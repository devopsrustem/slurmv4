((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ SGLANG_HOST_IP=10.99.91.39 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.39 SGLANG_LOCAL_IP_NIC=ens108np0 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false  /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph 

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_HOST_IP=10.99.91.41 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.41 SGLANG_LOCAL_IP_NIC=ens108np0   GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false  /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph 


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0   GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device  mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ SGLANG_HOST_IP=10.99.91.35 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.35 MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=info NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device  mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 


The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-27 14:33:03] INFO server_args.py:1697: Attention backend not specified. Use fa3 backend by default.
[2026-02-27 14:33:03] WARNING server_args.py:2326: KV cache is forced as chunk cache for decode server
[2026-02-27 14:33:04] server_args=ServerArgs(model_path='/app/models/Deepseek-R1/', tokenizer_path='/app/models/Deepseek-R1/', tokenizer_mode='auto', tokenizer_worker_num=1, skip_tokenizer_init=False, load_format='auto', model_loader_extra_config='{}', trust_remote_code=True, context_length=None, is_embedding=False, enable_multimodal=None, revision=None, model_impl='auto', host='10.99.91.49', port=30001, fastapi_root_path='', grpc_mode=False, skip_server_warmup=False, warmups=None, nccl_port=None, checkpoint_engine_wait_weights_before_ready=False, dtype='auto', quantization=None, quantization_param_path=None, kv_cache_dtype='auto', enable_fp32_lm_head=False, modelopt_quant=None, modelopt_checkpoint_restore_path=None, modelopt_checkpoint_save_path=None, modelopt_export_path=None, quantize_and_serve=False, rl_quant_profile=None, mem_fraction_static=0.8, max_running_requests=128, max_queued_requests=None, max_total_tokens=None, chunked_prefill_size=8192, enable_dynamic_chunking=False, max_prefill_tokens=16384, prefill_max_requests=None, schedule_policy='fcfs', enable_priority_scheduling=False, abort_on_priority_when_disabled=False, schedule_low_priority_values_first=False, priority_scheduling_preemption_threshold=10, schedule_conservativeness=1.0, page_size=1, swa_full_tokens_ratio=0.8, disable_hybrid_swa_memory=False, radix_eviction_policy='lru', enable_prefill_delayer=False, prefill_delayer_max_delay_passes=30, prefill_delayer_token_usage_low_watermark=None, prefill_delayer_forward_passes_buckets=None, prefill_delayer_wait_seconds_buckets=None, device='cuda', tp_size=16, pp_size=1, pp_max_micro_batch_size=None, pp_async_batch_depth=0, stream_interval=1, stream_output=False, random_seed=741016548, constrained_json_whitespace_pattern=None, constrained_json_disable_any_whitespace=False, watchdog_timeout=300, soft_watchdog_timeout=None, dist_timeout=None, download_dir=None, model_checksum=None, base_gpu_id=0, gpu_id_step=1, sleep_on_idle=False, custom_sigquit_handler=None, log_level='info', log_level_http=None, log_requests=False, log_requests_level=2, log_requests_format='text', log_requests_target=None, uvicorn_access_log_exclude_prefixes=[], crash_dump_folder=None, show_time_cost=False, enable_metrics=False, enable_metrics_for_all_schedulers=False, tokenizer_metrics_custom_labels_header='x-custom-labels', tokenizer_metrics_allowed_custom_labels=None, bucket_time_to_first_token=None, bucket_inter_token_latency=None, bucket_e2e_request_latency=None, collect_tokens_histogram=False, prompt_tokens_buckets=None, generation_tokens_buckets=None, gc_warning_threshold_secs=0.0, decode_log_interval=40, enable_request_time_stats_logging=False, kv_events_config=None, enable_trace=False, otlp_traces_endpoint='localhost:4317', export_metrics_to_file=False, export_metrics_to_file_dir=None, api_key=None, admin_api_key=None, served_model_name='/app/models/Deepseek-R1/', weight_version='default', chat_template=None, hf_chat_template_name=None, completion_template=None, file_storage_path='sglang_storage', enable_cache_report=False, reasoning_parser=None, tool_call_parser=None, tool_server=None, sampling_defaults='model', dp_size=1, load_balance_method='round_robin', dist_init_addr='10.99.91.49:5000', nnodes=2, node_rank=0, json_model_override_args='{}', preferred_sampling_params=None, enable_lora=None, enable_lora_overlap_loading=None, max_lora_rank=None, lora_target_modules=None, lora_paths=None, max_loaded_loras=None, max_loras_per_batch=8, lora_eviction_policy='lru', lora_backend='csgmv', max_lora_chunk_size=16, attention_backend='fa3', decode_attention_backend=None, prefill_attention_backend=None, sampling_backend='flashinfer', grammar_backend='xgrammar', mm_attention_backend=None, fp8_gemm_runner_backend='auto', fp4_gemm_runner_backend='auto', nsa_prefill_backend='flashmla_sparse', nsa_decode_backend='fa3', disable_flashinfer_autotune=False, speculative_algorithm=None, speculative_draft_model_path=None, speculative_draft_model_revision=None, speculative_draft_load_format=None, speculative_num_steps=None, speculative_eagle_topk=None, speculative_num_draft_tokens=None, speculative_accept_threshold_single=1.0, speculative_accept_threshold_acc=1.0, speculative_token_map=None, speculative_attention_mode='prefill', speculative_draft_attention_backend=None, speculative_moe_runner_backend='auto', speculative_moe_a2a_backend=None, speculative_draft_model_quantization=None, speculative_ngram_min_match_window_size=1, speculative_ngram_max_match_window_size=12, speculative_ngram_min_bfs_breadth=1, speculative_ngram_max_bfs_breadth=10, speculative_ngram_match_type='BFS', speculative_ngram_branch_length=18, speculative_ngram_capacity=10000000, enable_multi_layer_eagle=False, ep_size=1, moe_a2a_backend='none', moe_runner_backend='auto', flashinfer_mxfp4_moe_precision='default', enable_flashinfer_allreduce_fusion=False, deepep_mode='auto', ep_num_redundant_experts=0, ep_dispatch_algorithm=None, init_expert_location='trivial', enable_eplb=False, eplb_algorithm='auto', eplb_rebalance_num_iterations=1000, eplb_rebalance_layers_per_chunk=None, eplb_min_rebalancing_utilization_threshold=1.0, expert_distribution_recorder_mode=None, expert_distribution_recorder_buffer_size=1000, enable_expert_distribution_metrics=False, deepep_config=None, moe_dense_tp_size=None, elastic_ep_backend=None, mooncake_ib_device=None, max_mamba_cache_size=None, mamba_ssm_dtype='float32', mamba_full_memory_ratio=0.9, mamba_scheduler_strategy='no_buffer', mamba_track_interval=256, enable_hierarchical_cache=False, hicache_ratio=2.0, hicache_size=0, hicache_write_policy='write_through', hicache_io_backend='kernel', hicache_mem_layout='layer_first', disable_hicache_numa_detect=False, hicache_storage_backend=None, hicache_storage_prefetch_policy='best_effort', hicache_storage_backend_extra_config=None, hierarchical_sparse_attention_extra_config=None, enable_lmcache=False, kt_weight_path=None, kt_method='AMXINT4', kt_cpuinfer=None, kt_threadpool_count=2, kt_num_gpu_experts=None, kt_max_deferred_experts_per_token=None, dllm_algorithm=None, dllm_algorithm_config=None, enable_double_sparsity=False, ds_channel_config_path=None, ds_heavy_channel_num=32, ds_heavy_token_num=256, ds_heavy_channel_type='qk', ds_sparse_decode_threshold=4096, cpu_offload_gb=0, offload_group_size=-1, offload_num_in_group=1, offload_prefetch_step=1, offload_mode='cpu', multi_item_scoring_delimiter=None, disable_radix_cache=True, cuda_graph_max_bs=512, cuda_graph_bs=[1, 2, 4, 8, 12, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248, 256, 272, 288, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496, 512], disable_cuda_graph=False, disable_cuda_graph_padding=False, enable_profile_cuda_graph=False, enable_cudagraph_gc=False, enable_layerwise_nvtx_marker=False, enable_nccl_nvls=False, enable_symm_mem=False, disable_flashinfer_cutlass_moe_fp4_allgather=False, enable_tokenizer_batch_encode=False, disable_tokenizer_batch_decode=False, disable_outlines_disk_cache=False, disable_custom_all_reduce=False, enable_mscclpp=False, enable_torch_symm_mem=False, disable_overlap_schedule=False, enable_mixed_chunk=False, enable_dp_attention=False, enable_dp_lm_head=False, enable_two_batch_overlap=False, enable_single_batch_overlap=False, tbo_token_distribution_threshold=0.48, enable_torch_compile=False, enable_piecewise_cuda_graph=False, enable_torch_compile_debug_mode=False, torch_compile_max_bs=32, piecewise_cuda_graph_max_tokens=2048, piecewise_cuda_graph_tokens=[4, 8, 12, 16, 20, 24, 28, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 288, 320, 352, 384, 416, 448, 480, 512, 640, 704, 768, 832, 896, 960, 1024, 1280, 1536, 1792, 2048], piecewise_cuda_graph_compiler='eager', torchao_config='', enable_nan_detection=False, enable_p2p_check=False, triton_attention_reduce_in_fp32=False, triton_attention_num_kv_splits=8, triton_attention_split_tile_size=None, num_continuous_decode_steps=1, delete_ckpt_after_loading=False, enable_memory_saver=False, enable_weights_cpu_backup=False, enable_draft_weights_cpu_backup=False, allow_auto_truncate=False, enable_custom_logit_processor=False, flashinfer_mla_disable_ragged=False, disable_shared_experts_fusion=False, disable_chunked_prefix_cache=False, disable_fast_image_processor=False, keep_mm_feature_on_device=False, enable_return_hidden_states=False, enable_return_routed_experts=False, scheduler_recv_interval=1, numa_node=None, enable_deterministic_inference=False, rl_on_policy_target=None, enable_attn_tp_input_scattered=False, enable_nsa_prefill_context_parallel=False, nsa_prefill_cp_mode='in-seq-split', enable_fused_qk_norm_rope=False, enable_precise_embedding_interpolation=False, enable_dynamic_batch_tokenizer=False, dynamic_batch_tokenizer_batch_size=32, dynamic_batch_tokenizer_batch_timeout=0.002, debug_tensor_dump_output_folder=None, debug_tensor_dump_layers=None, debug_tensor_dump_input_file=None, debug_tensor_dump_inject=False, disaggregation_mode='decode', disaggregation_transfer_backend='mooncake', disaggregation_bootstrap_port=8998, disaggregation_decode_tp=None, disaggregation_decode_dp=None, disaggregation_prefill_pp=1, disaggregation_ib_device='mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7', disaggregation_decode_enable_offload_kvcache=False, disaggregation_decode_enable_fake_auto=False, num_reserved_decode_tokens=512, disaggregation_decode_polling_interval=1, encoder_only=False, language_only=False, encoder_transfer_backend='zmq_to_scheduler', encoder_urls=[], custom_weight_loader=[], weight_loader_disable_mmap=False, remote_instance_weight_loader_seed_instance_ip=None, remote_instance_weight_loader_seed_instance_service_port=None, remote_instance_weight_loader_send_weights_group_ports=None, remote_instance_weight_loader_backend='nccl', remote_instance_weight_loader_start_seed_via_transfer_engine=False, enable_pdmux=False, pdmux_config_path=None, sm_group_num=8, mm_max_concurrent_calls=32, mm_per_request_timeout=10.0, enable_broadcast_mm_inputs_process=False, enable_prefix_mm_cache=False, mm_enable_dp_encoder=False, mm_process_config={}, limit_mm_data_per_request=None, decrypted_config_file=None, decrypted_draft_config_file=None, forward_hooks=None)
[2026-02-27 14:33:04] Using default HuggingFace chat template with detected content format: string
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-27 14:33:13 TP1] Init torch distributed begin.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[W227 14:33:13.089845986 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
[2026-02-27 14:33:13 TP5] Init torch distributed begin.
[W227 14:33:13.472717844 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
...
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-27 14:33:14 TP6] Init torch distributed begin.
[2026-02-27 14:33:14 TP3] Init torch distributed begin.
[2026-02-27 14:33:14 TP2] Init torch distributed begin.
[2026-02-27 14:33:14 TP4] Init torch distributed begin.
[2026-02-27 14:33:14 TP7] Init torch distributed begin.
[2026-02-27 14:33:14 TP0] Init torch distributed begin.
[W227 14:33:15.752093632 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
...
[W227 14:33:15.835161340 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 1 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
...
[Gloo] Rank 6 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[2026-02-27 14:33:20 TP0] sglang is using nccl==2.29.3
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO ENV/Plugin: Could not find: libnccl-env.so
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Bootstrap: Using ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL version 2.29.3+cuda13.1
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL git version stable dcf2a2fbe
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NET/Plugin: Could not find: libnccl-net.so
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_SOCKET_IFNAME set by environment to ens3np0
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Using network IB
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Using network IB
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Using network IB
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Using network IB
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Using network IB
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Using network IB
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_3:1/RoCE [4]mlx5_4:1/RoCE [5]mlx5_5:1/RoCE [6]mlx5_6:1/RoCE [7]mlx5_7:1/RoCE [8]mlx5_10:1/RoCE [RO]; OOB ens3np0:10.99.91.49<0>
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Initialized NET plugin IB
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Using network IB
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Assigned GIN plugin GIN_IB_GDAKI to comm
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Assigned RMA plugin GIN_IB_PROXY to comm
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Using network IB
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO DMA-BUF is available on GPU device 0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO [Rank 0] ncclCommInitRank comm 0x5621301a1640 rank 0 nranks 16 cudaDev 0 nvmlDev 0 busId a000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO DMA-BUF is available on GPU device 2
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO [Rank 2] ncclCommInitRank comm 0x55db95387730 rank 2 nranks 16 cudaDev 2 nvmlDev 2 busId 3b000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO DMA-BUF is available on GPU device 4
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO [Rank 4] ncclCommInitRank comm 0x555e761ae1d0 rank 4 nranks 16 cudaDev 4 nvmlDev 4 busId 87000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO DMA-BUF is available on GPU device 3
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO [Rank 3] ncclCommInitRank comm 0x56396871db00 rank 3 nranks 16 cudaDev 3 nvmlDev 3 busId 44000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO DMA-BUF is available on GPU device 6
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO [Rank 6] ncclCommInitRank comm 0x55833d11d130 rank 6 nranks 16 cudaDev 6 nvmlDev 6 busId b8000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO DMA-BUF is available on GPU device 7
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO [Rank 7] ncclCommInitRank comm 0x56262b389b30 rank 7 nranks 16 cudaDev 7 nvmlDev 7 busId c1000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO DMA-BUF is available on GPU device 5
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO [Rank 5] ncclCommInitRank comm 0x5606e5888830 rank 5 nranks 16 cudaDev 5 nvmlDev 5 busId 90000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO DMA-BUF is available on GPU device 1
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO [Rank 1] ncclCommInitRank comm 0x5581a86a1830 rank 1 nranks 16 cudaDev 1 nvmlDev 1 busId 18000 commId 0x35712f37c64c1510 - Init START
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Bootstrap timings total 0.005946 (create 0.000018, send 0.000066, recv 0.000084, ring 0.004029, delay 0.000000)
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
...
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Bootstrap timings total 0.005130 (create 0.000023, send 0.000072, recv 0.000099, ring 0.002838, delay 0.000001)
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO MNNVL busId 0xc1000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO MNNVL busId 0xb8000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO MNNVL busId 0x90000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO MNNVL busId 0x87000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO MNNVL busId 0x44000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO MNNVL busId 0x3b000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO MNNVL busId 0x18000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Bootstrap timings total 0.212081 (create 0.000030, send 0.000086, recv 0.206276, ring 0.003569, delay 0.000001)
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO MNNVL busId 0xa000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 6 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 1 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 2 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 5 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 0 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 4 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 7 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO ncclTopoGetCpuAffinity: Affinity for GPU 3 is empty, ignoring. (GPU affinity =  ; CPU affinity = 0-111).
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO comm 0x5581a86a1830 rank 1 nRanks 16 nNodes 2 localRanks 8 localRank 1 MNNVL 0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO comm 0x5621301a1640 rank 0 nRanks 16 nNodes 2 localRanks 8 localRank 0 MNNVL 0
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Trees [0] 2/-1/-1->1->0 [1] 0/9/-1->1->-1 [2] -1/-1/-1->1->0 [3] 0/-1/-1->1->2 [4] 2/-1/-1->1->0 [5] 0/-1/-1->1->2 [6] 2/-1/-1->1->0 [7] 0/-1/-1->1->2 [8] 2/-1/-1->1->0 [9] 0/-1/-1->1->9 [10] -1/-1/-1->1->0 [11] 0/-1/-1->1->2 [12] 2/-1/-1->1->0 [13] 0/-1/-1->1->2 [14] 2/-1/-1->1->0 [15] 0/-1/-1->1->2
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/16 :  0  7  6  5  4  3  2  1  8 15 14 13 12 11 10  9
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 01/16 :  0  7  6  5  4  3  2  9  8 15 14 13 12 11 10  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 02/16 :  0  7  6  5  4  3 10  9  8 15 14 13 12 11  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 03/16 :  0  7  6  5  4 11 10  9  8 15 14 13 12  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 04/16 :  0  7  6  5 12 11 10  9  8 15 14 13  4  3  2  1
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO comm 0x55db95387730 rank 2 nRanks 16 nNodes 2 localRanks 8 localRank 2 MNNVL 0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 05/16 :  0  7  6 13 12 11 10  9  8 15 14  5  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 06/16 :  0  7 14 13 12 11 10  9  8 15  6  5  4  3  2  1
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO comm 0x56396871db00 rank 3 nRanks 16 nNodes 2 localRanks 8 localRank 3 MNNVL 0
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 07/16 :  0 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/16 :  0  7  6  5  4  3  2  1  8 15 14 13 12 11 10  9
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Trees [0] 3/-1/-1->2->1 [1] -1/-1/-1->2->3 [2] 3/10/-1->2->-1 [3] 1/-1/-1->2->3 [4] 3/-1/-1->2->1 [5] 1/-1/-1->2->3 [6] 3/-1/-1->2->1 [7] 1/-1/-1->2->3 [8] 3/-1/-1->2->1 [9] -1/-1/-1->2->3 [10] 3/-1/-1->2->10 [11] 1/-1/-1->2->3 [12] 3/-1/-1->2->1 [13] 1/-1/-1->2->3 [14] 3/-1/-1->2->1 [15] 1/-1/-1->2->3
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 09/16 :  0  7  6  5  4  3  2  9  8 15 14 13 12 11 10  1
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Trees [0] 4/-1/-1->3->2 [1] 2/-1/-1->3->4 [2] 4/-1/-1->3->2 [3] 2/11/-1->3->-1 [4] -1/-1/-1->3->2 [5] 2/-1/-1->3->4 [6] 4/-1/-1->3->2 [7] 2/-1/-1->3->4 [8] 4/-1/-1->3->2 [9] 2/-1/-1->3->4 [10] 4/-1/-1->3->2 [11] 2/-1/-1->3->11 [12] -1/-1/-1->3->2 [13] 2/-1/-1->3->4 [14] 4/-1/-1->3->2 [15] 2/-1/-1->3->4
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 10/16 :  0  7  6  5  4  3 10  9  8 15 14 13 12 11  2  1
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 11/16 :  0  7  6  5  4 11 10  9  8 15 14 13 12  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 12/16 :  0  7  6  5 12 11 10  9  8 15 14 13  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 13/16 :  0  7  6 13 12 11 10  9  8 15 14  5  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 14/16 :  0  7 14 13 12 11 10  9  8 15  6  5  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 15/16 :  0 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Trees [0] 1/8/-1->0->-1 [1] 7/-1/-1->0->1 [2] 1/-1/-1->0->7 [3] 7/-1/-1->0->1 [4] 1/-1/-1->0->7 [5] 7/-1/-1->0->1 [6] 1/-1/-1->0->7 [7] -1/-1/-1->0->1 [8] 1/-1/-1->0->8 [9] 7/-1/-1->0->1 [10] 1/-1/-1->0->7 [11] 7/-1/-1->0->1 [12] 1/-1/-1->0->7 [13] 7/-1/-1->0->1 [14] 1/-1/-1->0->7 [15] -1/-1/-1->0->1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO comm 0x555e761ae1d0 rank 4 nRanks 16 nNodes 2 localRanks 8 localRank 4 MNNVL 0
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO comm 0x5606e5888830 rank 5 nRanks 16 nNodes 2 localRanks 8 localRank 5 MNNVL 0
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Trees [0] 5/-1/-1->4->3 [1] 3/-1/-1->4->5 [2] 5/-1/-1->4->3 [3] -1/-1/-1->4->5 [4] 5/12/-1->4->-1 [5] 3/-1/-1->4->5 [6] 5/-1/-1->4->3 [7] 3/-1/-1->4->5 [8] 5/-1/-1->4->3 [9] 3/-1/-1->4->5 [10] 5/-1/-1->4->3 [11] -1/-1/-1->4->5 [12] 5/-1/-1->4->12 [13] 3/-1/-1->4->5 [14] 5/-1/-1->4->3 [15] 3/-1/-1->4->5
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Trees [0] 6/-1/-1->5->4 [1] 4/-1/-1->5->6 [2] 6/-1/-1->5->4 [3] 4/-1/-1->5->6 [4] 6/-1/-1->5->4 [5] 4/13/-1->5->-1 [6] -1/-1/-1->5->4 [7] 4/-1/-1->5->6 [8] 6/-1/-1->5->4 [9] 4/-1/-1->5->6 [10] 6/-1/-1->5->4 [11] 4/-1/-1->5->6 [12] 6/-1/-1->5->4 [13] 4/-1/-1->5->13 [14] -1/-1/-1->5->4 [15] 4/-1/-1->5->6
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO comm 0x55833d11d130 rank 6 nRanks 16 nNodes 2 localRanks 8 localRank 6 MNNVL 0
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Trees [0] 7/-1/-1->6->5 [1] 5/-1/-1->6->7 [2] 7/-1/-1->6->5 [3] 5/-1/-1->6->7 [4] 7/-1/-1->6->5 [5] -1/-1/-1->6->7 [6] 7/14/-1->6->-1 [7] 5/-1/-1->6->7 [8] 7/-1/-1->6->5 [9] 5/-1/-1->6->7 [10] 7/-1/-1->6->5 [11] 5/-1/-1->6->7 [12] 7/-1/-1->6->5 [13] -1/-1/-1->6->7 [14] 7/-1/-1->6->14 [15] 5/-1/-1->6->7
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO comm 0x56262b389b30 rank 7 nRanks 16 nNodes 2 localRanks 8 localRank 7 MNNVL 0
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Trees [0] -1/-1/-1->7->6 [1] 6/-1/-1->7->0 [2] 0/-1/-1->7->6 [3] 6/-1/-1->7->0 [4] 0/-1/-1->7->6 [5] 6/-1/-1->7->0 [6] 0/-1/-1->7->6 [7] 6/15/-1->7->-1 [8] -1/-1/-1->7->6 [9] 6/-1/-1->7->0 [10] 0/-1/-1->7->6 [11] 6/-1/-1->7->0 [12] 0/-1/-1->7->6 [13] 6/-1/-1->7->0 [14] 0/-1/-1->7->6 [15] 6/-1/-1->7->15
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828977:3830458 [0] NCCL INFO [Proxy Service] Device 1 CPU core 105
tpgds-aihub0003:3828979:3830461 [0] NCCL INFO [Proxy Service] Device 3 CPU core 110
tpgds-aihub0003:3828977:3830459 [0] NCCL INFO [Proxy Service UDS] Device 1 CPU core 98
tpgds-aihub0003:3828978:3830460 [0] NCCL INFO [Proxy Service] Device 2 CPU core 81
tpgds-aihub0003:3828976:3830462 [0] NCCL INFO [Proxy Service] Device 0 CPU core 58
tpgds-aihub0003:3828979:3830464 [0] NCCL INFO [Proxy Service UDS] Device 3 CPU core 59
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828978:3830463 [0] NCCL INFO [Proxy Service UDS] Device 2 CPU core 60
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so
tpgds-aihub0003:3828976:3830465 [0] NCCL INFO [Proxy Service UDS] Device 0 CPU core 48
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Check P2P Type isAllDirectP2p 1 directMode 0 isAllCudaP2p 1
tpgds-aihub0003:3828980:3830466 [0] NCCL INFO [Proxy Service] Device 4 CPU core 24
tpgds-aihub0003:3828981:3830467 [0] NCCL INFO [Proxy Service] Device 5 CPU core 105
tpgds-aihub0003:3828980:3830468 [0] NCCL INFO [Proxy Service UDS] Device 4 CPU core 110
tpgds-aihub0003:3828981:3830469 [0] NCCL INFO [Proxy Service UDS] Device 5 CPU core 55
tpgds-aihub0003:3828982:3830470 [0] NCCL INFO [Proxy Service] Device 6 CPU core 60
tpgds-aihub0003:3828983:3830471 [0] NCCL INFO [Proxy Service] Device 7 CPU core 105
tpgds-aihub0003:3828982:3830472 [0] NCCL INFO [Proxy Service UDS] Device 6 CPU core 88
tpgds-aihub0003:3828983:3830473 [0] NCCL INFO [Proxy Service UDS] Device 7 CPU core 110
tpgds-aihub0003:3828981:3830474 [0] NCCL INFO [Proxy Progress] Device 5 CPU core 89
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 05/0 : 14[6] -> 5[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828982:3830475 [0] NCCL INFO [Proxy Progress] Device 6 CPU core 89
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 06/0 : 15[7] -> 6[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 13/0 : 14[6] -> 5[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828977:3830476 [0] NCCL INFO [Proxy Progress] Device 1 CPU core 75
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 01/0 : 10[2] -> 1[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 04/0 : 5[5] -> 12[4] [send] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 14/0 : 15[7] -> 6[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 09/0 : 10[2] -> 1[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 12/0 : 5[5] -> 12[4] [send] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 05/0 : 6[6] -> 13[5] [send] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 00/0 : 1[1] -> 8[0] [send] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 13/0 : 6[6] -> 13[5] [send] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 08/0 : 1[1] -> 8[0] [send] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828978:3830477 [0] NCCL INFO [Proxy Progress] Device 2 CPU core 96
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 02/0 : 11[3] -> 2[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 10/0 : 11[3] -> 2[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 01/0 : 2[2] -> 9[1] [send] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 09/0 : 2[2] -> 9[1] [send] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828980:3830478 [0] NCCL INFO [Proxy Progress] Device 4 CPU core 96
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 04/0 : 13[5] -> 4[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 12/0 : 13[5] -> 4[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 03/0 : 4[4] -> 11[3] [send] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 11/0 : 4[4] -> 11[3] [send] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828976:3830479 [0] NCCL INFO [Proxy Progress] Device 0 CPU core 61
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/0 : 9[1] -> 0[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/0 : 9[1] -> 0[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828979:3830480 [0] NCCL INFO [Proxy Progress] Device 3 CPU core 56
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 03/0 : 12[4] -> 3[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 01/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 11/0 : 12[4] -> 3[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 02/0 : 3[3] -> 10[2] [send] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 10/0 : 3[3] -> 10[2] [send] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828983:3830481 [0] NCCL INFO [Proxy Progress] Device 7 CPU core 110
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 06/0 : 7[7] -> 14[6] [send] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 14/0 : 7[7] -> 14[6] [send] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 02/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 03/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 04/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 05/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 06/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 00/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 09/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 01/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 00/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 01/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 10/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 02/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 11/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 02/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 01/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 03/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 12/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 03/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 02/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 00/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 05/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 03/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 02/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 04/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 13/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 05/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 06/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 00/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 04/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 03/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 14/0 : 0[0] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 04/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 06/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 00/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 07/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 01/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 06/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 07/0 : 8[0] -> 7[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 15/0 : 8[0] -> 7[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 00/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 08/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 02/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 07/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 05/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 01/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 04/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 09/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 07/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 01/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 09/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 10/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 06/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 10/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 05/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 08/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 02/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 09/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 11/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 03/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 06/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 07/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 11/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 03/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 04/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 10/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 05/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 08/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 04/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 12/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 07/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 11/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 13/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 13/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 12/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 10/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 05/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 07/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 08/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 08/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 14/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 11/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 06/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 14/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 14/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 09/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 15/0 : 6[6] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 12/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 13/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 07/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 15/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 10/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 09/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 15/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 08/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 14/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 10/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 11/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 12/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 15/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 09/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 12/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 13/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 11/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 13/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 14/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 12/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 15/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 13/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 15/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3830470 [6] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828982:3830470 [6] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 14/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828981:3830467 [5] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 15/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828981:3830467 [5] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 07/0 : 0[0] -> 15[7] [send] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 15/0 : 0[0] -> 15[7] [send] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828980:3830466 [4] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828980:3830466 [4] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828978:3830460 [2] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828979:3830461 [3] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828983:3830471 [7] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828983:3830471 [7] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828977:3830458 [1] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828978:3830460 [2] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828976:3830462 [0] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0003:3828979:3830461 [3] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828977:3830458 [1] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828976:3830462 [0] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 01/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 02/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 03/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 04/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 05/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 06/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 07/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 09/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 10/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 11/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 12/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 00/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 00/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 13/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 01/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 14/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 01/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 02/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 02/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 00/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 00/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 15/0 : 0[0] -> 1[1] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 03/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 04/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 03/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 05/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 01/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 01/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 00/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 06/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 02/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 04/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 02/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 03/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 05/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 03/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 07/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 04/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 06/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 04/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 05/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 08/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 05/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 09/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 07/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 06/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 00/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 05/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 10/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 07/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 06/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 08/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 01/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 06/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 11/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 08/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 02/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 09/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 07/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 07/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 09/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 08/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 12/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 08/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 03/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 10/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 09/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 11/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 13/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 10/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 04/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 11/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 10/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 13/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 11/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 12/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 12/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 14/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 07/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 12/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 15/0 : 2[2] -> 3[3] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 14/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 13/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 13/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 08/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 14/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 13/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 15/0 : 3[3] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 14/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 09/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 15/0 : 1[1] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 14/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 10/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 15/0 : 6[6] -> 7[7] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 15/0 : 4[4] -> 5[5] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 11/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/0 : 8[0] -> 0[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 02/0 : 10[2] -> 2[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 07/0 : 15[7] -> 7[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 12/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 01/0 : 9[1] -> 1[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/0 : 8[0] -> 0[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 10/0 : 10[2] -> 2[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 00/0 : 0[0] -> 8[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 15/0 : 15[7] -> 7[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 09/0 : 9[1] -> 1[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 02/0 : 2[2] -> 10[2] [send] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 07/0 : 7[7] -> 15[7] [send] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Channel 08/0 : 0[0] -> 8[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 01/0 : 1[1] -> 9[1] [send] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Channel 10/0 : 2[2] -> 10[2] [send] via NET/IB/2/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 15/0 : 5[5] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 15/0 : 7[7] -> 15[7] [send] via NET/IB/7/GDRDMA
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 03/0 : 11[3] -> 3[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 09/0 : 1[1] -> 9[1] [send] via NET/IB/1/GDRDMA
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 11/0 : 11[3] -> 3[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 01/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 03/0 : 3[3] -> 11[3] [send] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 11/0 : 3[3] -> 11[3] [send] via NET/IB/3/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 02/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 04/0 : 12[4] -> 4[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 06/0 : 14[6] -> 6[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 12/0 : 12[4] -> 4[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 05/0 : 13[5] -> 5[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 03/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 04/0 : 4[4] -> 12[4] [send] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 14/0 : 14[6] -> 6[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 13/0 : 13[5] -> 5[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Channel 12/0 : 4[4] -> 12[4] [send] via NET/IB/4/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 06/0 : 6[6] -> 14[6] [send] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 05/0 : 5[5] -> 13[5] [send] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Channel 14/0 : 6[6] -> 14[6] [send] via NET/IB/6/GDRDMA
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 13/0 : 5[5] -> 13[5] [send] via NET/IB/5/GDRDMA
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 04/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 04/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 00/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 02/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Channel 08/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 05/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Channel 12/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Channel 10/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 06/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 09/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 10/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 11/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 12/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 13/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 14/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 06/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Channel 14/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0003:3828981:3828981 [5] NCCL INFO Connected all trees
tpgds-aihub0003:3828980:3828980 [4] NCCL INFO Connected all trees
tpgds-aihub0003:3828978:3828978 [2] NCCL INFO Connected all trees
tpgds-aihub0003:3828979:3828979 [3] NCCL INFO Connected all trees
tpgds-aihub0003:3828982:3828982 [6] NCCL INFO Connected all trees
tpgds-aihub0003:3828983:3828983 [7] NCCL INFO Connected all trees
tpgds-aihub0003:3828976:3828976 [0] NCCL INFO Connected all trees
tpgds-aihub0003:3828977:3828977 [1] NCCL INFO Connected all trees
