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
