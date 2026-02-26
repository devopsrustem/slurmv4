((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 sglang]$ ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
ens108np0        UP             10.99.91.39/31 
ens12f0np0       UP             
ens12f1np1       DOWN           
ens109np0        UP             10.99.92.39/31 
ens110np0        UP             10.99.93.39/31 
ens111np0        UP             10.99.94.39/31 
ens112np0        UP             10.99.95.39/31 
ens20f0np0       UP             
ens20f1np1       DOWN           
ens113np0        UP             10.99.96.39/31 
ens114np0        UP             10.99.97.39/31 
ens115np0        UP             10.99.98.39/31 
bond0            UP             10.82.101.193/29 
docker0          DOWN           172.17.0.1/16 

nv peermem не используем

запуск
aihub3
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0  SGLANG_HOST_IP=10.99.91.49  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ MC_LOG_LEVEL=TRACE SGLANG_LOCAL_IP_NIC=ens3np0 SGLANG_HOST_IP=10.99.91.35 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=info NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 sglang]$ SGLANG_LOCAL_IP_NIC=ens108np0 SGLANG_HOST_IP=10.99.91.39 SGLANG_HOST_IP=10.99.91.39 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 1   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_LOCAL_IP_NIC=ens108np0 SGLANG_HOST_IP=10.99.91.41 SGLANG_HOST_IP=10.99.91.41 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=INFO NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

