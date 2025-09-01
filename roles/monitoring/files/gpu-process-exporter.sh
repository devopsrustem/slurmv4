#!/bin/bash
OUT="/opt/node-exporter/textfile_collector/gpu_process_metrics.prom"
TMP=$(mktemp)
> "$TMP"

# Заголовки GPU метрик
echo "# HELP gpu_process_memory_bytes GPU process memory usage in bytes + GPU processes" > "$TMP"
echo "# TYPE gpu_process_memory_bytes gauge" >> "$TMP"

# Мапа uuid -> index
declare -A uuid_to_index
while IFS=',' read -r index uuid; do
    index=$(echo "$index" | xargs)
    uuid=$(echo "$uuid" | xargs)
    uuid_to_index["$uuid"]="$index"
done < <(nvidia-smi --query-gpu=index,uuid --format=csv,noheader,nounits)

# GPU-процессы
nvidia-smi --query-compute-apps=gpu_uuid,pid,process_name,used_gpu_memory --format=csv,noheader,nounits | while IFS=',' read -r uuid pid pname mem; do
    uuid=$(echo "$uuid" | xargs)
    pid=$(echo "$pid" | xargs)
    pname=$(echo "$pname" | xargs | sed 's/[^a-zA-Z0-9_]/_/g')
    mem=$(echo "$mem" | xargs)

    user=$(ps -o user= -p "$pid" 2>/dev/null | xargs)
    jobid=$(tr '\0' '\n' < /proc/$pid/environ 2>/dev/null | grep SLURM_JOB_ID | cut -d= -f2)

    cpath=$(readlink -f /proc/$pid/root 2>/dev/null | grep enroot || true)
    container=$(basename "$cpath" 2>/dev/null)
    [[ -z "$container" ]] && container="host"

    gpu_index="${uuid_to_index["$uuid"]}"
    [[ -z "$gpu_index" ]] && gpu_index="unknown"

    echo "gpu_process_gpu_memory_bytes{uuid=\"$uuid\", device=\"nvidia$gpu_index\", gpu=\"$gpu_index\", pid=\"$pid\", process=\"$pname\", user=\"$user\", job_id=\"$jobid\", container=\"$container\"} $(($mem * 1024 * 1024))" >> "$TMP"
done

# Docker метрики
echo -e "\n# HELP docker_container_info Container name, image, and ports" >> "$TMP"
echo "# TYPE docker_container_info gauge" >> "$TMP"
echo -e "\n# HELP docker_container_uptime_seconds Container uptime in seconds" >> "$TMP"
echo "# TYPE docker_container_uptime_seconds gauge" >> "$TMP"

now=$(date +%s)

docker ps --format '{{.Names}};{{.Image}};{{.Ports}}' | while IFS=';' read -r name image ports; do
    clean_name=$(echo "$name" | sed 's/[^a-zA-Z0-9_.-]/_/g')
    clean_image=$(echo "$image" | sed 's/[^a-zA-Z0-9_.:-]/_/g')
    clean_ports=$(echo "$ports" | sed 's/[^a-zA-Z0-9_,.:->]/_/g')

    echo "docker_container_info{name=\"$clean_name\",image=\"$clean_image\",ports=\"$clean_ports\"} 1" >> "$TMP"

    started_at=$(docker inspect -f '{{.State.StartedAt}}' "$name" 2>/dev/null)
    if [[ -n "$started_at" ]]; then
        started_epoch=$(date -d "$started_at" +%s 2>/dev/null)
        if [[ -n "$started_epoch" ]]; then
            uptime=$((now - started_epoch))
            echo "docker_container_uptime_seconds{name=\"$clean_name\"} $uptime" >> "$TMP"
        fi
    fi
done


# Отдельный файл для PCIe метрик
OUT_PCI="/opt/node-exporter/textfile_collector/pci_link_metrics.prom"
TMP_PCI=$(mktemp)
> "$TMP_PCI"

echo "# HELP pcie_link_status PCIe link status (1 = OK, 0 = DOWNGRADED)" > "$TMP_PCI"
echo "# TYPE pcie_link_status gauge" >> "$TMP_PCI"

declare -A pci2rdma
for IFACE in /sys/class/infiniband/*; do
    [ -d "$IFACE" ] || continue
    PCI=$(readlink -f "$IFACE/device" | awk -F '/' '{print $NF}' | sed 's/^0000://')
    RDMA=$(basename "$IFACE")
    pci2rdma["$PCI"]="$RDMA"
done

for DEV in $(sudo lspci -d 15b3: | awk '{print $1}'); do
    NAME=$(sudo lspci -s "$DEV" | cut -d ':' -f3- | sed 's/^[[:space:]]*//')
    CAP=$(sudo lspci -s "$DEV" -vv | awk '/LnkCap:/ && /Width/ {for (i=1;i<=NF;i++) if ($i == "Width") print $(i+1)}' | head -n1 | tr -d 'x,')
    STA=$(sudo lspci -s "$DEV" -vv | awk '/LnkSta:/ && /Width/ {for (i=1;i<=NF;i++) if ($i == "Width") print $(i+1)}' | head -n1 | tr -d 'x,')

    [[ -z "$CAP" || -z "$STA" ]] && continue

    STATUS="OK"
    VAL=1
    if [[ "$CAP" -ne "$STA" ]]; then
        STATUS="DOWNGRADED"
        VAL=0
    fi

    SERIAL=$(sudo lspci -vvvDnn -s "$DEV" | awk -F ': ' '/Serial number:/ {print $2}')
    RDMA="${pci2rdma["$DEV"]}"

    echo "pcie_link_status{device=\"$DEV\",name=\"$NAME\",rdma=\"${RDMA:-unknown}\",serial=\"${SERIAL:-unknown}\",cap=\"x$CAP\",sta=\"x$STA\",status=\"$STATUS\"} $VAL" >> "$TMP_PCI"
done

# Сохраняем оба файла
mv "$TMP" "$OUT"
chown nobody:nogroup "$OUT"
chmod 644 "$OUT"

mv "$TMP_PCI" "$OUT_PCI"
chown nobody:nogroup "$OUT_PCI"
chmod 644 "$OUT_PCI"
