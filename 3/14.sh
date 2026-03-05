0007:

bash
SGLANG_HOST_IP=10.99.91.59 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
0008:

bash
SGLANG_HOST_IP=10.99.91.63 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128

0007:

bash
SGLANG_HOST_IP=10.99.91.59 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.59 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128
0008:

bash
SGLANG_HOST_IP=10.99.91.63 \
NCCL_SOCKET_IFNAME=enp25s0np0 \
NCCL_IB_HCA=mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
NCCL_IB_GID_INDEX=3 \
python3 -m sglang.launch_server \
  --model-path /app/models/Deepseek-R1/ --trust-remote-code \
  --tp-size 16 --host 10.99.91.63 --port 30001 \
  --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 1 \
  --mem-fraction-static 0.8 --disaggregation-mode decode \
  --disaggregation-transfer-backend nixl \
  --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11 \
  --max-running-requests 128



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ nvidia-smi topo -m
	GPU0	GPU1	GPU2	GPU3	GPU4	GPU5	GPU6	GPU7	NIC0	NIC1	NIC2	NIC3	NIC4	NIC5	NIC6	NIC7	NIC8	NIC9	NIC10	NIC11	CPU Affinity	NUMA Affinity	GPU NUMA ID
GPU0	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NV18	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU1	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU2	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU3	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU4	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU5	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIXNODE	NODE	NODE	NODE	0-191	0		N/A
GPU6	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	0-191	0		N/A
GPU7	NV18	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	0-191	0		N/A
NIC0	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC1	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC2	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC3	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC4	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC5	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE				
NIC6	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE				
NIC7	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X NODE	NODE	NODE	NODE				
NIC8	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE				
NIC9	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE				
NIC10	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE				
NIC11	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 				

Legend:

  X    = Self
  SYS  = Connection traversing PCIe as well as the SMP interconnect between NUMA nodes (e.g., QPI/UPI)
  NODE = Connection traversing PCIe as well as the interconnect between PCIe Host Bridges within a NUMA node
  PHB  = Connection traversing PCIe as well as a PCIe Host Bridge (typically the CPU)
  PXB  = Connection traversing multiple PCIe bridges (without traversing the PCIe Host Bridge)
  PIX  = Connection traversing at most a single PCIe bridge
  NV#  = Connection traversing a bonded set of # NVLinks

NIC Legend:

  NIC0: mlx5_0
  NIC1: mlx5_1
  NIC2: mlx5_2
  NIC3: mlx5_3
  NIC4: mlx5_4
  NIC5: mlx5_5
  NIC6: mlx5_6
  NIC7: mlx5_7
  NIC8: mlx5_8
  NIC9: mlx5_9
  NIC10: mlx5_10
  NIC11: mlx5_11



((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ nvidia-smi topo -m
	GPU0	GPU1	GPU2	GPU3	GPU4	GPU5	GPU6	GPU7	NIC0	NIC1	NIC2	NIC3	NIC4	NIC5	NIC6	NIC7	NIC8	NIC9	NIC10	NIC11	CPU Affinity	NUMA Affinity	GPU NUMA ID
GPU0	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NV18	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU1	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NV18	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU2	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NV18	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU3	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU4	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU5	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	0-191	0		N/A
GPU6	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NV18	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	0-191	0		N/A
GPU7	NV18	NV18	NV18	NV18	NV18	NV18	NV18	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	0-191	0		N/A
NIC0	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC1	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC2	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC3	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC4	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE	NODE	NODE	NODE	NODE	NODE	NODE				
NIC5	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE	NODE				
NIC6	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE	NODE				
NIC7	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE	NODE				
NIC8	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	NODE	NODE	NODE				
NIC9	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 	PIX	NODE				
NIC10	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	 X 	NODE				
NIC11	NODE	NODE	NODE	NODE	NODE	NODE	NODE	PIX	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	NODE	 X 				

Legend:

  X    = Self
  SYS  = Connection traversing PCIe as well as the SMP interconnect between NUMA nodes (e.g., QPI/UPI)
  NODE = Connection traversing PCIe as well as the interconnect between PCIe Host Bridges within a NUMA node
  PHB  = Connection traversing PCIe as well as a PCIe Host Bridge (typically the CPU)
  PXB  = Connection traversing multiple PCIe bridges (without traversing the PCIe Host Bridge)
  PIX  = Connection traversing at most a single PCIe bridge
  NV#  = Connection traversing a bonded set of # NVLinks

NIC Legend:

  NIC0: mlx5_0
  NIC1: mlx5_1
  NIC2: mlx5_2
  NIC3: mlx5_3
  NIC4: mlx5_4
  NIC5: mlx5_5
  NIC6: mlx5_6
  NIC7: mlx5_7
  NIC8: mlx5_8
  NIC9: mlx5_9
  NIC10: mlx5_10
  NIC11: mlx5_11

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/rootvg-lvswap rd.md.uuid=2af815e3:3af6ecd9:384bc84d:419893b2 rd.lvm.lv=rootvg/lvroot rd.md.uuid=58f7a539:c9bca8de:6366ee85:4c38549a rd.lvm.lv=rootvg/lvswap rd.lvm.lv=rootvg/lvusr selinux=0 audit=1 tsx=auto slab_nomerge numa=off"
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau rd.driver.blacklist=nova-core"
((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0008 ~]$ 

((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/rootvg-lvswap rd.md.uuid=9c90a6f3:7ec9293a:bfb3c4eb:88206a82 rd.lvm.lv=rootvg/lvroot rd.md.uuid=88dc55fe:69117332:1fca8338:fb061701 rd.lvm.lv=rootvg/lvswap rd.lvm.lv=rootvg/lvusr selinux=0 audit=1 tsx=auto slab_nomerge numa=off"
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau rd.driver.blacklist=nova-core"


[dcbsr_dev@tpgds-aihub0003 ~]$ cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/rootvg-lvswap rd.md.uuid=7ce4fa65:91e1792e:70daaa77:518e6e8d rd.lvm.lv=rootvg/lvroot rd.md.uuid=09ce113e:0aa529fa:275857e3:076a9163 rd.lvm.lv=rootvg/lvswap rd.lvm.lv=rootvg/lvusr selinux=0 audit=1 tsx=auto slab_nomerge"
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau rd.driver.blacklist=nova-core"

pdsh -w tpgds-aihub0003,tpgds-aihub0006,tpgds-aihub0007,tpgds-aihub0008 \
  'python3 -c "import torch; print(torch.cuda.nccl.version())"'


cat /proc/113695/environ | tr '\0' '\n' | grep -E "NCCL|SGLANG|CUDA|NIXL|MC_"


[rank10]:[W305 10:17:38.040221001 ProcessGroupNCCL.cpp:1771] [PG ID 0 PG GUID 0 Rank 10] Failed to check the "should dump" flag on TCPStore, (maybe TCPStore server has shut down too early), with error: Broken pipe
[rank15]:[W305 10:17:38.404745404 TCPStore.cpp:106] [c10d] sendBytes failed on SocketImpl(fd=102, addr=tpgds-aihub0008.delta.sbrf.ru:33978, remote=10.99.91.59:5000): Broken pipe
Exception raised from sendBytes at /pytorch/torch/csrc/distributed/c10d/Utils.hpp:653 (most recent call first):
frame #0: c10::Error::Error(c10::SourceLocation, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) + 0x80 (0x7fd72e37cb80 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libc10.so)
frame #1: <unknown function> + 0x5ffc5b1 (0x7fd7111fc5b1 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #2: <unknown function> + 0x5ffce42 (0x7fd7111fce42 in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)
frame #3: <unknown function> + 0x5ffe94e (0x7fd7111fe94e in /app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/lib/libtorch_cpu.so)









((sglang-0.5.9) ) [dcbsr_dev@tpgds-aihub0007 ~]$ NCCL_IB_DISABLE=1 SGLANG_HOST_IP=10.99.91.59 NCCL_SOCKET_IFNAME=enp25s0np0 NCCL_IB_HCA="=mlx5_0,=mlx5_1,=mlx5_2,=mlx5_5,=mlx5_6,=mlx5_7,=mlx5_8,=mlx5_11" NCCL_IB_GID_INDEX=3 python3 -m sglang.launch_server   --model-path /app/models/Deepseek-R1/ --trust-remote-code   --tp-size 16 --host 10.99.91.59 --port 30001   --dist-init-addr 10.99.91.59:5000 --nnodes 2 --node-rank 0   --mem-fraction-static 0.8 --disaggregation-mode decode   --disaggregation-transfer-backend nixl   --disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_5,mlx5_6,mlx5_7,mlx5_8,mlx5_11   --max-running-requests 128 


Warning: please use at least NVCC 12.9 for the best DeepGEMM performance
[2026-03-05 10:24:01 TP1] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 370, in __init__
    self.capture()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 526, in capture
    _capture_one_stream()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 513, in _capture_one_stream
    ) = self.capture_one_batch_size(bs, forward, stream_idx)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 732, in capture_one_batch_size
    run_once()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 719, in run_once
    logits_output_or_pp_proxy_tensors = forward(
                                        ^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/utils/_contextlib.py", line 120, in decorate_context
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2919, in forward
    hidden_states = self.model(
                    ^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2730, in forward
    hidden_states, residual = layer(
                              ^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 2395, in forward
    hidden_states = self.self_attn(
                    ^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 1366, in forward
    s = self.forward_prepare(
        ^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 1420, in forward_prepare
    inner_state = self.forward_absorb_prepare(
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/models/deepseek_v2.py", line 1729, in forward_absorb_prepare
    q_pe, k_pe = self.rotary_emb(positions, q_pe, k_pe)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/nn/modules/module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/layers/utils/multi_platform.py", line 71, in forward
    return self._forward_method(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/layers/rotary_embedding.py", line 365, in forward_cuda
    apply_rope_with_cos_sin_cache_inplace(
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/jit_kernel/rope.py", line 227, in apply_rope_with_cos_sin_cache_inplace
    apply_rope_pos_ids_cos_sin_cache_without_kv_cache(
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/torch/_ops.py", line 1255, in __call__
    return self._op(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/jit_kernel/rope.py", line 108, in apply_rope_pos_ids_cos_sin_cache_without_kv_cache
    module = _jit_apply_rope_pos_ids_cos_sin_cache_module()
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/jit_kernel/utils.py", line 28, in wrapper
    result_map[key] = fn(*args, **kwargs)
                      ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/jit_kernel/rope.py", line 26, in _jit_apply_rope_pos_ids_cos_sin_cache_module
    return load_jit(
           ^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/jit_kernel/utils.py", line 162, in load_jit
    return load_inline(
           ^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/tvm_ffi/cpp/extension.py", line 1035, in load_inline
    build_inline(
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/tvm_ffi/cpp/extension.py", line 877, in build_inline
    return _build_impl(
           ^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/tvm_ffi/cpp/extension.py", line 672, in _build_impl
    build_ninja(str(build_dir))
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/tvm_ffi/cpp/extension.py", line 542, in build_ninja
    raise RuntimeError("\n".join(msg))
RuntimeError: ninja exited with status 1
stdout:
[1/1] c++ cuda_0.o -shared -L/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/tvm_ffi/lib -ltvm_ffi -L/usr/local/cuda-12.8/lib64 -lcudart -o sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so
FAILED: [code=1] sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so 
c++ cuda_0.o -shared -L/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/tvm_ffi/lib -ltvm_ffi -L/usr/local/cuda-12.8/lib64 -lcudart -o sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so
/usr/bin/ld: cannot find -lcudart
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 3130, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 368, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 564, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 522, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 247, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 330, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 413, in __init__
    self.initialize(min_per_gpu_memory)
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 609, in initialize
    self.init_device_graphs()
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 2156, in init_device_graphs
    self.graph_runner = graph_runners[self.device](self)
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-0.5.9/lib64/python3.12/site-packages/sglang/srt/model_executor/cuda_graph_runner.py", line 372, in __init__
    raise Exception(
Exception: Capture cuda graph failed: ninja exited with status 1
stdout:
[1/1] c++ cuda_0.o -shared -L/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/tvm_ffi/lib -ltvm_ffi -L/usr/local/cuda-12.8/lib64 -lcudart -o sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so
FAILED: [code=1] sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so 
c++ cuda_0.o -shared -L/app/sglang/sglang-0.5.9/lib/python3.12/site-packages/tvm_ffi/lib -ltvm_ffi -L/usr/local/cuda-12.8/lib64 -lcudart -o sgl_kernel_jit_apply_rope_pos_ids_cos_sin_cache.so
/usr/bin/ld: cannot find -lcudart
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

Possible solutions:
1. set --mem-fraction-static to a smaller value (e.g., 0.8 or 0.7)
2. set --cuda-graph-max-bs to a smaller value (e.g., 16)
3. disable torch compile by not using --enable-torch-compile
4. disable CUDA graph by --disable-cuda-graph. (Not recommended. Huge performance loss)
Open an issue on GitHub https://github.com/sgl-project/sglang/issues/new/choose 


[2026-03-05 10:24:01] Received sigquit from a child process. It usually means the child failed.
Killed



