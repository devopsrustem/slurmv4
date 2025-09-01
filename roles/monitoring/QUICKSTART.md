# 🚀 Quick Start Guide - HPC Monitoring Role

**Быстрый деплой полного мониторинга для Slurm HPC кластера с GPU и InfiniBand**

### 1. 📁 Клонируем проект

```bash
# Создаем структуру проекта
mkdir -p ~/ansible-hpc && cd ~/ansible-hpc

# Клонируем роль
git clone https://git.sa1.test/gpu-cluster/monitoring/ansible-monitoring.git roles/monitoring

# Копируем пример inventory
cp roles/monitoring/tests/inventory .
```

### 2. ⚙️ Настраиваем inventory

**Откройте `inventory` и замените на ваши серверы:**

```ini
[slurm-master]
sm01 ansible_host=10.81.8.28

[compute] 
cn01 ansible_host=10.81.10.101
cn02 ansible_host=10.81.10.102
cn03 ansible_host=10.81.10.103
cn04 ansible_host=10.81.10.104

[ufm]
ufm-cn1 ansible_host=10.81.8.21
ufm-cn2 ansible_host=10.81.8.22
ufm-sn1 ansible_host=10.81.8.24
ufm-sn2 ansible_host=10.81.8.25

[metrics]
metrics-server ansible_host=10.81.8.7

[all:vars]
ansible_user=saadmin
ansible_become=true
ansible_ssh_private_key_file=~/.ssh/id_ed25519
cluster_name=sa1-hpc-cluster
```

### 3. 🎯 Создаем playbook

```bash
cat > deploy-monitoring.yml << 'EOF'
---
- hosts: all
  become: true
  roles:
    - monitoring
EOF
```

### 4. 🧪 Тестируем подключение

```bash
# Проверяем SSH доступ
ansible all -i inventory -m ping

# Проверяем sudo права
ansible all -i inventory -m shell -a "whoami" --become
```

### 5. 🚀 Деплоим мониторинг

```bash
# Полный деплой
ansible-playbook -i inventory deploy-monitoring.yml

# Или поэтапно (рекомендуется для первого раза):
# 1. Только metrics сервер
ansible-playbook -i inventory deploy-monitoring.yml --limit metrics-server

# 2. Compute ноды  
ansible-playbook -i inventory deploy-monitoring.yml --limit compute

# 3. UFM серверы
ansible-playbook -i inventory deploy-monitoring.yml --limit ufm

# 4. Slurm master
ansible-playbook -i inventory deploy-monitoring.yml --limit slurm-master
```

### 6. ✅ Проверяем результат

```bash
# Проверяем targets в Prometheus
curl http://YOUR_METRICS_IP:9090/api/v1/targets | jq '.data.activeTargets[] | {job: .labels.job, instance: .labels.instance, health: .health}'

# Проверяем веб-интерфейсы
curl -I http://YOUR_METRICS_IP:9090/-/healthy  # Prometheus
curl -I http://YOUR_METRICS_IP:3000/api/health  # Grafana  
curl -I http://YOUR_METRICS_IP:8428/metrics     # VictoriaMetrics
```

## 🎛️ Доступ к интерфейсам

| Сервис | URL | Логин | Описание |
|--------|-----|-------|----------|
| **Grafana** | http://metrics-ip:3000 | admin/admin | Дашборды и визуализация |
| **Prometheus** | http://metrics-ip:9090 | - | Метрики и targets |
| **VictoriaMetrics** | http://metrics-ip:8428 | - | Long-term storage |
| **Alertmanager** | http://metrics-ip:9093 | - | Управление алертами |

## 🔧 Кастомизация

### Основные переменные (добавить в inventory):

```ini
[all:vars]
# Cluster settings
cluster_name=my-hpc-cluster
prometheus_retention=60d
victoriametrics_retention_period=24  # months

# Alert thresholds  
cluster_poweroff_temp_threshold=50  # °C
chip_hot_threshold=85  # °C
disk_space_threshold=85  # %

# Telegram notifications
telegram_enabled=true
telegram_bot_token={{ vault_telegram_bot_token }}
telegram_chat_id={{ vault_telegram_chat_id }}

# Local files server (если нет интернета)
use_local_files_server=true
local_files_server=http://10.81.8.5
```

### Секреты в Ansible Vault:

```bash
# Создаем vault файл
cat > group_vars/all/vault.yml << 'EOF'
vault_telegram_bot_token: "YOUR_BOT_TOKEN"
vault_telegram_chat_id: "YOUR_CHAT_ID"  
vault_ipmi_password: "YOUR_IPMI_PASSWORD"
vault_cluster_poweroff_token: "YOUR_WEBHOOK_TOKEN"
EOF

# Шифруем секреты
ansible-vault encrypt group_vars/all/vault.yml
```

## 📊 Что получите

✅ **GPU мониторинг** - DCGM + процессы на GPU  
✅ **InfiniBand мониторинг** - UFM + состояние портов  
✅ **Hardware мониторинг** - IPMI сенсоры всех узлов  
✅ **System мониторинг** - CPU, RAM, disk, network  
✅ **Slurm мониторинг** - очереди, состояние узлов  
✅ **Emergency система** - автоотключение при перегреве  
✅ **Long-term storage** - 12+ месяцев метрик  
✅ **Alerting** - Telegram + email уведомления  

## 🆘 Траблшутинг

**Проблема**: Сервис не запускается
```bash
# Проверить статус
ansible TARGET -i inventory -m shell -a "systemctl status SERVICE_NAME"

# Посмотреть логи  
ansible TARGET -i inventory -m shell -a "journalctl -u SERVICE_NAME -n 50"
```

**Проблема**: Target DOWN в Prometheus
```bash
# Проверить connectivity
curl http://node-ip:9100/metrics

# Проверить firewall
ansible TARGET -i inventory -m shell -a "ss -tlnp | grep 9100"
```

**Проблема**: Нет метрик GPU
```bash
# Проверить NVIDIA drivers
ansible compute -i inventory -m shell -a "nvidia-smi"

# Проверить DCGM exporter
ansible compute -i inventory -m shell -a "systemctl status docker.dcgm-exporter.service"
```

## 🔄 Обновление

```bash
# Обновляем роль
cd roles/monitoring && git pull

# Применяем изменения
ansible-playbook -i inventory deploy-monitoring.yml
```

## 📞 Поддержка

- **Документация**: [README.md](roles/monitoring/README.md)
- **Issues**: Создавайте в репозитории
- **Logs**: `/var/log/cluster_shutdown.log` (emergency poweroff)

---