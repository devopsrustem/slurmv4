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

ip a | grep -E "(ens3np0|ens108np0)" -A 2
Покажи какой интерфейс и IP.
2. Hostname и DNS:
bashhostname
cat /etc/hosts | grep $(hostname -s)
python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
Покажи что возвращает.
3. InfiniBand устройства:
bashibstat | grep -E "(State|Rate|mlx)"
ls /dev/infiniband/
4. SGLang установлен:
bash/app/sglang/sglang-latest/bin/python3 --version
/app/sglang/sglang-latest/bin/python3 -c "import sglang; print(sglang.__version__)"
5. Модель доступна:
bashls -lh /app/models/Deepseek-R1/
6. Mooncake библиотеки:
bashls -la /opt/mooncake-libs/
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -c "import mooncake; print('OK')"
7. GPU:
bashnvidia-smi --query-gpu=name,memory.total --format=csv



((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ip a | grep -E "(ens3np0|ens108np0)" -A 2
4: ens3np0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP group default qlen 1000
    link/ether 10:70:fd:27:25:0b brd ff:ff:ff:ff:ff:ff
    altname enp9s0np0
    inet 10.99.91.35/31 scope global noprefixroute ens3np0
       valid_lft forever preferred_lft forever
5: ens2np0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP group default qlen 1000


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ cat /etc/hosts | grep $(hostname -s)
10.99.91.35     tpgds-aihub0006.delta.sbrf.ru tpgds-aihub0006



((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.99.91.35



((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ibv_devinfo 
hca_id:	mlx5_0
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:250b
	sys_image_guid:			1070:fd03:0027:250b
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_1
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:2560
	sys_image_guid:			1070:fd03:0027:2560
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_2
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:255f
	sys_image_guid:			1070:fd03:0027:255f
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_3
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:256f
	sys_image_guid:			1070:fd03:0027:256f
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_4
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:254c
	sys_image_guid:			1070:fd03:0027:254c
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_5
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:2506
	sys_image_guid:			1070:fd03:0027:2506
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_6
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:2572
	sys_image_guid:			1070:fd03:0027:2572
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_7
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			1070:fd03:0027:2565
	sys_image_guid:			1070:fd03:0027:2565
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000838
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		4096 (5)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_8
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			58a2:e103:00b8:93ca
	sys_image_guid:			58a2:e103:00b8:93ca
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000834
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		1024 (3)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_9
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			58a2:e103:00b8:93cb
	sys_image_guid:			58a2:e103:00b8:93ca
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000834
	phys_port_cnt:			1
		port:	1
			state:			PORT_DOWN (1)
			max_mtu:		4096 (5)
			active_mtu:		1024 (3)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_10
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			58a2:e103:00b8:a1aa
	sys_image_guid:			58a2:e103:00b8:a1aa
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000834
	phys_port_cnt:			1
		port:	1
			state:			PORT_ACTIVE (4)
			max_mtu:		4096 (5)
			active_mtu:		1024 (3)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet

hca_id:	mlx5_11
	transport:			InfiniBand (0)
	fw_ver:				28.43.3608
	node_guid:			58a2:e103:00b8:a1ab
	sys_image_guid:			58a2:e103:00b8:a1aa
	vendor_id:			0x02c9
	vendor_part_id:			4129
	hw_ver:				0x0
	board_id:			MT_0000000834
	phys_port_cnt:			1
		port:	1
			state:			PORT_DOWN (1)
			max_mtu:		4096 (5)
			active_mtu:		1024 (3)
			sm_lid:			0
			port_lid:		0
			port_lmc:		0x00
			link_layer:		Ethernet


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ /app/sglang/sglang-latest/bin/python3 --version
Python 3.12.12


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ /app/sglang/sglang-latest/bin/python3 -c "import sglang; print(sglang.__version__)"
0.5.8.post1

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ls -lh /app/models/Deepseek-R1/
total 642G
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7K Feb 16 15:44 config.json
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 9.7K Feb 16 15:39 configuration_deepseek.py
drwxr-xr-x 2 dcbsr_dev dcbsr_dev 4.0K Feb 16 15:45 figures
-rw-r--r-- 1 dcbsr_dev dcbsr_dev  171 Feb 16 15:44 generation_config.json
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.6K Feb 16 15:39 gitattributes
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.1K Feb 16 15:47 LICENSE
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.9G Feb 16 15:45 model-00001-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00002-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00003-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00004-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00005-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00006-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00007-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00008-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00009-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00010-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00011-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.3G Feb 16 15:47 model-00012-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00013-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00014-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00015-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00016-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00017-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00018-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00019-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00020-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00021-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00022-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00023-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00024-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00025-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00026-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00027-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00028-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00029-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00030-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00031-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00032-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00033-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7G Feb 16 15:44 model-00034-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00035-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00036-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00037-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00038-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00039-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00040-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00041-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00042-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00043-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00044-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00045-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00046-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00047-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00048-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00049-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00050-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00051-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00052-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00053-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00054-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00055-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7G Feb 16 15:45 model-00056-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00057-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00058-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00059-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00060-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00061-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00062-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00063-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00064-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00065-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00066-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00067-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00068-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00069-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00070-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00071-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00072-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00073-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00074-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00075-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00076-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00077-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7G Feb 16 15:41 model-00078-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00079-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00080-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00081-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00082-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00083-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00084-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00085-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00086-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00087-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00088-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:50 model-00089-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00090-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00091-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00092-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00093-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00094-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00095-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00096-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00097-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00098-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00099-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7G Feb 16 15:49 model-00100-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00101-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00102-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00103-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00104-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00105-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00106-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00107-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00108-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00109-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00110-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00111-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00112-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00113-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00114-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00115-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00116-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00117-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00118-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00119-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00120-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00121-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 1.7G Feb 16 15:44 model-00122-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00123-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00124-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00125-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00126-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00127-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00128-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00129-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00130-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00131-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00132-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00133-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00134-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00135-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00136-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00137-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00138-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00139-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00140-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 3.0G Feb 16 15:40 model-00141-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00142-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:43 model-00143-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00144-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00145-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00146-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:47 model-00147-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:39 model-00148-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:49 model-00149-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00150-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:48 model-00151-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00152-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00153-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:42 model-00154-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:44 model-00155-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00156-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:41 model-00157-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:40 model-00158-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00159-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.9G Feb 16 15:40 model-00160-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:46 model-00161-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 4.1G Feb 16 15:45 model-00162-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 6.2G Feb 16 15:47 model-00163-of-000163.safetensors
-rw-r--r-- 1 dcbsr_dev dcbsr_dev  74K Feb 16 15:42 modeling_deepseek.py
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 8.5M Feb 16 15:40 model.safetensors.index.json
-rw-r--r-- 1 dcbsr_dev dcbsr_dev  15K Feb 16 15:46 README.md
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 3.9K Feb 16 15:46 tokenizer_config.json
-rw-r--r-- 1 dcbsr_dev dcbsr_dev 7.5M Feb 16 15:47 tokenizer.json

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ls -la /opt/mooncake-libs/
ls: cannot access '/opt/mooncake-libs/': No such file or directory
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ /opt/mooncake-libs/run-with-new-libstdc.sh python3 -c "import mooncake; print('OK')"
-bash: /opt/mooncake-libs/run-with-new-libstdc.sh: No such file or directory
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ nvidia-smi --query-gpu=name,memory.total --format=csv
name, memory.total [MiB]
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
NVIDIA H100 80GB HBM3, 81559 MiB
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ 
