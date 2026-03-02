https://arxiv.org/html/2508.01989v1


Отлично! Настроение боевое — две недели пробивались через эту стену, и вот оно работает.
Запрос с метриками:
bashcurl -s http://10.99.91.39:8000/generate \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Explain the theory of relativity in detail",
    "sampling_params": {
      "max_new_tokens": 200,
      "temperature": 0.7
    }
  }'
После ответа посмотри метрики напрямую с серверов:
bash# Prefill throughput
curl -s http://10.99.91.39:30000/get_server_info | python3 -m json.tool

# Decode throughput  
curl -s http://10.99.91.49:30001/get_server_info | python3 -m json.tool
Для нагрузочного теста (чтобы видеть реальную пропускную способность):
bashpython3 -m sglang.bench_serving \
  --backend sglang \
  --host 10.99.91.39 \
  --port 8000 \
  --num-prompts 20 \
  --request-rate 4 \
  --input-len 512 \
  --output-len 128
Присылай результаты — посмотрим TTFT (time to first token) и throughput. Для схемы 2P+2D с DeepSeek-R1 на H100 ожидаем TTFT < 500ms и decode > 1000 tok/s суммарно.


1
source /app/sglang/sglang-latest/bin/activate
SGLANG_HOST_IP=10.99.91.39 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.39 SGLANG_LOCAL_IP_NIC=ens108np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens108np0 NCCL_SOCKET_IFNAME=ens108np0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph


2
SGLANG_HOST_IP=10.99.91.41 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.41 SGLANG_LOCAL_IP_NIC=ens108np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens108np0 NCCL_SOCKET_IFNAME=ens108np0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

3
SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7   --max-running-requests 128

6
SGLANG_HOST_IP=10.99.91.35 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.35 SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7   --max-running-requests 128

router
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0001 ~]$   /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000 8998   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000




[dcbsr_dev@tpgds-aihub0003 ~]$ curl -s http://10.99.91.39:8000/generate \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Explain the theory of relativity in detail",
    "sampling_params": {
      "max_new_tokens": 200,
      "temperature": 0.7
    }
  }'
{"text":".\n\nAnswer\n\n0 (0 stars)\n\n0\n\ndontknowit23 2 years ago\n51 response - 0 helps \nAnswer:\n\nThe theory of relativity usually encompasses two interrelated theories by Albert Einstein: special relativity and general relativity. Special relativity applies to all physical phenomena in the absence of gravity. General relativity explains the law of gravitation and its relation to other forces of nature.It applies to the cosmological and astrophysical realm, including astronomy. The theory transformed theoretical physics and astronomy during the 20th century, superseding a 200-year-old theory of mechanics created primarily by Isaac Newton. It introduced concepts including spacetime as a unified entity of space and time, relativity of simultaneity, kinematic and gravitational time dilation, and length contraction. In the field of physics, relativity improved the science of elementary particles and their fundamental interactions, along with ushering in the nuclear age. With relativity, cosmology and astrophysics predicted extraordinary astronomical phenomena such as neutron stars, black holes, and gravitational waves.\n\nExplanation","output_ids":[339,7805,271,18,343,18,12570,868,18,271,70,1039,33944,279,1349,223,20,1737,5084,201,4287,4256,565,223,18,7531,539,7805,979,671,6129,294,76407,5292,44995,1234,105467,17800,513,26218,43490,28,3953,76407,305,3810,76407,16,11609,76407,19338,304,710,5131,25298,295,270,13651,294,22927,16,7120,76407,16428,270,2950,294,13846,4458,305,1009,9960,304,915,8753,294,4936,52402,19338,304,270,102897,305,110997,18000,23285,14,2622,59910,16,455,6129,23785,16242,18771,305,59910,2184,270,223,397,463,6683,14,52365,10511,260,223,792,6680,11489,6129,294,29821,5572,12515,513,39769,26037,16,983,10097,10869,2622,121928,412,260,41626,16090,294,3987,305,1014,14,76407,294,15261,114811,14,105116,305,43406,1014,103025,14,305,4892,40946,16,660,270,2994,294,18771,14,76407,10103,270,6262,294,23836,12663,305,786,11264,12013,14,3758,418,550,57766,295,270,12613,4109,16,3710,76407,14,117457,305,110997,23501,18888,25335,61004,25298,1345,412,51666,12570,14,5159,21137,14,305,43406,15110,339,28395],"meta_info":{"id":"725ac38f33db458b94f52d8cc40b0ed7","finish_reason":{"type":"length","length":200},"prompt_tokens":8,"weight_version":"default","total_retractions":0,"completion_tokens":200,"ca

ответ префилл 1
[2026-03-02 14:44:10 TP0] Decode batch, #running-req: 1, #token: 33, token usage: 0.00, pre-allocated usage: 0.00, #prealloc-req: 0, #transfer-req: 0, #retracted-req: 0, cuda graph: True, gen throughput (token/s): 0.04, #queue-req: 0
[2026-03-02 14:44:11 TP0] Decode batch, #running-req: 1, #token: 73, token usage: 0.00, pre-allocated usage: 0.00, #prealloc-req: 0, #transfer-req: 0, #retracted-req: 0, cuda graph: True, gen throughput (token/s): 78.20, #queue-req: 0
[2026-03-02 14:44:11 TP0] Decode batch, #running-req: 1, #token: 113, token usage: 0.00, pre-allocated usage: 0.00, #prealloc-req: 0, #transfer-req: 0, #retracted-req: 0, cuda graph: True, gen throughput (token/s): 77.89, #queue-req: 0
[2026-03-02 14:44:12 TP0] Decode batch, #running-req: 1, #token: 153, token usage: 0.00, pre-allocated usage: 0.00, #prealloc-req: 0, #transfer-req: 0, #retracted-req: 0, cuda graph: True, gen throughput (token/s): 77.90, #queue-req: 0
[2026-03-02 14:44:12 TP0] Decode batch, #running-req: 1, #token: 193, token usage: 0.00, pre-allocated usage: 0.00, #prealloc-req: 0, #transfer-req: 0, #retracted-req: 0, cuda graph: True, gen throughput (token/s): 77.90, #queue-req: 0


[dcbsr_dev@tpgds-aihub0003 ~]$ curl -s http://10.99.91.39:30000/get_server_info | python3 -m json.tool
{
    "model_path": "/app/models/Deepseek-R1/",
    "tokenizer_path": "/app/models/Deepseek-R1/",
    "tokenizer_mode": "auto",
    "tokenizer_worker_num": 1,
    "skip_tokenizer_init": false,
    "load_format": "auto",
    "model_loader_extra_config": "{}",
    "trust_remote_code": true,
    "context_length": null,
    "is_embedding": false,
    "enable_multimodal": null,
    "revision": null,
    "model_impl": "auto",
    "host": "10.99.91.39",
    "port": 30000,
    "fastapi_root_path": "",
    "grpc_mode": false,
    "skip_server_warmup": false,
    "warmups": null,
    "nccl_port": null,
    "checkpoint_engine_wait_weights_before_ready": false,
    "dtype": "auto",
    "quantization": null,
    "quantization_param_path": null,
    "kv_cache_dtype": "auto",
    "enable_fp32_lm_head": false,
    "modelopt_quant": null,
    "modelopt_checkpoint_restore_path": null,
    "modelopt_checkpoint_save_path": null,
    "modelopt_export_path": null,
    "quantize_and_serve": false,
    "rl_quant_profile": null,
    "mem_fraction_static": 0.8,
    "max_running_requests": null,
    "max_queued_requests": null,
    "max_total_tokens": null,
    "chunked_prefill_size": 8192,
    "enable_dynamic_chunking": false,
    "max_prefill_tokens": 16384,
    "prefill_max_requests": null,
    "schedule_policy": "fcfs",
    "enable_priority_scheduling": false,
    "abort_on_priority_when_disabled": false,
    "schedule_low_priority_values_first": false,
    "priority_scheduling_preemption_threshold": 10,
    "schedule_conservativeness": 1.0,
    "page_size": 1,
    "swa_full_tokens_ratio": 0.8,
    "disable_hybrid_swa_memory": false,
    "radix_eviction_policy": "lru",
    "enable_prefill_delayer": false,
    "prefill_delayer_max_delay_passes": 30,
    "prefill_delayer_token_usage_low_watermark": null,
    "prefill_delayer_forward_passes_buckets": null,
    "prefill_delayer_wait_seconds_buckets": null,
    "device": "cuda",
    "tp_size": 16,
    "pp_size": 1,
    "pp_max_micro_batch_size": null,
    "pp_async_batch_depth": 0,
    "stream_interval": 1,
    "stream_output": false,
    "random_seed": 128558095,
    "constrained_json_whitespace_pattern": null,
    "constrained_json_disable_any_whitespace": false,
    "watchdog_timeout": 300,
    "soft_watchdog_timeout": null,
    "dist_timeout": null,
    "download_dir": null,
    "model_checksum": null,
    "base_gpu_id": 0,
    "gpu_id_step": 1,
    "sleep_on_idle": false,
    "custom_sigquit_handler": null,
    "log_level": "info",
    "log_level_http": null,
    "log_requests": false,
    "log_requests_level": 2,
    "log_requests_format": "text",
    "log_requests_target": null,
    "uvicorn_access_log_exclude_prefixes": [],
    "crash_dump_folder": null,
    "show_time_cost": false,
    "enable_metrics": false,
    "enable_metrics_for_all_schedulers": false,
    "tokenizer_metrics_custom_labels_header": "x-custom-labels",
    "tokenizer_metrics_allowed_custom_labels": null,
    "extra_metric_labels": null,
    "bucket_time_to_first_token": null,
    "bucket_inter_token_latency": null,
    "bucket_e2e_request_latency": null,
    "collect_tokens_histogram": false,
    "prompt_tokens_buckets": null,
    "generation_tokens_buckets": null,
    "gc_warning_threshold_secs": 0.0,
    "decode_log_interval": 40,
    "enable_request_time_stats_logging": false,
    "kv_events_config": null,
    "enable_trace": false,
    "otlp_traces_endpoint": "localhost:4317",
    "export_metrics_to_file": false,
    "export_metrics_to_file_dir": null,
    "api_key": null,
    "admin_api_key": null,
    "served_model_name": "/app/models/Deepseek-R1/",
    "weight_version": "default",
    "chat_template": null,
    "hf_chat_template_name": null,
    "completion_template": null,
    "file_storage_path": "sglang_storage",
    "enable_cache_report": false,
    "reasoning_parser": null,
    "tool_call_parser": null,
    "tool_server": null,
    "sampling_defaults": "model",
    "dp_size": 1,
    "load_balance_method": "follow_bootstrap_room",
    "attn_cp_size": 1,
    "moe_dp_size": 1,
    "dist_init_addr": "10.99.91.39:5000",
    "nnodes": 2,
    "node_rank": 0,
    "json_model_override_args": "{}",
    "preferred_sampling_params": null,
    "enable_lora": null,
    "enable_lora_overlap_loading": null,
    "max_lora_rank": null,
    "lora_target_modules": null,
    "lora_paths": null,
    "max_loaded_loras": null,
    "max_loras_per_batch": 8,
    "lora_eviction_policy": "lru",
    "lora_backend": "csgmv",
    "max_lora_chunk_size": 16,
    "attention_backend": "fa3",
    "decode_attention_backend": null,
    "prefill_attention_backend": null,
    "sampling_backend": "flashinfer",
    "grammar_backend": "xgrammar",
    "mm_attention_backend": null,
    "fp8_gemm_runner_backend": "auto",
    "fp4_gemm_runner_backend": "flashinfer_cutlass",
    "nsa_prefill_backend": null,
    "nsa_decode_backend": null,
    "disable_flashinfer_autotune": false,
    "mamba_backend": "triton",
    "speculative_algorithm": null,
    "speculative_draft_model_path": null,
    "speculative_draft_model_revision": null,
    "speculative_draft_load_format": null,
    "speculative_num_steps": null,
    "speculative_eagle_topk": null,
    "speculative_num_draft_tokens": null,
    "speculative_accept_threshold_single": 1.0,
    "speculative_accept_threshold_acc": 1.0,
    "speculative_token_map": null,
    "speculative_attention_mode": "prefill",
    "speculative_draft_attention_backend": null,
    "speculative_moe_runner_backend": "auto",
    "speculative_moe_a2a_backend": null,
    "speculative_draft_model_quantization": null,
    "speculative_ngram_min_match_window_size": 1,
    "speculative_ngram_max_match_window_size": 12,
    "speculative_ngram_min_bfs_breadth": 1,
    "speculative_ngram_max_bfs_breadth": 10,
    "speculative_ngram_match_type": "BFS",
    "speculative_ngram_branch_length": 18,
    "speculative_ngram_capacity": 10000000,
    "enable_multi_layer_eagle": false,
    "ep_size": 1,
    "moe_a2a_backend": "none",
    "moe_runner_backend": "auto",
    "flashinfer_mxfp4_moe_precision": "default",
    "enable_flashinfer_allreduce_fusion": false,
    "deepep_mode": "auto",
    "ep_num_redundant_experts": 0,
    "ep_dispatch_algorithm": null,
    "init_expert_location": "trivial",
    "enable_eplb": false,
    "eplb_algorithm": "auto",
    "eplb_rebalance_num_iterations": 1000,
    "eplb_rebalance_layers_per_chunk": null,
    "eplb_min_rebalancing_utilization_threshold": 1.0,
    "expert_distribution_recorder_mode": null,
    "expert_distribution_recorder_buffer_size": 1000,
    "enable_expert_distribution_metrics": false,
    "deepep_config": null,
    "moe_dense_tp_size": null,
    "elastic_ep_backend": null,
    "mooncake_ib_device": null,
    "max_mamba_cache_size": null,
    "mamba_ssm_dtype": null,
    "mamba_full_memory_ratio": 0.9,
    "mamba_scheduler_strategy": "no_buffer",
    "mamba_track_interval": 256,
    "enable_hierarchical_cache": false,
    "hicache_ratio": 2.0,
    "hicache_size": 0,
    "hicache_write_policy": "write_through",
    "hicache_io_backend": "kernel",
    "hicache_mem_layout": "layer_first",
    "disable_hicache_numa_detect": false,
    "hicache_storage_backend": null,
    "hicache_storage_prefetch_policy": "best_effort",
    "hicache_storage_backend_extra_config": null,
    "hierarchical_sparse_attention_extra_config": null,
    "enable_lmcache": false,
    "kt_weight_path": null,
    "kt_method": "AMXINT4",
    "kt_cpuinfer": null,
    "kt_threadpool_count": 2,
    "kt_num_gpu_experts": null,
    "kt_max_deferred_experts_per_token": null,
    "dllm_algorithm": null,
    "dllm_algorithm_config": null,
    "enable_double_sparsity": false,
    "ds_channel_config_path": null,
    "ds_heavy_channel_num": 32,
    "ds_heavy_token_num": 256,
    "ds_heavy_channel_type": "qk",
    "ds_sparse_decode_threshold": 4096,
    "cpu_offload_gb": 0,
    "offload_group_size": -1,
    "offload_num_in_group": 1,
    "offload_prefetch_step": 1,
    "offload_mode": "cpu",
    "multi_item_scoring_delimiter": null,
    "disable_radix_cache": false,
    "cuda_graph_max_bs": 512,
    "cuda_graph_bs": [
        1,
        2,
        4,
        8,
        12,
        16,
        24,
        32,
        40,
        48,
        56,
        64,
        72,
        80,
        88,
        96,
        104,
        112,
        120,
        128,
        136,
        144,
        152,
        160,
        168,
        176,
        184,
        192,
        200,
        208,
        216,
        224,
        232,
        240,
        248,
        256,
        272,
        288,
        304,
        320,
        336,
        352,
        368,
        384,
        400,
        416,
        432,
        448,
        464,
        480,
        496,
        512
    ],
    "disable_cuda_graph": true,
    "disable_cuda_graph_padding": false,
    "enable_profile_cuda_graph": false,
    "enable_cudagraph_gc": false,
    "enable_layerwise_nvtx_marker": false,
    "enable_nccl_nvls": false,
    "enable_symm_mem": false,
    "disable_flashinfer_cutlass_moe_fp4_allgather": false,
    "enable_tokenizer_batch_encode": false,
    "disable_tokenizer_batch_decode": false,
    "disable_outlines_disk_cache": false,
    "disable_custom_all_reduce": false,
    "enable_mscclpp": false,
    "enable_torch_symm_mem": false,
    "disable_overlap_schedule": false,
    "enable_mixed_chunk": false,
    "enable_dp_attention": false,
    "enable_dp_lm_head": false,
    "enable_two_batch_overlap": false,
    "enable_single_batch_overlap": false,
    "tbo_token_distribution_threshold": 0.48,
    "enable_torch_compile": false,
    "enable_piecewise_cuda_graph": false,
    "enable_torch_compile_debug_mode": false,
    "torch_compile_max_bs": 32,
    "piecewise_cuda_graph_max_tokens": 2048,
    "piecewise_cuda_graph_tokens": [
        4,
        8,
        12,
        16,
        20,
        24,
        28,
        32,
        48,
        64,
        80,
        96,
        112,
        128,
        144,
        160,
        176,
        192,
        208,
        224,
        240,
        256,
        288,
        320,
        352,
        384,
        416,
        448,
        480,
        512,
        576,
        640,
        704,
        768,
        832,
        896,
        960,
        1024,
        1280,
        1536,
        1792,
        2048
    ],
    "piecewise_cuda_graph_compiler": "eager",
    "torchao_config": "",
    "enable_nan_detection": false,
    "enable_p2p_check": false,
    "triton_attention_reduce_in_fp32": false,
    "triton_attention_num_kv_splits": 8,
    "triton_attention_split_tile_size": null,
    "num_continuous_decode_steps": 1,
    "delete_ckpt_after_loading": false,
    "enable_memory_saver": false,
    "enable_weights_cpu_backup": false,
    "enable_draft_weights_cpu_backup": false,
    "allow_auto_truncate": false,
    "enable_custom_logit_processor": false,
    "flashinfer_mla_disable_ragged": false,
    "disable_shared_experts_fusion": false,
    "disable_chunked_prefix_cache": false,
    "disable_fast_image_processor": false,
    "keep_mm_feature_on_device": false,
    "enable_return_hidden_states": false,
    "enable_return_routed_experts": false,
    "scheduler_recv_interval": 1,
    "numa_node": null,
    "enable_deterministic_inference": false,
    "rl_on_policy_target": null,
    "enable_attn_tp_input_scattered": false,
    "enable_nsa_prefill_context_parallel": false,
    "nsa_prefill_cp_mode": "round-robin-split",
    "enable_fused_qk_norm_rope": false,
    "enable_precise_embedding_interpolation": false,
    "enable_dynamic_batch_tokenizer": false,
    "dynamic_batch_tokenizer_batch_size": 32,
    "dynamic_batch_tokenizer_batch_timeout": 0.002,
    "debug_tensor_dump_output_folder": null,
    "debug_tensor_dump_layers": null,
    "debug_tensor_dump_input_file": null,
    "debug_tensor_dump_inject": false,
    "disaggregation_mode": "prefill",
    "disaggregation_transfer_backend": "nixl",
    "disaggregation_bootstrap_port": 8998,
    "disaggregation_decode_tp": 16,
    "disaggregation_decode_dp": 1,
    "disaggregation_prefill_pp": 1,
    "disaggregation_ib_device": "mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11",
    "disaggregation_decode_enable_offload_kvcache": false,
    "num_reserved_decode_tokens": 512,
    "disaggregation_decode_polling_interval": 1,
    "encoder_only": false,
    "language_only": false,
    "encoder_transfer_backend": "zmq_to_scheduler",
    "encoder_urls": [],
    "custom_weight_loader": [],
    "weight_loader_disable_mmap": false,
    "remote_instance_weight_loader_seed_instance_ip": null,
    "remote_instance_weight_loader_seed_instance_service_port": null,
    "remote_instance_weight_loader_send_weights_group_ports": null,
    "remote_instance_weight_loader_backend": "nccl",
    "remote_instance_weight_loader_start_seed_via_transfer_engine": false,
    "enable_pdmux": false,
    "pdmux_config_path": null,
    "sm_group_num": 8,
    "mm_max_concurrent_calls": 32,
    "mm_per_request_timeout": 10.0,
    "enable_broadcast_mm_inputs_process": false,
    "enable_prefix_mm_cache": false,
    "mm_enable_dp_encoder": false,
    "mm_process_config": {},
    "limit_mm_data_per_request": null,
    "decrypted_config_file": null,
    "decrypted_draft_config_file": null,
    "forward_hooks": null,
    "status": "ready",
    "max_total_num_tokens": 326223,
    "max_req_input_len": 163834,
    "internal_states": [
        {
            "model_path": "/app/models/Deepseek-R1/",
            "tokenizer_path": "/app/models/Deepseek-R1/",
            "tokenizer_mode": "auto",
            "tokenizer_worker_num": 1,
            "skip_tokenizer_init": false,
            "load_format": "auto",
            "model_loader_extra_config": "{}",
            "trust_remote_code": true,
            "context_length": null,
            "is_embedding": false,
            "enable_multimodal": null,
            "revision": null,
            "model_impl": "auto",
            "host": "10.99.91.39",
            "port": 30000,
            "fastapi_root_path": "",
            "grpc_mode": false,
            "skip_server_warmup": false,
            "warmups": null,
            "nccl_port": null,
            "checkpoint_engine_wait_weights_before_ready": false,
            "dtype": "auto",
            "quantization": null,
            "quantization_param_path": null,
            "kv_cache_dtype": "auto",
            "enable_fp32_lm_head": false,
            "modelopt_quant": null,
            "modelopt_checkpoint_restore_path": null,
            "modelopt_checkpoint_save_path": null,
            "modelopt_export_path": null,
            "quantize_and_serve": false,
            "rl_quant_profile": null,
            "mem_fraction_static": 0.8,
            "max_running_requests": null,
            "max_queued_requests": null,
            "max_total_tokens": null,
            "chunked_prefill_size": 8192,
            "enable_dynamic_chunking": false,
            "max_prefill_tokens": 16384,
            "prefill_max_requests": null,
            "schedule_policy": "fcfs",
            "enable_priority_scheduling": false,
            "abort_on_priority_when_disabled": false,
            "schedule_low_priority_values_first": false,
            "priority_scheduling_preemption_threshold": 10,
            "schedule_conservativeness": 1.0,
            "page_size": 1,
            "swa_full_tokens_ratio": 0.8,
            "disable_hybrid_swa_memory": false,
            "radix_eviction_policy": "lru",
            "enable_prefill_delayer": false,
            "prefill_delayer_max_delay_passes": 30,
            "prefill_delayer_token_usage_low_watermark": null,
            "prefill_delayer_forward_passes_buckets": null,
            "prefill_delayer_wait_seconds_buckets": null,
            "device": "cuda",
            "tp_size": 16,
            "pp_size": 1,
            "pp_max_micro_batch_size": 2048,
            "pp_async_batch_depth": 0,
            "stream_interval": 1,
            "stream_output": false,
            "random_seed": 128558095,
            "constrained_json_whitespace_pattern": null,
            "constrained_json_disable_any_whitespace": false,
            "watchdog_timeout": 300,
            "soft_watchdog_timeout": null,
            "dist_timeout": null,
            "download_dir": null,
            "model_checksum": null,
            "base_gpu_id": 0,
            "gpu_id_step": 1,
            "sleep_on_idle": false,
            "custom_sigquit_handler": null,
            "log_level": "info",
            "log_level_http": null,
            "log_requests": false,
            "log_requests_level": 2,
            "log_requests_format": "text",
            "log_requests_target": null,
            "uvicorn_access_log_exclude_prefixes": [],
            "crash_dump_folder": null,
            "show_time_cost": false,
            "enable_metrics": false,
            "enable_metrics_for_all_schedulers": false,
            "tokenizer_metrics_custom_labels_header": "x-custom-labels",
            "tokenizer_metrics_allowed_custom_labels": null,
            "extra_metric_labels": null,
            "bucket_time_to_first_token": null,
            "bucket_inter_token_latency": null,
            "bucket_e2e_request_latency": null,
            "collect_tokens_histogram": false,
            "prompt_tokens_buckets": null,
            "generation_tokens_buckets": null,
            "gc_warning_threshold_secs": 0.0,
            "decode_log_interval": 40,
            "enable_request_time_stats_logging": false,
            "kv_events_config": null,
            "enable_trace": false,
            "otlp_traces_endpoint": "localhost:4317",
            "export_metrics_to_file": false,
            "export_metrics_to_file_dir": null,
            "api_key": null,
            "admin_api_key": null,
            "served_model_name": "/app/models/Deepseek-R1/",
            "weight_version": "default",
            "chat_template": null,
            "hf_chat_template_name": null,
            "completion_template": null,
            "file_storage_path": "sglang_storage",
            "enable_cache_report": false,
            "reasoning_parser": null,
            "tool_call_parser": null,
            "tool_server": null,
            "sampling_defaults": "model",
            "dp_size": 1,
            "load_balance_method": "follow_bootstrap_room",
            "attn_cp_size": 1,
            "moe_dp_size": 1,
            "dist_init_addr": "10.99.91.39:5000",
            "nnodes": 2,
            "node_rank": 0,
            "json_model_override_args": "{}",
            "preferred_sampling_params": null,
            "enable_lora": null,
            "enable_lora_overlap_loading": null,
            "max_lora_rank": null,
            "lora_target_modules": null,
            "lora_paths": null,
            "max_loaded_loras": null,
            "max_loras_per_batch": 8,
            "lora_eviction_policy": "lru",
            "lora_backend": "csgmv",
            "max_lora_chunk_size": 16,
            "attention_backend": "fa3",
            "decode_attention_backend": "fa3",
            "prefill_attention_backend": "fa3",
            "sampling_backend": "flashinfer",
            "grammar_backend": "xgrammar",
            "mm_attention_backend": null,
            "fp8_gemm_runner_backend": "auto",
            "fp4_gemm_runner_backend": "flashinfer_cutlass",
            "nsa_prefill_backend": null,
            "nsa_decode_backend": null,
            "disable_flashinfer_autotune": false,
            "mamba_backend": "triton",
            "speculative_algorithm": null,
            "speculative_draft_model_path": null,
            "speculative_draft_model_revision": null,
            "speculative_draft_load_format": null,
            "speculative_num_steps": null,
            "speculative_eagle_topk": null,
            "speculative_num_draft_tokens": null,
            "speculative_accept_threshold_single": 1.0,
            "speculative_accept_threshold_acc": 1.0,
            "speculative_token_map": null,
            "speculative_attention_mode": "prefill",
            "speculative_draft_attention_backend": null,
            "speculative_moe_runner_backend": "auto",
            "speculative_moe_a2a_backend": null,
            "speculative_draft_model_quantization": null,
            "speculative_ngram_min_match_window_size": 1,
            "speculative_ngram_max_match_window_size": 12,
            "speculative_ngram_min_bfs_breadth": 1,
            "speculative_ngram_max_bfs_breadth": 10,
            "speculative_ngram_match_type": "BFS",
            "speculative_ngram_branch_length": 18,
            "speculative_ngram_capacity": 10000000,
            "enable_multi_layer_eagle": false,
            "ep_size": 1,
            "moe_a2a_backend": "none",
            "moe_runner_backend": "auto",
            "flashinfer_mxfp4_moe_precision": "default",
            "enable_flashinfer_allreduce_fusion": false,
            "deepep_mode": "auto",
            "ep_num_redundant_experts": 0,
            "ep_dispatch_algorithm": null,
            "init_expert_location": "trivial",
            "enable_eplb": false,
            "eplb_algorithm": "auto",
            "eplb_rebalance_num_iterations": 1000,
            "eplb_rebalance_layers_per_chunk": null,
            "eplb_min_rebalancing_utilization_threshold": 1.0,
            "expert_distribution_recorder_mode": null,
            "expert_distribution_recorder_buffer_size": 1000,
            "enable_expert_distribution_metrics": false,
            "deepep_config": null,
            "moe_dense_tp_size": null,
            "elastic_ep_backend": null,
            "mooncake_ib_device": null,
            "max_mamba_cache_size": null,
            "mamba_ssm_dtype": null,
            "mamba_full_memory_ratio": 0.9,
            "mamba_scheduler_strategy": "no_buffer",
            "mamba_track_interval": 256,
            "enable_hierarchical_cache": false,
            "hicache_ratio": 2.0,
            "hicache_size": 0,
            "hicache_write_policy": "write_through",
            "hicache_io_backend": "kernel",
            "hicache_mem_layout": "layer_first",
            "disable_hicache_numa_detect": false,
            "hicache_storage_backend": null,
            "hicache_storage_prefetch_policy": "best_effort",
            "hicache_storage_backend_extra_config": null,
            "hierarchical_sparse_attention_extra_config": null,
            "enable_lmcache": false,
            "kt_weight_path": null,
            "kt_method": "AMXINT4",
            "kt_cpuinfer": null,
            "kt_threadpool_count": 2,
            "kt_num_gpu_experts": null,
            "kt_max_deferred_experts_per_token": null,
            "dllm_algorithm": null,
            "dllm_algorithm_config": null,
            "enable_double_sparsity": false,
            "ds_channel_config_path": null,
            "ds_heavy_channel_num": 32,
            "ds_heavy_token_num": 256,
            "ds_heavy_channel_type": "qk",
            "ds_sparse_decode_threshold": 4096,
            "cpu_offload_gb": 0,
            "offload_group_size": -1,
            "offload_num_in_group": 1,
            "offload_prefetch_step": 1,
            "offload_mode": "cpu",
            "multi_item_scoring_delimiter": null,
            "disable_radix_cache": false,
            "cuda_graph_max_bs": 512,
            "cuda_graph_bs": [
                1,
                2,
                4,
                8,
                12,
                16,
                24,
                32,
                40,
                48,
                56,
                64,
                72,
                80,
                88,
                96,
                104,
                112,
                120,
                128,
                136,
                144,
                152,
                160,
                168,
                176,
                184,
                192,
                200,
                208,
                216,
                224,
                232,
                240,
                248,
                256,
                272,
                288,
                304,
                320,
                336,
                352,
                368,
                384,
                400,
                416,
                432,
                448,
                464,
                480,
                496,
                512
            ],
            "disable_cuda_graph": true,
            "disable_cuda_graph_padding": false,
            "enable_profile_cuda_graph": false,
            "enable_cudagraph_gc": false,
            "enable_layerwise_nvtx_marker": false,
            "enable_nccl_nvls": false,
            "enable_symm_mem": false,
            "disable_flashinfer_cutlass_moe_fp4_allgather": false,
            "enable_tokenizer_batch_encode": false,
            "disable_tokenizer_batch_decode": false,
            "disable_outlines_disk_cache": false,
            "disable_custom_all_reduce": false,
            "enable_mscclpp": false,
            "enable_torch_symm_mem": false,
            "disable_overlap_schedule": false,
            "enable_mixed_chunk": false,
            "enable_dp_attention": false,
            "enable_dp_lm_head": false,
            "enable_two_batch_overlap": false,
            "enable_single_batch_overlap": false,
            "tbo_token_distribution_threshold": 0.48,
            "enable_torch_compile": false,
            "enable_piecewise_cuda_graph": false,
            "enable_torch_compile_debug_mode": false,
            "torch_compile_max_bs": 32,
            "piecewise_cuda_graph_max_tokens": 2048,
            "piecewise_cuda_graph_tokens": [
                4,
                8,
                12,
                16,
                20,
                24,
                28,
                32,
                48,
                64,
                80,
                96,
                112,
                128,
                144,
                160,
                176,
                192,
                208,
                224,
                240,
                256,
                288,
                320,
                352,
                384,
                416,
                448,
                480,
                512,
                576,
                640,
                704,
                768,
                832,
                896,
                960,
                1024,
                1280,
                1536,
                1792,
                2048
            ],
            "piecewise_cuda_graph_compiler": "eager",
            "torchao_config": "",
            "enable_nan_detection": false,
            "enable_p2p_check": false,
            "triton_attention_reduce_in_fp32": false,
            "triton_attention_num_kv_splits": 8,
            "triton_attention_split_tile_size": null,
            "num_continuous_decode_steps": 1,
            "delete_ckpt_after_loading": false,
            "enable_memory_saver": false,
            "enable_weights_cpu_backup": false,
            "enable_draft_weights_cpu_backup": false,
            "allow_auto_truncate": false,
            "enable_custom_logit_processor": false,
            "flashinfer_mla_disable_ragged": false,
            "disable_shared_experts_fusion": false,
            "disable_chunked_prefix_cache": false,
            "disable_fast_image_processor": false,
            "keep_mm_feature_on_device": false,
            "enable_return_hidden_states": false,
            "enable_return_routed_experts": false,
            "scheduler_recv_interval": 1,
            "numa_node": null,
            "enable_deterministic_inference": false,
            "rl_on_policy_target": null,
            "enable_attn_tp_input_scattered": false,
            "enable_nsa_prefill_context_parallel": false,
            "nsa_prefill_cp_mode": "round-robin-split",
            "enable_fused_qk_norm_rope": false,
            "enable_precise_embedding_interpolation": false,
            "enable_dynamic_batch_tokenizer": false,
            "dynamic_batch_tokenizer_batch_size": 32,
            "dynamic_batch_tokenizer_batch_timeout": 0.002,
            "debug_tensor_dump_output_folder": null,
            "debug_tensor_dump_layers": null,
            "debug_tensor_dump_input_file": null,
            "debug_tensor_dump_inject": false,
            "disaggregation_mode": "prefill",
            "disaggregation_transfer_backend": "nixl",
            "disaggregation_bootstrap_port": 8998,
            "disaggregation_decode_tp": 16,
            "disaggregation_decode_dp": 1,
            "disaggregation_prefill_pp": 1,
            "disaggregation_ib_device": "mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11",
            "disaggregation_decode_enable_offload_kvcache": false,
            "num_reserved_decode_tokens": 512,
            "disaggregation_decode_polling_interval": 1,
            "encoder_only": false,
            "language_only": false,
            "encoder_transfer_backend": "zmq_to_scheduler",
            "encoder_urls": [],
            "custom_weight_loader": [],
            "weight_loader_disable_mmap": false,
            "remote_instance_weight_loader_seed_instance_ip": null,
            "remote_instance_weight_loader_seed_instance_service_port": null,
            "remote_instance_weight_loader_send_weights_group_ports": null,
            "remote_instance_weight_loader_backend": "nccl",
            "remote_instance_weight_loader_start_seed_via_transfer_engine": false,
            "enable_pdmux": false,
            "pdmux_config_path": null,
            "sm_group_num": 8,
            "mm_max_concurrent_calls": 32,
            "mm_per_request_timeout": 10.0,
            "enable_broadcast_mm_inputs_process": false,
            "enable_prefix_mm_cache": false,
            "mm_enable_dp_encoder": false,
            "mm_process_config": {},
            "limit_mm_data_per_request": null,
            "decrypted_config_file": null,
            "decrypted_draft_config_file": null,
            "forward_hooks": null,
            "use_mla_backend": true,
            "last_gen_throughput": 0.0,
            "memory_usage": {
                "weight": 40.62,
                "kvcache": 21.35,
                "token_capacity": 326223,
                "graph": 0
            },
            "effective_max_running_requests_per_dp": 2048
        }
    ],
    "version": "0.5.9"
}

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
enp0s20f0u5u2c2  UNKNOWN        
enp86s0f0        DOWN           
enp25s0np0       UP             10.99.91.59/31 
enp41s0np0       UP             10.99.92.59/31 
enp86s0f1        DOWN           
enp59s0np0       UP             10.99.93.59/31 
enp83s0f0np0     DOWN           
enp83s0f1np1     DOWN           
enp92s0np0       UP             10.99.94.59/31 
enp155s0np0      UP             10.99.95.59/31 
enp170s0np0      UP             10.99.96.59/31 
enp187s0np0      UP             10.99.97.59/31 
enp210s0f0np0    UP             
enp210s0f1np1    DOWN           
enp218s0np0      UP             10.99.98.59/31 
bond0            UP             10.73.175.137/29 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ibdev2netdev 
mlx5_0 port 1 ==> enp25s0np0 (Up)
mlx5_1 port 1 ==> enp41s0np0 (Up)
mlx5_10 port 1 ==> enp210s0f1np1 (Down)
mlx5_11 port 1 ==> enp218s0np0 (Up)
mlx5_2 port 1 ==> enp59s0np0 (Up)
mlx5_3 port 1 ==> bond0 (Up)
mlx5_4 port 1 ==> enp83s0f1np1 (Down)
mlx5_5 port 1 ==> enp92s0np0 (Up)
mlx5_6 port 1 ==> enp155s0np0 (Up)
mlx5_7 port 1 ==> enp170s0np0 (Up)
mlx5_8 port 1 ==> enp187s0np0 (Up)
mlx5_9 port 1 ==> bond0 (Up)
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ nvidia-smi topo -m
	GPU0	GPU1	GPU2	GPU3	GPU4	GPU5	GPU6	GPU7	NIC0	NIC1	NIC2	NIC3	NIC4	NIC5	NIC6	NIC7	NIC8	NIC9	NIC10	NIC11	CPU Affinity	NUMA Affinity	GPU NUMA ID
GPU0	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NV18	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU1	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU2	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU3	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU4	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU5	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU6	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	0-191	0		N/A
GPU7	NV18	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	0-191	0		N/A
NIC0	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC1	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC2	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC3	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC4	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC5	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE				
NIC6	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE				
NIC7	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE				
NIC8	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE				
NIC9	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE				
NIC10	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE				
NIC11	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 				

Legend:

  X    = Self
  SYS  = Connection traversing PCIe as well as the SMP interconnect between NUMA nodes (e.g., QPI/UPI)
  NODE = Connection traversing PCIe as well as the interconnect between PCIe Host Bridges within a NUMA node
  PHB  = Connection traversing PCIe as well as a PCIe Host Bridge (typically the CPU)
  PXB  = Connection traversing multiple PCIe bridges (without traversing the PCIe Host Bridge)
  PIX  = Connection traversing at most a single PCIe bridge
  NV#  = Connection traversing a bonded set of # NVLinks

NIC Legend:

  NIC0: mlx5_0
  NIC1: mlx5_1
  NIC2: mlx5_2
  NIC3: mlx5_3
  NIC4: mlx5_4
  NIC5: mlx5_5
  NIC6: mlx5_6
  NIC7: mlx5_7
  NIC8: mlx5_8
  NIC9: mlx5_9
  NIC10: mlx5_10
  NIC11: mlx5_11


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
enp0s20f0u5u2c2  UNKNOWN        
enp86s0f0        DOWN           
enp25s0np0       UP             10.99.91.63/31 
enp41s0np0       UP             10.99.92.63/31 
enp86s0f1        DOWN           
enp59s0np0       UP             10.99.93.63/31 
enp83s0f0np0     UP             
enp83s0f1np1     DOWN           
enp92s0np0       UP             10.99.94.63/31 
enp155s0np0      UP             10.99.95.63/31 
enp170s0np0      UP             10.99.96.63/31 
enp187s0np0      UP             10.99.97.63/31 
enp210s0f0np0    UP             
enp210s0f1np1    DOWN           
enp218s0np0      UP             10.99.98.63/31 
bond0            UP             10.73.175.138/29 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ ibdev2netdev 
mlx5_0 port 1 ==> enp25s0np0 (Up)
mlx5_1 port 1 ==> enp41s0np0 (Up)
mlx5_10 port 1 ==> enp210s0f1np1 (Down)
mlx5_11 port 1 ==> enp218s0np0 (Up)
mlx5_2 port 1 ==> enp59s0np0 (Up)
mlx5_3 port 1 ==> bond0 (Up)
mlx5_4 port 1 ==> enp83s0f1np1 (Down)
mlx5_5 port 1 ==> enp92s0np0 (Up)
mlx5_6 port 1 ==> enp155s0np0 (Up)
mlx5_7 port 1 ==> enp170s0np0 (Up)
mlx5_8 port 1 ==> enp187s0np0 (Up)
mlx5_9 port 1 ==> bond0 (Up)

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0009 ~]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
ens108np0        UP             10.99.91.47/31 
ens12f0np0       UP             
ens12f1np1       DOWN           
ens109np0        UP             10.99.92.47/31 
ens110np0        UP             10.99.93.47/31 
ens111np0        UP             10.99.94.47/31 
ens112np0        UP             10.99.95.47/31 
ens20f0np0       UP             
ens20f1np1       DOWN           
ens113np0        UP             10.99.96.47/31 
ens114np0        UP             10.99.97.47/31 
ens115np0        UP             10.99.98.47/31 
bond0            UP             10.73.175.121/29 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0009 ~]$ ibdev2netdev 
mlx5_0 port 1 ==> ens108np0 (Up)
mlx5_1 port 1 ==> bond0 (Up)
mlx5_10 port 1 ==> ens114np0 (Up)
mlx5_11 port 1 ==> ens115np0 (Up)
mlx5_2 port 1 ==> ens12f1np1 (Down)
mlx5_3 port 1 ==> ens109np0 (Up)
mlx5_4 port 1 ==> ens110np0 (Up)
mlx5_5 port 1 ==> ens111np0 (Up)
mlx5_6 port 1 ==> ens112np0 (Up)
mlx5_7 port 1 ==> bond0 (Up)
mlx5_8 port 1 ==> ens20f1np1 (Down)
mlx5_9 port 1 ==> ens113np0 (Up)


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0012 ~]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
eno1             DOWN           
eno2             DOWN           
ens3np0          UP             10.99.91.43/31 
ens2np0          UP             10.99.92.43/31 
ens4np0          UP             10.99.93.43/31 
ens1np0          UP             10.99.94.43/31 
ens8np0          UP             10.99.95.43/31 
ens7np0          UP             10.99.96.43/31 
ens6np0          UP             10.99.97.43/31 
ens5np0          UP             10.99.98.43/31 
ens12f0np0       UP             
ens12f1np1       DOWN           
ens10f0np0       UP             
ens10f1np1       DOWN           
bond0            UP             10.73.175.161/29 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0012 ~]$ ibdev2netdev 
mlx5_0 port 1 ==> ens3np0 (Up)
mlx5_1 port 1 ==> ens2np0 (Up)
mlx5_10 port 1 ==> bond0 (Up)
mlx5_11 port 1 ==> ens10f1np1 (Down)
mlx5_2 port 1 ==> ens4np0 (Up)
mlx5_3 port 1 ==> ens1np0 (Up)
mlx5_4 port 1 ==> ens8np0 (Up)
mlx5_5 port 1 ==> ens7np0 (Up)
mlx5_6 port 1 ==> ens6np0 (Up)
mlx5_7 port 1 ==> ens5np0 (Up)
mlx5_8 port 1 ==> bond0 (Up)
mlx5_9 port 1 ==> ens12f1np1 (Down)



Отлично, разбираю топологию новых нод:
НодаRoCE IPNICАктивные mlx5 (без bond/Down)000710.99.91.59enp25s0np00,1,2,5,6,7,8,11000810.99.91.63enp25s0np00,1,2,5,6,7,8,11000910.99.91.47ens108np00,3,4,5,6,9,10,11001210.99.91.43ens3np00,1,2,3,4,5,6,7
Схема decode групп:

Группа 1: 0003 + 0006 → порт 30001
Группа 2: 0007 + 0008 → порт 30001
Группа 3: 0009 + 0012 → порт 30001


Prefill — без изменений (aihub0001 и 0002 как прежде)

DECODE ГРУППА 1 — aihub0003 (rank 0) — без изменений:
bashSGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 \
SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.49 --port 30001 \
  --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
  --max-running-requests 128
DECODE ГРУППА 1 — aihub0006 (rank 1) — без изменений:
bashSGLANG_HOST_IP=10.99.91.35 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.35 \
SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.35 --port 30001 \
  --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
  --max-running-requests 128

DECODE ГРУППА 2 — aihub0007 (rank 0):
bashSGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
DECODE ГРУППА 2 — aihub0008 (rank 1):
bashSGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128

DECODE ГРУППА 3 — aihub0009 (rank 0):
bashSGLANG_HOST_IP=10.99.91.47 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.47 \
SGLANG_LOCAL_IP_NIC=ens108np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_SOCKET_IFNAME=ens108np0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.47 --port 30001 \
  --dist-init-addr 10.99.91.47:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
  --max-running-requests 128
DECODE ГРУППА 3 — aihub0012 (rank 1):
bashSGLANG_HOST_IP=10.99.91.43 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.43 \
SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.43 --port 30001 \
  --dist-init-addr 10.99.91.47:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
  --max-running-requests 128

РОУТЕР (запускать последним, когда все 8 нод ответили fired up):
bash/app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 8998 \
  --decode http://10.99.91.49:30001 \
  --decode http://10.99.91.59:30001 \
  --decode http://10.99.91.47:30001 \
  --host 0.0.0.0 \
  --port 8000




tpgds-aihub0008:52323:52323 [7] NCCL INFO Connected to proxy localRank 6 -> connection 0x7f9438007258
tpgds-aihub0008:52323:53602 [7] NCCL INFO New proxy send connection 74 from local rank 3, transport 2
tpgds-aihub0008:52323:53602 [7] NCCL INFO proxyProgressAsync opId=0x560e41afb7c0 op.type=1 op.reqBuff=0x7fef3c2a0650 op.respSize=16 done
tpgds-aihub0008:52319:52319 [3] NCCL INFO ncclPollProxyResponse Received new opId=0x560e41afb7c0
tpgds-aihub0008:52323:53602 [7] NCCL INFO Received and initiated operation=Init res=0
tpgds-aihub0008:52321:52321 [5] NCCL INFO init.cc:491 Cuda Host Alloc Size 1048576 pointer 0x7f21ade82000
tpgds-aihub0008:52319:52319 [3] NCCL INFO resp.opId=0x560e41afb7c0 matches expected opId=0x560e41afb7c0
tpgds-aihub0008:52319:52319 [3] NCCL INFO Connected to proxy localRank 7 -> connection 0x7fef3c0071e0
tpgds-aihub0008:52318:52318 [2] NCCL INFO init.cc:491 Cuda Host Alloc Size 1048576 pointer 0x7f81c9e82000
tpgds-aihub0008:52318:52318 [2] NCCL INFO init.cc:501 Cuda Host Alloc Size 65536 pointer 0x7f82abf8e200
tpgds-aihub0008:52318:52318 [2] NCCL INFO init.cc:502 Cuda Host Alloc Size 65536 pointer 0x7f82abf9e200
tpgds-aihub0008:52323:53602 [7] NCCL INFO transport/p2p.cc:233 Cuda Alloc Size 33554432 pointer 0x7fef0a000000
tpgds-aihub0008:52323:53602 [7] NCCL INFO Allocated shareable buffer 0x7fef0a000000 size 33554432 ipcDesc 0x7fef3c3a1668
tpgds-aihub0008:52323:53602 [7] NCCL INFO proxyProgressAsync opId=0x560e41afb7c0 op.type=2 op.reqBuff=0x7fef3c2a0650 op.respSize=0 done
tpgds-aihub0008:52323:53602 [7] NCCL INFO Received and initiated operation=SharedInit res=0
tpgds-aihub0008:52319:52319 [3] NCCL INFO ncclPollProxyResponse Received new opId=0x560e41afb7c0
tpgds-aihub0008:52319:52319 [3] NCCL INFO resp.opId=0x560e41afb7c0 matches expected opId=0x560e41afb7c0
tpgds-aihub0008:52321:53599 [5] NCCL INFO transport/p2p.cc:233 Cuda Alloc Size 33554432 pointer 0x7f219a000000
tpgds-aihub0008:52319:52319 [3] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:52322:53601 [6] NCCL INFO transport/p2p.cc:233 Cuda Alloc Size 33554432 pointer 0x7f93fa000000
tpgds-aihub0008:52319:52319 [3] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:52321:53599 [5] NCCL INFO Allocated shareable buffer 0x7f219a000000 size 33554432 ipcDesc 0x7f21d829f248
tpgds-aihub0008:52322:53601 [6] NCCL INFO Allocated shareable buffer 0x7f93fa000000 size 33554432 ipcDesc 0x7f94382feaf8
tpgds-aihub0008:52321:53599 [5] NCCL INFO proxyProgressAsync opId=0x55deeb9b3150 op.type=2 op.reqBuff=0x7f21d82d2fa0 op.respSize=0 done
tpgds-aihub0008:52322:53601 [6] NCCL INFO proxyProgressAsync opId=0x562ba6fee6f0 op.type=2 op.reqBuff=0x7f94383f6fe0 op.respSize=0 done
tpgds-aihub0008:52321:53599 [5] NCCL INFO Received and initiated operation=SharedInit res=0
tpgds-aihub0008:52322:52322 [6] NCCL INFO ncclPollProxyResponse Received new opId=0x55deeb9b3150
tpgds-aihub0008:52323:52323 [7] NCCL INFO ncclPollProxyResponse Received new opId=0x562ba6fee6f0
tpgds-aihub0008:52322:52322 [6] NCCL INFO resp.opId=0x55deeb9b3150 matches expected opId=0x55deeb9b3150
tpgds-aihub0008:52323:52323 [7] NCCL INFO resp.opId=0x562ba6fee6f0 matches expected opId=0x562ba6fee6f0
tpgds-aihub0008:52322:53601 [6] NCCL INFO Received and initiated operation=SharedInit res=0
tpgds-aihub0008:52319:52319 [3] NCCL INFO init.cc:447 Cuda Alloc Size 23648 pointer 0x7f6202a2a000
tpgds-aihub0008:52323:52323 [7] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:52323:52323 [7] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:52319:52319 [3] NCCL INFO init.cc:449 Cuda Alloc Size 64 pointer 0x7f6202a2fe00
tpgds-aihub0008:52323:52323 [7] NCCL INFO init.cc:447 Cuda Alloc Size 23648 pointer 0x7ff026a2a000
tpgds-aihub0008:52321:52321 [5] NCCL INFO init.cc:501 Cuda Host Alloc Size 65536 pointer 0x7f228ff8e200
tpgds-aihub0008:52323:52323 [7] NCCL INFO init.cc:449 Cuda Alloc Size 64 pointer 0x7ff026a2fe00
tpgds-aihub0008:52321:52321 [5] NCCL INFO init.cc:502 Cuda Host Alloc Size 65536 pointer 0x7f228ff9e200
tpgds-aihub0008:52323:53602 [7] NCCL INFO New proxy send connection 75 from local rank 6, transport 2
tpgds-aihub0008:52319:52319 [3] NCCL INFO init.cc:491 Cuda Host Alloc Size 1048576 pointer 0x7f60f5e82000
tpgds-aihub0008:52323:53602 [7] NCCL INFO proxyProgressAsync opId=0x55deeb9b3150 op.type=1 op.reqBuff=0x7fef3c2a0650 op.respSize=16 done
tpgds-aihub0008:52322:52322 [6] NCCL INFO ncclPollProxyResponse Received new opId=0x55deeb9b3150
tpgds-aihub0008:52319:52319 [3] NCCL INFO init.cc:501 Cuda Host Alloc Size 65536 pointer 0x7f61d7f8e200
tpgds-aihub0008:52322:52322 [6] NCCL INFO resp.opId=0x55deeb9b3150 matches expected opId=0x55deeb9b3150
tpgds-aihub0008:52323:53602 [7] NCCL INFO Received and initiated operation=Init res=0
tpgds-aihub0008:52319:52319 [3] NCCL INFO init.cc:502 Cuda Host Alloc Size 65536 pointer 0x7f61d7f9e200
tpgds-aihub0008:52322:52322 [6] NCCL INFO Connected to proxy localRank 7 -> connection 0x7fef3c007258
tpgds-aihub0008:52323:52323 [7] NCCL INFO init.cc:491 Cuda Host Alloc Size 1048576 pointer 0x7fef1be82000
tpgds-aihub0008:52323:52323 [7] NCCL INFO init.cc:501 Cuda Host Alloc Size 65536 pointer 0x7feffbf8e200
tpgds-aihub0008:52323:53602 [7] NCCL INFO transport/p2p.cc:233 Cuda Alloc Size 33554432 pointer 0x7fef08000000
tpgds-aihub0008:52323:53602 [7] NCCL INFO Allocated shareable buffer 0x7fef08000000 size 33554432 ipcDesc 0x7fef3c2fed78
tpgds-aihub0008:52323:53602 [7] NCCL INFO proxyProgressAsync opId=0x55deeb9b3150 op.type=2 op.reqBuff=0x7fef3c2a0650 op.respSize=0 done
tpgds-aihub0008:52323:52323 [7] NCCL INFO init.cc:502 Cuda Host Alloc Size 65536 pointer 0x7feffbf9e200
tpgds-aihub0008:52322:52322 [6] NCCL INFO ncclPollProxyResponse Received new opId=0x55deeb9b3150
tpgds-aihub0008:52322:52322 [6] NCCL INFO resp.opId=0x55deeb9b3150 matches expected opId=0x55deeb9b3150
tpgds-aihub0008:52322:52322 [6] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:52322:52322 [6] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:52323:53602 [7] NCCL INFO Received and initiated operation=SharedInit res=0
tpgds-aihub0008:52322:52322 [6] NCCL INFO init.cc:447 Cuda Alloc Size 23648 pointer 0x7f951aa2a000
tpgds-aihub0008:52322:52322 [6] NCCL INFO init.cc:449 Cuda Alloc Size 64 pointer 0x7f951aa2fe00
tpgds-aihub0008:52322:52322 [6] NCCL INFO init.cc:491 Cuda Host Alloc Size 1048576 pointer 0x7f940de82000
tpgds-aihub0008:52322:52322 [6] NCCL INFO init.cc:501 Cuda Host Alloc Size 65536 pointer 0x7f94eff8e200
tpgds-aihub0008:52322:52322 [6] NCCL INFO init.cc:502 Cuda Host Alloc Size 65536 pointer 0x7f94eff9e200
tpgds-aihub0008:52323:52323 [7] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52319:52319 [3] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52323:52323 [7] NCCL INFO ncclCommInitRank comm 0x562b9d3ba940 rank 15 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52317:52317 [1] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52319:52319 [3] NCCL INFO ncclCommInitRank comm 0x560e379800b0 rank 11 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52321:52321 [5] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52316:52316 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52323:52323 [7] NCCL INFO Init timings - ncclCommInitRank: rank 15 nranks 16 total 1.53 (kernels 0.24, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.07, graphs 0.01, connections 0.21, rest 0.00)
tpgds-aihub0008:52317:52317 [1] NCCL INFO ncclCommInitRank comm 0x55b79c4620d0 rank 9 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52320:52320 [4] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52318:52318 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52319:52319 [3] NCCL INFO Init timings - ncclCommInitRank: rank 11 nranks 16 total 1.55 (kernels 0.24, alloc 0.99, bootstrap 0.02, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:52321:52321 [5] NCCL INFO ncclCommInitRank comm 0x555927d9ee40 rank 13 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52316:52316 [0] NCCL INFO ncclCommInitRank comm 0x55d658aa20b0 rank 8 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52322:52322 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:52317:52317 [1] NCCL INFO Init timings - ncclCommInitRank: rank 9 nranks 16 total 1.55 (kernels 0.22, alloc 0.81, bootstrap 0.23, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:52320:52320 [4] NCCL INFO ncclCommInitRank comm 0x5609ed20d210 rank 12 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52318:52318 [2] NCCL INFO ncclCommInitRank comm 0x563cc3da24f0 rank 10 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52321:52321 [5] NCCL INFO Init timings - ncclCommInitRank: rank 13 nranks 16 total 1.54 (kernels 0.25, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:52316:52316 [0] NCCL INFO Init timings - ncclCommInitRank: rank 8 nranks 16 total 1.57 (kernels 0.25, alloc 1.01, bootstrap 0.02, allgathers 0.01, topo 0.07, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:52322:52322 [6] NCCL INFO ncclCommInitRank comm 0x55dee1833070 rank 14 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0xabaf8d8e9c0f4614 - Init COMPLETE
tpgds-aihub0008:52320:52320 [4] NCCL INFO Init timings - ncclCommInitRank: rank 12 nranks 16 total 1.53 (kernels 0.24, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.07, graphs 0.01, connections 0.21, rest 0.01)
tpgds-aihub0008:52318:52318 [2] NCCL INFO Init timings - ncclCommInitRank: rank 10 nranks 16 total 1.54 (kernels 0.25, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.07, graphs 0.01, connections 0.21, rest 0.00)
tpgds-aihub0008:52322:52322 [6] NCCL INFO Init timings - ncclCommInitRank: rank 14 nranks 16 total 1.54 (kernels 0.22, alloc 1.01, bootstrap 0.02, allgathers 0.01, topo 0.07, graphs 0.01, connections 0.21, rest 0.00)
tpgds-aihub0008:52316:52316 [0] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f1315e00400 recvbuff 0x7f1315e00400 count 1 datatype 7 op 0 root 0 comm 0x55d658aa20b0 [nranks=16] stream 0x55d662c1f640
tpgds-aihub0008:52316:52316 [0] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52318:52318 [2] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f82e9e00400 recvbuff 0x7f82e9e00400 count 1 datatype 7 op 0 root 0 comm 0x563cc3da24f0 [nranks=16] stream 0x563ccdf22820
tpgds-aihub0008:52318:52318 [2] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52323:52323 [7] NCCL INFO AllReduce: opCount 0 sendbuff 0x7ff039e00400 recvbuff 0x7ff039e00400 count 1 datatype 7 op 0 root 0 comm 0x562b9d3ba940 [nranks=16] stream 0x562ba6fee6f0
tpgds-aihub0008:52323:52323 [7] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52317:52317 [1] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f5c09e00400 recvbuff 0x7f5c09e00400 count 1 datatype 7 op 0 root 0 comm 0x55b79c4620d0 [nranks=16] stream 0x55b7a65dd410
tpgds-aihub0008:52317:52317 [1] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52320:52320 [4] NCCL INFO AllReduce: opCount 0 sendbuff 0x7ff43de00400 recvbuff 0x7ff43de00400 count 1 datatype 7 op 0 root 0 comm 0x5609ed20d210 [nranks=16] stream 0x5609f7387c10
tpgds-aihub0008:52320:52320 [4] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52321:52321 [5] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f22cde00400 recvbuff 0x7f22cde00400 count 1 datatype 7 op 0 root 0 comm 0x555927d9ee40 [nranks=16] stream 0x555931f1c930
tpgds-aihub0008:52321:52321 [5] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52322:52322 [6] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f952de00400 recvbuff 0x7f952de00400 count 1 datatype 7 op 0 root 0 comm 0x55dee1833070 [nranks=16] stream 0x55deeb9b3150
tpgds-aihub0008:52322:52322 [6] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0008:52319:52319 [3] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f6215e00400 recvbuff 0x7f6215e00400 count 1 datatype 7 op 0 root 0 comm 0x560e379800b0 [nranks=16] stream 0x560e41afb7c0
tpgds-aihub0008:52319:52319 [3] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)

