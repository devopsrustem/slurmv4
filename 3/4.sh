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

1.
[2026-02-19 16:30:08] The server is fired up and ready to roll!
[2026-02-19 16:31:49] INFO:     10.99.91.39:46110 - "PRI %2A HTTP/2.0" 404 Not Found
[2026-02-19 16:31:49] WARNING:  Invalid HTTP request received.
[2026-02-19 16:31:49] INFO:     10.99.91.39:46120 - "PRI %2A HTTP/2.0" 404 Not Found
[2026-02-19 16:31:49] WARNING:  Invalid HTTP request received.
[2026-02-19 16:31:49 TP0] Prefill batch, #new-seq: 1, #new-token: 1, #cached-token: 0, token usage: 0.00, #running-req: 0, #queue-req: 0, #prealloc-req: 0, #inflight-req: 0, input throughput (token/s): 0.04, 
[2026-02-19 16:31:50] INFO:     10.99.91.39:46102 - "GET /health HTTP/1.1" 200 OK
[2026-02-19 16:31:50] INFO:     10.99.91.39:46128 - "GET /server_info HTTP/1.1" 200 OK
[2026-02-19 16:31:50] INFO:     10.99.91.39:46128 - "GET /model_info HTTP/1.1" 200 OK
[2026-02-19 16:32:42 TP0] Prefill batch, #new-seq: 1, #new-token: 11, #cached-token: 1, token usage: 0.00, #running-req: 0, #queue-req: 0, #prealloc-req: 0, #inflight-req: 0, input throughput (token/s): 0.02, 
E0219 16:32:42.940686 572100 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f4e02001680
E0219 16:32:42.940747 572011 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f8b0e001680
E0219 16:32:42.940757 571904 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fb04e001680
E0219 16:32:42.940785 571712 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7efad6001680
E0219 16:32:42.940807 571866 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7ef242001680
[2026-02-19 16:32:42 TP4] Session 10.82.101.249:16177 failed.
E0219 16:32:42.940838 572204 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fa646001680
E0219 16:32:42.940867 572191 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f5b66001680
[2026-02-19 16:32:42 TP1] Session 10.82.101.249:15559 failed.
[2026-02-19 16:32:42 TP5] Session 10.82.101.249:16771 failed.
[2026-02-19 16:32:42 TP0] Session 10.82.101.249:16200 failed.
[2026-02-19 16:32:42 TP7] Session 10.82.101.249:15952 failed.
[2026-02-19 16:32:42 TP3] Session 10.82.101.249:16531 failed.
[2026-02-19 16:32:42 TP2] Session 10.82.101.249:16431 failed.
E0219 16:32:42.952762 571753 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f7b86001680
[2026-02-19 16:32:42 TP6] Session 10.82.101.249:15222 failed.
[2026-02-19 16:32:42 TP0] Prefill transfer failed for request rank=0 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:40991
[2026-02-19 16:32:42 TP6] Prefill transfer failed for request rank=6 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:42797
[2026-02-19 16:32:42 TP7] Prefill transfer failed for request rank=7 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:34993
[2026-02-19 16:32:42 TP4] Prefill transfer failed for request rank=4 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:33795
[2026-02-19 16:32:42 TP5] Prefill transfer failed for request rank=5 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:33147
[2026-02-19 16:32:42 TP1] Prefill transfer failed for request rank=1 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:36555
[2026-02-19 16:32:42 TP3] Prefill transfer failed for request rank=3 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:40757
[2026-02-19 16:32:42 TP2] Prefill transfer failed for request rank=2 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.249:33571
[2026-02-19 16:32:42] INFO:     10.99.91.39:33788 - "POST /v1/chat/completions HTTP/1.1" 500 Internal Server Error
[2026-02-19 16:32:49 TP0] Prefill batch, #new-seq: 1, #new-token: 1, #cached-token: 0, token usage: 0.00, #running-req: 0, #queue-req: 0, #prealloc-req: 1, #inflight-req: 0, input throughput (token/s): 1.73, 
[2026-02-19 16:32:50] INFO:     10.99.91.39:56576 - "GET /health HTTP/1.1" 200 OK
[2026-02-19 16:33:31 TP0] Prefill bootstrap failed for request rank=0 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP7] Prefill bootstrap failed for request rank=7 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP5] Prefill bootstrap failed for request rank=5 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP6] Prefill bootstrap failed for request rank=6 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP3] Prefill bootstrap failed for request rank=3 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP4] Prefill bootstrap failed for request rank=4 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP2] Prefill bootstrap failed for request rank=2 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP1] Prefill bootstrap failed for request rank=1 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
2
 /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP13] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP9] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP15] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP10] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP14] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:30:07 TP8] Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128].json. Fallback to triton version 3.4.0 and use MoE kernel config from /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_4_0/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128].json. Performance might be sub-optimal!
[2026-02-19 16:30:07 TP8] Using MoE kernel config with down_moe=False. Performance might be sub-optimal! Config file not found at /app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/sglang/srt/layers/moe/fused_moe_triton/configs/triton_3_5_1/E=257,N=128,device_name=NVIDIA_H100_80GB_HBM3,dtype=fp8_w8a8,block_shape=[128, 128]_down.json, you can create them with https://github.com/sgl-project/sglang/tree/main/benchmark/kernels/fused_moe_triton
[2026-02-19 16:31:49] Invalid HTTP request received.
[2026-02-19 16:31:49] Invalid HTTP request received.
E0219 16:32:42.940815 535035 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7ee8ea001680
E0219 16:32:42.940845 535284 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7efb02001680
E0219 16:32:42.940887 534784 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fde16001680
E0219 16:32:42.940900 535303 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fe426001680
E0219 16:32:42.940912 535295 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fbf1a001680
[2026-02-19 16:32:42 TP11] Session 10.82.101.129:15482 failed.
[2026-02-19 16:32:42 TP10] Session 10.82.101.129:15518 failed.
E0219 16:32:42.941006 535305 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7fe12e001680
E0219 16:32:42.941030 535311 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f0a16001680
[2026-02-19 16:32:42 TP12] Session 10.82.101.129:16140 failed.
[2026-02-19 16:32:42 TP13] Session 10.82.101.129:16801 failed.
[2026-02-19 16:32:42 TP9] Session 10.82.101.129:15313 failed.
[2026-02-19 16:32:42 TP8] Session 10.82.101.129:16767 failed.
[2026-02-19 16:32:42 TP15] Session 10.82.101.129:15678 failed.
E0219 16:32:42.952979 535031 rdma_transport.cpp:529] Memory region not registered by any active device(s): 0x7f89ee001680
[2026-02-19 16:32:42 TP14] Session 10.82.101.129:15370 failed.
[2026-02-19 16:32:42 TP15] Prefill transfer failed for request rank=15 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:42181
[2026-02-19 16:32:42 TP14] Prefill transfer failed for request rank=14 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:39139
[2026-02-19 16:32:42 TP13] Prefill transfer failed for request rank=13 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:44121
[2026-02-19 16:32:42 TP12] Prefill transfer failed for request rank=12 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:34717
[2026-02-19 16:32:42 TP11] Prefill transfer failed for request rank=11 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:35917
[2026-02-19 16:32:42 TP10] Prefill transfer failed for request rank=10 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:37795
[2026-02-19 16:32:42 TP8] Prefill transfer failed for request rank=8 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:42929
[2026-02-19 16:32:42 TP9] Prefill transfer failed for request rank=9 req.rid='e030e49c59ad4d02ba84620cfb7e57c8' req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to send kv chunk of 687467831379323517 to 10.82.101.129:41953
[2026-02-19 16:33:31 TP14] Prefill bootstrap failed for request rank=14 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP12] Prefill bootstrap failed for request rank=12 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP13] Prefill bootstrap failed for request rank=13 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP10] Prefill bootstrap failed for request rank=10 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP9] Prefill bootstrap failed for request rank=9 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP11] Prefill bootstrap failed for request rank=11 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP8] Prefill bootstrap failed for request rank=8 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
[2026-02-19 16:33:31 TP15] Prefill bootstrap failed for request rank=15 req.rid='be001b94bbc848f2b1aa71e1e2b70aa8' req.bootstrap_room=2148295886124306552 with exception KVTransferError(bootstrap_room=2148295886124306552): Aborted by AbortReq.
3
engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP5] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP0] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP7] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP2] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP6] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP1] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP3] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP0] Decode transfer failed for request rank=0 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP7] Decode transfer failed for request rank=7 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP6] Decode transfer failed for request rank=6 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP4] Decode transfer failed for request rank=4 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP3] Decode transfer failed for request rank=3 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP5] Decode transfer failed for request rank=5 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP2] Decode transfer failed for request rank=2 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP1] Decode transfer failed for request rank=1 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42] INFO:     10.99.91.39:59642 - "POST /v1/chat/completions HTTP/1.1" 500 Internal Server Error
[2026-02-19 16:32:42 TP0] Decode transfer failed for request rank=0 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP6] Decode transfer failed for request rank=6 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed due to an unknown reason from another rank
[2026-02-19 16:32:42 TP7] Decode transfer failed for request rank=7 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP5] Decode transfer failed for request rank=5 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP4] Decode transfer failed for request rank=4 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP3] Decode transfer failed for request rank=3 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP2] Decode transfer failed for request rank=2 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP1] Decode transfer failed for request rank=1 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42] INFO:     10.99.91.39:59642 - "POST /v1/chat/completions HTTP/1.1" 500 Internal Server Error
[2026-02-19 16:32:50] INFO:     10.99.91.39:38826 - "GET /health HTTP/1.1" 200 OK
4
44
W0219 16:31:01.428280 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f3620000000 length 375865344
W0219 16:31:01.428292 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f3608000000 length 375865344
W0219 16:31:01.428305 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f35f0000000 length 375865344
W0219 16:31:01.428316 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f35d8000000 length 375865344
W0219 16:31:01.428331 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f35c0000000 length 375865344
W0219 16:31:01.428344 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f35a8000000 length 375865344
W0219 16:31:01.428362 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f3590000000 length 375865344
W0219 16:31:01.428375 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f3528000000 length 375865344
W0219 16:31:01.428388 650827 rdma_transport.cpp:400] RdmaTransport: Failed to register memory: addr 0x7f3510000000 length 375865344
[2026-02-19 16:31:01] Dummy health check server started in background thread at 10.99.91.33:30001
[2026-02-19 16:31:49] Invalid HTTP request received.
[2026-02-19 16:31:49] Invalid HTTP request received.
[2026-02-19 16:32:42 TP13] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP12] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP10] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP15] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP8] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP14] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP9] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP11] Error fetching prefill parallel info from bootstrap: HTTPConnectionPool(host='10.99.91.41', port=8998): Max retries exceeded with url: /route?engine_rank=-1&target_dp_group=-1&target_pp_rank=-1 (Caused by NewConnectionError("HTTPConnection(host='10.99.91.41', port=8998): Failed to establish a new connection: [Errno 111] Connection refused"))
[2026-02-19 16:32:42 TP15] Decode transfer failed for request rank=15 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP14] Decode transfer failed for request rank=14 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP13] Decode transfer failed for request rank=13 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP12] Decode transfer failed for request rank=12 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP11] Decode transfer failed for request rank=11 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP10] Decode transfer failed for request rank=10 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP9] Decode transfer failed for request rank=9 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP8] Decode transfer failed for request rank=8 decode_req.req.rid='c7287ad8cf064cdeb57872aad27241c2' decode_req.req.bootstrap_room=4751139391711345681 with exception KVTransferError(bootstrap_room=4751139391711345681): Could not fetch prefill parallel info from bootstrap_addr: 10.99.91.41:8998
[2026-02-19 16:32:42 TP15] Decode transfer failed for request rank=15 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP14] Decode transfer failed for request rank=14 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed due to an unknown reason from another rank
[2026-02-19 16:32:42 TP13] Decode transfer failed for request rank=13 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP12] Decode transfer failed for request rank=12 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP11] Decode transfer failed for request rank=11 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP10] Decode transfer failed for request rank=10 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP9] Decode transfer failed for request rank=9 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead
[2026-02-19 16:32:42 TP8] Decode transfer failed for request rank=8 decode_req.req.rid='45ebc41130344271a823975baf7621b6' decode_req.req.bootstrap_room=687467831379323517 with exception KVTransferError(bootstrap_room=687467831379323517): Failed to get kvcache from prefill instance, it might be dead

rout
tarted processing request
2026-02-19 13:32:18 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-vKqE58KDYXWZRQRwmxeiKZwv"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.33:30001 status=404 Not Found
2026-02-19 13:32:18  WARN http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-vKqE58KDYXWZRQRwmxeiKZwv" status_code=404 latency=1284}: smg::response: /home/runner/work/sglang/sglang/src/middleware.rs:354: request failed with client error
2026-02-19 13:32:42  INFO http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-jPUa0lWtvi7baYIbbYYWqmsH"}: smg::request: /home/runner/work/sglang/sglang/src/middleware.rs:310: started processing request
2026-02-19 13:32:42 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-jPUa0lWtvi7baYIbbYYWqmsH"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error
2026-02-19 13:32:42 ERROR http_request{method=POST uri=/v1/chat/completions version=HTTP/1.1 module="smg" request_id="chatcmpl-jPUa0lWtvi7baYIbbYYWqmsH"}: smg::routers::http::pd_router: /home/runner/work/sglang/sglang/src/routers/http/pd_router.rs:590: Decode server returned error status decode_url=http://10.99.91.49:30001 status=500 Internal Server Error





