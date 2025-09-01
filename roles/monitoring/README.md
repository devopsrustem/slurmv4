# HPC Cluster Monitoring Stack

# [QUICKSTART](https://git.sa1.test/gpu-cluster/monitoring/ansible-monitoring/-/blob/main/QUICKSTART.md)

## Features

- **🖥️ Complete HPC stack monitoring**: System, GPU, Slurm, InfiniBand, IPMI
- **🏢 Enterprise-ready**: HA setup with Pacemaker, custom Docker registry support
- **🎮 GPU-optimized**: DCGM + custom process exporters with Slurm integration
- **📊 Long-term storage**: VictoriaMetrics integration for metrics retention
- **🔥 Emergency response**: Automated cluster poweroff on critical temperature
- **🧹 Automated lifecycle**: Cleanup and maintenance scripts
- **📈 Rich visualization**: Pre-configured Grafana dashboards
- **🚨 Intelligent alerting**: Temperature, hardware, network, and Slurm alerts

## 📊 Supported Components

| Component | Target Nodes | Port | Description |
|-----------|--------------|------|-------------|
| **Node Exporter** | All nodes | 9100 | System metrics (CPU, RAM, disk, network) |
| **DCGM Exporter** | Compute nodes | 9400 | NVIDIA GPU metrics (temp, utilization, memory) |
| **Slurm Exporter** | Slurm master | 8080 | Job queue, node states, GPU accounting |
| **UFM Exporters** | UFM servers | 9001 | InfiniBand switch ports, link states |
| **IPMI Exporter** | Metrics server | 9290 | Hardware sensors (BMC, fans, power, temp) |
| **GPU Process Exporter** | Compute nodes | Timer | Detailed GPU process monitoring with Slurm jobs |
| **Prometheus** | Metrics server | 9090 | Metrics collection and alerting |
| **VictoriaMetrics** | Metrics server | 8428 | Long-term metrics storage (12 months default) |
| **Grafana** | Metrics server | 3000 | Visualization and dashboards |
| **Alertmanager** | Metrics server | 9093 | Alert routing (Telegram, email, webhooks) |

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Compute Nodes │    │   Slurm Master  │    │   UFM Servers   │
│                 │    │                 │    │                 │
│ • Node Exporter │    │ • Node Exporter │    │ • Node Exporter │
│ • DCGM Exporter │    │ • Slurm Export. │    │ • IB Link Info  │
│ • GPU Proc Exp. │    │                 │    │ • SM State Mon. │
│ • PCIe Monitor  │    │                 │    │ • Cleanup Timer │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────────────┐
                    │    Metrics Server       │
                    │                         │
                    │ • Prometheus            │
                    │ • VictoriaMetrics       │
                    │ • Grafana               │
                    │ • Alertmanager          │
                    │ • IPMI Exporter         │
                    │ • Emergency Poweroff    │
                    └─────────────────────────┘
```

## 🚀 Quick Start

### 1. Copy Example Inventory

```bash
cp roles/monitoring/tests/inventory inventories/my-cluster.yml
```

### 2. Customize for Your Environment

Edit `inventories/my-cluster.yml`:

```ini
[slurm-master]
slurm-master ansible_host=10.0.1.10

[compute]
cn[01:64] ansible_host_pattern=10.0.2.%d

[ufm]
ufm-cn1 ansible_host=10.0.3.1
ufm-cn2 ansible_host=10.0.3.2
ufm-sn1 ansible_host=10.0.4.1
ufm-sn2 ansible_host=10.0.4.2

[metrics]
metrics ansible_host=10.0.1.20

[all:vars]
cluster_name=my-hpc-cluster
# Add your custom variables here
```

### 3. Configure Secrets

Create `group_vars/all/vault.yml`:

```yaml
# Encrypt with: ansible-vault encrypt group_vars/all/vault.yml
vault_telegram_bot_token: "YOUR_BOT_TOKEN"
vault_telegram_chat_id: "YOUR_CHAT_ID"
vault_ipmi_password: "YOUR_IPMI_PASSWORD"
vault_cluster_poweroff_token: "YOUR_WEBHOOK_TOKEN"
vault_cluster_ipmi_password: "YOUR_CLUSTER_IPMI_PASSWORD"
```

### 4. Deploy

```bash
ansible-playbook -i inventories/my-cluster.yml site.yml
```

### 5. Access Dashboards

- **Grafana**: http://metrics-server:3000 (admin/admin)
- **Prometheus**: http://metrics-server:9090
- **VictoriaMetrics**: http://metrics-server:8428

## ⚙️ Configuration

### Key Variables

Override these in your inventory or group_vars:

```yaml
# Cluster configuration
cluster_name: "production-hpc"
prometheus_retention: "30d"
victoriametrics_retention_period: "24"  # months

# Alert thresholds
cluster_poweroff_temp_threshold: 45  # °C
chip_hot_threshold: 85  # °C
disk_space_threshold: 85  # %

# Network ranges (for emergency poweroff)
cluster_datanet_prefix: "10.0.2"
cluster_ipminet_prefix: "10.0.1"
cluster_data_start: 1
cluster_data_end: 64

# Telegram notifications
telegram_enabled: true
telegram_bot_token: "{{ vault_telegram_bot_token }}"
telegram_chat_id: "{{ vault_telegram_chat_id }}"

# Feature toggles
victoriametrics_enabled: true
cluster_poweroff_enabled: true
health_checks_enabled: true
```

### Advanced Configuration

See [`defaults/main.yml`](defaults/main.yml) for all available variables (100+ options).

## 🔥 Emergency Features

### Automated Cluster Poweroff

When datacenter temperature exceeds threshold:

1. **Prometheus** detects high inlet temperature (>45°C for >1 hour)
2. **Alertmanager** triggers emergency webhook
3. **Python webhook** executes graceful shutdown:
   - SSH poweroff to all compute nodes
   - SFA storage cluster shutdown
   - IPMI force poweroff if needed

**Safety**: Lock file prevents multiple executions, detailed logging.

### Critical Alerts

- **🌡️ Temperature**: Inlet temp, chip overheating, cooling failures
- **⚡ Power**: PSU failures, voltage issues, chassis power
- **🔌 Network**: Interface down, InfiniBand link failures
- **💾 Storage**: Disk space, read-only filesystems, Lustre issues
- **🖥️ Hardware**: RAM capacity, IPMI connectivity, fan failures
- **📊 Slurm**: Node failures, job queue issues

## 📁 Directory Structure

```
monitoring/
├── README.md
├── defaults/main.yml          # 100+ configurable variables
├── files/
│   ├── dcgm-custom-metrics.csv
│   ├── gpu-process-exporter.sh
│   ├── ib_sw_exp.py
│   ├── check_sm_state.sh
│   └── cleanup-metrics.sh
├── handlers/main.yml          # Service restart handlers
├── meta/main.yml              # Role metadata
├── tasks/
│   ├── main.yml               # Main orchestration with health checks
│   ├── install_node.yml       # Node exporter setup
│   ├── install_dcgm.yml       # GPU monitoring setup
│   ├── install_slurm.yml      # Slurm metrics setup
│   ├── install_ufm.yml        # InfiniBand monitoring setup
│   ├── install_prometheus.yml # Metrics collection setup
│   ├── install_grafana.yml    # Visualization setup
│   ├── install_ipmi_exporter.yml       # Hardware monitoring
│   ├── install_victoriametrics.yml     # Long-term storage
│   └── install_cluster_poweroff.yml    # Emergency response
├── templates/
│   ├── prometheus.yml.j2      # Prometheus configuration
│   ├── alertmanager.yml.j2    # Alert routing rules
│   ├── alert_rules.yml.j2     # Alert definitions
│   ├── endpoints/             # Service discovery configs
│   └── systemd service units
└── tests/
    ├── inventory              # Example inventory for testing
    └── test.yml              # Comprehensive test playbook
```

## 🧪 Testing

### Run Tests

```bash
# Full test suite
ansible-playbook -i tests/inventory tests/test.yml

# Check mode (dry run)
ansible-playbook -i tests/inventory tests/test.yml --check

# Test specific components
ansible-playbook -i tests/inventory tests/test.yml --tags monitoring
```

### Manual Verification

```bash
# Check service status
systemctl status docker.prometheus.service
systemctl status victoriametrics.service

# Test metrics endpoints
curl http://localhost:9100/metrics  # Node exporter
curl http://localhost:9400/metrics  # DCGM exporter
curl http://localhost:9090/-/healthy  # Prometheus

# Test emergency webhook
curl -X POST http://localhost:5001/alert?token=YOUR_TOKEN \
  -H "Content-Type: application/json" \
  -d '{"alerts":[{"status":"firing","labels":{"alertname":"CLUSTER-POWEROFF"}}]}'
```

## 📋 Requirements

### System Requirements

- **OS**: Ubuntu 22.04 LTS or 24.04 LTS
- **Ansible**: >= 2.13
- **Docker**: >= 20.10
- **Python**: >= 3.8

### Hardware Requirements

- **NVIDIA drivers and CUDA toolkit** (for GPU nodes)
- **Slurm workload manager** (configured)
- **InfiniBand drivers** (for UFM nodes)
- **Pacemaker cluster** (for UFM HA setup)
- **IPMI/BMC access** (for hardware monitoring)

### Network Requirements

- **Open ports** between monitoring server and all nodes
- **SSH key access** for emergency poweroff
- **IPMI network access** for hardware monitoring

## 🔒 Security

### Sensitive Data

Always use Ansible Vault for:

```yaml
# group_vars/all/vault.yml
vault_telegram_bot_token: "ENCRYPTED"
vault_ipmi_password: "ENCRYPTED"
vault_cluster_poweroff_token: "ENCRYPTED"
vault_smtp_password: "ENCRYPTED"
```

### Network Security

- Configure firewall rules for monitoring ports
- Use dedicated monitoring network if possible
- Secure IPMI access with strong credentials
- Review webhook tokens and authentication

## 🆘 Troubleshooting

### Common Issues

**Services not starting:**
```bash
# Check Docker status
systemctl status docker
journalctl -u docker.prometheus.service

# Check permissions
ls -la /etc/prometheus/
ls -la /var/lib/grafana/
```

**Missing metrics:**
```bash
# Test connectivity
telnet compute-node 9100
curl http://compute-node:9100/metrics

# Check Prometheus targets
curl http://localhost:9090/api/v1/targets
```

**UFM/Pacemaker issues:**
```bash
# Check cluster status
pcs status
pcs quorum status

# Check resource status
pcs resource show iblinkinfo-timer
```

**Emergency poweroff not working:**
```bash
# Check webhook logs
journalctl -u alert_webhook.service
tail -f /var/log/cluster_shutdown.log

# Test authentication
ssh master@compute-node 'sudo poweroff'
ipmitool -I lanplus -H bmc-host -U user -P pass chassis power status
```

### Performance Tuning

**High memory usage:**
```yaml
# Reduce retention or adjust VictoriaMetrics memory
prometheus_retention: "15d"
victoriametrics_memory_percent: 40
```

**Slow scraping:**
```yaml
# Increase intervals
prometheus_scrape_interval: "30s"
gpu_process_interval: "60s"
```

## 📞 Support

For issues and feature requests:

1. Check the [troubleshooting guide](#-troubleshooting)
2. Review logs: `journalctl -u service-name`
3. Contact the SA1 GPU Cluster team
4. Submit issues to the repository


## 🙏 Credits

- Based on [NVIDIA DeepOps](https://github.com/NVIDIA/deepops)
- Uses [Prometheus](https://prometheus.io/) ecosystem
- Inspired by HPC monitoring best practices