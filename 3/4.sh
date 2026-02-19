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


  2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:794: Starting router on 0.0.0.0:8000 | mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", None), ("http://10.99.91.41:30000", None)], decode_urls: ["http://10.99.91.49:30001", "http://10.99.91.33:30001"], prefill_policy: None, decode_policy: None } | policy: CacheAware { cache_threshold: 0.3, balance_abs_threshold: 64, balance_rel_threshold: 1.5, eviction_interval_secs: 60, max_tree_size: 67108864 } | max_payload: 512MB
2026-02-19 12:57:23  INFO smg::app_context: /home/runner/work/sglang/sglang/src/app_context.rs:412: Tokenizer path is not provided, will load from worker on the fly
2026-02-19 12:57:23  INFO smg::data_connector::factory: /home/runner/work/sglang/sglang/src/data_connector/factory.rs:51: Initializing data connector: Memory
2026-02-19 12:57:23  INFO smg::mcp::manager: /home/runner/work/sglang/sglang/src/mcp/manager.rs:90: No static MCP servers connected
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:833: Initializing workers for routing mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", None), ("http://10.99.91.41:30000", None)], decode_urls: ["http://10.99.91.49:30001", "http://10.99.91.33:30001"], prefill_policy: None, decode_policy: None }
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:851: Worker initialization job submitted (will complete in background)
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:863: No MCP config provided, skipping MCP server initialization
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:875: Workers initialized: 0 total, 0 healthy
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 definition_id=local_worker_registration
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab definition_id=local_worker_registration
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e definition_id=local_worker_registration
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d definition_id=local_worker_registration
2026-02-19 12:57:23  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:169: Initializing RouterManager in single-router mode
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=detect_connection_mode attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=detect_connection_mode attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=detect_connection_mode attempt=1
2026-02-19 12:57:23  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:177: Created single router with ID: http-pd
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=detect_connection_mode attempt=1
2026-02-19 12:57:23  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:216: Set default router to http-pd
2026-02-19 12:57:23  INFO smg::core::worker_manager: /home/runner/work/sglang/sglang/src/core/worker_manager.rs:350: Starting load monitoring with interval: 30s
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:907: Rate limiting is disabled (max_concurrent_requests = -1)
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:985: Router ready | workers: []
2026-02-19 12:57:23  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:1018: Starting server on 0.0.0.0:8000
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=detect_connection_mode duration_ms=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=discover_metadata attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=detect_connection_mode duration_ms=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=discover_metadata attempt=1
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::discover_metadata: /home/runner/work/sglang/sglang/src/core/steps/worker/local/discover_metadata.rs:64: Endpoint '/server_info' returned 404, falling back to '/get_server_info' for backward compatibility. The '/get_server_info' endpoint is deprecated and will be removed in a future version. Please use '/server_info' instead.
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::discover_metadata: /home/runner/work/sglang/sglang/src/core/steps/worker/local/discover_metadata.rs:64: Endpoint '/server_info' returned 404, falling back to '/get_server_info' for backward compatibility. The '/get_server_info' endpoint is deprecated and will be removed in a future version. Please use '/server_info' instead.
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::discover_metadata: /home/runner/work/sglang/sglang/src/core/steps/worker/local/discover_metadata.rs:64: Endpoint '/model_info' returned 404, falling back to '/get_model_info' for backward compatibility. The '/get_model_info' endpoint is deprecated and will be removed in a future version. Please use '/model_info' instead.
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::discover_metadata: /home/runner/work/sglang/sglang/src/core/steps/worker/local/discover_metadata.rs:64: Endpoint '/model_info' returned 404, falling back to '/get_model_info' for backward compatibility. The '/get_model_info' endpoint is deprecated and will be removed in a future version. Please use '/model_info' instead.
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=discover_metadata duration_ms=7
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=discover_dp_info duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=discover_dp_info attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=discover_metadata duration_ms=7
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=discover_dp_info attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=discover_dp_info duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=create_worker attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=create_worker duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=register_workers attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=create_worker duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=create_worker attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=register_workers attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=register_workers duration_ms=0
2026-02-19 12:57:23  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::register_tokenizer: /home/runner/work/sglang/sglang/src/core/steps/worker/local/register_tokenizer.rs:47: No tokenizer_path or model_path found for model unknown
2026-02-19 12:57:23  INFO smg::policies::registry: /home/runner/work/sglang/sglang/src/policies/registry.rs:89: Assigning policy cache_aware to new model unknown
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=register_tokenizer duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=activate_workers attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=register_workers duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=register_tokenizer attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=activate_workers duration_ms=0
2026-02-19 12:57:23  WARN smg::core::steps::worker::local::register_tokenizer: /home/runner/work/sglang/sglang/src/core/steps/worker/local/register_tokenizer.rs:47: No tokenizer_path or model_path found for model unknown
2026-02-19 12:57:23  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 duration_ms=10
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=update_policies attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=register_tokenizer duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=43d1d080-50f2-4411-8aa6-819ee08635d4 step_id=update_policies duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=register_tokenizer attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=activate_workers attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=activate_workers duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=update_policies attempt=1
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab step_id=update_policies duration_ms=0
2026-02-19 12:57:23  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=b1dd8d77-dbe7-45dd-828d-d1e918ce57ab duration_ms=10
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=detect_connection_mode duration_ms=1001
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=discover_metadata attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=detect_connection_mode duration_ms=1002
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=discover_metadata attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=discover_metadata duration_ms=4
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=discover_dp_info attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=discover_dp_info duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=create_worker attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=create_worker duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=register_workers attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=discover_dp_info attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=discover_metadata duration_ms=3
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=discover_dp_info duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=register_workers duration_ms=0
2026-02-19 12:57:24  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-19 12:57:24  INFO smg::policies::registry: /home/runner/work/sglang/sglang/src/policies/registry.rs:89: Assigning policy cache_aware to new model /app/models/Deepseek-R1/
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=activate_workers attempt=1
2026-02-19 12:57:24  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:121: Loading tokenizer '/app/models/Deepseek-R1/' from source: /app/models/Deepseek-R1/
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=create_worker duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=activate_workers duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=register_workers attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=create_worker attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=update_policies attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=update_policies duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=register_workers duration_ms=0
2026-02-19 12:57:24  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=register_tokenizer attempt=1
2026-02-19 12:57:24  WARN smg::core::steps::worker::shared::update_policies: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/update_policies.rs:62: Model /app/models/Deepseek-R1/ has conflicting load_balance_method: prefill=Some("follow_bootstrap_room"), decode=Some("round_robin")
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=activate_workers duration_ms=0
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=activate_workers attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=update_policies attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=update_policies duration_ms=0
2026-02-19 12:57:24  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:141: Successfully registered tokenizer '/app/models/Deepseek-R1/' with id: 9660bc09-8f16-4f41-823d-2e3c3dddf957
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=register_tokenizer attempt=1
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d step_id=register_tokenizer duration_ms=226
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e step_id=register_tokenizer duration_ms=225
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=5f8089d2-9bf3-4855-9ad7-3f17c803335d duration_ms=1232
2026-02-19 12:57:24  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=d9f2f3b1-62ff-4cdb-b2d4-3f483fefa69e duration_ms=1232

curl -X POST http://10.82.101.193:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "/app/models/Deepseek-R1/",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
