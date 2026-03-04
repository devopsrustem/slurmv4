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
