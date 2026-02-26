Decode Нода 3 (ЗАПУСТИ ПЕРВОЙ)


export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.49

export GLOO_SOCKET_FAMILY=AF_INET
export NCCL_SOCKET_IFNAME=ens3np0
export NCCL_TIMEOUT=600
export MASTER_ADDR=10.99.91.49
export MASTER_PORT=5000

GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.49 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998

  Decode Нода 6 (ЗАПУСТИ ЧЕРЕЗ 30 СЕК):

  pkill -9 -f sglang
sleep 2

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.35
export GLOO_SOCKET_FAMILY=AF_INET
export NCCL_SOCKET_IFNAME=ens3np0
export NCCL_TIMEOUT=600
export MASTER_ADDR=10.99.91.49
export MASTER_PORT=5000

GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.35 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998


  1

  pkill -9 -f sglang
sleep 2

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39
export GLOO_SOCKET_FAMILY=AF_INET
export NCCL_SOCKET_IFNAME=ens108np0
export NCCL_TIMEOUT=600
export MASTER_ADDR=10.99.91.39
export MASTER_PORT=5000

GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph


  2я

  pkill -9 -f sglang
sleep 2

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.41
export GLOO_SOCKET_FAMILY=AF_INET
export NCCL_SOCKET_IFNAME=ens108np0
export NCCL_TIMEOUT=600
export MASTER_ADDR=10.99.91.39
export MASTER_PORT=5000

GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.41 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph

  роутер

  /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 \
  --decode http://10.99.91.49:30001 \
  --host 0.0.0.0 \
  --port 8000


ps aux | grep sglang | grep python3 | head -1 | awk '{print $2}' | xargs -I {} cat /proc/{}/environ | tr '\0' '\n' | grep MOONCAKE


[dcbsr_dev@tpgds-aihub0003 ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
#10.82.101.249     tpgds-aihub0003.delta.sbrf.ru tpgds-aihub0003
10.99.91.49     tpgds-aihub0003.delta.sbrf.ru tpgds-aihub0003
[dcbsr_dev@tpgds-aihub0003 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.99.91.49
[dcbsr_dev@tpgds-aihub0003 ~]$ ps aux | grep sglang | grep python3 | head -1 | awk '{print $2}' | xargs -I {} cat /proc/{}/environ | tr '\0' '\n' | grep MOONCAKE
MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.49


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ [dcbsr_dev@tpgds-aihub0003 ~]$ ps aux | grep sglang | grep python3 | head -1 | awk '{print $2}' | xargs -I {} cat /proc/{}/environ | tr '\0' '\n' | grep MOONCAKE
MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.49
-bash: [dcbsr_dev@tpgds-aihub0003: command not found
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6


10.99.91.35     tpgds-aihub0006.delta.sbrf.ru tpgds-aihub0006
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.99.91.35

# На КАЖДОЙ ноде:
sudo pkill -9 -f sglang
sudo pkill -9 -f python
sudo pkill -9 -f mooncake
sleep 3

# Очисти все временные файлы:
rm -rf /tmp/torch_* /tmp/nccl_* /dev/shm/torch_* /tmp/mooncake* ~/.mooncake 2>/dev/null

# Проверь что ничего не осталось:
ps aux | grep -E "(sglang|python.*sglang)" | grep -v grep
ss -tlnp | grep -E "(5000|30000|30001|8998)"


3

pkill -9 -f sglang
sleep 2

MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.49 \
GLOO_SOCKET_FAMILY=AF_INET \
NCCL_SOCKET_IFNAME=ens3np0 \
NCCL_TIMEOUT=600 \
MASTER_ADDR=10.99.91.49 \
MASTER_PORT=5000 \
GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.49 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998

  6


  pkill -9 -f sglang
sleep 2

MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.35 \
GLOO_SOCKET_FAMILY=AF_INET \
NCCL_SOCKET_IFNAME=ens3np0 \
NCCL_TIMEOUT=600 \
MASTER_ADDR=10.99.91.49 \
MASTER_PORT=5000 \
GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.35 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998



  1


pkill -9 -f sglang
sleep 2

MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39 \
GLOO_SOCKET_FAMILY=AF_INET \
NCCL_SOCKET_IFNAME=ens108np0 \
NCCL_TIMEOUT=600 \
MASTER_ADDR=10.99.91.39 \
MASTER_PORT=5000 \
GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph


  2



pkill -9 -f sglang
sleep 2

MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.41 \
GLOO_SOCKET_FAMILY=AF_INET \
NCCL_SOCKET_IFNAME=ens108np0 \
NCCL_TIMEOUT=600 \
MASTER_ADDR=10.99.91.39 \
MASTER_PORT=5000 \
GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN \
NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX \
NCCL_IB_GID_INDEX=3 \
NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 \
CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.41 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph



  Decode нода 3:
bash--mooncake-transfer-engine-addr 10.99.91.49
Decode нода 6:
bash--mooncake-transfer-engine-addr 10.99.91.35
Prefill нода 1:
bash--mooncake-transfer-engine-addr 10.99.91.39
Prefill нода 2:
bash--mooncake-transfer-engine-addr 10.99.91.41Decode Нода 3 (10.99.91.49):
bash# Проверь текущие маршруты:
ip route show

# Добавь RoCE приоритет:
sudo ip route add 10.99.91.0/24 dev ens3np0 src 10.99.91.49 metric 10

# Проверь что добавилось:
ip route show | grep 10.99.91

Decode Нода 6 (10.99.91.35):
bash# Проверь текущие маршруты:
ip route show

# Добавь RoCE приоритет:
sudo ip route add 10.99.91.0/24 dev ens3np0 src 10.99.91.35 metric 10

# Проверь что добавилось:
ip route show | grep 10.99.91

Prefill Нода 1 (10.99.91.39):
bash# Проверь текущие маршруты:
ip route show

# Добавь RoCE приоритет:
sudo ip route add 10.99.91.0/24 dev ens108np0 src 10.99.91.39 metric 10

# Проверь что добавилось:
ip route show | grep 10.99.91

Prefill Нода 2 (10.99.91.41):
bash# Проверь текущие маршруты:
ip route show

# Добавь RoCE приоритет:
sudo ip route add 10.99.91.0/24 dev ens108np0 src 10.99.91.41 metric 10

# Проверь что добавилось:
ip route show | grep 10.99.91

❌ Если нужно откатить (на случай проблем):
bash# На каждой ноде:
sudo ip route del 10.99.91.0/24



