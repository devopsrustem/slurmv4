

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
