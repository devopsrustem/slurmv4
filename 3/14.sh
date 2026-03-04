0007:

bash
SGLANG_HOST_IP=10.99.91.59 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
0008:

bash
SGLANG_HOST_IP=10.99.91.63 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0007 ~]$ sudo find / -name all_reduce*
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda12/microbenchmarks/nccl_tests/all_reduce_perf
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda12/microbenchmarks/nccl_tests/all_reduce_perf_mpi
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/microbenchmarks/nccl_tests/all_reduce_perf
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/microbenchmarks/nccl_tests/all_reduce_perf_mpi
/app/tmp/uv/archive-v0/r8kos_ydg1hwacWqDaBmg/sglang/srt/distributed/device_communicators/all_reduce_utils.py
/app/tmp/uv/archive-v0/Wvf4lMgHGjKogMzPuJxYG/sglang/srt/distributed/device_communicators/all_reduce_utils.py
/app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/distributed/device_communicators/__pycache__/all_reduce_utils.cpython-312.pyc
/app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/distributed/device_communicators/all_reduce_utils.py
/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/distributed/device_communicators/__pycache__/all_reduce_utils.cpython-312.pyc
/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/sglang/srt/distributed/device_communicators/all_reduce_utils.py


NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/microbenchmarks/nccl_tests/all_reduce_perf \
  -b 1M -e 1G -f 2 -g 8



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ TORCH_DISTRIBUTED_DEFAULT_TIMEOUT=7200 SGLANG_DISABLE_DEEP_GEMM=1 LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/ --trust-remote-code   --tp-size 16 --host 10.99.91.59 --port 30001   --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0   --mem-fraction-static 0.8 --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11   --max-running-requests 128 --disable-cuda-graph^C
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 NCCL_IB_GID_INDEX=3 NCCL_SOCKET_IFNAME=enp25s0np0 /opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/microbenchmarks/nccl_tests/all_reduce_perf   -b 1M -e 1G -f 2 -g 8
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/microbenchmarks/nccl_tests/all_reduce_perf: error while loading shared libraries: libverifiable.so.0: cannot open shared object file: No such file or directory
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ fi^C /usr/lib/modules/$(uname -r) -name "*nvidia*" -name "*.ko*" 2>/dev/null
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ sudo find / -name libverifiable.so.0:
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ yum provides */libverifiable.so.0:
Not root, Subscription Management repositories not updated
Last metadata expiration check: 1 day, 8:08:23 ago on Tue 03 Mar 2026 11:29:44 AM MSK.
Error: No matches found. If searching for a file, try specifying the full path or using a wildcard prefix ("*/") at the beginning.
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ yum provides */libverifiable.so.0
Not root, Subscription Management repositories not updated
Last metadata expiration check: 1 day, 8:08:27 ago on Tue 03 Mar 2026 11:29:38 AM MSK.
Error: No matches found. If searching for a file, try specifying the full path or using a wildcard prefix ("*/") at the beginning.
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 








# На 0007 (запусти первым):
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
torchrun --nproc_per_node=8 --nnodes=2 \
  --node_rank=0 --master_addr=10.99.91.59 --master_port=29500 \
  -m torch.distributed.run --no_python python3 -c "
import torch, torch.distributed as dist
dist.init_process_group('nccl')
t = torch.ones(1024*1024).cuda(dist.get_rank() % 8)
dist.all_reduce(t)
print(f'rank {dist.get_rank()} OK')
"
bash
# На 0008 одновременно:
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
torchrun --nproc_per_node=8 --nnodes=2 \
  --node_rank=1 --master_addr=10.99.91.59 --master_port=29500 \
  -m torch.distributed.run --no_python python3 -c "..."




((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 NCCL_IB_GID_INDEX=3 NCCL_SOCKET_IFNAME=enp25s0np0 torchrun --nproc_per_node=8 --nnodes=2   --node_rank=1 --master_addr=10.99.91.59 --master_port=29500   -m torch.distributed.run --no_python python3 -c "..."
W0304 19:44:35.071000 690514 torch/distributed/run.py:803] 
W0304 19:44:35.071000 690514 torch/distributed/run.py:803] *****************************************
W0304 19:44:35.071000 690514 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 19:44:35.071000 690514 torch/distributed/run.py:803] *****************************************
[W304 19:44:37.543184455 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 19:44:40.789045482 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[E304 19:44:40.793259564 TCPStore.cpp:277] [c10d] The server socket on 29500 has failed to bind. TORCHELASTIC_USE_AGENT_STORE is enabled so ignoring the error.
[W304 19:44:40.795037897 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[W304 19:44:41.898456436 TCPStore.cpp:125] [c10d] recvValue failed on SocketImpl(fd=73, addr=localhost:46764, remote=localhost:29500): Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
Exception raised from recvBytes at /pytorch/torch/csrc/distributed/c10d/Utils.hpp:682 (most recent call first):
frame #0: c10::Error::Error(c10::SourceLocation, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) + 0x80 (0x7f260ef7cb80 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libc10.so)
frame #1: <unknown function> + 0x5ffc5b1 (0x7f25f19fc5b1 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #2: <unknown function> + 0x5ffd74d (0x7f25f19fd74d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #3: <unknown function> + 0x5ffe6aa (0x7f25f19fe6aa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #4: c10d::TCPStore::incrementValueBy(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x7a (0x7f25f19f7baa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #5: c10d::TCPStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x10f (0x7f25f19f7d2f in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #6: c10d::PrefixStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x36 (0x7f25f19a6da6 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #7: <unknown function> + 0xe08a9d (0x7f2601208a9d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
frame #8: <unknown function> + 0x3c071e (0x7f26007c071e in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
<omitting python frames>
frame #25: <unknown function> + 0x2a610 (0x7f261002a610 in /lib64/libc.so.6)
frame #26: __libc_start_main + 0x80 (0x7f261002a6c0 in /lib64/libc.so.6)
frame #27: _start + 0x25 (0x5565a71ee095 in /app/sglang/sglang-0.5.9/bin/python3.12)

E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965] Error waiting on exit barrier. Elapsed: 0.004255771636962891 seconds
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965] Traceback (most recent call last):
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/agent/server/api.py", line 951, in _exit_barrier
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]     store_util.barrier(
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 197, in barrier
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]     last_member_key = _barrier_nonblocking(
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]                       ^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 160, in _barrier_nonblocking
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]     idx = store.add(num_members_key, 1)
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965]           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.006000 690616 torch/distributed/elastic/agent/server/api.py:965] torch.distributed.DistNetworkError: Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
[W304 19:44:41.260159182 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[E304 19:44:41.264585197 TCPStore.cpp:277] [c10d] The server socket on 29500 has failed to bind. TORCHELASTIC_USE_AGENT_STORE is enabled so ignoring the error.
[W304 19:44:41.265823615 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[W304 19:44:41.369351604 TCPStore.cpp:125] [c10d] recvValue failed on SocketImpl(fd=73, addr=localhost:46784, remote=localhost:29500): Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
Exception raised from recvBytes at /pytorch/torch/csrc/distributed/c10d/Utils.hpp:682 (most recent call first):
frame #0: c10::Error::Error(c10::SourceLocation, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) + 0x80 (0x7f534e57cb80 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libc10.so)
frame #1: <unknown function> + 0x5ffc5b1 (0x7f5330ffc5b1 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #2: <unknown function> + 0x5ffd74d (0x7f5330ffd74d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #3: <unknown function> + 0x5ffe6aa (0x7f5330ffe6aa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #4: c10d::TCPStore::incrementValueBy(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x7a (0x7f5330ff7baa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #5: c10d::TCPStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x10f (0x7f5330ff7d2f in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #6: c10d::PrefixStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x36 (0x7f5330fa6da6 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #7: <unknown function> + 0xe08a9d (0x7f5340808a9d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
frame #8: <unknown function> + 0x3c071e (0x7f533fdc071e in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
<omitting python frames>
frame #25: <unknown function> + 0x2a610 (0x7f534f62a610 in /lib64/libc.so.6)
frame #26: __libc_start_main + 0x80 (0x7f534f62a6c0 in /lib64/libc.so.6)
frame #27: _start + 0x25 (0x55b3ec521095 in /app/sglang/sglang-0.5.9/bin/python3.12)

E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965] Error waiting on exit barrier. Elapsed: 0.004180192947387695 seconds
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965] Traceback (most recent call last):
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/agent/server/api.py", line 951, in _exit_barrier
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]     store_util.barrier(
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 197, in barrier
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]     last_member_key = _barrier_nonblocking(
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]                       ^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 160, in _barrier_nonblocking
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]     idx = store.add(num_members_key, 1)
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965]           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.477000 690617 torch/distributed/elastic/agent/server/api.py:965] torch.distributed.DistNetworkError: Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
[W304 19:44:41.375206605 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[E304 19:44:41.450388283 TCPStore.cpp:277] [c10d] The server socket on 29500 has failed to bind. TORCHELASTIC_USE_AGENT_STORE is enabled so ignoring the error.
[W304 19:44:41.452386604 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[E304 19:44:41.458920594 TCPStore.cpp:277] [c10d] The server socket on 29500 has failed to bind. TORCHELASTIC_USE_AGENT_STORE is enabled so ignoring the error.
[W304 19:44:41.460638393 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[W304 19:44:41.482160700 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [localhost]:29500 (errno: 97 - Address family not supported by protocol).
[W304 19:44:41.555803189 TCPStore.cpp:125] [c10d] recvValue failed on SocketImpl(fd=73, addr=localhost:46788, remote=localhost:29500): Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
Exception raised from recvBytes at /pytorch/torch/csrc/distributed/c10d/Utils.hpp:682 (most recent call first):
frame #0: c10::Error::Error(c10::SourceLocation, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) + 0x80 (0x7fb8fb77cb80 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libc10.so)
frame #1: <unknown function> + 0x5ffc5b1 (0x7fb8e4dfc5b1 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #2: <unknown function> + 0x5ffd74d (0x7fb8e4dfd74d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #3: <unknown function> + 0x5ffe6aa (0x7fb8e4dfe6aa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #4: c10d::TCPStore::incrementValueBy(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x7a (0x7fb8e4df7baa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #5: c10d::TCPStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x10f (0x7fb8e4df7d2f in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #6: c10d::PrefixStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x36 (0x7fb8e4da6da6 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #7: <unknown function> + 0xe08a9d (0x7fb8f4608a9d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
frame #8: <unknown function> + 0x3c071e (0x7fb8f3bc071e in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
<omitting python frames>
frame #25: <unknown function> + 0x2a610 (0x7fb90342a610 in /lib64/libc.so.6)
frame #26: __libc_start_main + 0x80 (0x7fb90342a6c0 in /lib64/libc.so.6)
frame #27: _start + 0x25 (0x55945186e095 in /app/sglang/sglang-0.5.9/bin/python3.12)

E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965] Error waiting on exit barrier. Elapsed: 0.004234790802001953 seconds
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965] Traceback (most recent call last):
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/agent/server/api.py", line 951, in _exit_barrier
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]     store_util.barrier(
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 197, in barrier
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]     last_member_key = _barrier_nonblocking(
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]                       ^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 160, in _barrier_nonblocking
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]     idx = store.add(num_members_key, 1)
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965]           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.664000 690621 torch/distributed/elastic/agent/server/api.py:965] torch.distributed.DistNetworkError: Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
[W304 19:44:41.564129174 TCPStore.cpp:125] [c10d] recvValue failed on SocketImpl(fd=73, addr=localhost:46796, remote=localhost:29500): Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
Exception raised from recvBytes at /pytorch/torch/csrc/distributed/c10d/Utils.hpp:682 (most recent call first):
frame #0: c10::Error::Error(c10::SourceLocation, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) + 0x80 (0x7fefead7cb80 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libc10.so)
frame #1: <unknown function> + 0x5ffc5b1 (0x7fefd43fc5b1 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #2: <unknown function> + 0x5ffd74d (0x7fefd43fd74d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #3: <unknown function> + 0x5ffe6aa (0x7fefd43fe6aa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #4: c10d::TCPStore::incrementValueBy(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x7a (0x7fefd43f7baa in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #5: c10d::TCPStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x10f (0x7fefd43f7d2f in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #6: c10d::PrefixStore::add(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, long) + 0x36 (0x7fefd43a6da6 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #7: <unknown function> + 0xe08a9d (0x7fefe3c08a9d in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
frame #8: <unknown function> + 0x3c071e (0x7fefe31c071e in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_python.so)
<omitting python frames>
frame #25: <unknown function> + 0x2a610 (0x7feff2a2a610 in /lib64/libc.so.6)
frame #26: __libc_start_main + 0x80 (0x7feff2a2a6c0 in /lib64/libc.so.6)
frame #27: _start + 0x25 (0x559fa340a095 in /app/sglang/sglang-0.5.9/bin/python3.12)

E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965] Error waiting on exit barrier. Elapsed: 0.00415802001953125 seconds
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965] Traceback (most recent call last):
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/agent/server/api.py", line 951, in _exit_barrier
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]     store_util.barrier(
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 197, in barrier
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]     last_member_key = _barrier_nonblocking(
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]                       ^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]   File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/distributed/elastic/utils/store.py", line 160, in _barrier_nonblocking
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]     idx = store.add(num_members_key, 1)
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965]           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
E0304 19:44:41.672000 690619 torch/distributed/elastic/agent/server/api.py:965] torch.distributed.DistNetworkError: Failed to recv, got 0 bytes. Connection was likely closed. Did the remote server shutdown or crash?
