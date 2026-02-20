NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.82.101.193:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disaggregation-decode-url http://10.99.91.49:30001,http://10.99.91.33:30001

NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.41 \
  --port 30000 \
  --dist-init-addr 10.82.101.193:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998 \
  --disaggregation-decode-url http://10.99.91.49:30001,http://10.99.91.33:30001

curl -v http://10.99.91.49:30001/health
curl -v http://10.99.91.33:30001/health

launch_server.py: error: unrecognized arguments: --disaggregation-decode-url http://10.99.91.49:30001,http://10.99.91.33:30001
[W219 11:47:05.252714350 AllocatorConfig.cpp:28] Warning: PYTORCH_CUDA_ALLOC_CONF is deprecated, use PYTORCH_ALLOC_CONF instead (function operator())


NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.82.101.193:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998

2я
NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.41 \
  --port 30000 \
  --dist-init-addr 10.82.101.193:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998
3я
NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.49 \
  --port 30001 \
  --dist-init-addr 10.82.101.249:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998

  4я

  NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=1 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.33 \
  --port 30001 \
  --dist-init-addr 10.82.101.249:5000 \
  --nnodes 2 \
  --node-rank 1 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-port 8998


  curl http://10.99.91.39:30000/health  # prefill 1
curl http://10.99.91.41:30000/health  # prefill 2
curl http://10.99.91.49:30001/health  # decode 3
curl http://10.99.91.33:30001/health  # decode 4

# Все должны вернуть HTTP 200 OK

# Потом запрос через router:
curl -X POST http://10.82.101.193:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello"}],
    "max_tokens": 10
  }'

[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tulpn | grep 8998
tcp   LISTEN 0      128      10.99.91.39:8998       0.0.0.0:*    users:(("python3",pid=376819,fd=121))    

[dcbsr_dev@tpgds-aihub0003 ~]$ telnet 10.99.91.39 8998
Trying 10.99.91.39...
Connected to 10.99.91.39.
Escape character is '^]'.


[dcbsr_dev@tpgds-aihub0003 ~]$ curl -v http://10.99.91.39:30000/v1/models
*   Trying 10.99.91.39:30000...
* Connected to 10.99.91.39 (10.99.91.39) port 30000 (#0)
> GET /v1/models HTTP/1.1
> Host: 10.99.91.39:30000
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Thu, 19 Feb 2026 09:22:36 GMT
< server: uvicorn
< content-length: 189
< content-type: application/json
< 
* Connection #0 to host 10.99.91.39 left intact
{"object":"list","data":[{"id":"/app/models/Deepseek-R1/","object":"model","created":1771492956,"owned_by":"sglang","root":"/app/models/Deepseek-R1/","parent":null,"max_model_len":163840}]}[dcbsr_dev@tpgds-aihub0003 ~]$ curl -v http://10.99.91.41:30000/v1/models
*   Trying 10.99.91.41:30000...
* Connected to 10.99.91.41 (10.99.91.41) port 30000 (#0)
> GET /v1/models HTTP/1.1
> Host: 10.99.91.41:30000
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 404 Not Found
< date: Thu, 19 Feb 2026 09:22:50 GMT
< server: uvicorn
< content-length: 22
< content-type: application/json
< 
* Connection #0 to host 10.99.91.41 left intact

1-2 ноды
ens108np0       GPU0 ↔ NIC0 (mlx5_0)         -1       0000:0e:00.0 ConnectX7(rev:0)     UP2-ROCE-AC-005-Q41-01-EXT          10.99.91.38           up      
3,5 ноды
ens3np0         GPU0 ↔ NIC0 (mlx5_0)         -1       0000:09:00.0 ConnectX7(rev:0)     UP2-ROCE-AC-005-Q41-01-EXT          10.99.91.48           up      



NCCL_SOCKET_IFNAME=bond0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.82.101.193:5000 \
  --nnodes 2 \
  --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0 \
  --disaggregation-bootstrap-host 0.0.0.0 \
  --disaggregation-bootstrap-port 8998

  E0219 12:59:19.523866 401918 common.h:378] readString: too large length from socket: 8387229930220700999
E0219 12:59:19.523916 401918 transfer_metadata_plugin.cpp:750] SocketHandShakePlugin: failed to receive handshake message, malformed json format: * Line 1, Column 1
  Syntax error: value, object or array expected.
, json string length: 0, json string content: 
E0219 12:59:19.524248 402005 common.h:378] readString: too large length from socket: 8387229930220700999
E0219 12:59:19.524286 402005 transfer_metadata_plugin.cpp:750] SocketHandShakePlugin: failed to receive handshake message, malformed json format: * Line 1, Column 1
  Syntax error: value, object or array expected.
, json string length: 0, json string content: 


1
NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
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
  --disaggregation-bootstrap-port 8998



  2

  
NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
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
  --disaggregation-bootstrap-port 8998

  
3
NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
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

5



NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --host 10.99.91.33 \
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

  NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
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
  --disaggregation-bootstrap-port 8998

  
SGLANG_KV_TRANSFER_USE_TCP=1
sha256sum /opt/mooncake-libs/run-with-new-libstdc.sh
ls -lh /opt/mooncake-libs/





###############
1-2 ноды

sudo mkdir -p /opt/mooncake-libs && \
sudo cp /opt/nvidia/nsight-compute/2025.4.1/host/linux-desktop-glibc_2_11_3-x64/libstdc++.so.6* /opt/mooncake-libs/ && \
sudo tee /opt/mooncake-libs/run-with-new-libstdc.sh > /dev/null << 'EOF'
#!/bin/bash
export LD_PRELOAD=/opt/mooncake-libs/libstdc++.so.6
exec "$@"
EOF
sudo chmod +x /opt/mooncake-libs/run-with-new-libstdc.sh && \
/opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -c "import mooncake; print('Mooncake OK')"


3,5 ноды
sudo find /opt/nvidia -name "libstdc++.so.6" -exec strings {} \; 2>/dev/null | grep GLIBCXX_3.4.30 | head -1 && \
sudo find /opt/nvidia -name "libstdc++.so.6" 2>/dev/null

3я

sudo mkdir -p /opt/mooncake-libs && \
sudo cp /opt/nvidia/nsight-compute/2025.1.1/host/linux-desktop-glibc_2_11_3-x64/libstdc++.so.6* /opt/mooncake-libs/ && \
sudo tee /opt/mooncake-libs/run-with-new-libstdc.sh > /dev/null << 'EOF'
#!/bin/bash
export LD_PRELOAD=/opt/mooncake-libs/libstdc++.so.6
exec "$@"
EOF
sudo chmod +x /opt/mooncake-libs/run-with-new-libstdc.sh && \
/opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -c "import mooncake; print('Mooncake OK')"

5я

sudo mkdir -p /opt/mooncake-libs && \
sudo cp /opt/nvidia/nsight-compute/2025.2.1/host/linux-desktop-glibc_2_11_3-x64/libstdc++.so.6* /opt/mooncake-libs/ && \
sudo tee /opt/mooncake-libs/run-with-new-libstdc.sh > /dev/null << 'EOF'
#!/bin/bash
export LD_PRELOAD=/opt/mooncake-libs/libstdc++.so.6
exec "$@"
EOF
sudo chmod +x /opt/mooncake-libs/run-with-new-libstdc.sh && \
/opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -c "import mooncake; print('Mooncake OK')"




[dcbsr_dev@tpgds-aihub0001 ~]$ curl -v http://10.99.91.33:30000/health
*   Trying 10.99.91.33:30000...
* connect to 10.99.91.33 port 30000 failed: Connection refused
* Failed to connect to 10.99.91.33 port 30000: Connection refused
* Closing connection 0
curl: (7) Failed to connect to 10.99.91.33 port 30000: Connection refused
[dcbsr_dev@tpgds-aihub0001 ~]$ curl -v http://10.99.91.39:30000/health
*   Trying 10.99.91.39:30000...
* Connected to 10.99.91.39 (10.99.91.39) port 30000 (#0)
> GET /health HTTP/1.1
> Host: 10.99.91.39:30000
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Thu, 19 Feb 2026 12:27:57 GMT
< server: uvicorn
< content-length: 0
< 
* Connection #0 to host 10.99.91.39 left intact
[dcbsr_dev@tpgds-aihub0001 ~]$ curl -v http://10.99.91.41:30000/health
*   Trying 10.99.91.41:30000...
* Connected to 10.99.91.41 (10.99.91.41) port 30000 (#0)
> GET /health HTTP/1.1
> Host: 10.99.91.41:30000
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Thu, 19 Feb 2026 12:28:10 GMT
< server: uvicorn
< content-length: 0
< 
* Connection #0 to host 10.99.91.41 left intact
[dcbsr_dev@tpgds-aihub0001 ~]$ curl -v http://10.99.91.49:30001/health
*   Trying 10.99.91.49:30001...
* Connected to 10.99.91.49 (10.99.91.49) port 30001 (#0)
> GET /health HTTP/1.1
> Host: 10.99.91.49:30001
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Thu, 19 Feb 2026 12:28:25 GMT
< server: uvicorn
< content-length: 0
< 
* Connection #0 to host 10.99.91.49 left intact
[dcbsr_dev@tpgds-aihub0001 ~]$ curl -v http://10.99.91.33:30001/health
*   Trying 10.99.91.33:30001...
* Connected to 10.99.91.33 (10.99.91.33) port 30001 (#0)
> GET /health HTTP/1.1
> Host: 10.99.91.33:30001
> User-Agent: curl/7.76.1
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Thu, 19 Feb 2026 12:28:35 GMT
< server: uvicorn
< content-length: 0
< 
* Connection #0 to host 10.99.91.33 left intact
timed out waiting for input: auto-logout




/app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 \
  --prefill http://10.99.91.41:30000 \
  --decode http://10.99.91.49:30001 \
  --decode http://10.99.91.33:30001 \
  --host 0.0.0.0 \
  --port 8000

https://docs.sglang.io/advanced_features/pd_disaggregation.html
https://docs.sglang.io/advanced_features/sgl_model_gateway.html#prefill-decode-disaggregation
https://docs.sglang.io/advanced_features/server_arguments.html#runtime-options
https://docs.sglang.io/references/multi_node_deployment/multi_node.html

давай синхронизируемся
запускаю

[dcbsr_dev@tpgds-aihub0001 ~]$ NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=0 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.39   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0

[dcbsr_dev@tpgds-aihub0002 ~]$ NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 NCCL_CROSS_NIC=0 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.41   --port 30000   --dist-init-addr 10.99.91.39:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode prefill   --disaggregation-ib-device mlx5_0

[dcbsr_dev@tpgds-aihub0003 ~]$ NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=0 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.49   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 0   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0 

[dcbsr_dev@tpgds-aihub0005 ~]$ NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens3np0 NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_NVLS_ENABLE=0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_CROSS_NIC=0 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh /app/sglang/sglang-latest/bin/python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/   --trust-remote-code   --tp-size 16   --host 10.99.91.33   --port 30001   --dist-init-addr 10.99.91.49:5000   --nnodes 2   --node-rank 1   --mem-fraction-static 0.8   --disaggregation-mode decode   --max-running-requests 128   --disaggregation-ib-device mlx5_0 

[dcbsr_dev@tpgds-aihub0001 ~]$ /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000   --prefill http://10.99.91.41:30000   --decode http://10.99.91.49:30001   --decode http://10.99.91.33:30001   --host 0.0.0.0   --port 8000

23534980@sigma.sbrf.ru@CAB-WSN-0052363:~$ curl -X POST http://10.82.101.193:8000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
{"error":{"type":"Not Found","code":"decode_not_found","message":"{\"detail\":\"Not Found\"}"}}23534980@sigma.sbrf.ru@CAB-WSN-0052363:~$ curl -X POST http://10.82.101.193:8000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
^C





[dcbsr_dev@tpgds-aihub0001 ~]$ ip r get 10.99.91.49 from 10.99.91.39
10.99.91.49 from 10.99.91.39 via 10.99.91.38 dev ens108np0 uid 12002 
    cache 
[dcbsr_dev@tpgds-aihub0002 ~]$ ip r get 10.99.91.49 from 10.99.91.41
10.99.91.49 from 10.99.91.41 via 10.99.91.40 dev ens108np0 uid 12002 
    cache 
[dcbsr_dev@tpgds-aihub0003 ~]$ ip r get 10.99.91.49 from 10.99.91.49
local 10.99.91.49 from 10.99.91.49 dev lo uid 12002 
    cache <local> 
[dcbsr_dev@tpgds-aihub0005 ~]$ ip r get 10.99.91.49 from 10.99.91.33
10.99.91.49 from 10.99.91.33 via 10.99.91.32 dev ens3np0 uid 12004 
    cache 


export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39

NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
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
  --disaggregation-ib-device mlx5_0

  export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.41
# ... остальные параметры


# На каждой ноде проверь:
python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"


[dcbsr_dev@tpgds-aihub0001 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.82.101.193

[dcbsr_dev@tpgds-aihub0002 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.82.101.194

[dcbsr_dev@tpgds-aihub0003 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.82.101.249

[dcbsr_dev@tpgds-aihub0005 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.82.101.129

sudo vi /etc/hosts
# Добавь/измени строку:
10.99.91.39 tpgds-aihub0001 tpgds-aihub0001.твой-домен

# На ноде 2:
10.99.91.41 tpgds-aihub0002 tpgds-aihub0002.твой-домен

# На ноде 3:
10.99.91.49 tpgds-aihub0003 tpgds-aihub0003.твой-домен

# На ноде 5:
10.99.91.33 tpgds-aihub0005 tpgds-aihub0005.твой-домен

export MOONCAKE_TRANSFER_ENGINE_IP=10.99.91.39

  --disaggregation-bootstrap-port 8998



[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tulpn | grep 8998
tcp   LISTEN 0      128      10.99.91.39:8998       0.0.0.0:*    users:(("python3",pid=625781,fd=121))        
[dcbsr_dev@tpgds-aihub0001 ~]$ ^C
[dcbsr_dev@tpgds-aihub0001 ~]$ 
logout
23534980@sigma.sbrf.ru@CAB-WSN-0052363:~$ ssh aihub2
Last login: Thu Feb 19 17:58:47 2026 from 10.9.143.146

 SberLinux release 9.7 (Ulutau)
 Hostname: tpgds-aihub0002

[dcbsr_dev@tpgds-aihub0002 ~]$ ss -tlnpn | grep 8998
[dcbsr_dev@tpgds-aihub0002 ~]$ 



23534980@sigma.sbrf.ru@CAB-WSN-0052363:~$ curl -X POST http://10.82.101.193:8000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
{"error":{"type":"Internal Server Error","code":"decode_internal_error","message":"Decode transfer failed for request rank=0 decode_req.req.rid='c9076693b82448c995406df0f8653fda' decode_req.req.bootstrap_room=6304315840878905318 with exception KVTransferError(bootstrap_room=6304315840878905318): Failed to get kvcache from prefill instance, it might be dead"}}


1

NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens108np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_9,mlx5_10,mlx5_11 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
SGLANG_DISAGGREGATION_BOOTSTRAP_TIMEOUT=600 \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --dp-size 8 \
  --enable-dp-attention \
  --moe-a2a-backend deepep \
  --host 10.99.91.39 \
  --port 30000 \
  --dist-init-addr 10.99.91.39:5000 \
  --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode prefill \
  --disaggregation-ib-device mlx5_0


2
# то же самое, только:
  --host 10.99.91.41 \
  --node-rank 1

3

NCCL_SOCKET_IFNAME=bond0 GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_DEBUG=WARN NCCL_IB_DISABLE=0 \
NCCL_NET_GDR_LEVEL=PIX NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 \
NCCL_NVLS_ENABLE=0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_CROSS_NIC=1 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 \
TOKENIZERS_PARALLELISM=false \
SGLANG_DISAGGREGATION_HEARTBEAT_MAX_FAILURE=100000 \
SGLANG_DISAGGREGATION_WAITING_TIMEOUT=600 \
/opt/mooncake-libs/run-with-new-libstdc.sh \
/app/sglang/sglang-latest/bin/python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ \
  --trust-remote-code \
  --tp-size 16 \
  --dp-size 8 \
  --enable-dp-attention \
  --moe-a2a-backend deepep \
  --host 10.99.91.49 \
  --port 30001 \
  --dist-init-addr 10.99.91.49:5000 \
  --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 \
  --disaggregation-mode decode \
  --max-running-requests 128 \
  --disaggregation-ib-device mlx5_0


  5

  # то же самое, только:
  --host 10.99.91.33 \
  --node-rank 1


  rou


  /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 \
  --prefill http://10.99.91.41:30000 \
  --decode http://10.99.91.49:30001 \
  --decode http://10.99.91.33:30001 \
  --host 0.0.0.0 \
  --port 8000


  [2026-02-20 11:13:52 DP1 TP3 EP3] Load weight begin. avail mem=77.48 GB
[2026-02-20 11:13:52 DP0 TP1 EP1] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 383, in __init__
    self.initialize(min_per_gpu_memory)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 460, in initialize
    self.load_model()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 889, in load_model
    self.model = self.loader.load_model(
                 ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_loader/loader.py", line 657, in load_model
    model = _initialize_model(
            ^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_loader/loader.py", line 278, in _initialize_model
    return model_class(**kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2790, in __init__
    self.model = DeepseekV2Model(
                 ^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2534, in __init__
    self.layers, self.start_layer, self.end_layer = make_layers(
                                                    ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/utils/common.py", line 615, in make_layers
    + get_offloader().wrap_modules(
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/utils/offloader.py", line 36, in wrap_modules
    return list(all_modules_generator)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/utils/common.py", line 617, in <genexpr>
    layer_fn(idx=idx, prefix=add_prefix(idx, prefix))
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2536, in <lambda>
    lambda idx, prefix: DeepseekV2DecoderLayer(
                        ^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2282, in __init__
    self.mlp = DeepseekV2MoE(
               ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 412, in __init__
    self.experts = get_moe_impl_class(quant_config)(
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/ep_moe/layer.py", line 84, in __init__
    super().__init__(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/layer.py", line 281, in __init__
    self.dispatcher = create_moe_dispatcher(self.moe_runner_config)
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/layer.py", line 96, in create_moe_dispatcher
    return MaybeTboDeepEPDispatcher(
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/batch_overlap/two_batch_overlap.py", line 1019, in __init__
    DeepEPDispatcher(**kwargs) for _ in range(num_inner_dispatchers)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/token_dispatcher/deepep.py", line 761, in __init__
    self._low_latency_dispatcher = _DeepEPDispatcherImplLowLatency(
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/token_dispatcher/deepep.py", line 536, in __init__
    super().__init__(**kwargs)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/layers/moe/token_dispatcher/deepep.py", line 304, in __init__
    raise ImportError(
ImportError: DeepEP is not installed. Please install DeepEP package from https://github.com/deepseek-ai/deepep.

[2026-02-20 11:13:52] Rank 0 scheduler is dead. Please check if there are relevant logs.
[2026-02-20 11:13:52] Exit code: -3
Traceback (most recent call last):
  File "<frozen runpy>", line 198, in _run_module_as_main
  File "<frozen runpy>", line 88, in _run_code
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/launch_server.py", line 32, in <module>
    run_server(server_args)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/launch_server.py", line 25, in run_server
    launch_server(server_args)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/http_server.py", line 1723, in launch_server
    _launch_subprocesses(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/engine.py", line 1013, in _launch_subprocesses
    scheduler_infos = _wait_for_scheduler_ready(scheduler_pipe_readers, scheduler_procs)
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/entrypoints/engine.py", line 847, in _wait_for_scheduler_ready
    data = scheduler_pipe_readers[i].recv()
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/multiprocessing/connection.py", line 250, in recv
    buf = self._recv_bytes()
          ^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/multiprocessing/connection.py", line 430, in _recv_bytes
    buf = self._recv(4)
          ^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/multiprocessing/connection.py", line 399, in _recv
    raise EOFError
EOFError

