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


cat /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py
cat /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/mooncake/utils.py
cat /app/sglang/sglang-latest/lib/python3.12/site-packages/mooncake/mooncake_config.py











((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ cat /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/mooncake/transfer_engine.py
import json
import logging
import os
from typing import List, Optional

from sglang.srt.environ import envs
from sglang.srt.utils import get_free_port, maybe_wrap_ipv6_address

logger = logging.getLogger(__name__)


def get_ib_devices_for_gpu(ib_device_str: Optional[str], gpu_id: int) -> Optional[str]:
    """
    Parse IB device string and get IB devices for a specific GPU ID.

    Supports all the following formats:
    1. Old format: "ib0, ib1, ib2"
    2. New format: {0: "ib0, ib1", 1: "ib2, ib3", 2: "ib4"}
    3. JSON file: path to a JSON file containing the mapping

    Args:
        ib_device_str: The original IB device string or path to JSON file
        gpu_id: The GPU ID to get devices for

    Returns:
        IB devices string for the GPU, or None if not available
    """
    if ib_device_str is None or not ib_device_str.strip():
        return None

    ib_device_str = ib_device_str.strip()

    # Check if it's a JSON file first and load its content
    is_json_file = ib_device_str.endswith(".json")
    if is_json_file:
        try:
            if os.path.isfile(ib_device_str):
                with open(ib_device_str, "r") as f:
                    ib_device_str = f.read()
            else:
                # File doesn't exist, treat as old format
                raise RuntimeError(f"File {ib_device_str} does not exist.")
        except (IOError, OSError) as e:
            # File reading failed, raise exception
            raise RuntimeError(f"Failed to read JSON file {ib_device_str}: {e}") from e

    # Check if it's JSON format (new format)
    try:
        parsed_json = json.loads(ib_device_str)
        if isinstance(parsed_json, dict):
            # Validate format - keys should be integers (or string rep), values should be strings
            gpu_mapping = {}
            for gpu_key, ib_devices in parsed_json.items():
                if (
                    isinstance(gpu_key, str)
                    and gpu_key.isdigit()
                    and isinstance(ib_devices, str)
                ):
                    gpu_mapping[int(gpu_key)] = ib_devices.strip()
                elif isinstance(gpu_key, int) and isinstance(ib_devices, str):
                    gpu_mapping[gpu_key] = ib_devices.strip()
                else:
                    raise ValueError(
                        f"Invalid format: keys must be integers (or string representations of integers) and values must be strings"
                    )

            if not gpu_mapping:
                raise ValueError("No valid GPU mappings found in JSON")

            # Return devices for specific GPU
            if gpu_id in gpu_mapping:
                return gpu_mapping[gpu_id]
            else:
                raise ValueError(
                    f"No IB devices configured for GPU {gpu_id}. Available GPUs: {list(gpu_mapping.keys())}"
                )

    except json.JSONDecodeError:
        if is_json_file:
            # It was supposed to be a JSON file but failed to parse
            raise RuntimeError(
                f"Failed to parse JSON content from file {ib_device_str}"
            )
        # Not JSON format, treat as old format - return same devices for all GPUs
        return ib_device_str


class MooncakeTransferEngine:

    def __init__(self, hostname: str, gpu_id: int, ib_device: Optional[str] = None):
        try:
            from mooncake.engine import TransferEngine
        except ImportError as e:
            raise ImportError(
                "Please install mooncake by following the instructions at "
                "https://github.com/kvcache-ai/Mooncake/blob/main/doc/en/build.md "  # noqa: E501
                "to run SGLang with MooncakeTransferEngine."
            ) from e

        self.engine = TransferEngine()
        self.hostname = hostname
        self.gpu_id = gpu_id
        self.ib_device = get_ib_devices_for_gpu(ib_device, gpu_id)

        self.initialize(
            hostname=self.hostname,
            device_name=self.ib_device,
        )
        self.session_id = (
            f"{maybe_wrap_ipv6_address(self.hostname)}:{self.engine.get_rpc_port()}"
        )

    def register(self, ptr, length):
        try:
            ret_value = self.engine.register_memory(ptr, length)
        except Exception:
            # Mark register as failed
            ret_value = -1

        if ret_value != 0:
            logger.debug("Mooncake memory registration %s failed.", ptr)

    def deregister(self, ptr):
        try:
            ret_value = self.engine.unregister_memory(ptr)
        except Exception:
            # Mark deregister as failed
            ret_value = -1

        if ret_value != 0:
            logger.debug("Mooncake memory deregistration %s failed.", ptr)

    def batch_register(self, ptrs: List[int], lengths: List[int]) -> int:
        """Batch register multiple memory regions."""
        try:
            ret_value = self.engine.batch_register_memory(ptrs, lengths)
        except Exception:
            # Mark batch register as failed
            ret_value = -1
            if not hasattr(self.engine, "batch_register_memory"):
                raise RuntimeError(
                    "Mooncake's batch register requires a newer version of mooncake-transfer-engine. "
                    "Please upgrade Mooncake."
                )

        if ret_value != 0:
            logger.debug("Mooncake batch memory registration failed.")
        return ret_value

    def batch_deregister(self, ptrs: List[int]) -> int:
        """Batch deregister multiple memory regions."""
        try:
            ret_value = self.engine.batch_unregister_memory(ptrs)
        except Exception:
            # Mark batch deregister as failed
            ret_value = -1

        if ret_value != 0:
            logger.debug("Mooncake batch memory deregistration failed.")
        return ret_value

    def initialize(
        self,
        hostname: str,
        device_name: Optional[str],
    ) -> None:
        """Initialize the mooncake instance."""
        if envs.ENABLE_ASCEND_TRANSFER_WITH_MOONCAKE.get():
            npu_phy_id = envs.ASCEND_NPU_PHY_ID.get()
            if npu_phy_id == -1:
                hostname += f":{get_free_port()}:npu_{self.gpu_id}"
            else:
                hostname += f":{get_free_port()}:npu_{npu_phy_id}"
            ret_value = self.engine.initialize(
                hostname,
                "P2PHANDSHAKE",
                "ascend",
                device_name if device_name is not None else "",
            )
        else:
            ret_value = self.engine.initialize(
                hostname,
                "P2PHANDSHAKE",
                "rdma",
                device_name if device_name is not None else "",
            )
        if ret_value != 0:
            logger.error("Mooncake Transfer Engine initialization failed.")
            raise RuntimeError("Mooncake Transfer Engine initialization failed.")

    def transfer_sync(
        self, session_id: str, buffer: int, peer_buffer_address: int, length: int
    ) -> int:
        """Synchronously transfer data to the specified address."""
        try:
            # the first time: based on session_id (which contains remote_ip) to construct a queue pair, and cache the queue pair
            # later: based on the cached queue pair to send data
            ret = self.engine.transfer_sync_write(
                session_id, buffer, peer_buffer_address, length
            )
        except Exception:
            # Mark transfer request as failed
            ret = -1

        if ret < 0:
            # Do not raise an exception here, since some transfer requests fail should be accepted and the execution thread should not be stopped.
            logger.debug(
                "Failed to transfer data from %s to %s - %s.",
                buffer,
                session_id,
                peer_buffer_address,
            )

        return ret

    def batch_transfer_sync(
        self,
        session_id: str,
        buffers: List[int],
        peer_buffer_addresses: List[int],
        lengths: List[int],
    ) -> int:
        """Synchronously transfer data to the specified addresses in batches."""
        try:
            ret = self.engine.batch_transfer_sync_write(
                session_id, buffers, peer_buffer_addresses, lengths
            )
        except Exception:
            ret = -1
            # Inform user to upgrade mooncake-transfer-engine >= 0.3.4.post2
            if not hasattr(self.engine, "batch_transfer_sync_write"):
                raise RuntimeError(
                    "Mooncake's batch transfer requires mooncake-transfer-engine >= 0.3.4.post2. "
                    "Please upgrade Mooncake by 'pip install mooncake-transfer-engine --upgrade'"
                )

        if ret < 0:
            logger.debug(
                "Failed to batch transfer data. Buffers: %s, Session: %s, Peer addresses: %s",
                buffers,
                session_id,
                peer_buffer_addresses,
            )
        return ret

    def get_session_id(self):
        return self.session_id
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ cat /app/sglang/sglang-latest/lib/python3.12/site-packages/sglang/srt/disaggregation/mooncake/utils.py
# Copyright 2025 SGLang Team
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
"""Mooncake-specific utilities for custom memory pool management."""

import logging
from typing import Any, Optional, Tuple

import torch

from sglang.srt.environ import envs

logger = logging.getLogger(__name__)

# Global constants for custom memory pool types
SUPPORTED_MOONCAKE_CUSTOM_MEM_POOL_TYPES = ["NVLINK", "BAREX"]


def init_mooncake_custom_mem_pool(
    device: str,
) -> Tuple[bool, Optional[Any], Optional[str]]:
    """
    Initialize custom memory pool based on environment variable.

    Args:
        device: The device to allocate memory on

    Returns:
        Tuple of (enable_custom_mem_pool, custom_mem_pool, custom_mem_pool_type)
    """
    enable_custom_mem_pool, custom_mem_pool_type = (
        check_mooncake_custom_mem_pool_enabled()
    )

    custom_mem_pool = None

    if enable_custom_mem_pool:
        try:
            # TODO(shangming): abstract custom allocator class for more backends
            if custom_mem_pool_type == "NVLINK":
                from mooncake.allocator import NVLinkAllocator

                allocator = NVLinkAllocator.get_allocator(device)
            elif custom_mem_pool_type == "BAREX":
                from mooncake.allocator import BarexAllocator

                allocator = BarexAllocator.get_allocator(device)
            else:
                # This should not happen due to the enable_custom_mem_pool check above
                raise ValueError(
                    f"Unsupported custom mem pool type: {custom_mem_pool_type}"
                )

            custom_mem_pool = torch.cuda.MemPool(allocator.allocator())
            logger.debug(
                f"Initialized custom memory pool: {custom_mem_pool_type} on device {device}"
            )
        except ImportError as e:
            logger.warning(
                f"Failed to import mooncake allocator for {custom_mem_pool_type}: {e}. "
                f"Falling back to default memory pool."
            )
            enable_custom_mem_pool = False
            custom_mem_pool = None
            custom_mem_pool_type = None
        except Exception as e:
            logger.error(
                f"Failed to initialize custom memory pool {custom_mem_pool_type}: {e}. "
                f"Falling back to default memory pool."
            )
            enable_custom_mem_pool = False
            custom_mem_pool = None
            custom_mem_pool_type = None
    else:
        return False, None, None

    return enable_custom_mem_pool, custom_mem_pool, custom_mem_pool_type


def check_mooncake_custom_mem_pool_enabled() -> Tuple[bool, Optional[str]]:
    """
    Check if custom memory pool is enabled without importing allocators.

    Returns:
        Tuple of (enable_custom_mem_pool, custom_mem_pool_type)
    """
    custom_mem_pool_type = envs.SGLANG_MOONCAKE_CUSTOM_MEM_POOL.get()

    if custom_mem_pool_type is not None:
        # Handle boolean True as NVLINK
        if custom_mem_pool_type.lower() == "true":
            custom_mem_pool_type = "NVLINK"
        enable_custom_mem_pool = (
            custom_mem_pool_type in SUPPORTED_MOONCAKE_CUSTOM_MEM_POOL_TYPES
        )
    else:
        enable_custom_mem_pool = False
        custom_mem_pool_type = None

    return enable_custom_mem_pool, custom_mem_pool_type
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ cat /app/sglang/sglang-latest/lib/python3.12/site-packages/mooncake/mooncake_config.py
#!/usr/bin/env python3
"""
Mooncake Configuration
"""
import json
import os
from dataclasses import dataclass
from typing import Optional

DEFAULT_GLOBAL_SEGMENT_SIZE = 3355443200  # 3.125 GiB
DEFAULT_LOCAL_BUFFER_SIZE = 1073741824  # 1.0 GiB

def _parse_segment_size(value) -> int:
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        s = value.strip().lower()
        if s.endswith("gb"):
            num = s[:-2].strip()
            if not num:
                raise ValueError(
                    "Invalid segment size: missing number before 'gb'"
                )
            return int(num) * 1024 * 1024 * 1024
        return int(s)
    return int(value)

@dataclass
class MooncakeConfig:
    """The configuration class for Mooncake.

    Attributes:
        local_hostname (str): The hostname of the local machine.
        metadata_server (str): The address of the metadata server.
        global_segment_size (int): The size of each global segment in bytes.
        local_buffer_size (int): The size of the local buffer in bytes.
        protocol (str): The communication protocol to use.
        device_name (Optional[str]): The name of the device to use.
        master_server_address (str): The address of the master server.

    Example of configuration file:
        {
            "local_hostname": "localhost",
            "metadata_server": "localhost:8080",
            "global_segment_size": 3355443200,
            "local_buffer_size": 1073741824,
            "protocol": "tcp",
            "device_name": "",
            "master_server_address": "localhost:8081"
        }
    """
    local_hostname: str
    metadata_server: str
    global_segment_size: int
    local_buffer_size: int
    protocol: str
    device_name: Optional[str]
    master_server_address: str

    @staticmethod
    def from_file(file_path: str) -> 'MooncakeConfig':
        """Load the config from a JSON file."""
        with open(file_path) as fin:
            config = json.load(fin)
        required_fields = [
            "local_hostname",
            "metadata_server",
            "master_server_address",
        ]
        for field in required_fields:
            if field not in config:
                raise ValueError(f"Missing required config field: {field}")
        return MooncakeConfig(
            local_hostname=config.get("local_hostname"),
            metadata_server=config.get("metadata_server"),
            global_segment_size=_parse_segment_size(
                config.get("global_segment_size", DEFAULT_GLOBAL_SEGMENT_SIZE)
            ),
            local_buffer_size=_parse_segment_size(
                config.get("local_buffer_size", DEFAULT_LOCAL_BUFFER_SIZE)
            ),
            protocol=config.get("protocol", "tcp"),
            device_name=config.get("device_name", ""),
            master_server_address=config.get("master_server_address"),
        )

    @staticmethod
    def load_from_env() -> 'MooncakeConfig':
        """Load config from a file specified in the environment variable.
        export MOONCAKE_MASTER=10.13.3.232:50051
        export MOONCAKE_PROTOCOL="rdma"
        export MOONCAKE_DEVICE=""
        export MOONCAKE_TE_META_DATA_SERVER="P2PHANDSHAKE"
        """
        config_file_path = os.getenv('MOONCAKE_CONFIG_PATH')
        if config_file_path is None:
            if not os.getenv("MOONCAKE_MASTER"):
                raise ValueError("Neither the environment variable 'MOONCAKE_CONFIG_PATH' nor 'MOONCAKE_MASTER' is set.")
            return MooncakeConfig(
                local_hostname=os.getenv("MOONCAKE_LOCAL_HOSTNAME", "localhost"),
                metadata_server=os.getenv("MOONCAKE_TE_META_DATA_SERVER", "P2PHANDSHAKE"),
                global_segment_size=_parse_segment_size(
                    os.getenv("MOONCAKE_GLOBAL_SEGMENT_SIZE", DEFAULT_GLOBAL_SEGMENT_SIZE)
                ),
                local_buffer_size=_parse_segment_size(
                    os.getenv("MOONCAKE_LOCAL_BUFFER_SIZE", DEFAULT_LOCAL_BUFFER_SIZE)
                ),
                protocol=os.getenv("MOONCAKE_PROTOCOL", "tcp"),
                device_name=os.getenv("MOONCAKE_DEVICE", ""),
                master_server_address=os.getenv("MOONCAKE_MASTER"),
            )
        return MooncakeConfig.from_file(config_file_path)((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ 

