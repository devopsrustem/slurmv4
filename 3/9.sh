((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 sglang]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
ens108np0        UP             10.99.91.39/31 
ens12f0np0       UP             
ens12f1np1       DOWN           
ens109np0        UP             10.99.92.39/31 
ens110np0        UP             10.99.93.39/31 
ens111np0        UP             10.99.94.39/31 
ens112np0        UP             10.99.95.39/31 
ens20f0np0       UP             
ens20f1np1       DOWN           
ens113np0        UP             10.99.96.39/31 
ens114np0        UP             10.99.97.39/31 
ens115np0        UP             10.99.98.39/31 
bond0            UP             10.82.101.193/29 
docker0          DOWN           172.17.0.1/16 

nv peermem не используем

запуск
aihub3
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0  SGLANG_HOST_IP=10.99.91.49  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0 SGLANG_HOST_IP=10.99.91.35 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=info NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 sglang]$ SGLANG_LOCAL_IP_NIC=ens108np0 SGLANG_HOST_IP=10.99.91.39 SGLANG_HOST_IP=10.99.91.39 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 1   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_LOCAL_IP_NIC=ens108np0 SGLANG_HOST_IP=10.99.91.41 SGLANG_HOST_IP=10.99.91.41 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$   /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000 8998   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000

запрос
[dcbsr_dev@tpgds-aihub0001 ~]$ curl -X POST http://10.82.101.193:8000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "default",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
{"error":{"type":"Internal Server Error","code":"decode_internal_error","message":"Decode transfer failed for request rank=0 decode_req.req.rid='9fc62257c8194d659c81fff52e976f03' decode_req.req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Failed to get kvcache from prefill instance, it might be dead"}}

ошибки

Req(rid=85e5064ad99a47428ca45d464e6e7721, input_ids=[0, 128803, 19923, 3, 1999, 344, 223, 20, 13, 20, 33, 128804], output_ids=[128798], self.grammar=None, self.sampling_params=<sglang.srt.sampling.sampling_params.SamplingParams object at 0x7f3294965b50>)
[2026-02-26 17:44:23 TP5] Prefill transfer failed for request rank=5 req.rid='85e5064ad99a47428ca45d464e6e7721' req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Decode instance could be dead, remote mooncake session 10.99.91.49:15993 is not alive
[2026-02-26 17:44:23 TP4] Prefill transfer failed for request rank=4 req.rid='85e5064ad99a47428ca45d464e6e7721' req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Decode instance could be dead, remote mooncake session 10.99.91.49:15451 is not alive
[2026-02-26 17:44:23 TP3] Prefill transfer failed for request rank=3 req.rid='85e5064ad99a47428ca45d464e6e7721' req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Decode instance could be dead, remote mooncake session 10.99.91.49:16570 is not alive
[2026-02-26 17:44:23 TP2] Prefill transfer failed for request rank=2 req.rid='85e5064ad99a47428ca45d464e6e7721' req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Decode instance could be dead, remote mooncake session 10.99.91.49:15833 is not alive
[2026-02-26 17:44:23 TP1] Prefill transfer failed for request rank=1 req.rid='85e5064ad99a47428ca45d464e6e7721' req.bootstrap_room=3513979088676517362 with exception KVTransferError(bootstrap_room=3513979088676517362): Decode instance could be dead, remote mooncake session 10.99.91.49:16928 is not alive


[2026-02-26 17:44:23 TP15] Prefill transfer failed for request rank=15 req.rid='db4047d61a0642f4b525a69b591ce839' req.bootstrap_room=9112912563575349302 with exception KVTransferError(bootstrap_room=9112912563575349302): Decode instance could be dead, remote mooncake session 10.99.91.35:15129 is not alive
[2026-02-26 17:44:23 TP14] Prefill transfer failed for request rank=14 req.rid='db4047d61a0642f4b525a69b591ce839' req.bootstrap_room=9112912563575349302 with exception KVTransferError(bootstrap_room=9112912563575349302): Decode instance could be dead, remote mooncake session 10.99.91.35:15056 is not alive
[2026-02-26 17:44:23 TP13] Prefill transfer failed for request rank=13 req.rid='db4047d61a0642f4b525a69b591ce839' req.bootstrap_room=9112912563575349302 with exception KVTransferError(bootstrap_room=9112912563575349302): Decode instance could be dead, remote mooncake session 10.99.91.35:15120 is not alive


[2026-02-26 17:44:23] INFO:     10.99.91.39:58708 - "POST /v1/chat/completions HTTP/1.1" 500 Internal Server Error
[2026-02-26 17:44:23 TP0] Decode transfer failed for request rank=0 decode_req.req.rid='2b0fd107dfc44e9085a12be3eeb44ebe' decode_req.req.bootstrap_room=6820366758815575100 with exception KVTransferError(bootstrap_room=6820366758815575100): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 17:44:23 TP7] Decode transfer failed for request rank=7 decode_req.req.rid='2b0fd107dfc44e9085a12be3eeb44ebe' decode_req.req.bootstrap_room=6820366758815575100 with exception KVTransferError(bootstrap_room=6820366758815575100): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 17:44:23 TP6] Decode transfer failed for request rank=6 decode_req.req.rid='2b0fd107dfc44e9085a12be3eeb44ebe' decode_req.req.bootstrap_room=6820366758815575100 with exception KVTransferError(bootstrap_room=6820366758815575100): Failed to get kvcache from prefill instance, it might be dead


alse, duration=0ms
[2026-02-26 17:40:56] Dummy health check server started in background thread at 10.99.91.35:30001
[2026-02-26 17:44:22 TP15] Decode transfer failed for request rank=15 decode_req.req.rid='6bea27e5c479488599d497458181a171' decode_req.req.bootstrap_room=5119455594567805886 with exception KVTransferError(bootstrap_room=5119455594567805886): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 17:44:22 TP14] Decode transfer failed for request rank=14 decode_req.req.rid='6bea27e5c479488599d497458181a171' decode_req.req.bootstrap_room=5119455594567805886 with exception KVTransferError(bootstrap_room=5119455594567805886): Failed due to an unknown reason from another rank
[2026-02-26 17:44:22 TP13] Decode transfer failed for request rank=13 decode_req.req.rid='6bea27e5c479488599d497458181a171' decode_req.req.bootstrap_room=5119455594567805886 with exception KVTransferError(bootstrap_room=5119455594567805886): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 17:44:22 TP12] Decode transfer failed for request rank=12 decode_req.req.rid='6bea27e5c479488599d497458181a171' decode_req.req.bootstrap_room=5119455594567805886 with exception KVTransferError(bootstrap_room=5119455594567805886): Failed to get kvcache from prefill instance, it might be dead

