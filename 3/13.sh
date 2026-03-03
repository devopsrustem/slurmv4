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



