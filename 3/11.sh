((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ SGLANG_HOST_IP=10.99.91.39 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.39 SGLANG_LOCAL_IP_NIC=ens108np0 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false  /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph 

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_HOST_IP=10.99.91.41 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.41 SGLANG_LOCAL_IP_NIC=ens108np0   GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false  /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11   --disaggregation-bootstrap-port 8998   --disable-cuda-graph 


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0   GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device  mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ SGLANG_HOST_IP=10.99.91.35 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.35 MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=info NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device  mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 


\1. Проверь статус всех 4 нод — поднялись ли prefill (aihub0001/0002)?
bashcurl -s http://10.99.91.39:30000/model_info | python3 -m json.tool
curl -s http://10.99.91.49:30001/model_info | python3 -m json.tool
2. Запусти роутер (если обе стороны ответили):
bashpython3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 8998 \
  --decode http://10.99.91.49:30001 \
  --host 0.0.0.0 --port 8000
3. Отправь тестовый запрос через роутер:
bashcurl -s http://localhost:8000/generate \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello", "sampling_params": {"max_new_tokens": 8}}'





((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ curl -s http://10.99.91.39:30000/model_info | python3 -m json.tool
{
    "model_path": "/app/models/Deepseek-R1/",
    "tokenizer_path": "/app/models/Deepseek-R1/",
    "is_generation": true,
    "preferred_sampling_params": null,
    "weight_version": "default",
    "has_image_understanding": false,
    "has_audio_understanding": false,
    "model_type": "deepseek_v3",
    "architectures": [
        "DeepseekV3ForCausalLM"
    ]
}

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ curl -s http://10.99.91.49:30001/model_info | python3 -m json.tool
{
    "model_path": "/app/models/Deepseek-R1/",
    "tokenizer_path": "/app/models/Deepseek-R1/",
    "is_generation": true,
    "preferred_sampling_params": null,
    "weight_version": "default",
    "has_image_understanding": false,
    "has_audio_understanding": false,
    "model_type": "deepseek_v3",
    "architectures": [
        "DeepseekV3ForCausalLM"
    ]
}





[dcbsr_dev@tpgds-aihub0001 ~]$ curl -s http://localhost:8000/generate   -H "Content-Type: application/json"   -d '{"text": "Hello", "sampling_params": {"max_new_tokens": 8}}'
{"error":{"type":"Service Unavailable","code":"server_selection_failed","message":"No available servers: No available prefill workers (all circuits open or unhealthy)"}}

[2026-02-27 15:01:51 TP3] Decode transfer failed for request rank=3 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead
[2026-02-27 15:01:51 TP5] Decode transfer failed for request rank=5 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead
[2026-02-27 15:01:51 TP2] Decode transfer failed for request rank=2 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead
[2026-02-27 15:01:51 TP1] Decode transfer failed for request rank=1 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead


[2026-02-27 15:01:51 TP9] Decode transfer failed for request rank=9 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead
[2026-02-27 15:01:51 TP10] Decode transfer failed for request rank=10 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead
[2026-02-27 15:01:51 TP8] Decode transfer failed for request rank=8 decode_req.req.rid='63b1b22dad53465b92560ebdda56d075' decode_req.req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Failed to get kvcache from prefill instance, it might be dead


[2026-02-27 15:01:51 TP4] Prefill transfer failed for request rank=4 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.49:15295 is not alive
[2026-02-27 15:01:51 TP1] Prefill transfer failed for request rank=1 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.49:15010 is not alive
[2026-02-27 15:01:51 TP2] Prefill transfer failed for request rank=2 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.49:16959 is not alive
[2026-02-27 15:01:51] INFO:     10.99.91.39:38178 - "POST /generate HTTP/1.1" 500 Internal Server Error


[2026-02-27 15:01:51 TP11] Prefill transfer failed for request rank=11 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.35:16371 is not alive
[2026-02-27 15:01:51 TP9] Prefill transfer failed for request rank=9 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.35:16272 is not alive
[2026-02-27 15:01:51 TP10] Prefill transfer failed for request rank=10 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.35:15390 is not alive
[2026-02-27 15:01:51 TP8] Prefill transfer failed for request rank=8 req.rid='ca271fb6eab2421f98ac61976e6f0f34' req.bootstrap_room=6593551520068383758 with exception KVTransferError(bootstrap_room=6593551520068383758): Decode instance could be dead, remote mooncake session 10.99.91.35:16323 is not alive




Изменить только один параметр в командах запуска, добавить:

bash
--disaggregation-transfer-backend nixl
Всё остальное оставить как есть (MC_GID_INDEX=3, MC_TCP_BIND_ADDRESS, device list). Параметр --disaggregation-ib-device тоже оставить — NIXL его использует.

Пример для aihub0003:

bash
SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 \
... все остальные переменные ... \
python3 -m sglang.launch_server \
  ... все остальные параметры ... \
  --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
  --max-running-requests 128
Если pip install nixl завалится или NIXL не найдёт UCX — покажи ошибку.

роутер запускать нужно?

3:21 PM

Утвердил необходимость маршрутизатора и уточнил порядок запуска
Утвердил необходимость маршрутизатора и уточнил порядок запуска

Да, роутер нужен. Порядок запуска:

Сначала prefill (aihub0001 + aihub0002) — ждать The server is fired up
Потом decode (aihub0003 + aihub0006) — ждать The server is fired up
Потом роутер (можно на aihub0001):
bash
python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 8998 \
  --decode http://10.99.91.49:30001 \
  --host 0.0.0.0 \
  --port 8000
Тест через роутер:
bash
curl -s http://10.99.91.39:8000/generate \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello world", "sampling_params": {"max_new_tokens": 16}}'



tpgds-aihub0006:1180822:1180822 [1] NCCL INFO ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, retrying (34/34) after sleep for 3400 msec
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, retrying (34/34) after sleep for 3400 msec
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, retrying (34/34) after sleep for 3400 msec

[2026-02-27 15:27:13] tpgds-aihub0006:1180824:1180824 [3] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO init.cc:2173 -> 6
tpgds-aihub0006:1180824:1180824 [3] NCCL INFO init.cc:2200 -> 6

[2026-02-27 15:27:13] tpgds-aihub0006:1180828:1180828 [7] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO init.cc:2173 -> 6
tpgds-aihub0006:1180828:1180828 [7] NCCL INFO init.cc:2200 -> 6
[2026-02-27 15:27:13 TP11] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.

[2026-02-27 15:27:13] tpgds-aihub0006:1180825:1180825 [4] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO init.cc:2173 -> 6
tpgds-aihub0006:1180825:1180825 [4] NCCL INFO init.cc:2200 -> 6

[2026-02-27 15:27:13] tpgds-aihub0006:1180827:1180827 [6] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO bootstrap.cc:778 -> 6
[2026-02-27 15:27:13 TP15] Scheduler hit an exception: Traceback (most recent call last):
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

tpgds-aihub0006:1180827:1180827 [6] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO init.cc:2173 -> 6
tpgds-aihub0006:1180827:1180827 [6] NCCL INFO init.cc:2200 -> 6
[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 15:27:13 TP12] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.

[2026-02-27 15:27:13] tpgds-aihub0006:1180822:1180822 [1] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180822:1180822 [1] NCCL INFO init.cc:2173 -> 6
[2026-02-27 15:27:13 TP14] Scheduler hit an exception: Traceback (most recent call last):
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

tpgds-aihub0006:1180822:1180822 [1] NCCL INFO init.cc:2200 -> 6
[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.

[2026-02-27 15:27:13] tpgds-aihub0006:1180826:1180826 [5] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO init.cc:2173 -> 6
tpgds-aihub0006:1180826:1180826 [5] NCCL INFO init.cc:2200 -> 6

[2026-02-27 15:27:13] tpgds-aihub0006:1180821:1180821 [0] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<58525> returned Connection refused, exceeded error retry count after 35 attempts
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO misc/socket.cc:389 -> 6
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO misc/socket.cc:438 -> 6
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO bootstrap.cc:670 -> 6
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO bootstrap.cc:778 -> 6
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO init.cc:1667 -> 6
tpgds-aihub0006:1180821:1180821 [0] NCCL INFO init.cc:2173 -> 6
[2026-02-27 15:27:13 TP9] Scheduler hit an exception: Traceback (most recent call last):
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

tpgds-aihub0006:1180821:1180821 [0] NCCL INFO init.cc:2200 -> 6
[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 15:27:13 TP13] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 15:27:13 TP8] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-27 15:27:13] Received sigquit from a child process. It usually means the child failed.
