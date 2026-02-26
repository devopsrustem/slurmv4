bash# С aihub0001 → aihub0003
echo "" | nc -w 2 10.99.91.49 15328; echo "exit: $?"

# С aihub0002 → aihub0006  
echo "" | nc -w 2 10.99.91.35 15599; echo "exit: $?"
И одновременно посмотри что пишет decode в момент подключения — найди stdout процесса:
bash# На aihub0003
ls -la /proc/3110559/fd/1 /proc/3110559/fd/2
# Если симлинк на /dev/pts/* или pipe - читать так:
tail -f /proc/3110559/fd/2
И самое важное — проверь есть ли bootstrap сервер (etcd/redis) который Mooncake использует для регистрации сессий, и видят ли его обе стороны:
bash# На всех 4 нодах
ss -tlnp | grep -E '2379|6379|8500'
# или
ps aux | grep -E 'etcd|redis|bootstrap'
Как именно запускается SGLang — есть ли --disaggregation-bootstrap-host параметр в команде запуска?



[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tlnp | grep -E '2379|6379|8500'
[dcbsr_dev@tpgds-aihub0001 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+  789925  1.0  0.0 53390224 1223020 pts/0 Sl+ 15:45   0:26 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.39 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998 --disable-cuda-graph
dcbsr_d+  813476  0.0  0.0   6424  2732 pts/2    S+   16:29   0:00 grep --color=auto -E etcd|redis|bootstrap

[dcbsr_dev@tpgds-aihub0002 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+ 1633605  0.9  0.0 53241024 1174540 pts/0 Sl+ 15:45   0:25 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.41 --port 30000 --dist-init-addr 10.99.91.39:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode prefill --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998 --disable-cuda-graph
dcbsr_d+ 1657401  0.0  0.0   6424  2736 pts/1    S+   16:29   0:00 grep --color=auto -E etcd|redis|bootstrap
[dcbsr_dev@tpgds-aihub0002 ~]$ ss -tlnp | grep -E '2379|6379|8500'

[dcbsr_dev@tpgds-aihub0003 ~]$ ss -tlnp | grep -E '2379|6379|8500'
[dcbsr_dev@tpgds-aihub0003 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+ 3110165  0.9  0.0 53481600 1255880 pts/0 Sl+ 15:45   0:26 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.49 --port 30001 --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode decode --max-running-requests 128 --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998
dcbsr_d+ 3134510  0.0  0.0   6424  2732 pts/1    S+   16:30   0:00 grep --color=auto -E etcd|redis|bootstrap


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ps aux | grep -E 'etcd|redis|bootstrap'
dcbsr_d+  484791  0.9  0.0 53168040 995884 pts/0 Sl+  15:45   0:25 /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.35 --port 30001 --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --max-running-requests 128 --disaggregation-ib-device mlx5_0 --disaggregation-bootstrap-port 8998
dcbsr_d+  507093  0.0  0.0   6420  2728 pts/1    S+   16:30   0:00 grep --color=auto -E etcd|redis|bootstrap
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ss -tlnp | grep -E '2379|6379|8500'
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ 

[dcbsr_dev@tpgds-aihub0001 ~]$ SGLANG_HOST_IP=10.99.91.39 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph


[dcbsr_dev@tpgds-aihub0002 ~]$ SGLANG_HOST_IP=10.99.91.41 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

[dcbsr_dev@tpgds-aihub0003 ~]$ SGLANG_HOST_IP=10.99.91.49  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ SGLANG_HOST_IP=10.99.91.35 GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998




