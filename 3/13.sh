tpgds-aihub0007:177792:177792 [5] NCCL INFO Init timings - ncclCommInitRank: rank 5 nranks 16 total 1.58 (kernels 0.26, alloc 0.97, bootstrap 0.07, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0007:177794:177794 [7] NCCL INFO AllReduce: opCount 0 sendbuff 0x7fb201e00400 recvbuff 0x7fb201e00400 count 1 datatype 7 op 0 root 0 comm 0x558f79e65f00 [nranks=16] stream 0x558f83fe3ca0
tpgds-aihub0007:177794:177794 [7] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177790:177790 [3] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f992fe00400 recvbuff 0x7f992fe00400 count 1 datatype 7 op 0 root 0 comm 0x5563c6374600 [nranks=16] stream 0x5563d04f1860
tpgds-aihub0007:177790:177790 [3] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177791:177791 [4] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f504fe00400 recvbuff 0x7f504fe00400 count 1 datatype 7 op 0 root 0 comm 0x5562bf45e640 [nranks=16] stream 0x5562c95dacf0
tpgds-aihub0007:177791:177791 [4] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177788:177788 [1] NCCL INFO AllReduce: opCount 0 sendbuff 0x7efebde00400 recvbuff 0x7efebde00400 count 1 datatype 7 op 0 root 0 comm 0x56097c3c37a0 [nranks=16] stream 0x56098653db60
tpgds-aihub0007:177788:177788 [1] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177787:177787 [0] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f97e1e00400 recvbuff 0x7f97e1e00400 count 1 datatype 7 op 0 root 0 comm 0x557a873708c0 [nranks=16] stream 0x557a912294f0
tpgds-aihub0007:177787:177787 [0] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177787:177787 [0] NCCL INFO AllReduce: 4 Bytes -> Algo TREE proto LL channel{Lo..Hi}={0..0}
tpgds-aihub0007:177792:177792 [5] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f4b8de00400 recvbuff 0x7f4b8de00400 count 1 datatype 7 op 0 root 0 comm 0x5630b3a08490 [nranks=16] stream 0x5630bdb840e0
tpgds-aihub0007:177792:177792 [5] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177789:177789 [2] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f6655e00400 recvbuff 0x7f6655e00400 count 1 datatype 7 op 0 root 0 comm 0x5630707be7f0 [nranks=16] stream 0x56307a93e600
tpgds-aihub0007:177789:177789 [2] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:177793:177793 [6] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f2457e00400 recvbuff 0x7f2457e00400 count 1 datatype 7 op 0 root 0 comm 0x558e404ecab0 [nranks=16] stream 0x558e4a66f540
tpgds-aihub0007:177793:177793 [6] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)

https://github.com/NVIDIA/nccl/issues/1534


NCCL_ALGO=Ring \
NCCL_PROTO=Simple \
Это принудительно переключит на Ring алгоритм вместо Tree.
Убей текущие процессы на 0007/0008:
bashpkill -f sglang


python3 -c "import torch; print(torch.cuda.nccl.version())"
# или
find / -name "libnccl.so*" 2>/dev/null
Но обновление NCCL в production среде — это риск, нужно согласование. Плюс SGLang 0.5.9 завязан на конкретную версию NCCL через PyTorch.
Быстрее и безопаснее — просто добавить NCCL_ALGO=Ring NCCL_PROTO=Simple. Это решает проблему без обновления, именно так и советуют в комментариях к тому же issue как workaround.
Попробуй сначала Ring/Simple — если заработает, обновление не нужно.мы пока в тестовой11:54 AMПризнал допустимость обновления в тестовой средеПризнал допустимость обновления в тестовой средеThe user is saying they're in a test environment, so updating NCCL is fine.DoneТогда попробуй обновить NCCL через pip:
bashpip install nvidia-nccl-cu12 --upgrade --break-system-packages
Или через conda если окружение на conda:
bashconda install -c conda-forge nccl
Но сначала проверь версию чтобы понимать с чего стартуем:
bashpython3 -c "import torch; print(torch.cuda.nccl.version())"
И параллельно — попробуй NCCL_ALGO=Ring без обновления, это займёт 2 минуты и может сразу решить проблему. Если сработает — обновление вообще не нужно.

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 models]$ python3 -c "import torch; print(torch.cuda.nccl.version())"
(2, 27, 5)


tpgds-aihub0007:177788:177788 [1] NCCL INFO NET/IB : Made virtual device [0] name=mlx5_0 speed=400000 ndevs=1
tpgds-aihub0007:177790:177790 [3] NCCL INFO NET/IB: [2] mlx5_2:uverbs2:1/RoCE provider=Mlx5 speed=400000 context=0x5563d0080110 pciPath=/sys/devices/pci0000:37/0000:37:01.0/0000:38:00.0/0000:39:01.0/0000:3b:00.0 ar=0
tpgds-aihub0007:177790:177790 [3] NCCL INFO NET/IB : Made virtual device [2] name=mlx5_2 speed=400000 ndevs=1
tpgds-aihub0007:177794:177794 [7] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:177794:177794 [7] NCCL INFO NET/IB: [2] mlx5_2:uverbs2:1/RoCE provider=Mlx5 speed=400000 context=0x558f83b735d0 pciPath=/sys/devices/pci0000:37/0000:37:01.0/0000:38:00.0/0000:39:01.0/0000:3b:00.0 ar=0
tpgds-aihub0007:177794:177794 [7] NCCL INFO NET/IB : Made virtual device [2] name=mlx5_2 speed=400000 ndevs=1
tpgds-aihub0007:177793:177793 [6] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:177789:177789 [2] NCCL INFO NET/Plugin: Could not find: libnccl-net.so. 
tpgds-aihub0007:177789:177789 [2] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0007:177793:177793 [6] NCCL INFO NET/IB: [0] mlx5_0:uverbs0:1/RoCE provider=Mlx5 speed=400000 context=0x558e4a17b8d0 pciPath=/sys/devices/pci0000:15/0000:15:01.0/0000:16:00.0/0000:17:01.0/0000:19:00.0 ar=0
tpgds-aihub0007:177793:177793 [6] NCCL INFO NET/IB : Made virtual device [0] name=mlx5_0 speed=400000 ndevs=1
tpgds-aihub0007:177789:177789 [2] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0007:177789:177789 [2] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0007:177787:177787 [0] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:177788:177788 [1] NCCL INFO Call to mlx5dv_get_data_direct_sysfs_path failed with error No such device errno 19
tpgds-aihub0007:177787:177787 [0] NCCL INFO NET/IB: [5] mlx5_5:uverbs5:1/RoCE provider=Mlx5 speed=400000 context=0x557a90dfa330 pciPath=/sys/devices/pci0000:59/0000:59:01.0/0000:5a:00.0/0000:5b:00.0/0000:5c:00.0 ar=0


[dcbsr_dev@tpgds-aihub0003 ~]$ sudo find / -name libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda12/lib/nccl_ofi/libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/lib/nccl_ofi/libnccl-net.so
[dcbsr_dev@tpgds-aihub0003 ~]$ 


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 models]$ sudo find / -name libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda12/lib/nccl_ofi/libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/lib/nccl_ofi/libnccl-net.so

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 models]$ 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 models]$ sudo find / -name libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda12/lib/nccl_ofi/libnccl-net.so
/opt/nvidia/nvidia_hpc_benchmarks_mpich/cuda13/lib/nccl_ofi/libnccl-net.so


NCCL_ALGO=Ring \
NCCL_PROTO=Simple \
NCCL_TREE_THRESHOLD=0 \


tpgds-aihub0007:185306:185306 [4] NCCL INFO ncclCommInitRank comm 0x5635705dda90 rank 4 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0x221dee7fa4558566 - Init COMPLETE
tpgds-aihub0007:185302:185302 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:185304:185304 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:185308:185308 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:185303:185303 [1] NCCL INFO Init timings - ncclCommInitRank: rank 1 nranks 16 total 1.57 (kernels 0.25, alloc 0.98, bootstrap 0.04, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.22, rest 0.00)
tpgds-aihub0007:185306:185306 [4] NCCL INFO Init timings - ncclCommInitRank: rank 4 nranks 16 total 1.54 (kernels 0.25, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.07, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0007:185302:185302 [0] NCCL INFO ncclCommInitRank comm 0x55a0be47d620 rank 0 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0x221dee7fa4558566 - Init COMPLETE
tpgds-aihub0007:185304:185304 [2] NCCL INFO ncclCommInitRank comm 0x55ff90c097e0 rank 2 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0x221dee7fa4558566 - Init COMPLETE
tpgds-aihub0007:185308:185308 [6] NCCL INFO ncclCommInitRank comm 0x55eac75f37e0 rank 6 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0x221dee7fa4558566 - Init COMPLETE
tpgds-aihub0007:185302:185302 [0] NCCL INFO Init timings - ncclCommInitRank: rank 0 nranks 16 total 1.58 (kernels 0.25, alloc 0.86, bootstrap 0.17, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.22, rest 0.00)
tpgds-aihub0007:185304:185304 [2] NCCL INFO Init timings - ncclCommInitRank: rank 2 nranks 16 total 1.54 (kernels 0.25, alloc 0.99, bootstrap 0.00, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.22, rest 0.00)
tpgds-aihub0007:185308:185308 [6] NCCL INFO Init timings - ncclCommInitRank: rank 6 nranks 16 total 1.54 (kernels 0.25, alloc 0.99, bootstrap 0.01, allgathers 0.01, topo 0.07, graphs 0.00, connections 0.22, rest 0.00)
tpgds-aihub0007:185308:185308 [6] NCCL INFO AllReduce: opCount 0 sendbuff 0x7fb8ade00400 recvbuff 0x7fb8ade00400 count 1 datatype 7 op 0 root 0 comm 0x55eac75f37e0 [nranks=16] stream 0x55ead176e920
tpgds-aihub0007:185308:185308 [6] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185307:185307 [5] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f8d11e00400 recvbuff 0x7f8d11e00400 count 1 datatype 7 op 0 root 0 comm 0x56297849a330 [nranks=16] stream 0x56298261b6d0
tpgds-aihub0007:185307:185307 [5] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185302:185302 [0] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f757de00400 recvbuff 0x7f757de00400 count 1 datatype 7 op 0 root 0 comm 0x55a0be47d620 [nranks=16] stream 0x55a0c85fa4a0
tpgds-aihub0007:185302:185302 [0] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185302:185302 [0] NCCL INFO AllReduce: 4 Bytes -> Algo RING proto SIMPLE channel{Lo..Hi}={0..0}
tpgds-aihub0007:185303:185303 [1] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f6713e00400 recvbuff 0x7f6713e00400 count 1 datatype 7 op 0 root 0 comm 0x563d06699bf0 [nranks=16] stream 0x563d10818b20
tpgds-aihub0007:185303:185303 [1] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185305:185305 [3] NCCL INFO AllReduce: opCount 0 sendbuff 0x7fd39de00400 recvbuff 0x7fd39de00400 count 1 datatype 7 op 0 root 0 comm 0x561cb2ec2cc0 [nranks=16] stream 0x561cbd03ee20
tpgds-aihub0007:185305:185305 [3] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185304:185304 [2] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f8c71e00400 recvbuff 0x7f8c71e00400 count 1 datatype 7 op 0 root 0 comm 0x55ff90c097e0 [nranks=16] stream 0x55ff9ad83490
tpgds-aihub0007:185304:185304 [2] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185306:185306 [4] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f7a97e00400 recvbuff 0x7f7a97e00400 count 1 datatype 7 op 0 root 0 comm 0x5635705dda90 [nranks=16] stream 0x56357a75dfe0
tpgds-aihub0007:185306:185306 [4] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)
tpgds-aihub0007:185309:185309 [7] NCCL INFO AllReduce: opCount 0 sendbuff 0x7f4311e00400 recvbuff 0x7f4311e00400 count 1 datatype 7 op 0 root 0 comm 0x55e11d052a20 [nranks=16] stream 0x55e1271cb4f0
tpgds-aihub0007:185309:185309 [7] NCCL INFO misc/utils.cc:233 memory stack hunk malloc(65536)

[2026-03-03 12:11:38] tpgds-aihub0007:185303:186751 [1] transport/net_ib.cc:2453 NCCL WARN NET/IB: Got completion from peer 10.99.91.63<51161> with status=4 opcode=32614 len=32614 vendor err 81 (Send) localGid ::ffff:10.99.92.59 remoteGids::ffff:10.99.91.63 hca mlx5_1
tpgds-aihub0007:185303:186751 [1] NCCL INFO transport/net.cc:1227 -> 6

на этом зависает


0007:
bashSGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring NCCL_PROTO=Simple \
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
bashSGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 \
SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 \
NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 \
NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX \
NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 \
NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring NCCL_PROTO=Simple \
PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false \
/opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128


как это происходит на 3й ноде (они отлично стартуют 3 и 6)
[W303 11:06:01.482274288 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
[W303 11:06:01.488657566 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 0 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 1 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 2 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 3 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 7 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 4 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 5 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 6 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 0 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[2026-03-03 11:06:05 TP0] sglang is using nccl==2.27.5
[Gloo] Rank 1 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 2 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 3 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 5 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 4 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 7 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 6 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[2026-03-03 11:06:07 TP0] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP1] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP2] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP3] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP4] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP5] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP6] Custom allreduce is disabled because this process group spans across nodes.
[2026-03-03 11:06:07 TP7] Custom allreduce is disabled because this process group spans across nodes.
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0


как это происходит на 7й
mily not supported by protocol).
[W303 12:25:46.083695509 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 0 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 1 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 2 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 3 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 5 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 4 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 6 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 7 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 0 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[2026-03-03 12:25:47 TP0] sglang is using nccl==2.27.5
[Gloo] Rank 1 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 3 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 4 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 6 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 5 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 7 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 2 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15

висит

8я
upported by protocol).
[W303 12:25:43.431958679 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
висит








  по очереди то как запускаю
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ NCCL_DEBUG=INFO^CCL_DEBUG=INFO NCCL_DEBUG_SUBSYS=ALL SGLANG_HOST_IP=10.99.91.59 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.59 SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring NCCL_PROTO=Simple PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/ --trust-remote-code   --tp-size 16 --host 10.99.91.59 --port 30001   --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0   --mem-fraction-static 0.8 --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11   --max-running-requests 128

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_DEBUG=INFO SGLANG_HOST_IP=10.99.91.63 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.63 SGLANG_LOCAL_IP_NIC=enp25s0np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=enp25s0np0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 _TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 NCCL_TREE_THRESHOLD=0 NCCL_ALGO=Ring NCCL_PROTO=Simple PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/ --trust-remote-code   --tp-size 16 --host 10.99.91.63 --port 30001   --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1   --mem-fraction-static 0.8 --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,m_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11   --max-running-requests 128


7я
pgds-aihub0007:196831:196831 [1] NCCL INFO Channel 02/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0007:196831:196831 [1] NCCL INFO Channel 03/0 : 1[1] -> 0[0] via P2P/IPC
tpgds-aihub0007:196837:196837 [7] NCCL INFO Connected all trees
tpgds-aihub0007:196833:196833 [3] NCCL INFO Connected all trees
tpgds-aihub0007:196836:196836 [6] NCCL INFO Connected all trees
tpgds-aihub0007:196834:196834 [4] NCCL INFO Connected all trees
tpgds-aihub0007:196835:196835 [5] NCCL INFO Connected all trees
tpgds-aihub0007:196832:196832 [2] NCCL INFO Connected all trees
tpgds-aihub0007:196837:198225 [7] NCCL INFO [Proxy Progress] Device 7 CPU core 31
tpgds-aihub0007:196834:198226 [4] NCCL INFO [Proxy Progress] Device 4 CPU core 35
tpgds-aihub0007:196836:198227 [6] NCCL INFO [Proxy Progress] Device 6 CPU core 31
tpgds-aihub0007:196835:198228 [5] NCCL INFO [Proxy Progress] Device 5 CPU core 31
tpgds-aihub0007:196833:198229 [3] NCCL INFO [Proxy Progress] Device 3 CPU core 26
tpgds-aihub0007:196832:198230 [2] NCCL INFO [Proxy Progress] Device 2 CPU core 31
tpgds-aihub0007:196837:196837 [7] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196837:196837 [7] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196837:196837 [7] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196837:196837 [7] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196834:196834 [4] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196834:196834 [4] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196834:196834 [4] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196834:196834 [4] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196831:196831 [1] NCCL INFO Connected all trees
tpgds-aihub0007:196830:196830 [0] NCCL INFO Connected all trees
tpgds-aihub0007:196835:196835 [5] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196835:196835 [5] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196835:196835 [5] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196835:196835 [5] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196836:196836 [6] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196836:196836 [6] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196836:196836 [6] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196836:196836 [6] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196830:196830 [0] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196830:196830 [0] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196830:196830 [0] NCCL INFO Enabled NCCL Func/Proto/Algo Matrix:
     Function |       LL     LL128    Simple   |          Tree           Ring  CollNetDirect   CollNetChain           NVLS       NVLSTree            PAT  
    Broadcast |        0         0         1   |             0              1              0              0              0              0              0  
       Reduce |        0         0         1   |             0              1              0              0              0              0              0  
    AllGather |        0         0         1   |             0              1              0              0              0              0              0  
ReduceScatter |        0         0         1   |             0              1              0              0              0              0              0  
    AllReduce |        0         0         1   |             0              1              0              0              0              0              0  

tpgds-aihub0007:196830:196830 [0] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196830:196830 [0] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196833:196833 [3] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196833:196833 [3] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196833:196833 [3] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196833:196833 [3] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196832:196832 [2] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196830:196830 [0] NCCL INFO CC Off, workFifoBytes 1048576
tpgds-aihub0007:196832:196832 [2] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196832:196832 [2] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196832:196832 [2] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196831:198231 [1] NCCL INFO [Proxy Progress] Device 1 CPU core 20
tpgds-aihub0007:196831:196831 [1] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0007:196831:196831 [1] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0007:196831:196831 [1] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0007:196831:196831 [1] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0007:196833:196833 [3] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196831:196831 [1] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196833:196833 [3] NCCL INFO ncclCommInitRank comm 0x562ede2778a0 rank 3 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196831:196831 [1] NCCL INFO ncclCommInitRank comm 0x55ccc70de120 rank 1 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196833:196833 [3] NCCL INFO Init timings - ncclCommInitRank: rank 3 nranks 16 total 1.47 (kernels 0.25, alloc 1.00, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196831:196831 [1] NCCL INFO Init timings - ncclCommInitRank: rank 1 nranks 16 total 1.48 (kernels 0.26, alloc 0.99, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.14, rest 0.00)
tpgds-aihub0007:196832:196832 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196832:196832 [2] NCCL INFO ncclCommInitRank comm 0x5581e75ffb50 rank 2 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196832:196832 [2] NCCL INFO Init timings - ncclCommInitRank: rank 2 nranks 16 total 1.50 (kernels 0.25, alloc 0.98, bootstrap 0.06, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196837:196837 [7] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196837:196837 [7] NCCL INFO ncclCommInitRank comm 0x55d258a71780 rank 7 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196837:196837 [7] NCCL INFO Init timings - ncclCommInitRank: rank 7 nranks 16 total 1.48 (kernels 0.25, alloc 1.00, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196835:196835 [5] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196835:196835 [5] NCCL INFO ncclCommInitRank comm 0x556e2352ce30 rank 5 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196835:196835 [5] NCCL INFO Init timings - ncclCommInitRank: rank 5 nranks 16 total 1.49 (kernels 0.25, alloc 1.01, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196836:196836 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196836:196836 [6] NCCL INFO ncclCommInitRank comm 0x55867f7cbb60 rank 6 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196836:196836 [6] NCCL INFO Init timings - ncclCommInitRank: rank 6 nranks 16 total 1.47 (kernels 0.25, alloc 0.99, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196834:196834 [4] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196834:196834 [4] NCCL INFO ncclCommInitRank comm 0x55cba05b8c10 rank 4 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196834:196834 [4] NCCL INFO Init timings - ncclCommInitRank: rank 4 nranks 16 total 1.50 (kernels 0.25, alloc 1.01, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)
tpgds-aihub0007:196830:196830 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0007:196830:196830 [0] NCCL INFO ncclCommInitRank comm 0x5567682677b0 rank 0 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0007:196830:196830 [0] NCCL INFO Init timings - ncclCommInitRank: rank 0 nranks 16 total 1.51 (kernels 0.25, alloc 0.86, bootstrap 0.20, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.02)

[2026-03-03 12:35:26] tpgds-aihub0007:196830:198223 [0] transport/net_ib.cc:2453 NCCL WARN NET/IB: Got completion from peer 10.99.91.63<36473> with status=4 opcode=0 len=0 vendor err 81 (Send) localGid ::ffff:10.99.91.59 remoteGids::ffff:10.99.91.63 hca mlx5_0
tpgds-aihub0007:196830:198223 [0] NCCL INFO transport/net.cc:1227 -> 6

висит

8я

pgds-aihub0008:181415:181415 [4] NCCL INFO Bootstrap timings total 0.037958 (create 0.000024, send 0.000479, recv 0.020151, ring 0.005293, delay 0.000000)
tpgds-aihub0008:181414:181414 [3] NCCL INFO Bootstrap timings total 0.007621 (create 0.000021, send 0.000301, recv 0.000655, ring 0.001561, delay 0.000000)
tpgds-aihub0008:181412:181412 [1] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181415:181415 [4] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181414:181414 [3] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181411:181411 [0] NCCL INFO MNNVL busId 0x18000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181417:181417 [6] NCCL INFO Bootstrap timings total 0.007148 (create 0.000022, send 0.000427, recv 0.000767, ring 0.003465, delay 0.000000)
tpgds-aihub0008:181418:181418 [7] NCCL INFO Bootstrap timings total 0.013872 (create 0.000023, send 0.000428, recv 0.000699, ring 0.004143, delay 0.000000)
tpgds-aihub0008:181417:181417 [6] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181416:181416 [5] NCCL INFO Bootstrap timings total 0.019536 (create 0.000021, send 0.000514, recv 0.012682, ring 0.003696, delay 0.000000)
tpgds-aihub0008:181418:181418 [7] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181416:181416 [5] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:181413:181413 [2] NCCL INFO MNNVL busId 0x3a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181415:181415 [4] NCCL INFO MNNVL busId 0x9a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181414:181414 [3] NCCL INFO MNNVL busId 0x5d000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181412:181412 [1] NCCL INFO MNNVL busId 0x2a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181418:181418 [7] NCCL INFO MNNVL busId 0xdb000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181416:181416 [5] NCCL INFO MNNVL busId 0xab000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181417:181417 [6] NCCL INFO MNNVL busId 0xba000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:181415:181415 [4] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181412:181412 [1] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181415:181415 [4] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181411:181411 [0] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181412:181412 [1] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181418:181418 [7] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181416:181416 [5] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181413:181413 [2] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181417:181417 [6] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181414:181414 [3] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:181411:181411 [0] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181418:181418 [7] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181416:181416 [5] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181413:181413 [2] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181414:181414 [3] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181417:181417 [6] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:181411:181411 [0] NCCL INFO comm 0x5584f0195160 rank 8 nRanks 16 nNodes 2 localRanks 8 localRank 0 MNNVL 0
tpgds-aihub0008:181411:181411 [0] NCCL INFO Trees [0] 9/-1/-1->8->0 [1] 9/-1/-1->8->0 [2] 9/0/-1->8->-1 [3] 9/0/-1->8->-1
tpgds-aihub0008:181411:181411 [0] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181412:181412 [1] NCCL INFO comm 0x556e4ac80ae0 rank 9 nRanks 16 nNodes 2 localRanks 8 localRank 1 MNNVL 0
tpgds-aihub0008:181412:181412 [1] NCCL INFO Trees [0] 10/-1/-1->9->8 [1] 10/-1/-1->9->8 [2] 10/-1/-1->9->8 [3] 10/-1/-1->9->8
tpgds-aihub0008:181412:181412 [1] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181418:181418 [7] NCCL INFO comm 0x56545e7b5730 rank 15 nRanks 16 nNodes 2 localRanks 8 localRank 7 MNNVL 0
tpgds-aihub0008:181413:181413 [2] NCCL INFO comm 0x55c103b0cae0 rank 10 nRanks 16 nNodes 2 localRanks 8 localRank 2 MNNVL 0
tpgds-aihub0008:181417:181417 [6] NCCL INFO comm 0x55f7c86465b0 rank 14 nRanks 16 nNodes 2 localRanks 8 localRank 6 MNNVL 0
tpgds-aihub0008:181415:181415 [4] NCCL INFO comm 0x559a0bcabd20 rank 12 nRanks 16 nNodes 2 localRanks 8 localRank 4 MNNVL 0
tpgds-aihub0008:181414:181414 [3] NCCL INFO comm 0x557ef1c5a800 rank 11 nRanks 16 nNodes 2 localRanks 8 localRank 3 MNNVL 0
tpgds-aihub0008:181416:181416 [5] NCCL INFO comm 0x55e5b54c2530 rank 13 nRanks 16 nNodes 2 localRanks 8 localRank 5 MNNVL 0
tpgds-aihub0008:181418:181418 [7] NCCL INFO Trees [0] -1/-1/-1->15->14 [1] -1/-1/-1->15->14 [2] -1/-1/-1->15->14 [3] -1/-1/-1->15->14
tpgds-aihub0008:181413:181413 [2] NCCL INFO Trees [0] 11/-1/-1->10->9 [1] 11/-1/-1->10->9 [2] 11/-1/-1->10->9 [3] 11/-1/-1->10->9
tpgds-aihub0008:181417:181417 [6] NCCL INFO Trees [0] 15/-1/-1->14->13 [1] 15/-1/-1->14->13 [2] 15/-1/-1->14->13 [3] 15/-1/-1->14->13
tpgds-aihub0008:181415:181415 [4] NCCL INFO Trees [0] 13/-1/-1->12->11 [1] 13/-1/-1->12->11 [2] 13/-1/-1->12->11 [3] 13/-1/-1->12->11
tpgds-aihub0008:181418:181418 [7] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181414:181414 [3] NCCL INFO Trees [0] 12/-1/-1->11->10 [1] 12/-1/-1->11->10 [2] 12/-1/-1->11->10 [3] 12/-1/-1->11->10
tpgds-aihub0008:181413:181413 [2] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181416:181416 [5] NCCL INFO Trees [0] 14/-1/-1->13->12 [1] 14/-1/-1->13->12 [2] 14/-1/-1->13->12 [3] 14/-1/-1->13->12
tpgds-aihub0008:181417:181417 [6] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181415:181415 [4] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181414:181414 [3] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181416:181416 [5] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:181411:181411 [0] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181412:181412 [1] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181418:181418 [7] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181413:181413 [2] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181417:181417 [6] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181416:181416 [5] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181415:181415 [4] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181411:182637 [0] NCCL INFO [Proxy Service] Device 0 CPU core 66
tpgds-aihub0008:181414:181414 [3] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:181416:182648 [5] NCCL INFO [Proxy Service UDS] Device 5 CPU core 12
tpgds-aihub0008:181418:182649 [7] NCCL INFO [Proxy Service UDS] Device 7 CPU core 123
tpgds-aihub0008:181411:182639 [0] NCCL INFO [Proxy Service UDS] Device 0 CPU core 111
tpgds-aihub0008:181414:182652 [3] NCCL INFO [Proxy Service UDS] Device 3 CPU core 66
tpgds-aihub0008:181412:182640 [1] NCCL INFO [Proxy Service UDS] Device 1 CPU core 46
tpgds-aihub0008:181412:182638 [1] NCCL INFO [Proxy Service] Device 1 CPU core 45
tpgds-aihub0008:181413:182646 [2] NCCL INFO [Proxy Service UDS] Device 2 CPU core 187
tpgds-aihub0008:181417:182647 [6] NCCL INFO [Proxy Service UDS] Device 6 CPU core 174
tpgds-aihub0008:181415:182645 [4] NCCL INFO [Proxy Service] Device 4 CPU core 99
tpgds-aihub0008:181413:182642 [2] NCCL INFO [Proxy Service] Device 2 CPU core 68
tpgds-aihub0008:181418:182641 [7] NCCL INFO [Proxy Service] Device 7 CPU core 186
tpgds-aihub0008:181417:182643 [6] NCCL INFO [Proxy Service] Device 6 CPU core 147
tpgds-aihub0008:181415:182651 [4] NCCL INFO [Proxy Service UDS] Device 4 CPU core 5
tpgds-aihub0008:181414:182650 [3] NCCL INFO [Proxy Service] Device 3 CPU core 35
tpgds-aihub0008:181416:182644 [5] NCCL INFO [Proxy Service] Device 5 CPU core 58
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 00/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 00/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 01/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 00/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 00/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 00/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 01/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 01/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 01/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 02/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 01/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 02/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 03/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 02/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 02/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 02/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 03/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 03/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 03/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 03/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 00/0 : 9[1] -> 0[0] [send] via NET/IB/0(8)/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 00/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 01/0 : 9[1] -> 0[0] [send] via NET/IB/0(8)/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 01/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:182653 [0] NCCL INFO [Proxy Progress] Device 0 CPU core 0
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 02/0 : 9[1] -> 0[0] [send] via NET/IB/0(8)/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 02/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 03/0 : 9[1] -> 0[0] [send] via NET/IB/0(8)/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 03/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 00/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 01/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 02/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 03/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:181418:181418 [7] NCCL INFO Channel 00/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:181418:181418 [7] NCCL INFO Channel 01/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:181411:182637 [0] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:181411:182637 [0] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:181418:181418 [7] NCCL INFO Channel 02/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:181418:181418 [7] NCCL INFO Channel 03/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 00/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181414:181414 [3] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181413:181413 [2] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181415:181415 [4] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181417:181417 [6] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181418:181418 [7] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181416:181416 [5] NCCL INFO Connected all rings, use ring PXN 1 GDR 1
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 01/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 02/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 03/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 00/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 01/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 02/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 00/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 00/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 00/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 00/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 01/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Channel 03/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 00/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 01/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 01/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 02/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 01/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 02/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 01/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:181416:181416 [5] NCCL INFO Channel 03/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 02/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:181414:181414 [3] NCCL INFO Channel 03/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 02/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 02/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:181417:181417 [6] NCCL INFO Channel 03/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:181413:181413 [2] NCCL INFO Channel 03/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 03/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 00/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 00/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 01/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 02/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 03/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 00/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 01/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 02/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:181411:181411 [0] NCCL INFO Channel 03/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 01/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 02/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:181412:181412 [1] NCCL INFO Channel 03/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:181415:181415 [4] NCCL INFO Connected all trees
tpgds-aihub0008:181414:181414 [3] NCCL INFO Connected all trees
tpgds-aihub0008:181418:181418 [7] NCCL INFO Connected all trees
tpgds-aihub0008:181416:181416 [5] NCCL INFO Connected all trees
tpgds-aihub0008:181417:181417 [6] NCCL INFO Connected all trees
tpgds-aihub0008:181413:181413 [2] NCCL INFO Connected all trees
tpgds-aihub0008:181415:182655 [4] NCCL INFO [Proxy Progress] Device 4 CPU core 179
tpgds-aihub0008:181414:182656 [3] NCCL INFO [Proxy Progress] Device 3 CPU core 179
tpgds-aihub0008:181415:181415 [4] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181415:181415 [4] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181415:181415 [4] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181415:181415 [4] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181418:182659 [7] NCCL INFO [Proxy Progress] Device 7 CPU core 22
tpgds-aihub0008:181416:182658 [5] NCCL INFO [Proxy Progress] Device 5 CPU core 60
tpgds-aihub0008:181417:182657 [6] NCCL INFO [Proxy Progress] Device 6 CPU core 148
tpgds-aihub0008:181413:182660 [2] NCCL INFO [Proxy Progress] Device 2 CPU core 179
tpgds-aihub0008:181414:181414 [3] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181414:181414 [3] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181414:181414 [3] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181414:181414 [3] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181416:181416 [5] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181416:181416 [5] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181416:181416 [5] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181416:181416 [5] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181417:181417 [6] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181417:181417 [6] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181417:181417 [6] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181417:181417 [6] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181418:181418 [7] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181418:181418 [7] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181418:181418 [7] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181418:181418 [7] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181413:181413 [2] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181413:181413 [2] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181413:181413 [2] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181413:181413 [2] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181411:181411 [0] NCCL INFO Connected all trees
tpgds-aihub0008:181412:181412 [1] NCCL INFO Connected all trees
tpgds-aihub0008:181411:181411 [0] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181411:181411 [0] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181411:181411 [0] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181411:181411 [0] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181412:182661 [1] NCCL INFO [Proxy Progress] Device 1 CPU core 59
tpgds-aihub0008:181412:181412 [1] NCCL INFO NCCL_PROTO set by environment to Simple
tpgds-aihub0008:181412:181412 [1] NCCL INFO NCCL_ALGO set by environment to Ring
tpgds-aihub0008:181412:181412 [1] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:181412:181412 [1] NCCL INFO 4 coll channels, 4 collnet channels, 0 nvls channels, 4 p2p channels, 1 p2p channels per peer
tpgds-aihub0008:181415:181415 [4] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181411:181411 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181415:181415 [4] NCCL INFO ncclCommInitRank comm 0x559a0bcabd20 rank 12 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181411:181411 [0] NCCL INFO ncclCommInitRank comm 0x5584f0195160 rank 8 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181416:181416 [5] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181417:181417 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181415:181415 [4] NCCL INFO Init timings - ncclCommInitRank: rank 12 nranks 16 total 1.46 (kernels 0.22, alloc 1.00, bootstrap 0.04, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.10, rest 0.04)
tpgds-aihub0008:181411:181411 [0] NCCL INFO Init timings - ncclCommInitRank: rank 8 nranks 16 total 1.49 (kernels 0.22, alloc 0.98, bootstrap 0.09, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.13, rest 0.01)
tpgds-aihub0008:181416:181416 [5] NCCL INFO ncclCommInitRank comm 0x55e5b54c2530 rank 13 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181417:181417 [6] NCCL INFO ncclCommInitRank comm 0x55f7c86465b0 rank 14 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181418:181418 [7] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181412:181412 [1] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181416:181416 [5] NCCL INFO Init timings - ncclCommInitRank: rank 13 nranks 16 total 1.47 (kernels 0.24, alloc 1.01, bootstrap 0.02, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.11, rest 0.03)
tpgds-aihub0008:181417:181417 [6] NCCL INFO Init timings - ncclCommInitRank: rank 14 nranks 16 total 1.46 (kernels 0.25, alloc 1.01, bootstrap 0.01, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.11, rest 0.03)
tpgds-aihub0008:181418:181418 [7] NCCL INFO ncclCommInitRank comm 0x56545e7b5730 rank 15 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181412:181412 [1] NCCL INFO ncclCommInitRank comm 0x556e4ac80ae0 rank 9 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181414:181414 [3] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181418:181418 [7] NCCL INFO Init timings - ncclCommInitRank: rank 15 nranks 16 total 1.47 (kernels 0.24, alloc 1.01, bootstrap 0.01, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.11, rest 0.03)
tpgds-aihub0008:181413:181413 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:181414:181414 [3] NCCL INFO ncclCommInitRank comm 0x557ef1c5a800 rank 11 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181412:181412 [1] NCCL INFO Init timings - ncclCommInitRank: rank 9 nranks 16 total 1.50 (kernels 0.22, alloc 0.95, bootstrap 0.12, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.14, rest 0.00)
tpgds-aihub0008:181413:181413 [2] NCCL INFO ncclCommInitRank comm 0x55c103b0cae0 rank 10 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0x45a3a89de169ea18 - Init COMPLETE
tpgds-aihub0008:181414:181414 [3] NCCL INFO Init timings - ncclCommInitRank: rank 11 nranks 16 total 1.47 (kernels 0.25, alloc 1.01, bootstrap 0.01, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.11, rest 0.03)
tpgds-aihub0008:181413:181413 [2] NCCL INFO Init timings - ncclCommInitRank: rank 10 nranks 16 total 1.48 (kernels 0.25, alloc 1.02, bootstrap 0.01, allgathers 0.01, topo 0.05, graphs 0.00, connections 0.11, rest 0.03)

висит

так установил (как на aihub3)
 1414  [ 2026-02-24 19:27:04 MSK ] unzip master.zip
 1415  [ 2026-02-24 19:27:09 MSK ] cd gdrcopy-master/
 1416  [ 2026-02-24 19:27:15 MSK ] make clean
 1417  [ 2026-02-24 19:27:21 MSK ] make prefix=$HOME/gdrcopy_install CUDA=/usr/local/cuda-13.1 lib
 1418  [ 2026-02-24 19:27:28 MSK ] make prefix=$HOME/gdrcopy_install install
 1419  [ 2026-02-24 19:28:10 MSK ] ls -la $HOME/gdrcopy_install/lib/
 1420  [ 2026-02-24 19:28:16 MSK ] ls -la $HOME/gdrcopy_install/include/


 ((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ls -la $HOME/gdrcopy_install/lib/
total 32
drwxr-xr-x 2 dcbsr_dev dcbsr_dev    72 Mar  3 13:04 .
drwxr-xr-x 5 dcbsr_dev dcbsr_dev    43 Mar  3 13:04 ..
lrwxrwxrwx 1 dcbsr_dev dcbsr_dev    14 Mar  3 13:04 libgdrapi.so -> libgdrapi.so.2
lrwxrwxrwx 1 dcbsr_dev dcbsr_dev    16 Mar  3 13:04 libgdrapi.so.2 -> libgdrapi.so.2.5
-rwxr-xr-x 1 dcbsr_dev dcbsr_dev 31352 Mar  3 13:04 libgdrapi.so.2.5
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ls -la $HOME/gdrcopy_install/include/
total 12
drwxr-xr-x 2 dcbsr_dev dcbsr_dev   41 Mar  3 13:04 .
drwxr-xr-x 5 dcbsr_dev dcbsr_dev   43 Mar  3 13:04 ..
-rw-rw-r-- 1 dcbsr_dev dcbsr_dev 7887 Mar  3 13:04 gdrapi.h
-rw-rw-r-- 1 dcbsr_dev dcbsr_dev  332 Mar  3 13:04 gdrconfig.h
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 

bash
lsmod | grep gdrdrv
ls /dev/gdrdrv
Если модуля нет — нужно собрать и загрузить:

bash
cd ~/gdrcopy-master
make CUDA=/usr/local/cuda-13.1 drv
sudo insmod src/gdrdrv/gdrdrv.ko
lsmod | grep gdrdrv
ls /dev/gdrdrv
Если insmod требует подписи (secure boot) или нет прав — покажи ошибку.

И проверь как это сделано на 0003:

bash
# На 0003:
lsmod | grep gdrdrv
ls /dev/gdrdrv
modinfo gdrdrv 2>/dev/null | grep filename

[dcbsr_dev@tpgds-aihub0003 ~]$ lsmod | grep gdrdrv
[dcbsr_dev@tpgds-aihub0003 ~]$ lsmod | grep gdrdrv
[dcbsr_dev@tpgds-aihub0003 ~]$ ls /dev/gdrdrv
ls: cannot access '/dev/gdrdrv': No such file or directory
[dcbsr_dev@tpgds-aihub0003 ~]$ modinfo gdrdrv 2>/dev/null | grep filename
[dcbsr_dev@tpgds-aihub0003 ~]$ 





[dcbsr_dev@tpgds-aihub0003 ~]$ sudo find / -name libcudart.so.13
/usr/local/targets/x86_64-linux/lib/libcudart.so.13
/usr/local/cuda-13.1/targets/x86_64-linux/lib/libcudart.so.13
/usr/local/cuda-13.1/lib64/libcudart.so.13
/app/sglang/sglang-0.5.8.post1/lib/python3.12/site-packages/nvidia/cu13/lib/libcudart.so.13

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ sudo find / -name libcudart.so.13
find: ‘/proc/205601’: No such file or directory
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ 


[dcbsr_dev@tpgds-aihub0003 ~]$ SGLANG_HOST_IP=10.99.91.49 MC_GID_INDEX=3 MC_TCP_BIND_ADDRESS=10.99.91.49 SGLANG_LOCAL_IP_NIC=ens3np0 GLOO_SOCKET_FAMILY=AF_INET GLOO_SOCKET_IFNAME=ens3np0 NCCL_SOCKET_IFNAME=ens3np0 NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7 NCCL_IB_GID_INDEX=3 NCCL_IB_TC=106 NCCL_IB_DISABLE=0 NCCL_NET_GDR_LEVEL=PIX NCCL_NVLS_ENABLE=0 NCCL_CROSS_NIC=1 NCCL_TIMEOUT=600 CUDA_DEVICE_MAX_CONNECTIONS=1 PYTORCH_ALLOC_CONF=expandable_segments:True,max_split_size_mb:256 TOKENIZERS_PARALLELISM=false /opt/mooncake-libs/run-with-new-libstdc.sh python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/ --trust-remote-code   --tp-size 16 --host 10.99.91.49 --port 30001   --dist-init-addr 10.99.91.49:5000 --nnodes 2 --node-rank 0   --mem-fraction-static 0.8 --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7   --max-running-requests 128
tpgds-aihub0007:203921:203921 [4] NCCL INFO NCCL_IB_HCA set to mlx5_0
tpgds-aihub0007:203923:203923 [6] NCCL INFO NET/Plugin: libcudart.so.13: cannot open shared object file: No such file or directory
tpgds-aihub0007:203923:203923 [6] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0007:203924:203924 [7] NCCL INFO NET/Plugin: libcudart.so.13: cannot open shared object file: No such file or directory
tpgds-aihub0007:203924:203924 [7] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0007:203923:203923 [6] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0




