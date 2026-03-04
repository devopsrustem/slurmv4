0007:
bashLD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=0 NCCL_TIMEOUT=600 \
NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring NCCL_PROTO=Simple \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
0008 — то же самое, только SGLANG_HOST_IP=10.99.91.63, --host 10.99.91.63, --node-rank 1.
Ключевое отличие от предыдущих попыток — убрал NCCL_NET_GDR_LEVEL=PIX и NCCL_CROSS_NIC=1, оставил только mlx5_0. Максимально близко к рабочему torchrun тесту.



На 0007 (rank 0):
bashNCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0 \
  --master_addr=10.99.91.59 --master_port=29500 \
  /tmp/test_nccl.py
На 0008 (rank 1) одновременно:
bashNCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1 \
  --master_addr=10.99.91.59 --master_port=29500 \
  /tmp/test_nccl.py
Если зависнет — проблема именно в 0007↔0008 inter-node NCCL.

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 12:17:15.750000 469293 torch/distributed/run.py:803] 
W0304 12:17:15.750000 469293 torch/distributed/run.py:803] *****************************************
W0304 12:17:15.750000 469293 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 12:17:15.750000 469293 torch/distributed/run.py:803] *****************************************
[W304 12:17:18.228653728 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.223723147 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.223868351 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.225036144 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.225098990 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.226303063 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.233063946 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.269516582 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.283025107 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[rank12]: Traceback (most recent call last):
[rank12]:   File "/tmp/test_nccl.py", line 6, in <module>
[rank12]:     x = torch.ones(1000).cuda(rank)
[rank12]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank12]: torch.AcceleratorError: CUDA error: invalid device ordinal
[rank12]: GPU device may be out of range, do you have enough GPUs?
[rank12]: CUDA kernel errors might be asynchronously reported at some other API call, so the stacktrace below might be incorrect.
[rank12]: For debugging consider passing CUDA_LAUNCH_BLOCKING=1
[rank12]: Compile with `TORCH_USE_CUDA_DSA` to enable device-side assertions.

[rank11]: Traceback (most recent call last):
[rank11]:   File "/tmp/test_nccl.py", line 6, in <module>
[rank11]:     x = torch.ones(1000).cuda(rank)
[rank11]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank11]: torch.AcceleratorError: CUDA error: invalid device ordinal
[rank11]: GPU device may be out of range, do you have enough GPUs?
[rank11]: CUDA kernel errors might be asynchronously reported at some other API call, so the stacktrace below might be incorrect.
[rank11]: For debugging consider passing CUDA_LAUNCH_BLOCKING=1
[rank11]: Compile with `TORCH_USE_CUDA_DSA` to enable device-side assertions.

W0304 12:17:22.059000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469398 closing signal SIGTERM
W0304 12:17:22.060000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469399 closing signal SIGTERM
W0304 12:17:22.060000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469400 closing signal SIGTERM
W0304 12:17:22.061000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469403 closing signal SIGTERM
W0304 12:17:22.061000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469404 closing signal SIGTERM
W0304 12:17:22.062000 469293 torch/distributed/elastic/multiprocessing/api.py:908] Sending process 469405 closing signal SIGTERM
E0304 12:17:22.232000 469293 torch/distributed/elastic/multiprocessing/api.py:882] failed (exitcode: 1) local_rank: 4 (pid: 469402) of binary: /app/sglang/sglang-0.5.9/bin/python3.12
Traceback (most recent call last):
  File "/app/sglang/sglang-0.5.9/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 357, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/run.py", line 936, in main
    run(args)
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/run.py", line 927, in run
    elastic_launch(
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/launcher/api.py", line 156, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/launcher/api.py", line 293, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError: 
============================================================
/tmp/test_nccl.py FAILED
------------------------------------------------------------
Failures:
  <NO_OTHER_FAILURES>
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-03-04_12:17:22
  host      : tpgds-aihub0008.delta.sbrf.ru
  rank      : 12 (local_rank: 4)
  exitcode  : 1 (pid: 469402)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ 

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 12:17:14.161000 267897 torch/distributed/run.py:803] 
W0304 12:17:14.161000 267897 torch/distributed/run.py:803] *****************************************
W0304 12:17:14.161000 267897 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 12:17:14.161000 267897 torch/distributed/run.py:803] *****************************************
[W304 12:17:16.381145738 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.890936097 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.890940575 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.891672306 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.891997177 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.938432391 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.941479740 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 12:17:19.942025561 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).



cat > /tmp/test_nccl.py << 'EOF'
import torch
import torch.distributed as dist
import os

dist.init_process_group('nccl')
rank = dist.get_rank()
local_rank = int(os.environ['LOCAL_RANK'])
torch.cuda.set_device(local_rank)
x = torch.ones(1000).cuda(local_rank)
dist.all_reduce(x)
torch.cuda.synchronize()
print(f'rank {rank} local_rank {local_rank} OK: {x[0].item()}')
dist.destroy_process_group()
EOF
[W304 12:17:19.980160588 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol)
