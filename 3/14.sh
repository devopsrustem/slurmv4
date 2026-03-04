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

