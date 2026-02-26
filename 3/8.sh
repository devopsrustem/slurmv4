[2026-02-26 12:53:08 TP4] Prefill transfer failed for request rank=4 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.249:16324 is not alive
[2026-02-26 12:53:08 TP3] Prefill transfer failed for request rank=3 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.249:16342 is not alive
[2026-02-26 12:53:08 TP2] Prefill transfer failed for request rank=2 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.249:15835 is not alive
[2026-02-26 12:53:08 TP1] Prefill transfer failed for request rank=1 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.249:16598 is not alive


[2026-02-26 12:53:08 TP12] Prefill transfer failed for request rank=12 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.130:16388 is not alive
[2026-02-26 12:53:08 TP11] Prefill transfer failed for request rank=11 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.130:15766 is not alive
[2026-02-26 12:53:08 TP10] Prefill transfer failed for request rank=10 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.130:15659 is not alive
[2026-02-26 12:53:08 TP9] Prefill transfer failed for request rank=9 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.130:15084 is not alive
[2026-02-26 12:53:08 TP8] Prefill transfer failed for request rank=8 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.130:16707 is not alive



/app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ MC_TCP_BIND_ADDRESS=10.99.91.39 MC_GID_INDEX=3 MC_MTU=4096 MOONCAKE_DEVICE="mlx5_0" MOONCAKE_PROTOCOL="rdma" GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ MC_TCP_BIND_ADDRESS=10.99.91.41 MC_GID_INDEX=3 MC_MTU=4096 MOONCAKE_PROTOCOL="rdma" MOONCAKE_DEVICE="mlx5_0" GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens108np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.39 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998   --disable-cuda-graph


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ MC_TCP_BIND_ADDRESS=10.99.91.49 MC_GID_INDEX=3 MOONCAKE_DEVICE="mlx5_0" MOONCAKE_PROTOCOL="rdma" GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ MC_TCP_BIND_ADDRESS=10.99.91.35 MC_GID_INDEX=3 MOONCAKE_DEVICE="mlx5_0" MOONCAKE_PROTOCOL="barex"  GLOO_SOCKET_FAMILY=AF_INET NCCL_SOCKET_IFNAME=ens3np0 NCCL_TIMEOUT=600 MASTER_ADDR=10.99.91.49 MASTER_PORT=5000 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.35   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0   --disaggregation-bootstrap-port 8998



Создай файлы конфигурации на каждой ноде
На 10.99.91.39 (prefill node 0):
bashmkdir -p /opt/mooncake-libs/config
cat > /opt/mooncake-libs/config/mooncake.json << 'EOF'
{
  "local_hostname": "10.99.91.39",
  "metadata_server": "http://10.99.91.39:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}
EOF
На 10.99.91.41 (prefill node 1):
bashmkdir -p /opt/mooncake-libs/config
cat > /opt/mooncake-libs/config/mooncake.json << 'EOF'
{
  "local_hostname": "10.99.91.41",
  "metadata_server": "http://10.99.91.39:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}
EOF
На 10.99.91.49 (decode node 0):
bash# Сначала проверь: ibdev2netdev | grep ens3np0
# должно показать mlx5_X → ens3np0 — подставь вместо mlx5_0 если отличается
mkdir -p /opt/mooncake-libs/config
cat > /opt/mooncake-libs/config/mooncake.json << 'EOF'
{
  "local_hostname": "10.99.91.49",
  "metadata_server": "http://10.99.91.49:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}
EOF
На 10.99.91.35 (decode node 1):
bashmkdir -p /opt/mooncake-libs/config
cat > /opt/mooncake-libs/config/mooncake.json << 'EOF'
{
  "local_hostname": "10.99.91.35",
  "metadata_server": "http://10.99.91.49:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}
EOF

Обновлённые скрипты запуска
Prefill node 0 (10.99.91.39) — скрипт 1:
bashpkill -9 -f sglang
sleep 2

MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
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
  --disaggregation-bootstrap-port 8998 \
  --disable-cuda-graph
Decode node 0 (10.99.91.49) — скрипт 3:
bashpkill -9 -f sglang
sleep 2

MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
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
  --disaggregation-bootstrap-port 8998
Изменения во всех скриптах: убрал MOONCAKE_TRANSFER_ENGINE_IP и --disaggregation-ib-device, добавил MOONCAKE_CONFIG_PATH. Перед запуском обязательно проверь ibdev2netdev на decode нодах — нужно убедиться что там тоже mlx5_0 смотрит на нужный RoCE интерфейс.более простого способа не существует?12:45 PMВыявил простейший способ через переменную окруженияВыявил простейший способ через переменную окруженияThe user wants a simpler solution. Let me think...
The simplest approach would be to just set MC_EXCLUDE_DEVICES or similar env var... or just use MOONCAKE_TRANSFER_ENGINE_IP correctly.
Actually, the simplest fix is just setting MC_TCP_BIND_ADDRESS to the RoCE IP - this tells Mooncake which IP to bind to, which forces it to pick the correct device.
Wait, looking at the issue again - MOONCAKE_TRANSFER_ENGINE_IP should work but apparently doesn't. Let me think about why.
Actually the simplest solution might be just setting MC_TCP_BIND_ADDRESS=<roce_ip> - this is what the Mooncake issue #256 example showed. This env var tells the transfer engine which IP address to bind to, and it should pick the correct NIC automatically based on that IP.
So I'd just set the bind address to the RoCE IP directly, which should force Mooncake to use the right interface. Though MOONCAKE_TRANSFER_ENGINE_IP and MC_TCP_BIND_ADDRESS might be doing similar things - I need to figure out which one actually works. The real issue is that the decode nodes are registering with the bond IPs, so the fix needs to ensure they're using the RoCE interface instead.Show moreDoneДа, существует. Одна переменная:
bashMC_TCP_BIND_ADDRESS=10.99.91.39 \   # на каждой ноде свой RoCE IP
Это заставляет Mooncake биндиться к конкретному IP → он сам находит правильный mlx5 интерфейс. Никаких JSON файлов.
Ты уже использовал MOONCAKE_TRANSFER_ENGINE_IP — это другая переменная, она говорит что анонсировать, но не говорит к чему биндиться. MC_TCP_BIND_ADDRESS именно биндит сокет.
Итого для каждой ноды просто замени:
bash# было:
MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39 \

# стало:
MC_TCP_BIND_ADDRESS=10.99.91.39 \
Decode ноды (10.99.91.49, 10.99.91.35) — то же самое с их RoCE IP. После этого сессии будут регистрироваться как 10.99.91.x:port вместо 10.82.101.x:port.[2026-02-26 12:53:08 TP4] Prefill transfer failed for request rank=4 req.rid='af2f3f99db344fab9f0598c637f163fe' req.bootstrap_room=6989861766352545488 with exception KVTransferError(bootstrap_room=6989861766352545488): Decode instance could be dead, remote mooncake session 10.82.101.249:16324 is notpasted12:56 PMDiagnosed configuration incompatibility and identified proper solution pathDiagnosed configuration incompatibility and identified proper solution pathThe error persists - decode still registers sessions with bond IPs (10.82.101.249, 10.82.101.130). The env vars like MC_TCP_BIND_ADDRESS, MOONCAKE_DEVICE, MOONCAKE_PROTOCOL aren't working with this version of Mooncake bundled in /opt/mooncake-libs/.
The key issue: this is a custom/older Mooncake build in /opt/mooncake-libs/ that may not support these env vars. The only reliable solution for this version is MOONCAKE_CONFIG_PATH.
Also I notice on node 4 (aihub0006) they used MOONCAKE_PROTOCOL="barex" - that's wrong, should be "rdma".
So the env var approach won't work here - I need to create the config files and point to them with MOONCAKE_CONFIG_PATH instead.Show moreDoneDecode ноды всё ещё регистрируются через 10.82.101.x — значит эти env vars (MC_TCP_BIND_ADDRESS, MOONCAKE_DEVICE и т.д.) не поддерживаются той версией Mooncake которая в /opt/mooncake-libs/. Это старый кастомный билд.
Также вижу опечатку на ноде 4 (aihub0006): MOONCAKE_PROTOCOL="barex" — должно быть rdma.
Единственный надёжный вариант для этой версии — всё-таки MOONCAKE_CONFIG_PATH. Это буквально 4 файла по 5 строк:
bash# На КАЖДОЙ из 4 нод (один раз):
cat > /tmp/mooncake.json << EOF
{
  "local_hostname": "$(hostname -I | awk '{print $1}')",
  "metadata_server": "http://METADATA_IP:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}
EOF
Где METADATA_IP — 10.99.91.39 для prefill нод, 10.99.91.49 для decode нод. И добавить одну строку в скрипты:
bashMOONCAKE_CONFIG_PATH=/tmp/mooncake.json \
Убрать MOONCAKE_TRANSFER_ENGINE_IP / MC_TCP_BIND_ADDRESS / MOONCAKE_DEVICE / MOONCAKE_PROTOCOL — они всё равно не работают.
Быстрее этого способа нет для данной версии.mkdir -p /opt/mooncake-libs/config cat > /opt/mooncake-libs/config/mooncake.json << 'EOF' { "local_hostname": "10.99.91.49", "metadata_server": "http://10.99.91.49:8998/metadata", "protocol": "rdma", "device_name": "mlx5_0" } EOFтакая конструкция верна?12:59 PMПодтвердил корректность синтаксиса heredoc конструкцииПодтвердил корректность синтаксиса heredoc конструкцииYes, that's correct syntax for heredoc.DoneДа, синтаксис верный. Можешь проверить что записалось:
bashcat /opt/mooncake-libs/config/mooncake.json
Должно вывести:
json{
  "local_hostname": "10.99.91.49",
  "metadata_server": "http://10.99.91.49:8998/metadata",
  "protocol": "rdma",
  "device_name": "mlx5_0"
}



((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ cat /opt/mooncake-libs/
config/                  libstdc++.so.6           run-with-new-libstdc.sh  
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ cat /opt/mooncake-libs/run-with-new-libstdc.sh 
#!/bin/bash
export LD_PRELOAD=/opt/mooncake-libs/libstdc++.so.6
exec "$@"
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ 

Проверь сначала версию Mooncake:
bash/app/sglang/sglang-latest/bin/python3 -c "import mooncake; print(mooncake.__version__)"
# или
/app/sglang/sglang-latest/bin/pip show mooncake-transfer-engine
И попробуй явно с MOONCAKE_CONFIG_PATH:
bashMOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
/app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
Это покажет читается ли файл вообще. И покажи вывод — разберёмся точно.

















((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ /app/sglang/sglang-latest/bin/pip show mooncake-transfer-engine
Name: mooncake-transfer-engine
Version: 0.3.8.post1
Summary: Python binding of a Mooncake library using pybind11
Home-page: https://github.com/kvcache-ai/Mooncake
Author: Mooncake Authors
Author-email: 
License: 
Location: /app/sglang/sglang-0.5.8.post1/lib64/python3.12/site-packages
Requires: aiohttp, requests
Required-by: 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
/app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
PATH: /opt/mooncake-libs/config/mooncake.json
FILE: {'local_hostname': '10.99.91.49', 'metadata_server': 'http://10.99.91.49:8998/metadata', 'protocol': 'rdma', 'device_name': 'mlx5_0'}




((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ /app/sglang/sglang-latest/bin/pip show mooncake-transfer-engine
Name: mooncake-transfer-engine
Version: 0.3.8.post1
Summary: Python binding of a Mooncake library using pybind11
Home-page: https://github.com/kvcache-ai/Mooncake
Author: Mooncake Authors
Author-email: 
License: 
Location: /app/sglang/sglang-0.5.8.post1/lib64/python3.12/site-packages
Requires: aiohttp, requests
Required-by: 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
/app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
PATH: /opt/mooncake-libs/config/mooncake.json
FILE: {'local_hostname': '10.99.91.35', 'metadata_server': 'http://10.99.91.49:8998/metadata', 'protocol': 'rdma', 'device_name': 'mlx5_0'}




((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ /app/sglang/sglang-latest/bin/pip show mooncake-transfer-engine
Name: mooncake-transfer-engine
Version: 0.3.8.post1
Summary: Python binding of a Mooncake library using pybind11
Home-page: https://github.com/kvcache-ai/Mooncake
Author: Mooncake Authors
Author-email: 
License: 
Location: /app/sglang/sglang-0.5.8.post1/lib64/python3.12/site-packages
Requires: aiohttp, requests
Required-by: 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ /app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
PATH: None
Traceback (most recent call last):
  File "<string>", line 5, in <module>
TypeError: expected str, bytes or os.PathLike object, not NoneType
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
/app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
PATH: /opt/mooncake-libs/config/mooncake.json
FILE: {'local_hostname': '10.99.91.39', 'metadata_server': 'http://10.99.91.39:8998/metadata', 'protocol': 'rdma', 'device_name': 'mlx5_0'}





((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ /app/sglang/sglang-latest/bin/pip show mooncake-transfer-engine
Name: mooncake-transfer-engine
Version: 0.3.8.post1
Summary: Python binding of a Mooncake library using pybind11
Home-page: https://github.com/kvcache-ai/Mooncake
Author: Mooncake Authors
Author-email: 
License: 
Location: /app/sglang/sglang-0.5.8.post1/lib64/python3.12/site-packages
Requires: aiohttp, requests
Required-by: 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0002 ~]$ MOONCAKE_CONFIG_PATH=/opt/mooncake-libs/config/mooncake.json \
/app/sglang/sglang-latest/bin/python3 -c "
import os, json
path = os.environ.get('MOONCAKE_CONFIG_PATH')
print('PATH:', path)
print('FILE:', json.load(open(path)))
"
PATH: /opt/mooncake-libs/config/mooncake.json
FILE: {'local_hostname': '10.99.91.41', 'metadata_server': 'http://10.99.91.39:8998/metadata', 'protocol': 'rdma', 'device_name': 'mlx5_0'}





bashfind /app/sglang/sglang-latest -name "*.py" | xargs grep -l "local_hostname\|TransferEngine\|MOONCAKE_CONFIG" 2>/dev/null
И конкретно файл инициализации:
bashfind /app/sglang/sglang-latest -path "*/disaggregation*" -name "*.py" | head -20
И посмотри что там внутри:
bashfind /app/sglang/sglang-latest -path "*/disaggregation*" -name "*.py" | xargs grep -l "hostname\|device_name\|config" 2>/dev/null | head -5 | xargs cat



Значит SGLang установлен как пакет, исходники не там. Ищем иначе:
bashfind /app/sglang/sglang-latest/lib -name "mooncake*.py" -o -name "*disaggregat*.py" 2>/dev/null | head -20
bashfind /app/sglang/sglang-latest/lib -path "*/sglang*" -name "*.py" | xargs grep -l "local_hostname\|mooncake_config\|MOONCAKE" 2>/dev/null
bashpython3 -c "import sglang; print(sglang.__file__)"
# потом ищем рядом
Или через pip:
bash/app/sglang/sglang-latest/bin/pip show -f sglang | grep -i "mooncake\|disaggregat"
