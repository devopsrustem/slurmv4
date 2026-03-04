((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] 
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] *****************************************
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 15:04:47.404000 507927 torch/distributed/run.py:803] *****************************************
[W304 15:04:49.571579240 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.868867217 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.868912841 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.870269089 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.871889652 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [tpgds-aihub0003.delta.sbrf.ru]:29500 (errno: 97 - Address family not supported by protocol).



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1   --master_addr=10.99.91.59 --master_port=29500   /tmp/test_nccl.py
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] 
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] *****************************************
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] Setting OMP_NUM_THREADS environment variable for each process to be 1 in default, to avoid your system being overloaded, please further tune the variable for optimal performance in your application as needed. 
W0304 15:04:49.732000 533558 torch/distributed/run.py:803] *****************************************
[W304 15:04:52.212591857 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176372020 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176371927 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176676292 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.176967382 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.190170587 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.192191941 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.193097809 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).
[W304 15:04:53.194587795 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.59]:29500 (errno: 97 - Address family not supported by protocol).

bash
# На 0007:
host 10.99.91.59
cat /etc/hosts | grep 10.99.91.59
И запусти тест с явным rdzv backend чтобы обойти DNS:

bash
# На 0007:
NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=0 \
  --rdzv_backend=c10d \
  --rdzv_endpoint=10.99.91.59:29500 \
  /tmp/test_nccl.py

# На 0008:
NCCL_NVLS_ENABLE=0 NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0 NCCL_IB_GID_INDEX=3 \
torchrun --nproc_per_node=8 --nnodes=2 --node_rank=1 \
  --rdzv_backend=c10d \
  --rdzv_endpoint=10.99.91.59:29500 \
  /tmp/test_nccl.py


# На 0007:
hostname -I
ip addr show enp25s0np0 | grep inet
host 10.99.91.59
Если IP реально 10.99.91.59 — добавь в /etc/hosts:
bashecho "10.99.91.59 tpgds-aihub0007" | sudo tee -a /etc/hosts



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ hostname -I
10.99.91.59 10.99.92.59 10.99.93.59 10.99.94.59 10.99.95.59 10.99.96.59 10.99.97.59 10.99.98.59 10.73.175.137 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ ip addr show enp25s0np0 | grep inet
    inet 10.99.91.59/31 scope global noprefixroute enp25s0np0
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ host 10.99.91.59
59.91.99.10.in-addr.arpa domain name pointer tpgds-aihub0003.delta.sbrf.ru.
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
#10.73.175.137     tpgds-aihub0007.delta.sbrf.ru tpgds-aihub0007
10.99.91.59     tpgds-aihub0007.delta.sbrf.ru tpgds-aihub0007


((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ hostname -I
10.99.91.63 10.99.92.63 10.99.93.63 10.99.94.63 10.99.95.63 10.99.96.63 10.99.97.63 10.99.98.63 10.73.175.138 
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ ip addr show enp25s0np0 | grep inet
    inet 10.99.91.63/31 scope global noprefixroute enp25s0np0
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ host 10.99.91.63
63.91.99.10.in-addr.arpa domain name pointer tpgds-aihub0003.delta.sbrf.ru.

