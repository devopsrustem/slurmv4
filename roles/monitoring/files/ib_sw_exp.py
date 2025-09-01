#!/usr/bin/env python3

import subprocess
import re
import socket

# Получаем hostname
#hostname = socket.gethostname()

# Команда iblinkinfo
cmd = ["iblinkinfo", "--switches-only", "-l"]
result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

if result.returncode != 0:
    print(f"Error running iblinkinfo: {result.stderr}")
    exit(1)

# Словари для состояний
physical_states = {
    "NoChange": 0,
    "Sleep": 1,
    "Polling": 2,
    "Disabled": 3,
    "Shift": 4,
    "LinkUp": 5,
    "LinkErrorRecover": 6,
    "Phytest": 7,
}

logical_states = {
    "NoChange": 0,
    "Down": 1,
    "Init": 2,
    "Armed": 3,
    "Active": 4,
    "ActDefer": 5
}

# Выходной файл
output_file = "/opt/node-exporter/textfile_collector/ib_link_metrics.prom"

lines = result.stdout.strip().splitlines()
metrics = []

# HELP и TYPE
metrics.append('# HELP iblinkinfo_physical_state_id Physical state of the InfiniBand port (0: No change, 1: Sleep, 2: Polling, 3: Disable, 4: Shift, 5: Link up, 6: Link error recover, 7: Phytest)')
metrics.append('# TYPE iblinkinfo_physical_state_id gauge')
metrics.append('# HELP iblinkinfo_state_id State of the InfiniBand port (0: No change, 1: Down, 2: Init, 3: Armed, 4: Active, 5: Act defer)')
metrics.append('# TYPE iblinkinfo_state_id gauge')

for line in lines:
    # Имя коммутатора
    switch_match = re.search(r'0x[\da-f]+ "\s*([\w\d\-]+)"', line)
    src_switch = switch_match.group(1) if switch_match else "unknown"

    # src_port
    src_port_match = re.search(r'\s(\d+)\[\s*\]\s+==\(', line)
    src_port = src_port_match.group(1) if src_port_match else "unknown"

    # speed и состояния
    speed_port = "unknown"
    logical_state = "Down"
    physical_state = "Disabled"

    speed_status_match = re.search(r'==\(\s*(.*?)\s+(\w+)/\s*(\w+)\)', line)
    if speed_status_match:
        speed_raw = speed_status_match.group(1).strip()
        logical_state = speed_status_match.group(2).strip()
        physical_state = speed_status_match.group(3).strip()

        # Обработка скорости
        speed_parts = speed_raw.split()
        if len(speed_parts) >= 2 and re.match(r'^\d+X$', speed_parts[0]):
            try:
                lanes = int(speed_parts[0][0])
                rate = float(speed_parts[1])
                speed_port = f"{lanes * rate:.1f}"
            except Exception:
                pass

    # dst_port
    dst_port_match = re.search(r'==>.*?(\d+)\s+(\d+)\[\s*\]', line)
    dst_port = dst_port_match.group(2) if dst_port_match else "unknown"

    # dst_node
    dst_node_match = re.search(r'"([^"]*)"\s+\(', line)
    dst_node_raw = dst_node_match.group(1).strip() if dst_node_match else ""
    dst_node = dst_node_raw if dst_node_raw else "unknown"

    physical_val = physical_states.get(physical_state, 3)
    logical_val = logical_states.get(logical_state, 1)

    labels = f'src_switch="{src_switch}", src_port="{src_port}", speed_port="{speed_port}", dst_port="{dst_port}", dst_node="{dst_node}"'
    
    metrics.append(f'iblinkinfo_physical_state_id{{{labels}}} {physical_val}')
    metrics.append(f'iblinkinfo_state_id{{{labels}}} {logical_val}')

# Запись в файл
with open(output_file, "w") as f:
    f.write("\n".join(metrics) + "\n")
