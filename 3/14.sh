
Summary:
  Total:	80.0035 secs
  Slowest:	16.9997 secs
  Fastest:	2.1150 secs
  Average:	8.4074 secs
  Requests/sec:	2.4999
  
  Total data:	208592 bytes
  Size/request:	2065 bytes

Response time histogram:
  2.115 [1]	|■■
  3.604 [1]	|■■
  5.092 [6]	|■■■■■■■■■■■
  6.580 [17]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  8.069 [22]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  9.557 [21]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  11.046 [16]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  12.534 [11]	|■■■■■■■■■■■■■■■■■■■■
  14.023 [4]	|■■■■■■■
  15.511 [1]	|■■
  17.000 [1]	|■■


Latency distribution:
  10% in 5.1888 secs
  25% in 6.6515 secs
  50% in 8.3323 secs
  75% in 10.0073 secs
  90% in 12.0470 secs
  95% in 13.0460 secs
  99% in 16.9997 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0165 secs, 2.1150 secs, 16.9997 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0004 secs
  resp wait:	8.3906 secs, 2.1075 secs, 16.9896 secs
  resp read:	0.0001 secs, 0.0001 secs, 0.0009 secs

Status code distribution:
  [200]	101 responses

Error distribution:
  [99]	Post "http://10.82.101.193:8000/v1/chat/completions": context deadline exceeded (Client.Timeout exceeded while awaiting headers)




./hey_linux_amd64 -n 10 -c 2 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions









  23534980@sigma.sbrf.ru@CAB-WSN-0052363:/home/work/23534980@sigma.sbrf.ru$ ./hey_linux_amd64 -n 10 -c 2 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions

Summary:
  Total:	53.3455 secs
  Slowest:	7.9777 secs
  Fastest:	3.1785 secs
  Average:	5.1506 secs
  Requests/sec:	0.1875
  
  Total data:	14355 bytes
  Size/request:	2050 bytes

Response time histogram:
  3.179 [1]	|■■■■■■■■■■■■■
  3.658 [1]	|■■■■■■■■■■■■■
  4.138 [0]	|
  4.618 [0]	|
  5.098 [3]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  5.578 [0]	|
  6.058 [0]	|
  6.538 [1]	|■■■■■■■■■■■■■
  7.018 [0]	|
  7.498 [0]	|
  7.978 [1]	|■■■■■■■■■■■■■


Latency distribution:
  10% in 3.4238 secs
  25% in 5.0322 secs
  50% in 5.0976 secs
  75% in 7.9777 secs
  0% in 0.0000 secs
  0% in 0.0000 secs
  0% in 0.0000 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0025 secs, 3.1785 secs, 7.9777 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0001 secs
  resp wait:	5.1479 secs, 3.1724 secs, 7.9718 secs
  resp read:	0.0001 secs, 0.0001 secs, 0.0001 secs

Status code distribution:
  [200]	7 responses

Error distribution:
  [3]	Post "http://10.82.101.193:8000/v1/chat/completions": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

./hey_linux_amd64 -n 10 -c 2 -t 60 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions


  
0007:
bashLD_LIBRARY_PATH=/usr/local/cuda-12.8/targets/x86_64-linux/lib:/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA="=mlx5_0,=mlx5_1,=mlx5_2,=mlx5_5,=mlx5_6,=mlx5_7,=mlx5_8,=mlx5_11" \
NCCL_IB_GID_INDEX=3 \
NCCL_NVLS_ENABLE=0 \
NCCL_ALGO=Ring \
NCCL_PROTO=Simple \
NCCL_IB_CUDA_SUPPORT=0 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128 --disable-cuda-graph
0008: то же, node-rank 1, SGLANG_HOST_IP=10.99.91.63, host=10.99.91.63.







23534980@sigma.sbrf.ru@CAB-WSN-0052363:/home/work/23534980@sigma.sbrf.ru$ ./hey_linux_amd64 -n 20 -c 5 -t 120 -m POST   -H "Content-Type: application/json"   -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":2048}'   http://10.82.101.193:8000/v1/chat/completions

Summary:
  Total:	368.3566 secs
  Slowest:	55.4212 secs
  Fastest:	3.6413 secs
  Average:	10.3381 secs
  Requests/sec:	0.0543
  
  Total data:	23785 bytes
  Size/request:	2162 bytes

Response time histogram:
  3.641 [1]	|■■■■
  8.819 [9]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  13.997 [0]	|
  19.175 [0]	|
  24.353 [0]	|
  29.531 [0]	|
  34.709 [0]	|
  39.887 [0]	|
  45.065 [0]	|
  50.243 [0]	|
  55.421 [1]	|■■■■


Latency distribution:
  10% in 4.5251 secs
  25% in 4.6539 secs
  50% in 6.3148 secs
  75% in 8.3544 secs
  90% in 55.4212 secs
  0% in 0.0000 secs
  0% in 0.0000 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0039 secs, 3.6413 secs, 55.4212 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0001 secs
  resp wait:	10.3341 secs, 3.6412 secs, 55.4122 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	11 responses

Error distribution:
  [9]	Post "http://10.82.101.193:8000/v1/chat/completions": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

23534980@sigma.sbrf.ru@CAB-WSN-0052363:/home/work/23534980@sigma.sbrf.ru$ ./hey_linux_amd64 -n 20 -c 5 -t 120 -m POST   -H "Content-Type: application/json"   -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":2048}'   http://10.82.101.193:8000/v1/chat/completions

Summary:
  Total:	29.8537 secs
  Slowest:	8.5696 secs
  Fastest:	2.0942 secs
  Average:	6.4054 secs
  Requests/sec:	0.6699
  
  Total data:	41285 bytes
  Size/request:	2064 bytes

Response time histogram:
  2.094 [1]	|■■■■■■
  2.742 [0]	|
  3.389 [0]	|
  4.037 [0]	|
  4.684 [0]	|
  5.332 [0]	|
  5.979 [7]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  6.627 [4]	|■■■■■■■■■■■■■■■■■■■■■■■
  7.275 [2]	|■■■■■■■■■■■
  7.922 [3]	|■■■■■■■■■■■■■■■■■
  8.570 [3]	|■■■■■■■■■■■■■■■■■


Latency distribution:
  10% in 5.5500 secs
  25% in 5.9038 secs
  50% in 6.2404 secs
  75% in 7.6786 secs
  90% in 8.0686 secs
  95% in 8.5696 secs
  0% in 0.0000 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0022 secs, 2.0942 secs, 8.5696 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0002 secs
  resp wait:	6.4031 secs, 2.0941 secs, 8.5613 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0002 secs

Status code distribution:
  [200]	20 responses
