((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] 
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] *****************************************
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] *****************************************
[W304 15:04:49.571579240 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.868867217 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.868912841 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.870269089 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.871889652 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] 
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] *****************************************
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] *****************************************
[W304 15:04:52.212591857 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176372020 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176371927 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176676292 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176967382 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.190170587 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.192191941 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.193097809 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.194587795 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).

bash
# На 0007:
host 10.99.91.59
cat /etc/hosts | grep 10.99.91.59
И запусти тест с явным rdzv backend чтобы обойти DNS:

bash
# На 0007:
NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0 \
  --rdzv_backend=c10d \
  --rdzv_endpoint=10.99.91.59:29500 \
  /tmp/test_nccl.py

# На 0008:
NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1 \
  --rdzv_backend=c10d \
  --rdzv_endpoint=10.99.91.59:29500 \
  /tmp/test_nccl.py


# На 0007:
hostname -I
ip addr show enp25s0np0 | grep inet
host 10.99.91.59
Если IP реально 10.99.91.59 — добавь в /etc/hosts:
bashecho "10.99.91.59 tpgds-aihub0007" | sudo tee -a /etc/hosts



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ hostname -I
10.99.91.59 10.99.92.59 10.99.93.59 10.99.94.59 10.99.95.59 10.99.96.59 10.99.97.59 10.99.98.59 10.73.175.137 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ip addr show enp25s0np0 | grep inet
    inet 10.99.91.59/31 scope global noprefixroute enp25s0np0
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ host 10.99.91.59
59.91.99.10.in-addr.arpa domain name pointer tpgds-aihub0003.delta.sbrf.ru.
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
#10.73.175.137     tpgds-aihub0007.delta.sbrf.ru tpgds-aihub0007
10.99.91.59     tpgds-aihub0007.delta.sbrf.ru tpgds-aihub0007


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ hostname -I
10.99.91.63 10.99.92.63 10.99.93.63 10.99.94.63 10.99.95.63 10.99.96.63 10.99.97.63 10.99.98.63 10.73.175.138 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ ip addr show enp25s0np0 | grep inet
    inet 10.99.91.63/31 scope global noprefixroute enp25s0np0
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ host 10.99.91.63
63.91.99.10.in-addr.arpa domain name pointer tpgds-aihub0003.delta.sbrf.ru.

LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
python3 -m sglang.compile_deep_gemm \
  --model /app/models/Deepseek-R1/ \
  --tp 8 --trust-remote-code



  TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=7200 \
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
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


sudo py-spy dump --pid $(pgrep -f "sglang.launch_server")


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ py-spy dump --pid $(pgrep -f "sglang.launch_server")
Process 544105: python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.59 --port 30001 --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode decode --disaggregation-transfer-backend nixl --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 --max-running-requests 128
Python v3.12.12 (/usr/bin/python3.12)

Thread 544105 (idle): "MainThread"
    _recv (multiprocessing/connection.py:395)
    _recv_bytes (multiprocessing/connection.py:430)
    recv (multiprocessing/connection.py:250)
    _wait_for_scheduler_ready (engine.py:894)
    _launch_subprocesses (engine.py:1084)
    launch_server (http_server.py:1894)
    run_server (sglang/launch_server.py:28)
    <module> (sglang/launch_server.py:35)
    _run_code (<frozen runpy>:88)
    _run_module_as_main (<frozen runpy>:198)



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ py-spy dump --pid $(pgrep -f "sglang.launch_server")
Process 581325: python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.63 --port 30001 --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --disaggregation-transfer-backend nixl --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 --max-running-requests 128
Python v3.12.12 (/usr/bin/python3.12)

Thread 581325 (idle): "MainThread"
    _recv (multiprocessing/connection.py:395)
    _recv_bytes (multiprocessing/connection.py:430)
    recv (multiprocessing/connection.py:250)
    _wait_for_scheduler_ready (engine.py:894)
    _launch_subprocesses (engine.py:1044)
    launch_server (http_server.py:1894)
    run_server (sglang/launch_server.py:28)
    <module> (sglang/launch_server.py:35)
    _run_code (<frozen runpy>:88)
    _run_module_as_main (<frozen runpy>:198)


# На 0007 - дампи все процессы:
for pid in $(pgrep -f "scheduler_TP"); do
  echo "=== PID $pid ==="
  py-spy dump --pid $pid 2>/dev/null | head -20
done


=== PID 544360 ===
Process 544360: sglang::scheduler_TP0
Python v3.12.12 (/usr/bin/python3.12)

Thread 544360 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544361 ===
Process 544361: sglang::scheduler_TP1
Python v3.12.12 (/usr/bin/python3.12)

Thread 544361 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544362 ===
Process 544362: sglang::scheduler_TP2
Python v3.12.12 (/usr/bin/python3.12)

Thread 544362 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544363 ===
Process 544363: sglang::scheduler_TP3
Python v3.12.12 (/usr/bin/python3.12)

Thread 544363 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544364 ===
Process 544364: sglang::scheduler_TP4
Python v3.12.12 (/usr/bin/python3.12)

Thread 544364 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544365 ===
Process 544365: sglang::scheduler_TP5
Python v3.12.12 (/usr/bin/python3.12)

Thread 544365 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544366 ===
Process 544366: sglang::scheduler_TP6
Python v3.12.12 (/usr/bin/python3.12)

Thread 544366 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)
=== PID 544367 ===
Process 544367: sglang::scheduler_TP7
Python v3.12.12 (/usr/bin/python3.12)

Thread 544367 (active): "MainThread"
    synchronize (torch/cuda/streams.py:102)
    __init__ (pynccl.py:121)
    __init__ (distributed/parallel_state.py:338)
    init_model_parallel_group (distributed/parallel_state.py:1379)
    initialize_model_parallel (distributed/parallel_state.py:1676)
    init_torch_distributed (model_runner.py:812)
    __init__ (model_runner.py:392)
    _init_model_runner (tp_worker.py:346)
    __init__ (tp_worker.py:247)
    init_tp_model_worker (scheduler.py:522)
    init_model_worker (scheduler.py:564)
    __init__ (scheduler.py:368)
    run_scheduler_process (scheduler.py:3139)
    run (multiprocessing/process.py:108)
    _bootstrap (multiprocessing/process.py:314)
    _main (multiprocessing/spawn.py:135)



    sed -n '110,130p' /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ sed -n '110,130p' /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py
        # `torch.cuda.device` is a context manager that changes the
        # current cuda device to the specified one
        with torch.cuda.device(device):
            self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                self.world_size, self.unique_id, self.rank
            )
            self.stream = torch.cuda.Stream()

            # A small all_reduce for warmup.
            data = torch.zeros(1, device=device)
            self.all_reduce(data)
            self.stream.synchronize()
            del data

        # by default it is disabled, e.g. in profiling models and prefill phase.
        # to use it, use under `with obj.change_state(enable=True)`, usually
        # when we are using CUDA graph.
        self.disabled = True

    def _resolve_stream(self, stream: Optional[torch.cuda.Stream]):
        """Return the stream to use for NCCL calls.


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ sed -n '110,130p' /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py
        # `torch.cuda.device` is a context manager that changes the
        # current cuda device to the specified one
        with torch.cuda.device(device):
            self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                self.world_size, self.unique_id, self.rank
            )
            self.stream = torch.cuda.Stream()

            # A small all_reduce for warmup.
            data = torch.zeros(1, device=device)
            #self.all_reduce(data)
            #self.stream.synchronize()
            del data

        # by default it is disabled, e.g. in profiling models and prefill phase.
        # to use it, use under `with obj.change_state(enable=True)`, usually
        # when we are using CUDA graph.
        self.disabled = True

    def _resolve_stream(self, stream: Optional[torch.cuda.Stream]):
        """Return the stream to use for NCCL calls.


[2026-03-04 16:38:57 TP6] Ignore import error when loading sglang.srt.models.glm_ocr: No module named 'transformers.models.glm_ocr'
[2026-03-04 16:38:57 TP6] Ignore import error when loading sglang.srt.models.glm_ocr_nextn: No module named 'transformers.models.glm_ocr'
[2026-03-04 16:38:57 TP6] Ignore import error when loading sglang.srt.models.glmasr: cannot import name 'GlmAsrConfig' from 'transformers' (/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/transformers/__init__.py)






bash
TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=7200 \
SGLANG_DISABLE_DEEP_GEMM=1 \
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
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
0008:

bash
TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=7200 \
SGLANG_DISABLE_DEEP_GEMM=1 \
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
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

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ find /app/sglang/ -name communicator.py
/app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/communicator.py
/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/layers/communicator.py

026-03-04 16:46:41 TP4] Capture cuda graph begin. This can take up to several minutes. avail mem=15.30 GB
[2026-03-04 16:46:41 TP1] Capture cuda graph begin. This can take up to several minutes. avail mem=15.30 GB
[2026-03-04 16:46:41 TP2] Capture cuda graph begin. This can take up to several minutes. avail mem=15.30 GB
Capturing batches (bs=128 avail_mem=15.16 GB):   0%|                                                                                    | 0/20 [00:00<?, ?it/s]


grep -n "_tp_reduce_scatter\|def _tp_reduce_scatter" /app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/layers/communicator.py



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ grep -n "_tp_reduce_scatter\|def _tp_reduce_scatter" /app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/layers/communicator.py
38:    attn_tp_reduce_scatter_tensor,
421:            hidden_states, residual = self._tp_reduce_scatter(
517:    def _tp_reduce_scatter(
837:        attn_tp_reduce_scatter_tensor(hidden_states, input_hidden_states)
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 




sed -n '517,560p' /app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/layers/communicator.py
