   коротко
запуск на 1 и 2 нодах (до 3 и 5 даже не дошли)
1я нода
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ export LD_LIBRARY_PATH=/app/sglang/sglang-0.5.8.post1/lib64/python3.12/site-packages/torch/lib:$(find /app/sglang/sglang-0.5.7/lib/python3.12/site-packages/nvidia -type d -name lib 2>/dev/null | tr '\n' ':'):/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ python -c "import deep_ep; print('DeepEP работает на aihub1')"
DeepEP работает на aihub1


NVSHMEM_BOOTSTRAP=PMI NVSHMEM_TRANSPORT=TCP NVSHMEM_DEBUG=1 NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false SGLANG_DISAGGREGATION_BOOTSTRAP_TIMEOUT=600 /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --dp-size 8 --enable-dp-attention --moe-a2a-backend deepep --host 10.99.91.39 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0
2я нода
все тож самое
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ NVSHMEM_BOOTSTRAP=PMI NVSHMEM_TRANSPORT=TCP NVSHMEM_DEBUG=1 NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false SGLANG_DISAGGREGATION_BOOTSTRAP_TIMEOUT=600 /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --dp-size 8 --enable-dp-attention --moe-a2a-backend deepep --host 10.99.91.41 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0



ошибка

1я нода
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/mem/mem_heap.cpp:630: non-zero status: 7 Failed to allgather PEs peer_base values

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1049: non-zero status: 7 nvshmem register static heaps failed 

tpgds-aihub0001:313423:313423 [5] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0001.delta.sbrf.ru<41670>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/mem/mem_heap.cpp:238: non-zero status: -6 allgather of heap base for all PE failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/mem/mem_heap.cpp:630: non-zero status: 7 Failed to allgather PEs peer_base values

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1049: non-zero status: 7 nvshmem register static heaps failed 

tpgds-aihub0001:313424:313424 [6] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0001.delta.sbrf.ru<38334>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/mem/mem_heap.cpp:238: non-zero status: -6 allgather of heap base for all PE failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/mem/mem_heap.cpp:630: non-zero status: 7 Failed to allgather PEs peer_base values

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1049: non-zero status: 7 nvshmem register static heaps failed 

tpgds-aihub0001:313425:313425 [7] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed


2я

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/transport/transport.cpp:416: non-zero status: 7 No devices selected.

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1045: non-zero status: 7 nvshmem setup connections failed 

tpgds-aihub0002:848534:848534 [2] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0002.delta.sbrf.ru<42852>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/topo/topo.cpp:223: non-zero status: -6 allgather of gpu_info failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/transport/transport.cpp:416: non-zero status: 7 No devices selected.

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1045: non-zero status: 7 nvshmem setup connections failed 

tpgds-aihub0002:848535:848535 [3] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0002.delta.sbrf.ru<43134>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/topo/topo.cpp:223: non-zero status: -6 allgather of gpu_info failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/transport/transport.cpp:416: non-zero status: 7 No devices selected.

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1045: non-zero status: 7 nvshmem setup connections failed 

tpgds-aihub0002:848536:848536 [4] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0002.delta.sbrf.ru<52504>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/topo/topo.cpp:223: non-zero status: -6 allgather of gpu_info failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/transport/transport.cpp:416: non-zero status: 7 No devices selected.

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1045: non-zero status: 7 nvshmem setup connections failed 

tpgds-aihub0002:848537:848537 [5] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/ncclSocket/ncclsocket_socket.cpp:socketProgress:59: socketProgress: Connection closed by remote peer tpgds-aihub0002.delta.sbrf.ru<41346>
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:97: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/modules/bootstrap/uid/bootstrap_uid.cpp:500: non-zero status: -6 /dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/topo/topo.cpp:223: non-zero status: -6 allgather of gpu_info failed 

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/transport/transport.cpp:416: non-zero status: 7 No devices selected.

/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/init/init.cu:1045: non-zero status: 7 nvshmem setup connections failed 

tpgds-aihub0002:848538:848538 [6] NVSHMEM INFO nvshmemi_common_init failed, continuing
/dvs/p4/build/sw/rel/gpgpu/toolkit/r12.8/main_nvshmem/src/host/team/team.cu:nvshmem_team_split_strided:63: NVSHMEM API called before NVSHMEM initialization has completed

[2026-02-25 15:04:37] Scheduler or DataParallelController 848532 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848533 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848534 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848535 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848536 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848537 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848538 terminated with 255
[2026-02-25 15:04:37] Scheduler or DataParallelController 848539 terminated with 255
[2026-02-25 15:04:39] Scheduler or DataParallelController 848334 terminated with 0
[2026-02-25 15:04:39] INFO:     Started server process [848143]
[2026-02-25 15:04:39] INFO:     Waiting for application startup.
[2026-02-25 15:04:39] ERROR:    Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/starlette/routing.py", line 694, in lifespan
    async with self.lifespan_context(app) as maybe_state:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/contextlib.py", line 210, in __aenter__
    return await anext(self.gen)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/fastapi/routing.py", line 201, in merged_lifespan
    async with original_context(app) as maybe_original_state:
               ^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/contextlib.py", line 210, in __aenter__
    return await anext(self.gen)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/http_server.py", line 270, in lifespan
    fast_api_app.state.openai_serving_completion = OpenAIServingCompletion(
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/openai/serving_completions.py", line 45, in __init__
    super().__init__(tokenizer_manager)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/openai/serving_base.py", line 35, in __init__
    if isinstance(self.tokenizer_manager.server_args, ServerArgs)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'server_args'

[2026-02-25 15:04:39] ERROR:    Application startup failed. Exiting.






export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39

NCCL_SOCKET_IFNAME=bond0 \
GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph


export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.41

NCCL_SOCKET_IFNAME=bond0 \
GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb=256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.41 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph


  export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.49

NCCL_SOCKET_IFNAME=bond0 \
GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb=256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.49 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998


  export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.33

NCCL_SOCKET_IFNAME=bond0 \
GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb=256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.33 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998


  /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 \
  --decode http://10.99.91.49:30001 \
  --host 0.0.0.0 \
  --port 8000

  # На ноде 3, когда увидишь "The server is fired up":
curl http://10.99.91.49:30001/health

# Должен вернуть 200 OK


curl -X POST http://10.82.101.193:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
  ##############

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.35
export GLOO_SOCKET_FAMILY=AF_INET

NCCL_SOCKET_IFNAME=bond0 \
GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb=256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.35 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998



_enable_dp_encoder=False, mm_process_config={}, limit_mm_data_per_request=None, decrypted_config_file=None, decrypted_draft_config_file=None, forward_hooks=None)
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:32:57 TP13] Init torch distributed begin.
[2026-02-25 16:32:57 TP10] Init torch distributed begin.
[W225 16:32:57.295093976 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:57.295152768 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:32:58 TP14] Init torch distributed begin.
[2026-02-25 16:32:58 TP8] Init torch distributed begin.
[2026-02-25 16:32:58 TP15] Init torch distributed begin.
[2026-02-25 16:32:58 TP12] Init torch distributed begin.
[2026-02-25 16:32:58 TP11] Init torch distributed begin.
[2026-02-25 16:32:58 TP9] Init torch distributed begin.
[W225 16:32:58.470737969 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:58.656077665 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:59.766266089 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:59.768556663 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:59.770903372 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:32:59.773174154 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15

[2026-02-25 16:33:59] tpgds-aihub0006:3996242:3996242 [2] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:33:59 TP10] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:33:59] tpgds-aihub0006:3996243:3996243 [3] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:33:59] tpgds-aihub0006:3996246:3996246 [6] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:33:59] tpgds-aihub0006:3996241:3996241 [1] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:33:59] tpgds-aihub0006:3996244:3996244 [4] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:33:59] tpgds-aihub0006:3996247:3996247 [7] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:33:59] tpgds-aihub0006:3996245:3996245 [5] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<54709> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:33:59 TP9] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59 TP11] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59 TP14] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59 TP12] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59] Received sigquit from a child process. It usually means the child failed.
--- Logging error ---
[2026-02-25 16:33:59 TP13] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 16:33:59 TP15] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:33:59] Received sigquit from a child process. It usually means the child failed.
Killed
