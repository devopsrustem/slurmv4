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

  
