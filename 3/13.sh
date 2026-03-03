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
