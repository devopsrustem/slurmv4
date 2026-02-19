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

