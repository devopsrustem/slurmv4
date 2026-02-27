Шаг 1 — Диагностика через TCP (5 минут)
Добавить на все 4 ноды и перезапустить:
bashexport MC_FORCE_TCP=true
Если заработает — проблема в RDMA (GID/device). Если нет — проблема в портах или регистрации сессий.

Шаг 2 — Если TCP работает, исправляем RDMA
bashexport MC_GID_INDEX=3
export MC_TCP_BIND_ADDRESS=10.99.91.X  # RoCE IP каждой ноды
И расширить --disaggregation-ib-device со всеми физическими NIC:
bash--disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
Проверить что GID index 3 реально RoCEv2/IPv4:
bashshow_gids | grep mlx5_0
# Должно быть ::ffff:10.99.91.X на индексе 3

Шаг 3 — Проверить коллизии портов после запуска
bashss -tlnp | grep python | awk '{print $4}' | sort -t: -k2 -n
# Все 8 портов TransferEngine на ноде должны быть уникальными

Шаг 4 — Если ничего не помогает: NIXL
bash--disaggregation-transfer-backend nixl
pip install nixl
Подтверждённо работает на H20 с mlx5_bond окружением.

Добавить к логированию на время диагностики:
bashexport GLOG_v=3
export MC_YLT_LOG_LEVEL=debug
export MC_TE_METRIC=1
Искать в логах: "Find best gid index" — если там fe80:: или нули вместо ::ffff:10.99.91.X — GID неправильный.


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ export MC_FORCE_TCP=true
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0  SGLANG_HOST_IP=10.99.91.49  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ export MC_FORCE_TCP=true
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0 SGLANG_HOST_IP=10.99.91.35 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=info NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ export MC_FORCE_TCP=true
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ SGLANG_LOCAL_IP_NIC=ens108np0 SGLANG_HOST_IP=10.99.91.39 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ export MC_FORCE_TCP=true
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_LOCAL_IP_NIC=ens108np0  SGLANG_HOST_IP=10.99.91.41 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph



I0227 11:31:26.136366 1021616 transfer_engine_impl.cpp:172] Transfer Engine RPC using P2P handshake, listening on 10.99.91.35:15395
I0227 11:31:26.136373 1021614 transfer_engine_impl.cpp:172] Transfer Engine RPC using P2P handshake, listening on 10.99.91.35:16600
I0227 11:31:26.136425 1021616 transfer_engine_impl.cpp:217] Auto-discovering topology...
I0227 11:31:26.136436 1021614 transfer_engine_impl.cpp:217] Auto-discovering topology...
WARNING: Logging before InitGoogleLogging() is written to STDERR
I0227 11:31:26.136683 1021621 transfer_engine_impl.cpp:571] Metrics reporting is disabled (set MC_TE_METRIC=1 to enable)
I0227 11:31:26.136708 1021621 transfer_engine_impl.cpp:105] Transfer Engine parseHostNameWithPort. server_name: 10.99.91.35 port: 12001
I0227 11:31:26.136734 1021621 transfer_engine_impl.cpp:172] Transfer Engine RPC using P2P handshake, listening on 10.99.91.35:16012
I0227 11:31:26.136807 1021621 transfer_engine_impl.cpp:217] Auto-discovering topology...
WARNING: Logging before InitGoogleLogging() is written to STDERR
I0227 11:31:26.138336 1021615 transfer_engine_impl.cpp:571] Metrics reporting is disabled (set MC_TE_METRIC=1 to enable)
I0227 11:31:26.138362 1021615 transfer_engine_impl.cpp:105] Transfer Engine parseHostNameWithPort. server_name: 10.99.91.35 port: 12001
I0227 11:31:26.138392 1021615 transfer_engine_impl.cpp:172] Transfer Engine RPC using P2P handshake, listening on 10.99.91.35:16328
I0227 11:31:26.138466 1021615 transfer_engine_impl.cpp:217] Auto-discovering topology...
I0227 11:31:26.138890 1021619 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.138926 1021619 tcp_transport.cpp:343] TcpTransport: listen on port 16953
I0227 11:31:26.138926 1021620 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.138952 1021620 tcp_transport.cpp:343] TcpTransport: listen on port 15485
I0227 11:31:26.139014 1021618 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139035 1021618 tcp_transport.cpp:343] TcpTransport: listen on port 15355
I0227 11:31:26.139185 1021617 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139211 1021617 tcp_transport.cpp:343] TcpTransport: listen on port 16794
I0227 11:31:26.139276 1021616 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139302 1021621 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139302 1021616 tcp_transport.cpp:343] TcpTransport: listen on port 16836
I0227 11:31:26.139323 1021621 tcp_transport.cpp:343] TcpTransport: listen on port 16877
I0227 11:31:26.139338 1021614 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139361 1021614 tcp_transport.cpp:343] TcpTransport: listen on port 16853
I0227 11:31:26.139604 1021615 transfer_engine_impl.cpp:232] Topology discovery complete. Found 1 HCAs.
I0227 11:31:26.139624 1021615 tcp_transport.cpp:343] TcpTransport: listen on port 16507
[2026-02-27 11:31:26 TP13] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 11:31:26 TP10] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26 TP11] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
--- Logging error ---
[2026-02-27 11:31:26 TP8] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26 TP12] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
--- Logging error ---
[2026-02-27 11:31:26 TP14] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26 TP15] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
[2026-02-27 11:31:26 TP9] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 373, in __init__
    self.init_disaggregation()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 888, in init_disaggregation
    self.disagg_decode_prealloc_queue = DecodePreallocQueue(
                                        ^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 241, in __init__
    self.kv_manager = self._init_kv_manager()
                      ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/decode.py", line 310, in _init_kv_manager
    kv_manager: BaseKVManager = kv_manager_class(
                                ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 165, in __init__
    self.init_engine()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/conn.py", line 229, in init_engine
    self.engine = MooncakeTransferEngine(
                  ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 105, in __init__
    self.initialize(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py", line 181, in initialize
    ret_value = self.engine.initialize(
                ^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: open: Address family not supported by protocol

[2026-02-27 11:31:26] Received sigquit from a child process. It usually means the child failed.
tpgds-aihub0006:1021620:1023014 [6] NCCL INFO [Service thread] Connection closed by localRank 1
tpgds-aihub0006:1021621:1023016 [7] NCCL INFO [Service thread] Connection closed by localRank 1
tpgds-aihub0006:1021621:1023016 [7] NCCL INFO [Service thread] Connection closed by localRank 0
tpgds-aihub0006:1021619:1023015 [5] NCCL INFO [Service thread] Connection closed by localRank 1
tpgds-aihub0006:1021620:1023014 [6] NCCL INFO [Service thread] Connection closed by localRank 0
tpgds-aihub0006:1021619:1023015 [5] NCCL INFO [Service thread] Connection closed by localRank 0
tpgds-aihub0006:1021621:1023016 [7] NCCL INFO [Service thread] Connection closed by localRank 3
tpgds-aihub0006:1021621:1023016 [7] NCCL INFO [Service thread] Connection closed by localRank 2
Killed

