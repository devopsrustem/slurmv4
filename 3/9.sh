bash# С aihub0001 → aihub0003
echo "" | nc -w 2 10.99.91.49 15328; echo "exit: $?"

# С aihub0002 → aihub0006  
echo "" | nc -w 2 10.99.91.35 15599; echo "exit: $?"
И одновременно посмотри что пишет decode в момент подключения — найди stdout процесса:
bash# На aihub0003
ls -la /proc/3110559/fd/1 /proc/3110559/fd/2
# Если симлинк на /dev/pts/* или pipe - читать так:
tail -f /proc/3110559/fd/2
И самое важное — проверь есть ли bootstrap сервер (etcd/redis) который Mooncake использует для регистрации сессий, и видят ли его обе стороны:
bash# На всех 4 нодах
ss -tlnp | grep -E '2379|6379|8500'
# или
ps aux | grep -E 'etcd|redis|bootstrap'
Как именно запускается SGLang — есть ли --disaggregation-bootstrap-host параметр в команде запуска?



[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tlnp | grep -E '2379|6379|8500'
[dcbsr_dev@tpgds-aihub0001 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+  789925  1.0  0.0 53390224 1223020 pts/0 Sl+ 15:45   0:26 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.39 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998 --disable-cuda-graph
dcbsr_d+  813476  0.0  0.0   6424  2732 pts/2    S+   16:29   0:00 grep --color=auto -E etcd|redis|bootstrap

[dcbsr_dev@tpgds-aihub0002 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+ 1633605  0.9  0.0 53241024 1174540 pts/0 Sl+ 15:45   0:25 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.41 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998 --disable-cuda-graph
dcbsr_d+ 1657401  0.0  0.0   6424  2736 pts/1    S+   16:29   0:00 grep --color=auto -E etcd|redis|bootstrap
[dcbsr_dev@tpgds-aihub0002 ~]$ ss -tlnp | grep -E '2379|6379|8500'

[dcbsr_dev@tpgds-aihub0003 ~]$ ss -tlnp | grep -E '2379|6379|8500'
[dcbsr_dev@tpgds-aihub0003 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+ 3110165  0.9  0.0 53481600 1255880 pts/0 Sl+ 15:45   0:26 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.49 --port 30001 --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode decode --max-running-requests 128 --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998
dcbsr_d+ 3134510  0.0  0.0   6424  2732 pts/1    S+   16:30   0:00 grep --color=auto -E etcd|redis|bootstrap


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+  484791  0.9  0.0 53168040 995884 pts/0 Sl+  15:45   0:25 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.35 --port 30001 --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --max-running-requests 128 --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998
dcbsr_d+  507093  0.0  0.0   6420  2728 pts/1    S+   16:30   0:00 grep --color=auto -E etcd|redis|bootstrap
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ss -tlnp | grep -E '2379|6379|8500'
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ 

[dcbsr_dev@tpgds-aihub0001 ~]$ SGLANG_HOST_IP=10.99.91.39 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph


[dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_HOST_IP=10.99.91.41 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

[dcbsr_dev@tpgds-aihub0003 ~]$ SGLANG_HOST_IP=10.99.91.49  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ SGLANG_HOST_IP=10.99.91.35 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998













usage: launch_server.py [-h] --model-path MODEL_PATH [--tokenizer-path TOKENIZER_PATH] [--tokenizer-mode {auto,slow}]
                        [--tokenizer-worker-num TOKENIZER_WORKER_NUM] [--skip-tokenizer-init]
                        [--load-format {auto,pt,safetensors,npcache,dummy,sharded_state,gguf,bitsandbytes,layered,flash_rl,remote,remote_instance,fastsafetensors,private}]
                        [--model-loader-extra-config MODEL_LOADER_EXTRA_CONFIG] [--trust-remote-code]
                        [--context-length CONTEXT_LENGTH] [--is-embedding] [--enable-multimodal] [--revision REVISION]
                        [--model-impl MODEL_IMPL] [--host HOST] [--port PORT] [--fastapi-root-path FASTAPI_ROOT_PATH]
                        [--grpc-mode] [--skip-server-warmup] [--warmups WARMUPS] [--nccl-port NCCL_PORT]
                        [--checkpoint-engine-wait-weights-before-ready] [--dtype {auto,half,float16,bfloat16,float,float32}]
                        [--quantization {awq,fp8,gptq,marlin,gptq_marlin,awq_marlin,bitsandbytes,gguf,modelopt,modelopt_fp8,modelopt_fp4,petit_nvfp4,w8a8_int8,w8a8_fp8,moe_wna16,qoq,w4afp8,mxfp4,auto-round,compressed-tensors,modelslim,quark_int4fp8_moe}]
                        [--quantization-param-path QUANTIZATION_PARAM_PATH]
                        [--kv-cache-dtype {auto,fp8_e5m2,fp8_e4m3,bf16,bfloat16,fp4_e2m1}] [--enable-fp32-lm-head]
                        [--modelopt-quant MODELOPT_QUANT]
                        [--modelopt-checkpoint-restore-path MODELOPT_CHECKPOINT_RESTORE_PATH]
                        [--modelopt-checkpoint-save-path MODELOPT_CHECKPOINT_SAVE_PATH]
                        [--modelopt-export-path MODELOPT_EXPORT_PATH] [--quantize-and-serve]
                        [--rl-quant-profile RL_QUANT_PROFILE] [--mem-fraction-static MEM_FRACTION_STATIC]
                        [--max-running-requests MAX_RUNNING_REQUESTS] [--max-queued-requests MAX_QUEUED_REQUESTS]
                        [--max-total-tokens MAX_TOTAL_TOKENS] [--chunked-prefill-size CHUNKED_PREFILL_SIZE]
                        [--prefill-max-requests PREFILL_MAX_REQUESTS] [--enable-dynamic-chunking]
                        [--max-prefill-tokens MAX_PREFILL_TOKENS]
                        [--schedule-policy {lpm,random,fcfs,dfs-weight,lof,priority,routing-key}]
                        [--enable-priority-scheduling] [--abort-on-priority-when-disabled]
                        [--schedule-low-priority-values-first]
                        [--priority-scheduling-preemption-threshold PRIORITY_SCHEDULING_PREEMPTION_THRESHOLD]
                        [--schedule-conservativeness SCHEDULE_CONSERVATIVENESS] [--page-size PAGE_SIZE]
                        [--hybrid-kvcache-ratio] [--swa-full-tokens-ratio SWA_FULL_TOKENS_RATIO] [--disable-hybrid-swa-memory]
                        [--radix-eviction-policy {lru,lfu}] [--enable-prefill-delayer]
                        [--prefill-delayer-max-delay-passes PREFILL_DELAYER_MAX_DELAY_PASSES]
                        [--prefill-delayer-token-usage-low-watermark PREFILL_DELAYER_TOKEN_USAGE_LOW_WATERMARK]
                        [--prefill-delayer-forward-passes-buckets PREFILL_DELAYER_FORWARD_PASSES_BUCKETS [PREFILL_DELAYER_FORWARD_PASSES_BUCKETS ...]]
                        [--prefill-delayer-wait-seconds-buckets PREFILL_DELAYER_WAIT_SECONDS_BUCKETS [PREFILL_DELAYER_WAIT_SECONDS_BUCKETS ...]]
                        [--device DEVICE] [--tensor-parallel-size TENSOR_PARALLEL_SIZE]
                        [--pipeline-parallel-size PIPELINE_PARALLEL_SIZE] [--pp-max-micro-batch-size PP_MAX_MICRO_BATCH_SIZE]
                        [--pp-async-batch-depth PP_ASYNC_BATCH_DEPTH] [--stream-interval STREAM_INTERVAL] [--stream-output]
                        [--random-seed RANDOM_SEED]
                        [--constrained-json-whitespace-pattern CONSTRAINED_JSON_WHITESPACE_PATTERN]
                        [--constrained-json-disable-any-whitespace] [--watchdog-timeout WATCHDOG_TIMEOUT]
                        [--soft-watchdog-timeout SOFT_WATCHDOG_TIMEOUT] [--dist-timeout DIST_TIMEOUT]
                        [--download-dir DOWNLOAD_DIR] [--model-checksum [MODEL_CHECKSUM]] [--base-gpu-id BASE_GPU_ID]
                        [--gpu-id-step GPU_ID_STEP] [--sleep-on-idle] [--custom-sigquit-handler CUSTOM_SIGQUIT_HANDLER]
                        [--log-level LOG_LEVEL] [--log-level-http LOG_LEVEL_HTTP] [--log-requests]
                        [--log-requests-level {0,1,2,3}] [--log-requests-format {text,json}]
                        [--log-requests-target LOG_REQUESTS_TARGET [LOG_REQUESTS_TARGET ...]]
                        [--uvicorn-access-log-exclude-prefixes [UVICORN_ACCESS_LOG_EXCLUDE_PREFIXES ...]]
                        [--crash-dump-folder CRASH_DUMP_FOLDER] [--show-time-cost] [--enable-metrics]
                        [--enable-metrics-for-all-schedulers]
                        [--tokenizer-metrics-custom-labels-header TOKENIZER_METRICS_CUSTOM_LABELS_HEADER]
                        [--tokenizer-metrics-allowed-custom-labels TOKENIZER_METRICS_ALLOWED_CUSTOM_LABELS [TOKENIZER_METRICS_ALLOWED_CUSTOM_LABELS ...]]
                        [--bucket-time-to-first-token BUCKET_TIME_TO_FIRST_TOKEN [BUCKET_TIME_TO_FIRST_TOKEN ...]]
                        [--bucket-inter-token-latency BUCKET_INTER_TOKEN_LATENCY [BUCKET_INTER_TOKEN_LATENCY ...]]
                        [--bucket-e2e-request-latency BUCKET_E2E_REQUEST_LATENCY [BUCKET_E2E_REQUEST_LATENCY ...]]
                        [--collect-tokens-histogram]
                        [--prompt-tokens-buckets PROMPT_TOKENS_BUCKETS [PROMPT_TOKENS_BUCKETS ...]]
                        [--generation-tokens-buckets GENERATION_TOKENS_BUCKETS [GENERATION_TOKENS_BUCKETS ...]]
                        [--gc-warning-threshold-secs GC_WARNING_THRESHOLD_SECS] [--decode-log-interval DECODE_LOG_INTERVAL]
                        [--enable-request-time-stats-logging] [--kv-events-config KV_EVENTS_CONFIG] [--enable-trace]
                        [--otlp-traces-endpoint OTLP_TRACES_ENDPOINT] [--export-metrics-to-file]
                        [--export-metrics-to-file-dir EXPORT_METRICS_TO_FILE_DIR] [--api-key API_KEY]
                        [--admin-api-key ADMIN_API_KEY] [--served-model-name SERVED_MODEL_NAME]
                        [--weight-version WEIGHT_VERSION] [--chat-template CHAT_TEMPLATE]
                        [--hf-chat-template-name HF_CHAT_TEMPLATE_NAME] [--completion-template COMPLETION_TEMPLATE]
                        [--file-storage-path FILE_STORAGE_PATH] [--enable-cache-report]
                        [--reasoning-parser {deepseek-r1,deepseek-v3,glm45,gpt-oss,kimi,kimi_k2,qwen3,qwen3-thinking,minimax,minimax-append-think,step3,nano_v3,interns1}]
                        [--tool-call-parser {deepseekv3,deepseekv31,deepseekv32,glm,glm45,glm47,gpt-oss,kimi_k2,llama3,mimo,mistral,pythonic,qwen,qwen25,qwen3_coder,step3,minimax-m2,trinity,interns1}]
                        [--tool-server TOOL_SERVER] [--sampling-defaults {openai,model}]
                        [--data-parallel-size DATA_PARALLEL_SIZE]
                        [--load-balance-method {auto,round_robin,follow_bootstrap_room,total_requests,total_tokens}]
                        [--prefill-round-robin-balance] [--dist-init-addr DIST_INIT_ADDR] [--nnodes NNODES]
                        [--node-rank NODE_RANK] [--json-model-override-args JSON_MODEL_OVERRIDE_ARGS]
                        [--preferred-sampling-params PREFERRED_SAMPLING_PARAMS] [--enable-lora]
                        [--enable-lora-overlap-loading] [--max-lora-rank MAX_LORA_RANK]
                        [--lora-target-modules [{q_proj,k_proj,v_proj,o_proj,gate_proj,up_proj,down_proj,qkv_proj,gate_up_proj,embed_tokens,lm_head,all} ...]]
                        [--lora-paths [LORA_PATHS ...]] [--max-loras-per-batch MAX_LORAS_PER_BATCH]
                        [--max-loaded-loras MAX_LOADED_LORAS] [--lora-eviction-policy {lru,fifo}]
                        [--lora-backend {triton,csgmv,ascend,torch_native}] [--max-lora-chunk-size {16,32,64,128}]
                        [--attention-backend {triton,torch_native,flex_attention,nsa,cutlass_mla,fa3,fa4,flashinfer,flashmla,trtllm_mla,trtllm_mha,dual_chunk_flash_attn,aiter,wave,intel_amx,ascend,intel_xpu}]
                        [--prefill-attention-backend {triton,torch_native,flex_attention,nsa,cutlass_mla,fa3,fa4,flashinfer,flashmla,trtllm_mla,trtllm_mha,dual_chunk_flash_attn,aiter,wave,intel_amx,ascend,intel_xpu}]
                        [--decode-attention-backend {triton,torch_native,flex_attention,nsa,cutlass_mla,fa3,fa4,flashinfer,flashmla,trtllm_mla,trtllm_mha,dual_chunk_flash_attn,aiter,wave,intel_amx,ascend,intel_xpu}]
                        [--sampling-backend {ascend,pytorch,flashinfer}]
                        [--grammar-backend {xgrammar,outlines,llguidance,none}]
                        [--mm-attention-backend {sdpa,fa3,triton_attn,ascend_attn,aiter_attn}]
                        [--nsa-prefill-backend {flashmla_sparse,flashmla_kv,flashmla_auto,fa3,tilelang,aiter}]
                        [--nsa-decode-backend {flashmla_sparse,flashmla_kv,flashmla_auto,fa3,tilelang,aiter}]
                        [--fp8-gemm-backend {auto,deep_gemm,flashinfer_trtllm,cutlass,triton,aiter}]
                        [--fp4-gemm-backend {auto,flashinfer_cudnn,flashinfer_cutlass,flashinfer_trtllm}]
                        [--disable-flashinfer-autotune] [--speculative-algorithm {EAGLE,EAGLE3,NEXTN,STANDALONE,NGRAM}]
                        [--speculative-draft-model-path SPECULATIVE_DRAFT_MODEL_PATH]
                        [--speculative-draft-model-revision SPECULATIVE_DRAFT_MODEL_REVISION]
                        [--speculative-draft-load-format {auto,pt,safetensors,npcache,dummy,sharded_state,gguf,bitsandbytes,layered,flash_rl,remote,remote_instance,fastsafetensors,private}]
                        [--speculative-num-steps SPECULATIVE_NUM_STEPS] [--speculative-eagle-topk SPECULATIVE_EAGLE_TOPK]
                        [--speculative-num-draft-tokens SPECULATIVE_NUM_DRAFT_TOKENS]
                        [--speculative-accept-threshold-single SPECULATIVE_ACCEPT_THRESHOLD_SINGLE]
                        [--speculative-accept-threshold-acc SPECULATIVE_ACCEPT_THRESHOLD_ACC]
                        [--speculative-token-map SPECULATIVE_TOKEN_MAP] [--speculative-attention-mode {prefill,decode}]
                        [--speculative-draft-attention-backend SPECULATIVE_DRAFT_ATTENTION_BACKEND]
                        [--speculative-moe-runner-backend {auto,deep_gemm,triton,triton_kernel,flashinfer_trtllm,flashinfer_cutlass,flashinfer_mxfp4,flashinfer_cutedsl,cutlass}]
                        [--speculative-moe-a2a-backend {none,deepep,mooncake,ascend_fuseep}]
                        [--speculative-draft-model-quantization {awq,fp8,gptq,marlin,gptq_marlin,awq_marlin,bitsandbytes,gguf,modelopt,modelopt_fp8,modelopt_fp4,petit_nvfp4,w8a8_int8,w8a8_fp8,moe_wna16,qoq,w4afp8,mxfp4,auto-round,compressed-tensors,modelslim,quark_int4fp8_moe,unquant}]
                        [--speculative-ngram-min-match-window-size SPECULATIVE_NGRAM_MIN_MATCH_WINDOW_SIZE]
                        [--speculative-ngram-max-match-window-size SPECULATIVE_NGRAM_MAX_MATCH_WINDOW_SIZE]
                        [--speculative-ngram-min-bfs-breadth SPECULATIVE_NGRAM_MIN_BFS_BREADTH]
                        [--speculative-ngram-max-bfs-breadth SPECULATIVE_NGRAM_MAX_BFS_BREADTH]
                        [--speculative-ngram-match-type {BFS,PROB}]
                        [--speculative-ngram-branch-length SPECULATIVE_NGRAM_BRANCH_LENGTH]
                        [--speculative-ngram-capacity SPECULATIVE_NGRAM_CAPACITY] [--enable-multi-layer-eagle]
                        [--expert-parallel-size EXPERT_PARALLEL_SIZE] [--moe-a2a-backend {none,deepep,mooncake,ascend_fuseep}]
                        [--moe-runner-backend {auto,deep_gemm,triton,triton_kernel,flashinfer_trtllm,flashinfer_cutlass,flashinfer_mxfp4,flashinfer_cutedsl,cutlass}]
                        [--flashinfer-mxfp4-moe-precision {default,bf16}] [--enable-flashinfer-allreduce-fusion]
                        [--deepep-mode {normal,low_latency,auto}] [--ep-num-redundant-experts EP_NUM_REDUNDANT_EXPERTS]
                        [--ep-dispatch-algorithm EP_DISPATCH_ALGORITHM] [--init-expert-location INIT_EXPERT_LOCATION]
                        [--enable-eplb] [--eplb-algorithm EPLB_ALGORITHM]
                        [--eplb-rebalance-num-iterations EPLB_REBALANCE_NUM_ITERATIONS]
                        [--eplb-rebalance-layers-per-chunk EPLB_REBALANCE_LAYERS_PER_CHUNK]
                        [--eplb-min-rebalancing-utilization-threshold EPLB_MIN_REBALANCING_UTILIZATION_THRESHOLD]
                        [--expert-distribution-recorder-mode EXPERT_DISTRIBUTION_RECORDER_MODE]
                        [--expert-distribution-recorder-buffer-size EXPERT_DISTRIBUTION_RECORDER_BUFFER_SIZE]
                        [--enable-expert-distribution-metrics] [--deepep-config DEEPEP_CONFIG]
                        [--moe-dense-tp-size MOE_DENSE_TP_SIZE] [--elastic-ep-backend {none,mooncake}]
                        [--mooncake-ib-device MOONCAKE_IB_DEVICE] [--max-mamba-cache-size MAX_MAMBA_CACHE_SIZE]
                        [--mamba-ssm-dtype {float32,bfloat16}] [--mamba-full-memory-ratio MAMBA_FULL_MEMORY_RATIO]
                        [--mamba-scheduler-strategy {auto,no_buffer,extra_buffer}]
                        [--mamba-track-interval MAMBA_TRACK_INTERVAL] [--enable-hierarchical-cache]
                        [--hicache-ratio HICACHE_RATIO] [--hicache-size HICACHE_SIZE]
                        [--hicache-write-policy {write_back,write_through,write_through_selective}]
                        [--hicache-io-backend {direct,kernel,kernel_ascend}]
                        [--hicache-mem-layout {layer_first,page_first,page_first_direct,page_first_kv_split,page_head}]
                        [--disable-hicache-numa-detect]
                        [--hicache-storage-backend {file,mooncake,hf3fs,nixl,aibrix,dynamic,eic}]
                        [--hicache-storage-prefetch-policy {best_effort,wait_complete,timeout}]
                        [--hicache-storage-backend-extra-config HICACHE_STORAGE_BACKEND_EXTRA_CONFIG]
                        [--hierarchical-sparse-attention-extra-config HIERARCHICAL_SPARSE_ATTENTION_EXTRA_CONFIG]
                        [--enable-lmcache] [--kt-weight-path KT_WEIGHT_PATH] [--kt-method KT_METHOD]
                        [--kt-cpuinfer KT_CPUINFER] [--kt-threadpool-count KT_THREADPOOL_COUNT]
                        [--kt-num-gpu-experts KT_NUM_GPU_EXPERTS]
                        [--kt-max-deferred-experts-per-token KT_MAX_DEFERRED_EXPERTS_PER_TOKEN]
                        [--dllm-algorithm DLLM_ALGORITHM] [--dllm-algorithm-config DLLM_ALGORITHM_CONFIG]
                        [--enable-double-sparsity] [--ds-channel-config-path DS_CHANNEL_CONFIG_PATH]
                        [--ds-heavy-channel-num DS_HEAVY_CHANNEL_NUM] [--ds-heavy-token-num DS_HEAVY_TOKEN_NUM]
                        [--ds-heavy-channel-type DS_HEAVY_CHANNEL_TYPE]
                        [--ds-sparse-decode-threshold DS_SPARSE_DECODE_THRESHOLD] [--cpu-offload-gb CPU_OFFLOAD_GB]
                        [--offload-group-size OFFLOAD_GROUP_SIZE] [--offload-num-in-group OFFLOAD_NUM_IN_GROUP]
                        [--offload-prefetch-step OFFLOAD_PREFETCH_STEP] [--offload-mode OFFLOAD_MODE]
                        [--multi-item-scoring-delimiter MULTI_ITEM_SCORING_DELIMITER] [--disable-radix-cache]
                        [--cuda-graph-max-bs CUDA_GRAPH_MAX_BS] [--cuda-graph-bs CUDA_GRAPH_BS [CUDA_GRAPH_BS ...]]
                        [--disable-cuda-graph] [--disable-cuda-graph-padding] [--enable-profile-cuda-graph]
                        [--enable-cudagraph-gc] [--enable-layerwise-nvtx-marker] [--enable-nccl-nvls] [--enable-symm-mem]
                        [--disable-flashinfer-cutlass-moe-fp4-allgather] [--enable-tokenizer-batch-encode]
                        [--disable-tokenizer-batch-decode] [--disable-outlines-disk-cache] [--disable-custom-all-reduce]
                        [--enable-mscclpp] [--enable-torch-symm-mem] [--disable-overlap-schedule] [--enable-mixed-chunk]
                        [--enable-dp-attention] [--enable-dp-lm-head] [--enable-two-batch-overlap]
                        [--enable-single-batch-overlap] [--tbo-token-distribution-threshold TBO_TOKEN_DISTRIBUTION_THRESHOLD]
                        [--enable-torch-compile] [--enable-torch-compile-debug-mode] [--enable-piecewise-cuda-graph]
                        [--piecewise-cuda-graph-tokens PIECEWISE_CUDA_GRAPH_TOKENS [PIECEWISE_CUDA_GRAPH_TOKENS ...]]
                        [--piecewise-cuda-graph-compiler {eager,inductor}] [--torch-compile-max-bs TORCH_COMPILE_MAX_BS]
                        [--piecewise-cuda-graph-max-tokens PIECEWISE_CUDA_GRAPH_MAX_TOKENS] [--torchao-config TORCHAO_CONFIG]
                        [--enable-nan-detection] [--enable-p2p-check] [--triton-attention-reduce-in-fp32]
                        [--triton-attention-num-kv-splits TRITON_ATTENTION_NUM_KV_SPLITS]
                        [--triton-attention-split-tile-size TRITON_ATTENTION_SPLIT_TILE_SIZE]
                        [--num-continuous-decode-steps NUM_CONTINUOUS_DECODE_STEPS] [--delete-ckpt-after-loading]
                        [--enable-memory-saver] [--enable-weights-cpu-backup] [--enable-draft-weights-cpu-backup]
                        [--allow-auto-truncate] [--enable-custom-logit-processor] [--flashinfer-mla-disable-ragged]
                        [--disable-shared-experts-fusion] [--disable-chunked-prefix-cache] [--disable-fast-image-processor]
                        [--keep-mm-feature-on-device] [--enable-return-hidden-states] [--enable-return-routed-experts]
                        [--scheduler-recv-interval SCHEDULER_RECV_INTERVAL] [--numa-node NUMA_NODE [NUMA_NODE ...]]
                        [--enable-deterministic-inference] [--rl-on-policy-target {fsdp}] [--enable-attn-tp-input-scattered]
                        [--enable-nsa-prefill-context-parallel] [--nsa-prefill-cp-mode {in-seq-split,round-robin-split}]
                        [--enable-fused-qk-norm-rope] [--enable-precise-embedding-interpolation]
                        [--enable-dynamic-batch-tokenizer]
                        [--dynamic-batch-tokenizer-batch-size DYNAMIC_BATCH_TOKENIZER_BATCH_SIZE]
                        [--dynamic-batch-tokenizer-batch-timeout DYNAMIC_BATCH_TOKENIZER_BATCH_TIMEOUT]
                        [--debug-tensor-dump-output-folder DEBUG_TENSOR_DUMP_OUTPUT_FOLDER]
                        [--debug-tensor-dump-layers DEBUG_TENSOR_DUMP_LAYERS [DEBUG_TENSOR_DUMP_LAYERS ...]]
                        [--debug-tensor-dump-input-file DEBUG_TENSOR_DUMP_INPUT_FILE]
                        [--debug-tensor-dump-inject DEBUG_TENSOR_DUMP_INJECT] [--disaggregation-mode {null,prefill,decode}]
                        [--disaggregation-transfer-backend {mooncake,nixl,ascend,fake}]
                        [--disaggregation-bootstrap-port DISAGGREGATION_BOOTSTRAP_PORT]
                        [--disaggregation-decode-tp DISAGGREGATION_DECODE_TP]
                        [--disaggregation-decode-dp DISAGGREGATION_DECODE_DP]
                        [--disaggregation-prefill-pp DISAGGREGATION_PREFILL_PP]
                        [--disaggregation-ib-device DISAGGREGATION_IB_DEVICE] [--disaggregation-decode-enable-offload-kvcache]
                        [--disaggregation-decode-enable-fake-auto] [--num-reserved-decode-tokens NUM_RESERVED_DECODE_TOKENS]
                        [--disaggregation-decode-polling-interval DISAGGREGATION_DECODE_POLLING_INTERVAL] [--encoder-only]
                        [--language-only] [--encoder-transfer-backend {zmq_to_scheduler,zmq_to_tokenizer,mooncake}]
                        [--encoder-urls ENCODER_URLS [ENCODER_URLS ...]] [--custom-weight-loader [CUSTOM_WEIGHT_LOADER ...]]
                        [--weight-loader-disable-mmap]
                        [--remote-instance-weight-loader-seed-instance-ip REMOTE_INSTANCE_WEIGHT_LOADER_SEED_INSTANCE_IP]
                        [--remote-instance-weight-loader-seed-instance-service-port REMOTE_INSTANCE_WEIGHT_LOADER_SEED_INSTANCE_SERVICE_PORT]
                        [--remote-instance-weight-loader-send-weights-group-ports REMOTE_INSTANCE_WEIGHT_LOADER_SEND_WEIGHTS_GROUP_PORTS]
                        [--remote-instance-weight-loader-backend {transfer_engine,nccl}]
                        [--remote-instance-weight-loader-start-seed-via-transfer-engine] [--enable-pdmux]
                        [--pdmux-config-path PDMUX_CONFIG_PATH] [--sm-group-num SM_GROUP_NUM] [--config CONFIG]
                        [--mm-max-concurrent-calls MM_MAX_CONCURRENT_CALLS] [--mm-per-request-timeout MM_PER_REQUEST_TIMEOUT]
                        [--enable-broadcast-mm-inputs-process] [--mm-process-config MM_PROCESS_CONFIG]
                        [--mm-enable-dp-encoder] [--limit-mm-data-per-request LIMIT_MM_DATA_PER_REQUEST]
                        [--decrypted-config-file DECRYPTED_CONFIG_FILE]
                        [--decrypted-draft-config-file DECRYPTED_DRAFT_CONFIG_FILE] [--enable-prefix-mm-cache]
                        [--forward-hooks FORWARD_HOOKS]
launch_server.py: error: unrecognized arguments: --ss
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ^C
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ 
logout
23534980@sigma.sbrf.ru@CAB-WSN-0052363:/home/work/23534980@sigma.sbrf.ru$ ssh aihub1
Last login: Thu Feb 26 16:31:51 2026 from 10.9.143.146

 SberLinux release 9.7 (Ulutau)
 Hostname: tpgds-aihub0001

[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tlnp | grep -E '8998'
LISTEN 0      128      10.99.91.39:8998       0.0.0.0:*    users:(("python3",pid=789925,fd=121))        
[dcbsr_dev@tpgds-aihub0001 ~]$ grep -r "bootstrap_host" /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/dis
disaggregation/ distributed/    
[dcbsr_dev@tpgds-aihub0001 ~]$ grep -r "bootstrap_host" /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/prefill.py:        if req.bootstrap_host == FAKE_BOOTSTRAP_HOST:
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/prefill.py:            bootstrap_addr=f"{req.bootstrap_host}:{self.bootstrap_port}",
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/common/conn.py:        self.bootstrap_host = server_args.host
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/common/conn.py:            host = self.bootstrap_host
grep: /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/common/__pycache__/conn.cpython-312.pyc: binary file matches
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/encode_receiver.py:            bootstrap_host=recv_req.bootstrap_host,
grep: /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/__pycache__/prefill.cpython-312.pyc: binary file matches
grep: /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/__pycache__/decode.cpython-312.pyc: binary file matches
grep: /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/__pycache__/encode_receiver.cpython-312.pyc: binary file matches
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/decode.py:            if req.bootstrap_host == FAKE_BOOTSTRAP_HOST or (
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/decode.py:                req.bootstrap_host is None
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/decode.py:                bootstrap_addr=f"{req.bootstrap_host}:{req.bootstrap_port}",
[dcbsr_dev@tpgds-aihub0001 ~]$ 




prefill/decode:
bashgrep -r "bootstrap_host\|bootstrap_room\|bootstrap_port" \
  /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/ 2>/dev/null | \
  grep -v ".pyc" | grep -v "Binary"
Параметра --disaggregation-bootstrap-host в SGLang нет (мы видели полный help). Bootstrap_host берётся из --host каждого сервера и передаётся роутером. Скорее всего роутер передаёт prefill bootstrap host (10.99.91.39) в запрос к decode, и decode должен до него дотянуться — это должно работать.
Реальная проблема может быть в другом — проверь TCP handshake напрямую:
bash# С aihub0001 → aihub0003, смотри что приходит
(echo -n '{"op":"check"}'; sleep 1) | nc 10.99.91.49 15328 | xxd | head -5




[dcbsr_dev@tpgds-aihub0001 ~]$ grep -r "bootstrap_host\|bootstrap_room\|bootstrap_port" \
  /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/ 2>/dev/null | \
  grep -v ".pyc" | grep -v "Binary"
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router.py:        prefill_urls: List of (url, bootstrap_port) tuples for prefill servers (PD mode only)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router.py:        bootstrap_port_annotation: Kubernetes annotation name for bootstrap port (PD mode).
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:    )  # List of (url, bootstrap_port)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:    bootstrap_port_annotation: str = "sglang.ai/bootstrap-port"
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:        args_dict["bootstrap_port_annotation"] = "sglang.ai/bootstrap-port"
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                bootstrap_port_str = prefill_args[1]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                if bootstrap_port_str.lower() == "none":
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                    bootstrap_port = None
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                        bootstrap_port = int(bootstrap_port_str)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                            f"Invalid bootstrap port: {bootstrap_port_str}. Must be a number or 'none'"
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:                bootstrap_port = None
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/router_args.py:            prefill_urls.append((url, bootstrap_port))
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:        self.prefill_bootstrap_ports = [url[1] for url in router_args.prefill_urls]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            self.prefill_bootstrap_ports[pidx],
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            bootstrap_room_list = []
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                bootstrap_room_list = (
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    modified_request["bootstrap_room"]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    if isinstance(modified_request["bootstrap_room"], list)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    else [modified_request["bootstrap_room"]]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                trace_context = trace_get_remote_propagate_context(bootstrap_room_list)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            for bootstrap_room in bootstrap_room_list:
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                trace_slice_end("mini_lb_launch", bootstrap_room, auto_next_anon=True)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            for bootstrap_room in bootstrap_room_list:
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    bootstrap_room,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                trace_req_finish(bootstrap_room)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                bootstrap_room_list = []
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    bootstrap_room_list = (
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                        modified_request["bootstrap_room"]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                        if isinstance(modified_request["bootstrap_room"], list)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                        else [modified_request["bootstrap_room"]]
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                        bootstrap_room_list
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                for bootstrap_room in bootstrap_room_list:
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                        "mini_lb_launch", bootstrap_room, auto_next_anon=True
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            for bootstrap_room in bootstrap_room_list:
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    bootstrap_room,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                trace_req_finish(bootstrap_room)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:    prefill_server, bootstrap_port, decode_server = lb.select_pair()
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_host": [hostname] * batch_size,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_port": [bootstrap_port] * batch_size,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_room": [
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                    _generate_bootstrap_room() for _ in range(batch_size)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_host": hostname,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_port": bootstrap_port,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:                "bootstrap_room": _generate_bootstrap_room(),
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:    prefill_server, bootstrap_port, decode_server = lb.select_pair()
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            "bootstrap_host": hostname,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            "bootstrap_port": bootstrap_port,
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:            "bootstrap_room": _generate_bootstrap_room(),
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:def _generate_bootstrap_room():
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:    bootstrap_room = random.randint(0, 2**63 - 1)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:        trace_req_start(bootstrap_room, bootstrap_room, role="router")
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:        trace_slice_start("mini_lb_launch", bootstrap_room)
/app/sglang/sglang-latest/lib/python3.12/site-packages/sglang_router/mini_lb.py:    return bootstrap_room
[dcbsr_dev@tpgds-aihub0001 ~]$ (echo -n '{"op":"check"}'; sleep 1) | nc 10.99.91.49 15328 | xxd | head -5
-bash: xxd: command not found
Ncat: Connection reset by peer.


на aihub3
E0226 16:43:33.215444 3114642 common.h:378] readString: too large length from socket: 7143335878552658555
E0226 16:43:33.215505 3114642 transfer_metadata_plugin.cpp:750] SocketHandShakePlugin: failed to receive handshake message, malformed json format: * Line 1, Column 1
  Syntax error: value, object or array expected.
, json string length: 0, json string content: 


логи роутера
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$   /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:794: Starting router on 0.0.0.0:8000 | mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", None)], decode_urls: ["http://10.99.91.49:30001"], prefill_policy: None, decode_policy: None } | policy: CacheAware { cache_threshold: 0.3, balance_abs_threshold: 64, balance_rel_threshold: 1.5, eviction_interval_secs: 60, max_tree_size: 67108864 } | max_payload: 512MB
2026-02-26 13:00:06  INFO smg::app_context: /home/runner/work/sglang/sglang/src/app_context.rs:412: Tokenizer path is not provided, will load from worker on the fly
2026-02-26 13:00:06  INFO smg::data_connector::factory: /home/runner/work/sglang/sglang/src/data_connector/factory.rs:51: Initializing data connector: Memory
2026-02-26 13:00:06  INFO smg::mcp::manager: /home/runner/work/sglang/sglang/src/mcp/manager.rs:90: No static MCP servers connected
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:833: Initializing workers for routing mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", None)], decode_urls: ["http://10.99.91.49:30001"], prefill_policy: None, decode_policy: None }
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:851: Worker initialization job submitted (will complete in background)
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:863: No MCP config provided, skipping MCP server initialization
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:875: Workers initialized: 0 total, 0 healthy
2026-02-26 13:00:06  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 definition_id=local_worker_registration
2026-02-26 13:00:06  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f definition_id=local_worker_registration
2026-02-26 13:00:06  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:169: Initializing RouterManager in single-router mode
2026-02-26 13:00:06  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:177: Created single router with ID: http-pd
2026-02-26 13:00:06  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=detect_connection_mode attempt=1
2026-02-26 13:00:06  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=detect_connection_mode attempt=1
2026-02-26 13:00:06  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:216: Set default router to http-pd
2026-02-26 13:00:06  INFO smg::core::worker_manager: /home/runner/work/sglang/sglang/src/core/worker_manager.rs:350: Starting load monitoring with interval: 30s
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:907: Rate limiting is disabled (max_concurrent_requests = -1)
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:985: Router ready | workers: []
2026-02-26 13:00:06  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:1018: Starting server on 0.0.0.0:8000
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=detect_connection_mode duration_ms=1002
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=discover_metadata attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=discover_metadata attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=detect_connection_mode duration_ms=1003
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=discover_metadata duration_ms=10
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=discover_dp_info attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=discover_dp_info duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=create_worker attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=create_worker duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=register_workers attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=register_workers duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=discover_metadata duration_ms=12
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=discover_dp_info attempt=1
2026-02-26 13:00:07  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-26 13:00:07  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:121: Loading tokenizer '/app/models/Deepseek-R1/' from source: /app/models/Deepseek-R1/
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=discover_dp_info duration_ms=0
2026-02-26 13:00:07  INFO smg::policies::registry: /home/runner/work/sglang/sglang/src/policies/registry.rs:89: Assigning policy cache_aware to new model /app/models/Deepseek-R1/
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=activate_workers attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=activate_workers duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=update_policies attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=create_worker attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=register_workers attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=update_policies duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=create_worker duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=register_workers duration_ms=0
2026-02-26 13:00:07  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=register_tokenizer attempt=1
2026-02-26 13:00:07  WARN smg::core::steps::worker::shared::update_policies: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/update_policies.rs:62: Model /app/models/Deepseek-R1/ has conflicting load_balance_method: prefill=Some("follow_bootstrap_room"), decode=Some("round_robin")
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=activate_workers attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=activate_workers duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=update_policies duration_ms=0
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=update_policies attempt=1
2026-02-26 13:00:07  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:141: Successfully registered tokenizer '/app/models/Deepseek-R1/' with id: 09b8ea9c-9832-4637-8371-40f981f7ea29
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=register_tokenizer attempt=1
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 step_id=register_tokenizer duration_ms=211
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=a6e493a6-4ccd-41be-aab0-5831cc6278a1 duration_ms=1225
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f step_id=register_tokenizer duration_ms=211
2026-02-26 13:00:07  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=1c20d313-ae05-4b80-85b9-e5372c34cf5f duration_ms=1225
2026-02-26 13:00:11  INFO http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::request: /home/runner/work/sglang/sglang/src/middleware.rs:310: started processing request
2026-02-26 13:00:12 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-26 13:00:12 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-26 13:00:12 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-26 13:00:12 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-26 13:00:13 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-26 13:00:13 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-Wly2zVLtUcyK1Vg13jmipvFZ" status_code=500 latency=1254651}: smg::response: /home/runner/work/sglang/sglang/src/middleware.rs:349: request failed with server error
