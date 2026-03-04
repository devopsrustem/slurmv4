

0007:
bashLD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
0008:
bashLD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128

tpgds-aihub0007:222223:222223 [2] NCCL INFO Channel 01/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0007:222226:222226 [5] NCCL INFO Channel 12/0 : 5[5] -> 4[4] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 03/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222224:222224 [3] NCCL INFO Channel 10/0 : 3[3] -> 2[2] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 04/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222225:222225 [4] NCCL INFO Channel 11/0 : 4[4] -> 3[3] via P2P/IPC
tpgds-aihub0007:222223:222223 [2] NCCL INFO Channel 09/0 : 2[2] -> 1[1] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 05/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 06/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 07/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 09/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 10/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 11/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 12/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 13/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 14/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 15/0 : 7[7] -> 0[0] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 06/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0007:222228:222228 [7] NCCL INFO Channel 14/0 : 7[7] -> 6[6] via P2P/IPC
tpgds-aihub0007:222224:222224 [3] NCCL INFO Connected all trees
tpgds-aihub0007:222223:222223 [2] NCCL INFO Connected all trees
tpgds-aihub0007:222225:222225 [4] NCCL INFO Connected all trees
tpgds-aihub0007:222224:222224 [3] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222224:222224 [3] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222226:222226 [5] NCCL INFO Connected all trees
tpgds-aihub0007:222227:222227 [6] NCCL INFO Connected all trees
tpgds-aihub0007:222221:222221 [0] NCCL INFO Connected all trees
tpgds-aihub0007:222228:222228 [7] NCCL INFO Connected all trees
tpgds-aihub0007:222222:222222 [1] NCCL INFO Connected all trees
tpgds-aihub0007:222223:222223 [2] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222223:222223 [2] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222225:222225 [4] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222225:222225 [4] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222227:222227 [6] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222227:222227 [6] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222228:222228 [7] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222228:222228 [7] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222222:222222 [1] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222222:222222 [1] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222226:222226 [5] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222226:222226 [5] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222221:222221 [0] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:222221:222221 [0] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0007:222221:222221 [0] NCCL INFO CC Off, workFifoBytes 1048576
tpgds-aihub0007:222224:222224 [3] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222228:222228 [7] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222224:222224 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222228:222228 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222224:222224 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222228:222228 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222224:222224 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222228:222228 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222224:222224 [3] NCCL INFO ncclCommInitRank comm 0x560d47aa6b30 rank 3 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222228:222228 [7] NCCL INFO ncclCommInitRank comm 0x5635b47d5ec0 rank 7 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222224:222224 [3] NCCL INFO Init timings - ncclCommInitRank: rank 3 nranks 16 total 2.17 (kernels 0.25, alloc 1.56, bootstrap 0.08, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.20, rest 0.01)
tpgds-aihub0007:222228:222228 [7] NCCL INFO Init timings - ncclCommInitRank: rank 7 nranks 16 total 2.18 (kernels 0.25, alloc 1.58, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0007:222221:222221 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222222:222222 [1] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222227:222227 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222221:222221 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222226:222226 [5] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222222:222222 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222227:222227 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222221:222221 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222225:222225 [4] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222226:222226 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222222:222222 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222227:222227 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222221:222221 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222225:222225 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222226:222226 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222222:222222 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222227:222227 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222225:222225 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222222:222222 [1] NCCL INFO ncclCommInitRank comm 0x55811b960800 rank 1 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222221:222221 [0] NCCL INFO ncclCommInitRank comm 0x559e4d06ee30 rank 0 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222226:222226 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222227:222227 [6] NCCL INFO ncclCommInitRank comm 0x558b18286cf0 rank 6 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222225:222225 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222223:222223 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:222226:222226 [5] NCCL INFO ncclCommInitRank comm 0x563c1ba4d9e0 rank 5 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222227:222227 [6] NCCL INFO Init timings - ncclCommInitRank: rank 6 nranks 16 total 2.19 (kernels 0.32, alloc 1.51, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0007:222222:222222 [1] NCCL INFO Init timings - ncclCommInitRank: rank 1 nranks 16 total 2.17 (kernels 0.25, alloc 1.57, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0007:222221:222221 [0] NCCL INFO Init timings - ncclCommInitRank: rank 0 nranks 16 total 2.20 (kernels 0.25, alloc 1.59, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.22, rest 0.00)
tpgds-aihub0007:222225:222225 [4] NCCL INFO ncclCommInitRank comm 0x562f56dc2a50 rank 4 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222223:222223 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0007:222226:222226 [5] NCCL INFO Init timings - ncclCommInitRank: rank 5 nranks 16 total 2.17 (kernels 0.25, alloc 1.56, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0007:222225:222225 [4] NCCL INFO Init timings - ncclCommInitRank: rank 4 nranks 16 total 2.18 (kernels 0.31, alloc 1.51, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0007:222223:222223 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0007:222223:222223 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0007:222223:222223 [2] NCCL INFO ncclCommInitRank comm 0x558473e12480 rank 2 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0007:222223:222223 [2] NCCL INFO Init timings - ncclCommInitRank: rank 2 nranks 16 total 2.18 (kernels 0.25, alloc 1.11, bootstrap 0.53, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)

# На 0007 - на чём заблокирован главный процесс:
cat /proc/$(pgrep -f "scheduler_TP0" | head -1)/wchan

# И стек вызовов:
sudo cat /proc/$(pgrep -f "scheduler_TP0" | head -1)/stack


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ pgrep -a sglang
207007 sglang::scheduler_TP8                                                                                                                                 
207008 sglang::scheduler_TP9                                                                                                                                 
207009 sglang::scheduler_TP10                                                                                                                                
207010 sglang::scheduler_TP11                                                                                                                                
207011 sglang::scheduler_TP12                                                                                                                                
207012 sglang::scheduler_TP13                                                                                                                                
207013 sglang::scheduler_TP14                                                                                                                                
207014 sglang::scheduler_TP15                                                                                                                                 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ pgrep -a python
206836 python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.63 --port 30001 --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --disaggregation-transfer-backend nixl --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 --max-running-requests 128
207006 /app/sglang/sglang-0.5.9/bin/python3 -c from multiprocessing.resource_tracker import main;main(76)

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ pgrep -a sglang
222221 sglang::scheduler_TP0                                                                                                                                 
222222 sglang::scheduler_TP1                                                                                                                                 
222223 sglang::scheduler_TP2                                                                                                                                 
222224 sglang::scheduler_TP3                                                                                                                                 
222225 sglang::scheduler_TP4                                                                                                                                 
222226 sglang::scheduler_TP5                                                                                                                                 
222227 sglang::scheduler_TP6                                                                                                                                 
222228 sglang::scheduler_TP7                                                                                                                                  
222229 sglang::detokenizer                                                                                                                                    
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ pgrep -a python
222051 python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.59 --port 30001 --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 --mem-fraction-static 0.8 --disaggregation-mode decode --disaggregation-transfer-backend nixl --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 --max-running-requests 128
222220 /app/sglang/sglang-0.5.9/bin/python3 -c from multiprocessing.resource_tracker import main;main(76)
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 




Процессы живы! На 0007 даже detokenizer запущен — это хороший знак, значит оно дальше продвинулось. Проверь на чём висит главный python процесс:
bash# На 0007:
cat /proc/222051/wchan
cat /proc/222051/status | grep -E "State|VmRSS|VmPeak"

# На 0008:
cat /proc/206836/wchan
cat /proc/206836/status | grep -E "State|VmRSS|VmPeak"
И проверь память GPU сейчас:
bash# На обоих:
nvidia-smi --query-gpu=memory.used,memory.free --format=csv
Скорее всего SGLang сейчас инициализирует NIXL/disaggregation engine и ждёт ответа от prefill. Это может занять несколько минут.




((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ cat /proc/222051/status | grep -E "State|VmRSS|VmPeak"
State:	S (sleeping)
VmPeak:	53515308 kB
VmRSS:	 1075148 kB

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ cat /proc/206836/wchan
pipe_read((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihubcat /proc/206836/status | grep -E "State|VmRSS|VmPeak"S|VmPeak"
State:	S (sleeping)
VmPeak:	53217996 kB
VmRSS:	  995612 kB
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ nvidia-smi --query-gpu=memory.used,memory.free --format=csv
memory.used [MiB], memory.free [MiB]
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB
1718 MiB, 79364 MiB


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ nvidia-smi --query-gpu=memory.used,memory.free --format=csv
memory.used [MiB], memory.free [MiB]
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB
1718 MiB, 79363 MiB


# На 0007:
for pid in $(pgrep -f "scheduler_TP"); do
  echo -n "$(cat /proc/$pid/comm) ($pid): "
  cat /proc/$pid/wchan
done

# На 0008:
for pid in $(pgrep -f "scheduler_TP"); do
  echo -n "$(cat /proc/$pid/comm) ($pid): "
  cat /proc/$pid/wchan
done


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ for pid in $(pgrep -f "scheduler_TP"); do
  echo -n "$(cat /proc/$pid/comm) ($pid): "
  cat /proc/$pid/wchan
done
sglang::schedul (222221): 0sglang::schedul (222222): 0sglang::schedul (222223): 0sglang::schedul (222224): 0sglang::schedul (222225): 0sglang::schedul (222226): 0sglang::schedul (222227): 0sglang::schedul (222228): 0((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ for pid in $(pgrep -f "scheduler_TP"); do
  echo -n "$(cat /proc/$pid/comm) ($pid): "
  cat /proc/$pid/wchan
done
sglang::schedul (207007): 0sglang::schedul (207008): 0sglang::schedul (207009): 0sglang::schedul (207010): 0sglang::schedul (207011): 0sglang::schedul (207012): 0sglang::schedul (207013): 0sglang::schedul (207014): 0((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ 















# На 0007 - что процесс делает прямо сейчас:
sudo strace -p 222051 -e trace=futex,connect,sendto,recvfrom 2>&1 | head -30

# Открытые соединения:
lsof -p 222051 -i 2>/dev/null
И проверь — может логи пишутся в файл, а не в терминал:

bash
ls -lt /tmp/*.log 2>/dev/null
ls -lt /tmp/sglang* 2>/dev/null
find /tmp -name "*.log" -newer /tmp -maxdepth 2 2>/dev/null
*.log  нет на серверах - никто не пишет

2:41 PM

Диагностировал застревание процесса после инициализации NCCL
Диагностировал застревание процесса после инициализации NCCL
Помнишь — на 0009 было "DeepGEMM JIT 5%"? Может 0007/0008 тоже компилируют JIT но молча. Проверь CPU активность:

bash
# На 0007 - смотрим что жрёт CPU:
top -b -n 1 -p $(pgrep -d',' -f "scheduler_TP|python3")

# Есть ли DeepGEMM кэш:
ls ~/.cache/deep_gemm/ 2>/dev/null || ls /tmp/deep_gemm* 2>/dev/null
find /home -name "*.cu" -newer /tmp 2>/dev/null | head -5
На 0003/0006 этот кэш уже есть, поэтому они стартуют быстро. На 0007/0008 — компилируется с нуля молча.


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ lsof -p 222051 -i 2>/dev/null
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ top -b -n 1 -p $(pgrep -d',' -f "scheduler_TP|python3")
top - 14:43:35 up 23:29,  2 users,  load average: 9.20, 9.12, 9.03
Tasks:  10 total,   8 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  4.3 us,  0.5 sy,  0.0 ni, 95.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem : 2062969.+total, 1914349.+free, 106780.5 used, 102069.0 buff/cache
MiB Swap:   4096.0 total,   4096.0 free,      0.0 used. 1956188.+avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 222221 dcbsr_d+  20   0  222.5g   1.6g 614356 R 200.0   0.1  91:26.46 sglang::schedul
 222222 dcbsr_d+  20   0  222.0g   1.5g 607692 R 106.7   0.1  45:55.31 sglang::schedul
 222225 dcbsr_d+  20   0  222.0g   1.5g 606420 R 106.7   0.1  45:53.52 sglang::schedul
 222223 dcbsr_d+  20   0  222.0g   1.5g 612256 R 100.0   0.1  45:53.99 sglang::schedul
 222224 dcbsr_d+  20   0  222.0g   1.5g 607680 R 100.0   0.1  45:53.43 sglang::schedul
 222226 dcbsr_d+  20   0  222.0g   1.5g 612860 R 100.0   0.1  45:53.91 sglang::schedul
 222227 dcbsr_d+  20   0  222.0g   1.5g 609964 R 100.0   0.1  45:54.45 sglang::schedul
 222228 dcbsr_d+  20   0  222.0g   1.5g 612520 R 100.0   0.1  45:53.54 sglang::schedul
 222051 dcbsr_d+  20   0   51.0g   1.0g 404548 S   0.0   0.1   0:23.63 python3
 222220 dcbsr_d+  20   0   18456  14720   8552 S   0.0   0.0   0:00.01 python3
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ls ~/.cache/deep_gemm/ 2>/dev/null || ls /tmp/deep_gemm* 2>/dev/null
cache  tmp
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ find /home -name "*.cu" -newer /tmp 2>/dev/null | head -5
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 











# Сколько файлов уже скомпилировано:
find ~/.cache/deep_gemm/ -name "*.cubin" -o -name "*.so" 2>/dev/null | wc -l

# Активность в tmp (куда компилирует):
ls -lt ~/.cache/deep_gemm/tmp/ | head -10

# Сравни с 0003 - сколько там файлов:
# (на 0003):
find ~/.cache/deep_gemm/ -type f | wc -l

Node 0007 (rank 0):
bashLD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
Node 0008 (rank 1):
bashLD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
Запускай сначала 0007, потом 0008.

bashSGLANG_LOGGING_LEVEL=DEBUG \
NCCL_DEBUG=INFO \
NCCL_DEBUG_SUBSYS=INIT,NET \
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 ...
Или если хочешь совсем подробно:
bashSGLANG_LOGGING_LEVEL=DEBUG \
TORCH_DISTRIBUTED_DEBUG=DETAIL \
NCCL_DEBUG=WARN \


tpgds-aihub0007:11218:11218 [3] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:11218:11218 [3] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:11218:11218 [3] NCCL INFO NET/IB: [11] mlx5_11:uverbs11:1/RoCE provider=Mlx5 speed=400000 context=0x55c3759a11b0 pciPath=/sys/devices/pci0000:d7/0000:d7:01.0/0000:d8:00.0/0000:d9:00.0/0000:da:00.0 ar=0


tpgds-aihub0007:11222:11222 [7] NCCL INFO NET/Plugin: Could not find: libnccl-net.so. 
tpgds-aihub0007:11222:11222 [7] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0007:11222:11222 [7] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19


tpgds-aihub0007:11215:11215 [0] NCCL INFO NET/Plugin: Could not find: libnccl-net.so. 


[dcbsr_dev@tpgds-aihub0008 ~]$ find ~/.cache/deep_gemm/ -name "*.cubin" -o -name "*.so" 2>/dev/null | wc -l
0


tpgds-aihub0007:13538:13538 [6] NCCL INFO ncclCommInitRank comm 0x55cdb22a7bb0 rank 6 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0x9e2e2d778bf0e3a8 - Init COMPLETE
tpgds-aihub0007:13532:13532 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:13538:13538 [6] NCCL INFO Init timings - ncclCommInitRank: rank 6 nranks 16 total 1.52 (kernels 0.20, alloc 1.02, bootstrap 0.02, allgathers 0.02, topo 0.05, graphs 0.00, connections 0.20, rest 0.00)
tpgds-aihub0007:13536:13536 [4] NCCL INFO Init timings - ncclCommInitRank: rank 4 nranks 16 total 1.53 (kernels 0.26, alloc 0.98, bootstrap 0.01, allgathers 0.02, topo 0.05, graphs 0.00, connections 0.20, rest 0.01)
tpgds-aihub0007:13534:13534 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:13532:13532 [0] NCCL INFO ncclCommInitRank comm 0x55bd73c0f7e0 rank 0 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0x9e2e2d778bf0e3a8 - Init COMPLETE
tpgds-aihub0007:13534:13534 [2] NCCL INFO ncclCommInitRank comm 0x55c4963dfa60 rank 2 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0x9e2e2d778bf0e3a8 - Init COMPLETE
tpgds-aihub0007:13532:13532 [0] NCCL INFO Init timings - ncclCommInitRank: rank 0 nranks 16 total 1.54 (kernels 0.26, alloc 0.99, bootstrap 0.01, allgathers 0.02, topo 0.05, graphs 0.00, connections 0.20, rest 0.00)
tpgds-aihub0007:13534:13534 [2] NCCL INFO Init timings - ncclCommInitRank: rank 2 nranks 16 total 1.53 (kernels 0.20, alloc 0.94, bootstrap 0.11, allgathers 0.02, topo 0.05, graphs 0.00, connections 0.20, rest 0.00)

bash
# На 0008 - смотри все файлы которые создаёт процесс:
sudo lsof -p 206836 | grep -E "REG|DIR" | grep -v "mem" | tail -20

# Или найди свежие файлы:
find /tmp /home /root -name "*.cubin" -o -name "*.ptx" 2>/dev/null | head -10
find /tmp -newer /tmp -maxdepth 3 2>/dev/null | head -20



[dcbsr_dev@tpgds-aihub0008 ~]$ sudo lsof -p 206836 | grep -E "REG|DIR" | grep -v "mem" | tail -20
[dcbsr_dev@tpgds-aihub0008 ~]$ find /tmp /home /root -name "*.cubin" -o -name "*.ptx" 2>/dev/null | head -10
/home/dcbsr_dev/.triton/cache/XLJKEP2WX5VVDBMDFU2Y4WRYUXAR5E7FP3CPJKKOAZMAZFIIZIIQ/set_mla_kv_buffer_kernel.ptx
/home/dcbsr_dev/.triton/cache/XLJKEP2WX5VVDBMDFU2Y4WRYUXAR5E7FP3CPJKKOAZMAZFIIZIIQ/set_mla_kv_buffer_kernel.cubin
/home/dcbsr_dev/.triton/cache/QVJODX2LGJQSL4RANR55PKYW2ER3INWPVTUMG2ZJSFYWRRAFOILQ/memcpy_triton_kernel.ptx
/home/dcbsr_dev/.triton/cache/QVJODX2LGJQSL4RANR55PKYW2ER3INWPVTUMG2ZJSFYWRRAFOILQ/memcpy_triton_kernel.cubin
/home/dcbsr_dev/.triton/cache/IVP3PISPK6O6KGFTMMSIMGFF43ZZRMBMVG4YE7FEJ4XY4A2A5D2A/fused_moe_kernel.ptx
/home/dcbsr_dev/.triton/cache/IVP3PISPK6O6KGFTMMSIMGFF43ZZRMBMVG4YE7FEJ4XY4A2A5D2A/fused_moe_kernel.cubin
/home/dcbsr_dev/.triton/cache/BKHG3B4PTU6ANA7UQTVIN4BV6L4KPPPA2WRV2HGQ5RS35RHQ3OPQ/act_and_mul_kernel.ptx
/home/dcbsr_dev/.triton/cache/BKHG3B4PTU6ANA7UQTVIN4BV6L4KPPPA2WRV2HGQ5RS35RHQ3OPQ/act_and_mul_kernel.cubin
/home/dcbsr_dev/.triton/cache/HLL6PSAL6VU6JJVUKQQGZWQ3BWLLEMBZSNKLNTWL56SXJ2II3H5A/fused_moe_kernel.ptx
/home/dcbsr_dev/.triton/cache/HLL6PSAL6VU6JJVUKQQGZWQ3BWLLEMBZSNKLNTWL56SXJ2II3H5A/fused_moe_kernel.cubin
[dcbsr_dev@tpgds-aihub0008 ~]$ df -h
Filesystem                     Size  Used Avail Use% Mounted on
devtmpfs                       4.0M     0  4.0M   0% /dev
tmpfs                         1008G  253M 1008G   1% /dev/shm
tmpfs                          403G   12M  403G   1% /run
efivarfs                       512K  209K  299K  42% /sys/firmware/efi/efivars
/dev/mapper/rootvg-lvroot      102G  803M  102G   1% /
/dev/mapper/rootvg-lvusr       117G   40G   78G  35% /usr
/dev/md127                     769M  449M  265M  63% /boot
/dev/mapper/rootvg-lvopt       115G  4.3G  111G   4% /opt
/dev/mapper/rootvg-lvvar       115G  7.6G  108G   7% /var
/dev/mapper/rootvg-lvhome      104G  830M  104G   1% /home
/dev/mapper/rootvg-lvtmp       104G  784M  104G   1% /tmp
tmpfs                           25M  744K   25M   3% /var/log/audit_log_tmpfs
/dev/md125                     200M  7.4M  193M   4% /boot/efi
/dev/mapper/rootvg-lvvarcrash   50G  393M   50G   1% /var/crash
/dev/md0                        28T  2.6T   26T  10% /app
tmpfs                          202G  8.0K  202G   1% /run/user/12003
[dcbsr_dev@tpgds-aihub0008 ~]$ find /tmp -newer /tmp -maxdepth 3 2>/dev/null | head -20
[dcbsr_dev@tpgds-aihub0008 ~]$ find ~/.cache/deep_gemm/ -name "*.cubin" -o -name "*.so" 2>/dev/null | wc -l
0


bash# На 0008 - актуальный PID python:
pgrep -a python3 | grep sglang

# И сколько файлов открыто:
sudo lsof -p $(pgrep python3 | head -1) 2>/dev/null | wc -l
И проверь куда сейчас пишет deep_gemm — возможно путь другой:
bashfind /app ~/.cache /tmp -name "*.cubin" -newer /proc/1 2>/dev/null | grep -v triton | head -10




[dcbsr_dev@tpgds-aihub0008 ~]$ pgrep -a python3 | grep sglang
12885 python3 -m sglang.launch_server --model-path /app/models/Deepseek-R1/ --trust-remote-code --tp-size 16 --host 10.99.91.63 --port 30001 --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 --mem-fraction-static 0.8 --disaggregation-mode decode --disaggregation-transfer-backend nixl --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 --max-running-requests 128
13053 /app/sglang/sglang-0.5.9/bin/python3 -c from multiprocessing.resource_tracker import main;main(76)
[dcbsr_dev@tpgds-aihub0008 ~]$ sudo lsof -p $(pgrep python3 | head -1) 2>/dev/null | wc -l
357
[dcbsr_dev@tpgds-aihub0008 ~]$ find /app ~/.cache /tmp -name "*.cubin" -newer /proc/1 2>/dev/null | grep -v triton | head -10
[dcbsr_dev@tpgds-aihub0008 ~]$ 


# Где реально компилирует:
sudo lsof -p $(pgrep -f "scheduler_TP0") 2>/dev/null | grep -E "\.so|\.cubin|\.ptx|cache" | head -20

# Переменная окружения для пути кэша:
cat /proc/$(pgrep -f "scheduler_TP0")/environ | tr '\0' '\n' | grep -iE "cache|gemm|triton"


[dcbsr_dev@tpgds-aihub0007 ~]$ find ~/.cache/deep_gemm/ -type f | wc -l
0
[dcbsr_dev@tpgds-aihub0007 ~]$ sudo lsof -p $(pgrep -f "scheduler_TP0") 2>/dev/null | grep -E "\.so|\.cubin|\.ptx|cache" | head -20
[dcbsr_dev@tpgds-aihub0007 ~]$ cat /proc/$(pgrep -f "scheduler_TP0")/environ | tr '\0' '\n' | grep -iE "cache|gemm|triton"
DG_JIT_CACHE_DIR=/home/dcbsr_dev/.cache/deep_gemm
TORCHINDUCTOR_CACHE_DIR=/app/tmp/torchinductor_dcbsr_dev
SGLANG_DISABLE_OUTLINES_DISK_CACHE=0
[dcbsr_dev@tpgds-aihub0007 ~]$ 

find /app/tmp/torchinductor_dcbsr_dev -type f | wc -l
watch -n 15 'find /app/tmp/torchinductor_dcbsr_dev -type f | wc -l'


# На 0007 - простой тест без sglang:
python3 -c "
import torch
print('CUDA:', torch.cuda.is_available())
print('GPU count:', torch.cuda.device_count())
x = torch.randn(1000, 1000).cuda()
y = torch.randn(1000, 1000).cuda()
z = torch.matmul(x, y)
torch.cuda.synchronize()
print('matmul OK:', z.shape)
"
И сравни версию драйвера с 0003:
bash# На 0007 и 0003:
nvidia-smi | head -3
cat /proc/driver/nvidia/versionдрайвер точно не при чем7:36 PMДиагностировал зависание GPU после инициализации NCCLДиагностировал зависание GPU после инициализации NCCLТогда посмотрим что именно крутится на GPU:
bash# На 0007 - какие CUDA kernels выполняются:
nvidia-smi pmon -c 3 -s u


[dcbsr_dev@tpgds-aihub0007 ~]$ nvidia-smi pmon -c 3 -s u
# gpu         pid   type     sm    mem    enc    dec    jpg    ofa    command 
# Idx           #    C/G      %      %      %      %      %      %    name 
    0      13532     C     99      0      -      -      -      -    sglang::schedul
    1      13533     C     99      0      -      -      -      -    sglang::schedul
    2      13534     C     99      0      -      -      -      -    sglang::schedul
    3      13535     C     99      0      -      -      -      -    sglang::schedul
    4      13536     C     99      0      -      -      -      -    sglang::schedul
    5      13537     C     99      0      -      -      -      -    sglang::schedul
    6      13538     C     99      0      -      -      -      -    sglang::schedul
    7      13539     C     99      0      -      -      -      -    sglang::schedul
    0      13532     C     99      0      -      -      -      -    sglang::schedul
    1      13533     C     99      0      -      -      -      -    sglang::schedul
    2      13534     C     99      0      -      -      -      -    sglang::schedul
    3      13535     C     99      0      -      -      -      -    sglang::schedul
    4      13536     C     99      0      -      -      -      -    sglang::schedul
    5      13537     C     99      0      -      -      -      -    sglang::schedul
    6      13538     C     99      0      -      -      -      -    sglang::schedul
    7      13539     C     99      0      -      -      -      -    sglang::schedul
    0      13532     C     99      0      -      -      -      -    sglang::schedul
    1      13533     C     99      0      -      -      -      -    sglang::schedul
    2      13534     C     99      0      -      -      -      -    sglang::schedul
    3      13535     C    100      0      -      -      -      -    sglang::schedul
    4      13536     C     99      0      -      -      -      -    sglang::schedul
    5      13537     C     99      0      -      -      -      -    sglang::schedul
    6      13538     C     99      0      -      -      -      -    sglang::schedul
    7      13539     C     99      0      -      -      -      -    sglang::schedul
[dcbsr_dev@tpgds-aihub0007 ~]$ cat /proc/driver/nvidia/version
NVRM version: NVIDIA UNIX Open Kernel Module for x86_64  590.48.01  Release Build  (root@tpgds-aihub0007)  Mon Mar  2 03:02:25 PM MSK 2026
GCC version:  gcc version 11.5.0 20240719 (Platform V SberLinux 11.5.0-11) (GCC) 
[dcbsr_dev@tpgds-aihub0007 ~]$ 


















[dcbsr_dev@tpgds-aihub0007 ~]$ systemctl status nvidia-fabricmanager
● nvidia-fabricmanager.service - NVIDIA fabric manager service
     Loaded: loaded (/usr/lib/systemd/system/nvidia-fabricmanager.service; enabled; preset: enabled)
     Active: active (running) since Tue 2026-03-03 18:39:19 MSK; 1h 4min ago
    Process: 4776 ExecStartPre=/usr/bin/nvidia-fabricmanager-start.sh --mode precheck (code=exited, status=0/SUCCESS)
    Process: 5037 ExecStart=/usr/bin/nvidia-fabricmanager-start.sh --mode start (code=exited, status=0/SUCCESS)
   Main PID: 5183 (nv-fabricmanage)
      Tasks: 18 (limit: 3355442)
     Memory: 23.4M (peak: 30.9M)
        CPU: 2.659s
     CGroup: /system.slice/nvidia-fabricmanager.service
             └─5183 /usr/bin/nv-fabricmanager -c /usr/share/nvidia/nvswitch/fabricmanager.cfg

Mar 03 18:38:51 tpgds-aihub0007 systemd[1]: Starting NVIDIA fabric manager service...
Mar 03 18:38:51 tpgds-aihub0007 nvidia-fabricmanager-start.sh[5037]: Detected Pre-NVL5 system
Mar 03 18:39:18 tpgds-aihub0007 nv-fabricmanager[5183]: Connected to 1 node.
Mar 03 18:39:19 tpgds-aihub0007 nv-fabricmanager[5183]: Successfully configured all the available NVSwitches to route GPU NVLink traffic. NVLink Peer-to-Peer support will be enabled on>
Mar 03 18:39:19 tpgds-aihub0007 nvidia-fabricmanager-start.sh[5037]: Started "Nvidia Fabric Manager"
Mar 03 18:39:19 tpgds-aihub0007 systemd[1]: Started NVIDIA fabric manager service.
Mar 03 18:39:57 tpgds-aihub0007 nv-fabricmanager[5183]: detected NVSwitch non-fatal error 22013 on NodeId 0 on NVSwitch pci bus id 00000000:08:00.0 physical id 3 port 60






[dcbsr_dev@tpgds-aihub0008 ~]$ systemctl status nvidia-fabricmanager
● nvidia-fabricmanager.service - NVIDIA fabric manager service
     Loaded: loaded (/usr/lib/systemd/system/nvidia-fabricmanager.service; enabled; preset: enabled)
     Active: active (running) since Tue 2026-03-03 18:39:35 MSK; 1h 4min ago
    Process: 4806 ExecStartPre=/usr/bin/nvidia-fabricmanager-start.sh --mode precheck (code=exited, status=0/SUCCESS)
    Process: 5075 ExecStart=/usr/bin/nvidia-fabricmanager-start.sh --mode start (code=exited, status=0/SUCCESS)
   Main PID: 5219 (nv-fabricmanage)
      Tasks: 18 (limit: 3355442)
     Memory: 24.1M (peak: 32.7M)
        CPU: 2.748s
     CGroup: /system.slice/nvidia-fabricmanager.service
             └─5219 /usr/bin/nv-fabricmanager -c /usr/share/nvidia/nvswitch/fabricmanager.cfg

Mar 03 18:39:05 tpgds-aihub0008 systemd[1]: Starting NVIDIA fabric manager service...
Mar 03 18:39:05 tpgds-aihub0008 nvidia-fabricmanager-start.sh[5075]: Detected Pre-NVL5 system
Mar 03 18:39:35 tpgds-aihub0008 nv-fabricmanager[5219]: Connected to 1 node.
Mar 03 18:39:35 tpgds-aihub0008 nv-fabricmanager[5219]: Successfully configured all the available NVSwitches to route GPU NVLink traffic. NVLink Peer-to-Pe>
Mar 03 18:39:35 tpgds-aihub0008 nvidia-fabricmanager-start.sh[5075]: Started "Nvidia Fabric Manager"
Mar 03 18:39:35 tpgds-aihub0008 systemd[1]: Started NVIDIA fabric manager service.

Попробуй отключить NVSwitch для NCCL — заставь использовать только PCIe/RoCE:

bash
NCCL_NVLS_ENABLE=0 \
NCCL_P2P_DISABLE=1 \
NCCL_SHM_DISABLE=0 \
Или проверь какой GPU висит на порту 60:

bash
# На 0007:
nvidia-smi nvlink -s -i 0,1,2,3,4,5,6,7 2>/dev/null | grep -E "Error|Inactive|port 60"

# И посмотри статус всех NVLink портов:
nvidia-smi nvlink -e -i 0 2>/dev/null | head -20
Если один GPU имеет дефектный NVLink порт — NCCL может вечно ждать передачи через него.





[  117.984502] nvidia-nvswitch3: SXid (PCI:0000:08:00.0): 22013, Non-fatal, Link 60 Minion Link DLREQ interrupt
[  117.985304] nvidia-nvswitch3: SXid (PCI:0000:08:00.0): 22013, Severity 0 Engine instance 60 Sub-engine instance 00
[  117.986807] nvidia-nvswitch3: SXid (PCI:0000:08:00.0): 22013, Data {0x0000003c, 0x0000003c, 0x00000000, 0x0000003c, 0x80000302, 0x00000000, 0x00000000, 0x00000000, 0x00000000}



 4428.423595] bond0: (slave enp83s0f0np0): speed changed to 0 on port 2
[ 4428.434938] bond0: (slave enp83s0f0np0): link status definitely down, disabling slave
[ 4435.115811] mlx5_core 0000:53:00.0 enp83s0f0np0: Link down
[ 4435.195065] bond0: (slave enp83s0f0np0): link status definitely down, disabling slave
[ 4441.768101] mlx5_core 0000:53:00.0 enp83s0f0np0: Link up
[ 4441.769587] mlx5_core 0000:53:00.0 mlx5_3: Port: 1 Link ACTIVE
[ 4441.852238] bond0: (slave enp83s0f0np0): link status definitely up, 100000 Mbps full duplex
[ 4443.968257] mlx5_core 0000:53:00.0 enp83s0f0np0: Link down
[ 4443.974372] mlx5_core 0000:53:00.0 mlx5_3: Port: 1 Link DOWN
[ 4443.975417] bond0: (slave enp83s0f0np0): speed changed to 0 on port 2
[ 4444.035309] bond0: (slave enp83s0f0np0): link status definitely down, disabling slave
[ 4450.318539] mlx5_core 0000:53:00.0 enp83s0f0np0: Link up
[ 4450.320122] mlx5_core 0000:53:00.0 mlx5_3: Port: 1 Link ACTIVE
[ 4450.381185] bond0: (slave enp83s0f0np0): link status definitely up, 100000 Mbps full duplex
[ 4450.918521] mlx5_core 0000:53:00.0 enp83s0f0np0: Link down
[ 4450.934787] mlx5_core 0000:53:00.0 mlx5_3: Port: 1 Link DOWN
[ 4450.935194] bond0: (slave enp83s0f0np0): speed changed to 0 on port 2
[ 4451.003393] bond0: (slave enp83s0f0np0): link status definitely down, disabling slave

Попробуй отключить NVLink P2P — заставить NCCL использовать только PCIe:

bash
NCCL_P2P_DISABLE=1 \
NCCL_NVLS_ENABLE=0 \
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 ...
И проверь какой GPU на битом NVLink порту:

bash
# На 0007:
nvidia-smi nvlink -s 2>/dev/null | grep -i "inactive\|error\|down"
Если NCCL_P2P_DISABLE=1 поможет — значит проблема именно в NVSwitch3 Link 60.

Разработал тестовые команды для изоляции неисправного сервера
Разработал тестовые команды для изоляции неисправного сервера
Тест 1: 0003 (rank 0) + 0007 (rank 1)

0003:

bash
SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 \
SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 \
NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.49 --port 30001 \
  --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 \
  --max-running-requests 128
0007:

bash
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
Тест 2: 0003 (rank 0) + 0008 (rank 1)

0003 — та же команда что выше.

0008:

bash
LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64:$LD_LIBRARY_PATH \
SGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
Логика диагностики:

Тест 1 завис → 0007 виноват (NVSwitch Link 60)
Тест 2 завис → 0008 виноват
Оба зависли → проблема в межсерверной совместимости Supermicro + noname

# На 0007 - тест allreduce между 8 GPU:
python3 -c "
import torch
import torch.distributed as dist
import os

os.environ['NCCL_NVLS_ENABLE'] = '0'

dist.init_process_group('nccl', init_method='tcp://10.99.91.59:29500', rank=0, world_size=8)
torch.cuda.set_device(0)
x = torch.ones(1000).cuda()
dist.all_reduce(x)
torch.cuda.synchronize()
print('allreduce OK:', x[0].item())
dist.destroy_process_group()
"

python3 -c "
import torch
import torch.distributed as dist
import os

os.environ['NCCL_NVLS_ENABLE'] = '0'
os.environ['GLOO_SOCKET_FAMILY'] = 'AF_INET'

dist.init_process_group('nccl', init_method='tcp://10.99.91.59:29500?use_libuv=0', rank=0, world_size=1)
torch.cuda.set_device(0)
x = torch.ones(1000).cuda()
dist.all_reduce(x)
torch.cuda.synchronize()
print('allreduce OK:', x[0].item())
dist.destroy_process_group()
"


# На 0008 - все 8 GPU честный тест:
NCCL_NVLS_ENABLE=0 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 \
NCCL_IB_GID_INDEX=3 \
torchrun --nproc_per_node=8 --master_addr=10.99.91.63 --master_port=29500 \
  -c "
import torch
import torch.distributed as dist
dist.init_process_group('nccl')
rank = dist.get_rank()
x = torch.ones(1000).cuda(rank)
dist.all_reduce(x)
torch.cuda.synchronize()
print(f'rank {rank} OK: {x[0].item()}')
"


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 torchrun --nproc_per_node=8 --master_addr=10.99.91.63 --master_port=29500   -c "import torch
import torch.distributed as dist
dist.init_process_group('nccl')
rank = dist.get_rank()
x = torch.ones(1000).cuda(rank)
dist.all_reduce(x)
torch.cuda.synchronize()
print(f'rank {rank} OK: {x[0].item()}')
"
usage: torchrun [-h] [--nnodes NNODES] [--nproc-per-node NPROC_PER_NODE]
                [--rdzv-backend RDZV_BACKEND] [--rdzv-endpoint RDZV_ENDPOINT] [--rdzv-id RDZV_ID]
                [--rdzv-conf RDZV_CONF] [--standalone] [--max-restarts MAX_RESTARTS]
                [--monitor-interval MONITOR_INTERVAL] [--start-method {spawn,fork,forkserver}]
                [--event-log-handler EVENT_LOG_HANDLER] [--role ROLE] [-m] [--no-python]
                [--run-path] [--log-dir LOG_DIR] [-r REDIRECTS] [-t TEE]
                [--local-ranks-filter LOCAL_RANKS_FILTER] [--node-rank NODE_RANK]
                [--master-addr MASTER_ADDR] [--master-port MASTER_PORT] [--local-addr LOCAL_ADDR]
                [--logs-specs LOGS_SPECS] [--numa-binding {node,socket,exclusive,core-complex}]
                training_script ...
torchrun: error: unrecognized arguments: -c
