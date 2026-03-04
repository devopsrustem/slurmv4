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
