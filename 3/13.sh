

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



Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
tpgds-aihub0008:207008:207008 [1] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207008:207008 [1] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207013:207013 [6] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207013:207013 [6] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207009:207009 [2] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207009:207009 [2] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207014:207014 [7] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207014:207014 [7] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207010:207010 [3] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207010:207010 [3] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207012:207012 [5] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207012:207012 [5] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207011:207011 [4] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207011:207011 [4] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207007:207007 [0] NCCL INFO cudaDriverVersion 13010
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207007:207007 [0] NCCL INFO Bootstrap: Using enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL version 2.27.5+cuda12.9
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Plugin name set by env to libnccl-net.so
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v10 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v9 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v8 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclNetPlugin_v7 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Loaded net plugin AWS Libfabric (v6)
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v10 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v9 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v8 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v7 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/Plugin: Failed to find ncclCollNetPlugin_v6 symbol.
tpgds-aihub0008:207007:207007 [0] NCCL INFO Successfully loaded external plugin libnccl-net.so
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/OFI Using aws-ofi-nccl 1.6.0
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207008:207008 [1] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207008:207008 [1] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207013:207013 [6] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207013:207013 [6] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207011:207011 [4] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207011:207011 [4] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207010:207010 [3] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207010:207010 [3] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207012:207012 [5] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207012:207012 [5] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207009:207009 [2] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207009:207009 [2] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207014:207014 [7] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207014:207014 [7] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207008:207008 [1] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207008:207008 [1] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207008:207008 [1] NCCL INFO Using network IB
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/OFI Selected Provider is verbs;ofi_rxm (found 58 nics)
tpgds-aihub0008:207007:207007 [0] NCCL INFO Initialized NET plugin AWS Libfabric
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/OFI Invalid type of PCI bus returned 0
tpgds-aihub0008:207007:207007 [0] NCCL INFO plugin/net.cc:118 -> 2
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_IB_DISABLE set by environment to 0.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_SOCKET_IFNAME set by environment to enp25s0np0
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_IB_HCA set to mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11
tpgds-aihub0008:207013:207013 [6] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207013:207013 [6] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207013:207013 [6] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207013:207013 [6] NCCL INFO Using network IB
tpgds-aihub0008:207011:207011 [4] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207011:207011 [4] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207011:207011 [4] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207011:207011 [4] NCCL INFO Using network IB
tpgds-aihub0008:207010:207010 [3] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207010:207010 [3] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207012:207012 [5] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207012:207012 [5] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207010:207010 [3] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207010:207010 [3] NCCL INFO Using network IB
tpgds-aihub0008:207014:207014 [7] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207012:207012 [5] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207014:207014 [7] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207012:207012 [5] NCCL INFO Using network IB
tpgds-aihub0008:207014:207014 [7] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207014:207014 [7] NCCL INFO Using network IB
tpgds-aihub0008:207007:207007 [0] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207007:207007 [0] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207007:207007 [0] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207007:207007 [0] NCCL INFO Using network IB
tpgds-aihub0008:207009:207009 [2] NCCL INFO NET/IB : Using [0]mlx5_0:1/RoCE [1]mlx5_1:1/RoCE [2]mlx5_2:1/RoCE [3]mlx5_5:1/RoCE [4]mlx5_6:1/RoCE [5]mlx5_7:1/RoCE [6]mlx5_8:1/RoCE [7]mlx5_11:1/RoCE [RO]; OOB enp25s0np0:10.99.91.63<0>
tpgds-aihub0008:207009:207009 [2] NCCL INFO Initialized NET plugin IB
tpgds-aihub0008:207009:207009 [2] NCCL INFO Assigned NET plugin IB to comm
tpgds-aihub0008:207009:207009 [2] NCCL INFO Using network IB
tpgds-aihub0008:207008:207008 [1] NCCL INFO DMA-BUF is available on GPU device 1
tpgds-aihub0008:207008:207008 [1] NCCL INFO ncclCommInitRank comm 0x5654997a1f80 rank 9 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207013:207013 [6] NCCL INFO DMA-BUF is available on GPU device 6
tpgds-aihub0008:207013:207013 [6] NCCL INFO ncclCommInitRank comm 0x559f74138ef0 rank 14 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207007:207007 [0] NCCL INFO DMA-BUF is available on GPU device 0
tpgds-aihub0008:207011:207011 [4] NCCL INFO DMA-BUF is available on GPU device 4
tpgds-aihub0008:207007:207007 [0] NCCL INFO ncclCommInitRank comm 0x55a223a946d0 rank 8 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207010:207010 [3] NCCL INFO DMA-BUF is available on GPU device 3
tpgds-aihub0008:207007:207007 [0] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207011:207011 [4] NCCL INFO ncclCommInitRank comm 0x56032bd58b40 rank 12 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207009:207009 [2] NCCL INFO DMA-BUF is available on GPU device 2
tpgds-aihub0008:207014:207014 [7] NCCL INFO DMA-BUF is available on GPU device 7
tpgds-aihub0008:207010:207010 [3] NCCL INFO ncclCommInitRank comm 0x5620a5c59ae0 rank 11 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207014:207014 [7] NCCL INFO ncclCommInitRank comm 0x562f37374680 rank 15 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207012:207012 [5] NCCL INFO DMA-BUF is available on GPU device 5
tpgds-aihub0008:207009:207009 [2] NCCL INFO ncclCommInitRank comm 0x555bdf658400 rank 10 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207012:207012 [5] NCCL INFO ncclCommInitRank comm 0x55e5e8d6c970 rank 13 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0xde4443395863ef4a - Init START
tpgds-aihub0008:207014:207014 [7] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207010:207010 [3] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207009:207009 [2] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207008:207008 [1] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207011:207011 [4] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207013:207013 [6] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207012:207012 [5] NCCL INFO RAS client listening socket at 127.0.0.1<28028>
tpgds-aihub0008:207012:207012 [5] NCCL INFO Bootstrap timings total 0.005222 (create 0.000027, send 0.000199, recv 0.001423, ring 0.000924, delay 0.000000)
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207014:207014 [7] NCCL INFO Bootstrap timings total 0.006511 (create 0.000023, send 0.000336, recv 0.000894, ring 0.003303, delay 0.000000)
tpgds-aihub0008:207013:207013 [6] NCCL INFO Bootstrap timings total 0.023294 (create 0.000022, send 0.000361, recv 0.017586, ring 0.001330, delay 0.000000)
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207011:207011 [4] NCCL INFO Bootstrap timings total 0.009308 (create 0.000024, send 0.000410, recv 0.004804, ring 0.001679, delay 0.000000)
tpgds-aihub0008:207009:207009 [2] NCCL INFO Bootstrap timings total 0.005666 (create 0.000021, send 0.000362, recv 0.000753, ring 0.002912, delay 0.000000)
tpgds-aihub0008:207010:207010 [3] NCCL INFO Bootstrap timings total 0.006863 (create 0.000024, send 0.000351, recv 0.000462, ring 0.003030, delay 0.000000)
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207007:207007 [0] NCCL INFO Bootstrap timings total 0.012593 (create 0.000026, send 0.000379, recv 0.000681, ring 0.009340, delay 0.000000)
tpgds-aihub0008:207008:207008 [1] NCCL INFO Bootstrap timings total 0.600410 (create 0.000026, send 0.000349, recv 0.595147, ring 0.002666, delay 0.000000)
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_CUMEM_ENABLE set by environment to 0.
tpgds-aihub0008:207012:207012 [5] NCCL INFO MNNVL busId 0xab000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207014:207014 [7] NCCL INFO MNNVL busId 0xdb000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207013:207013 [6] NCCL INFO MNNVL busId 0xba000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207011:207011 [4] NCCL INFO MNNVL busId 0x9a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207007:207007 [0] NCCL INFO MNNVL busId 0x18000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207008:207008 [1] NCCL INFO MNNVL busId 0x2a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207009:207009 [2] NCCL INFO MNNVL busId 0x3a000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207010:207010 [3] NCCL INFO MNNVL busId 0x5d000 fabric UUID 0.0 cliqueId 0x0 state 3 healthMask 0x0
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_NET_GDR_LEVEL set by environment to PIX
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207008:207008 [1] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207007:207007 [0] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207013:207013 [6] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207011:207011 [4] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207014:207014 [7] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207009:207009 [2] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207010:207010 [3] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_NVLS_ENABLE set by environment to 0.
tpgds-aihub0008:207012:207012 [5] NCCL INFO NCCL_CROSS_NIC set by environment to 1.
tpgds-aihub0008:207009:207009 [2] NCCL INFO comm 0x555bdf658400 rank 10 nRanks 16 nNodes 2 localRanks 8 localRank 2 MNNVL 0
tpgds-aihub0008:207010:207010 [3] NCCL INFO comm 0x5620a5c59ae0 rank 11 nRanks 16 nNodes 2 localRanks 8 localRank 3 MNNVL 0
tpgds-aihub0008:207012:207012 [5] NCCL INFO comm 0x55e5e8d6c970 rank 13 nRanks 16 nNodes 2 localRanks 8 localRank 5 MNNVL 0
tpgds-aihub0008:207011:207011 [4] NCCL INFO comm 0x56032bd58b40 rank 12 nRanks 16 nNodes 2 localRanks 8 localRank 4 MNNVL 0
tpgds-aihub0008:207014:207014 [7] NCCL INFO comm 0x562f37374680 rank 15 nRanks 16 nNodes 2 localRanks 8 localRank 7 MNNVL 0
tpgds-aihub0008:207013:207013 [6] NCCL INFO comm 0x559f74138ef0 rank 14 nRanks 16 nNodes 2 localRanks 8 localRank 6 MNNVL 0
tpgds-aihub0008:207009:207009 [2] NCCL INFO Trees [0] 11/-1/-1->10->9 [1] 11/-1/-1->10->9 [2] 11/-1/-1->10->2 [3] -1/-1/-1->10->9 [4] 11/-1/-1->10->9 [5] 11/-1/-1->10->9 [6] 11/-1/-1->10->9 [7] 11/-1/-1->10->9 [8] 11/-1/-1->10->9 [9] 11/-1/-1->10->9 [10] 11/2/-1->10->-1 [11] -1/-1/-1->10->9 [12] 11/-1/-1->10->9 [13] 11/-1/-1->10->9 [14] 11/-1/-1->10->9 [15] 11/-1/-1->10->9
tpgds-aihub0008:207010:207010 [3] NCCL INFO Trees [0] 12/-1/-1->11->10 [1] 12/-1/-1->11->10 [2] 12/-1/-1->11->10 [3] 12/-1/-1->11->3 [4] -1/-1/-1->11->10 [5] 12/-1/-1->11->10 [6] 12/-1/-1->11->10 [7] 12/-1/-1->11->10 [8] 12/-1/-1->11->10 [9] 12/-1/-1->11->10 [10] 12/-1/-1->11->10 [11] 12/3/-1->11->-1 [12] -1/-1/-1->11->10 [13] 12/-1/-1->11->10 [14] 12/-1/-1->11->10 [15] 12/-1/-1->11->10
tpgds-aihub0008:207009:207009 [2] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207012:207012 [5] NCCL INFO Trees [0] 14/-1/-1->13->12 [1] 14/-1/-1->13->12 [2] 14/-1/-1->13->12 [3] 14/-1/-1->13->12 [4] 14/-1/-1->13->12 [5] 14/-1/-1->13->5 [6] -1/-1/-1->13->12 [7] 14/-1/-1->13->12 [8] 14/-1/-1->13->12 [9] 14/-1/-1->13->12 [10] 14/-1/-1->13->12 [11] 14/-1/-1->13->12 [12] 14/-1/-1->13->12 [13] 14/5/-1->13->-1 [14] -1/-1/-1->13->12 [15] 14/-1/-1->13->12
tpgds-aihub0008:207010:207010 [3] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207011:207011 [4] NCCL INFO Trees [0] 13/-1/-1->12->11 [1] 13/-1/-1->12->11 [2] 13/-1/-1->12->11 [3] 13/-1/-1->12->11 [4] 13/-1/-1->12->4 [5] -1/-1/-1->12->11 [6] 13/-1/-1->12->11 [7] 13/-1/-1->12->11 [8] 13/-1/-1->12->11 [9] 13/-1/-1->12->11 [10] 13/-1/-1->12->11 [11] 13/-1/-1->12->11 [12] 13/4/-1->12->-1 [13] -1/-1/-1->12->11 [14] 13/-1/-1->12->11 [15] 13/-1/-1->12->11
tpgds-aihub0008:207014:207014 [7] NCCL INFO Trees [0] -1/-1/-1->15->14 [1] 8/-1/-1->15->14 [2] 8/-1/-1->15->14 [3] 8/-1/-1->15->14 [4] 8/-1/-1->15->14 [5] 8/-1/-1->15->14 [6] 8/-1/-1->15->14 [7] 8/-1/-1->15->7 [8] -1/-1/-1->15->14 [9] 8/-1/-1->15->14 [10] 8/-1/-1->15->14 [11] 8/-1/-1->15->14 [12] 8/-1/-1->15->14 [13] 8/-1/-1->15->14 [14] 8/-1/-1->15->14 [15] 8/7/-1->15->-1
tpgds-aihub0008:207012:207012 [5] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207013:207013 [6] NCCL INFO Trees [0] 15/-1/-1->14->13 [1] 15/-1/-1->14->13 [2] 15/-1/-1->14->13 [3] 15/-1/-1->14->13 [4] 15/-1/-1->14->13 [5] 15/-1/-1->14->13 [6] 15/-1/-1->14->6 [7] -1/-1/-1->14->13 [8] 15/-1/-1->14->13 [9] 15/-1/-1->14->13 [10] 15/-1/-1->14->13 [11] 15/-1/-1->14->13 [12] 15/-1/-1->14->13 [13] 15/-1/-1->14->13 [14] 15/6/-1->14->-1 [15] -1/-1/-1->14->13
tpgds-aihub0008:207011:207011 [4] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207014:207014 [7] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207013:207013 [6] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207007:207007 [0] NCCL INFO comm 0x55a223a946d0 rank 8 nRanks 16 nNodes 2 localRanks 8 localRank 0 MNNVL 0
tpgds-aihub0008:207008:207008 [1] NCCL INFO comm 0x5654997a1f80 rank 9 nRanks 16 nNodes 2 localRanks 8 localRank 1 MNNVL 0
tpgds-aihub0008:207007:207007 [0] NCCL INFO Trees [0] 9/-1/-1->8->0 [1] -1/-1/-1->8->15 [2] 9/-1/-1->8->15 [3] 9/-1/-1->8->15 [4] 9/-1/-1->8->15 [5] 9/-1/-1->8->15 [6] 9/-1/-1->8->15 [7] 9/-1/-1->8->15 [8] 9/0/-1->8->-1 [9] -1/-1/-1->8->15 [10] 9/-1/-1->8->15 [11] 9/-1/-1->8->15 [12] 9/-1/-1->8->15 [13] 9/-1/-1->8->15 [14] 9/-1/-1->8->15 [15] 9/-1/-1->8->15
tpgds-aihub0008:207010:207010 [3] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207007:207007 [0] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207008:207008 [1] NCCL INFO Trees [0] 10/-1/-1->9->8 [1] 10/-1/-1->9->1 [2] -1/-1/-1->9->8 [3] 10/-1/-1->9->8 [4] 10/-1/-1->9->8 [5] 10/-1/-1->9->8 [6] 10/-1/-1->9->8 [7] 10/-1/-1->9->8 [8] 10/-1/-1->9->8 [9] 10/1/-1->9->-1 [10] -1/-1/-1->9->8 [11] 10/-1/-1->9->8 [12] 10/-1/-1->9->8 [13] 10/-1/-1->9->8 [14] 10/-1/-1->9->8 [15] 10/-1/-1->9->8
tpgds-aihub0008:207008:207008 [1] NCCL INFO P2P Chunksize set to 131072
tpgds-aihub0008:207011:207011 [4] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207012:207012 [5] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207014:207014 [7] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207009:207009 [2] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207013:207013 [6] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207007:207007 [0] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207008:207008 [1] NCCL INFO PROFILER/Plugin: Could not find: libnccl-profiler.so. 
tpgds-aihub0008:207012:208295 [5] NCCL INFO [Proxy Service] Device 5 CPU core 88
tpgds-aihub0008:207011:208293 [4] NCCL INFO [Proxy Service] Device 4 CPU core 118
tpgds-aihub0008:207010:208292 [3] NCCL INFO [Proxy Service] Device 3 CPU core 96
tpgds-aihub0008:207014:208294 [7] NCCL INFO [Proxy Service] Device 7 CPU core 88
tpgds-aihub0008:207011:208298 [4] NCCL INFO [Proxy Service UDS] Device 4 CPU core 23
tpgds-aihub0008:207013:208300 [6] NCCL INFO [Proxy Service UDS] Device 6 CPU core 6
tpgds-aihub0008:207010:208299 [3] NCCL INFO [Proxy Service UDS] Device 3 CPU core 71
tpgds-aihub0008:207012:208301 [5] NCCL INFO [Proxy Service UDS] Device 5 CPU core 168
tpgds-aihub0008:207014:208302 [7] NCCL INFO [Proxy Service UDS] Device 7 CPU core 147
tpgds-aihub0008:207013:208297 [6] NCCL INFO [Proxy Service] Device 6 CPU core 3
tpgds-aihub0008:207009:208303 [2] NCCL INFO [Proxy Service UDS] Device 2 CPU core 159
tpgds-aihub0008:207009:208296 [2] NCCL INFO [Proxy Service] Device 2 CPU core 29
tpgds-aihub0008:207008:208305 [1] NCCL INFO [Proxy Service] Device 1 CPU core 142
tpgds-aihub0008:207007:208304 [0] NCCL INFO [Proxy Service] Device 0 CPU core 9
tpgds-aihub0008:207007:208306 [0] NCCL INFO [Proxy Service UDS] Device 0 CPU core 174
tpgds-aihub0008:207008:208307 [1] NCCL INFO [Proxy Service UDS] Device 1 CPU core 47
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 06/0 : 7[7] -> 14[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 14/0 : 7[7] -> 14[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0008:207013:208308 [6] NCCL INFO [Proxy Progress] Device 6 CPU core 105
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 05/0 : 14[6] -> 5[5] [send] via NET/IB/6/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 13/0 : 14[6] -> 5[5] [send] via NET/IB/6/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 04/0 : 5[5] -> 12[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 12/0 : 5[5] -> 12[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0008:207011:208309 [4] NCCL INFO [Proxy Progress] Device 4 CPU core 25
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 03/0 : 12[4] -> 3[3] [send] via NET/IB/4/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 11/0 : 12[4] -> 3[3] [send] via NET/IB/4/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 01/0 : 2[2] -> 9[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0008:207008:208310 [1] NCCL INFO [Proxy Progress] Device 1 CPU core 10
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 09/0 : 2[2] -> 9[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 00/0 : 9[1] -> 0[0] [send] via NET/IB/1/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 08/0 : 9[1] -> 0[0] [send] via NET/IB/1/GDRDMA
tpgds-aihub0008:207010:208311 [3] NCCL INFO [Proxy Progress] Device 3 CPU core 47
tpgds-aihub0008:207012:208312 [5] NCCL INFO [Proxy Progress] Device 5 CPU core 45
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 03/0 : 4[4] -> 11[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 05/0 : 6[6] -> 13[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 13/0 : 6[6] -> 13[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 11/0 : 4[4] -> 11[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 04/0 : 13[5] -> 4[4] [send] via NET/IB/5/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 02/0 : 11[3] -> 2[2] [send] via NET/IB/3/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 12/0 : 13[5] -> 4[4] [send] via NET/IB/5/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 10/0 : 11[3] -> 2[2] [send] via NET/IB/3/GDRDMA
tpgds-aihub0008:207007:208313 [0] NCCL INFO [Proxy Progress] Device 0 CPU core 45
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 00/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 08/0 : 1[1] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 00/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 01/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 06/0 : 15[7] -> 6[6] [send] via NET/IB/7/GDRDMA
tpgds-aihub0008:207014:208314 [7] NCCL INFO [Proxy Progress] Device 7 CPU core 47
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 14/0 : 15[7] -> 6[6] [send] via NET/IB/7/GDRDMA
tpgds-aihub0008:207009:208315 [2] NCCL INFO [Proxy Progress] Device 2 CPU core 47
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 02/0 : 3[3] -> 10[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 02/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 10/0 : 3[3] -> 10[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 01/0 : 10[2] -> 1[1] [send] via NET/IB/2/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 09/0 : 10[2] -> 1[1] [send] via NET/IB/2/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 03/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 04/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 05/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 06/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 08/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 09/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 10/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 11/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 00/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 12/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 01/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 13/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 02/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 00/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 14/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 00/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 04/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 05/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 01/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 06/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 01/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 07/0 : 0[0] -> 15[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 15/0 : 0[0] -> 15[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 00/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 07/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 02/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 00/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 03/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 01/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 01/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 02/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 08/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 03/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 03/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 02/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 03/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 04/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 04/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 05/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 06/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 04/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 05/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 06/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 09/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 06/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 05/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 07/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 07/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 10/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 12/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 07/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 07/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 08/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 08/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 09/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 00/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 13/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 08/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 09/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 08/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 10/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 14/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 02/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 09/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 10/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 11/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 03/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 15/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 09/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 11/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 04/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 12/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 13/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 11/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 10/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 05/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 11/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 12/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 06/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 13/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 14/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 12/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 07/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 15/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 13/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 14/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 14/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 15/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 08/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 15/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 10/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 15/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 01/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 11/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207011:208293 [4] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207012:208295 [5] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207013:208297 [6] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207013:208297 [6] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 02/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207011:208293 [4] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207012:208295 [5] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 12/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 13/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 14/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 15/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 07/0 : 8[0] -> 7[7] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 15/0 : 8[0] -> 7[7] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 03/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207010:208292 [3] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 04/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 05/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 06/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 07/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 09/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 10/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 11/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 12/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 13/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 14/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:208294 [7] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207014:208294 [7] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 15/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207009:208296 [2] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207009:208296 [2] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207008:208305 [1] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207008:208305 [1] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207007:208304 [0] NCCL INFO NCCL_IB_GID_INDEX set by environment to 3.
tpgds-aihub0008:207010:208292 [3] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207007:208304 [0] NCCL INFO NCCL_IB_TC set by environment to 106.
tpgds-aihub0008:207007:207007 [0] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 00/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207010:207010 [3] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207009:207009 [2] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207011:207011 [4] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207012:207012 [5] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207013:207013 [6] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207014:207014 [7] NCCL INFO Connected all rings, use ring PXN 0 GDR 1
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 02/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 03/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 04/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 05/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 06/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 07/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 08/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 10/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 11/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 12/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 13/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 00/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 00/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 14/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 01/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 01/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 00/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 00/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 01/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 02/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 01/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 02/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 15/0 : 8[0] -> 9[1] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 02/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 03/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 04/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 02/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 00/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 01/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 03/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 03/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 00/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 03/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 06/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 01/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 05/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 04/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 03/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 05/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 06/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 04/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 02/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 07/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 05/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 06/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 04/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 08/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 04/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 07/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 05/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 05/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 08/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 08/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 09/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 07/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 08/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 09/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 06/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 06/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 10/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 09/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 07/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 11/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 07/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 09/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 10/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 10/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 12/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 11/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 08/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 08/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 11/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 10/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 12/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 14/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 13/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 09/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 11/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 09/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 13/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 15/0 : 12[4] -> 13[5] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 10/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 14/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 14/0 : 14[6] -> 15[7] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 11/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 12/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 15/0 : 11[3] -> 12[4] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 12/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 12/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 13/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 13/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 13/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 14/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 14/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 15/0 : 13[5] -> 14[6] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 15/0 : 10[2] -> 11[3] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 15/0 : 9[1] -> 10[2] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 04/0 : 4[4] -> 12[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 06/0 : 6[6] -> 14[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 12/0 : 4[4] -> 12[4] [receive] via NET/IB/4/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 05/0 : 5[5] -> 13[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 14/0 : 6[6] -> 14[6] [receive] via NET/IB/6/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 04/0 : 12[4] -> 4[4] [send] via NET/IB/4/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 07/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 13/0 : 5[5] -> 13[5] [receive] via NET/IB/5/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 06/0 : 14[6] -> 6[6] [send] via NET/IB/6/GDRDMA
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 12/0 : 12[4] -> 4[4] [send] via NET/IB/4/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 05/0 : 13[5] -> 5[5] [send] via NET/IB/5/GDRDMA
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 14/0 : 14[6] -> 6[6] [send] via NET/IB/6/GDRDMA
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 13/0 : 13[5] -> 5[5] [send] via NET/IB/5/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 01/0 : 1[1] -> 9[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 03/0 : 3[3] -> 11[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 02/0 : 2[2] -> 10[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 09/0 : 1[1] -> 9[1] [receive] via NET/IB/1/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 11/0 : 3[3] -> 11[3] [receive] via NET/IB/3/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 10/0 : 2[2] -> 10[2] [receive] via NET/IB/2/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 01/0 : 9[1] -> 1[1] [send] via NET/IB/1/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 03/0 : 11[3] -> 3[3] [send] via NET/IB/3/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 02/0 : 10[2] -> 2[2] [send] via NET/IB/2/GDRDMA
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 09/0 : 9[1] -> 1[1] [send] via NET/IB/1/GDRDMA
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 11/0 : 11[3] -> 3[3] [send] via NET/IB/3/GDRDMA
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 10/0 : 10[2] -> 2[2] [send] via NET/IB/2/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 15/0 : 8[0] -> 15[7] via P2P/IPC
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 00/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 07/0 : 7[7] -> 15[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 08/0 : 0[0] -> 8[0] [receive] via NET/IB/0/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 15/0 : 7[7] -> 15[7] [receive] via NET/IB/7/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 00/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 07/0 : 15[7] -> 7[7] [send] via NET/IB/7/GDRDMA
tpgds-aihub0008:207007:207007 [0] NCCL INFO Channel 08/0 : 8[0] -> 0[0] [send] via NET/IB/0/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 15/0 : 15[7] -> 7[7] [send] via NET/IB/7/GDRDMA
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 01/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 02/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 03/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 00/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 05/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 04/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207008:207008 [1] NCCL INFO Channel 08/0 : 9[1] -> 8[0] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 01/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207011:207011 [4] NCCL INFO Channel 11/0 : 12[4] -> 11[3] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 02/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Channel 10/0 : 11[3] -> 10[2] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 03/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207009:207009 [2] NCCL INFO Channel 09/0 : 10[2] -> 9[1] via P2P/IPC
tpgds-aihub0008:207012:207012 [5] NCCL INFO Channel 12/0 : 13[5] -> 12[4] via P2P/IPC
tpgds-aihub0008:207013:207013 [6] NCCL INFO Channel 13/0 : 14[6] -> 13[5] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 04/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 05/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 06/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 07/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 09/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 10/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 11/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 12/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 13/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 14/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 15/0 : 15[7] -> 8[0] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 06/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207014:207014 [7] NCCL INFO Channel 14/0 : 15[7] -> 14[6] via P2P/IPC
tpgds-aihub0008:207010:207010 [3] NCCL INFO Connected all trees
tpgds-aihub0008:207009:207009 [2] NCCL INFO Connected all trees
tpgds-aihub0008:207011:207011 [4] NCCL INFO Connected all trees
tpgds-aihub0008:207012:207012 [5] NCCL INFO Connected all trees
tpgds-aihub0008:207010:207010 [3] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207010:207010 [3] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207007:207007 [0] NCCL INFO Connected all trees
tpgds-aihub0008:207008:207008 [1] NCCL INFO Connected all trees
tpgds-aihub0008:207013:207013 [6] NCCL INFO Connected all trees
tpgds-aihub0008:207014:207014 [7] NCCL INFO Connected all trees
tpgds-aihub0008:207009:207009 [2] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207009:207009 [2] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207011:207011 [4] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207011:207011 [4] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207007:207007 [0] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207007:207007 [0] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207013:207013 [6] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207013:207013 [6] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207012:207012 [5] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207012:207012 [5] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207008:207008 [1] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207008:207008 [1] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207014:207014 [7] NCCL INFO threadThresholds 8/8/64 | 128/8/64 | 512 | 512
tpgds-aihub0008:207014:207014 [7] NCCL INFO 16 coll channels, 16 collnet channels, 0 nvls channels, 16 p2p channels, 2 p2p channels per peer
tpgds-aihub0008:207011:207011 [4] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207011:207011 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207007:207007 [0] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207011:207011 [4] NCCL INFO ncclCommInitRank comm 0x56032bd58b40 rank 12 nranks 16 cudaDev 4 nvmlDev 4 busId 9a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207007:207007 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207007:207007 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207011:207011 [4] NCCL INFO Init timings - ncclCommInitRank: rank 12 nranks 16 total 2.13 (kernels 0.22, alloc 1.62, bootstrap 0.01, allgathers 0.00, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:207007:207007 [0] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207014:207014 [7] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207010:207010 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207009:207009 [2] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207007:207007 [0] NCCL INFO ncclCommInitRank comm 0x55a223a946d0 rank 8 nranks 16 cudaDev 0 nvmlDev 0 busId 18000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207014:207014 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207012:207012 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207010:207010 [3] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207007:207007 [0] NCCL INFO Init timings - ncclCommInitRank: rank 8 nranks 16 total 2.13 (kernels 0.25, alloc 1.59, bootstrap 0.01, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:207008:207008 [1] NCCL INFO TUNER/Plugin: Could not find: libnccl-tuner.so. Using internal tuner plugin.
tpgds-aihub0008:207014:207014 [7] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207012:207012 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207009:207009 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207013:207013 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO ncclCommInitRank comm 0x5620a5c59ae0 rank 11 nranks 16 cudaDev 3 nvmlDev 3 busId 5d000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207008:207008 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v4 symbol.
tpgds-aihub0008:207014:207014 [7] NCCL INFO ncclCommInitRank comm 0x562f37374680 rank 15 nranks 16 cudaDev 7 nvmlDev 7 busId db000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207012:207012 [5] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207009:207009 [2] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207013:207013 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207008:207008 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v3 symbol.
tpgds-aihub0008:207010:207010 [3] NCCL INFO Init timings - ncclCommInitRank: rank 11 nranks 16 total 2.14 (kernels 0.25, alloc 1.60, bootstrap 0.01, allgathers 0.00, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0008:207012:207012 [5] NCCL INFO ncclCommInitRank comm 0x55e5e8d6c970 rank 13 nranks 16 cudaDev 5 nvmlDev 5 busId ab000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207014:207014 [7] NCCL INFO Init timings - ncclCommInitRank: rank 15 nranks 16 total 2.15 (kernels 0.25, alloc 1.61, bootstrap 0.01, allgathers 0.00, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:207009:207009 [2] NCCL INFO ncclCommInitRank comm 0x555bdf658400 rank 10 nranks 16 cudaDev 2 nvmlDev 2 busId 3a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207013:207013 [6] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207008:207008 [1] NCCL INFO TUNER/Plugin: Failed to find ncclTunerPlugin_v2 symbol, using internal tuner instead.
tpgds-aihub0008:207012:207012 [5] NCCL INFO Init timings - ncclCommInitRank: rank 13 nranks 16 total 2.13 (kernels 0.24, alloc 1.60, bootstrap 0.01, allgathers 0.00, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:207013:207013 [6] NCCL INFO ncclCommInitRank comm 0x559f74138ef0 rank 14 nranks 16 cudaDev 6 nvmlDev 6 busId ba000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207009:207009 [2] NCCL INFO Init timings - ncclCommInitRank: rank 10 nranks 16 total 2.15 (kernels 0.22, alloc 1.65, bootstrap 0.01, allgathers 0.00, topo 0.06, graphs 0.00, connections 0.21, rest 0.01)
tpgds-aihub0008:207008:207008 [1] NCCL INFO ncclCommInitRank comm 0x5654997a1f80 rank 9 nranks 16 cudaDev 1 nvmlDev 1 busId 2a000 commId 0xde4443395863ef4a - Init COMPLETE
tpgds-aihub0008:207013:207013 [6] NCCL INFO Init timings - ncclCommInitRank: rank 14 nranks 16 total 2.16 (kernels 0.25, alloc 1.61, bootstrap 0.02, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
tpgds-aihub0008:207008:207008 [1] NCCL INFO Init timings - ncclCommInitRank: rank 9 nranks 16 total 2.16 (kernels 0.25, alloc 1.04, bootstrap 0.60, allgathers 0.01, topo 0.06, graphs 0.00, connections 0.21, rest 0.00)
