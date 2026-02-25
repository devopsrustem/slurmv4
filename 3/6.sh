pkill -9 -f sglang
sleep 2

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.35
export GLOO_SOCKET_FAMILY=AF_INET
export NCCL_SOCKET_IFNAME=ens3np0
export NCCL_TIMEOUT=600

numactl --cpunodebind=0 --membind=0 -- env GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.35 --port 30001 --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --max-running-requests 128 --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998
