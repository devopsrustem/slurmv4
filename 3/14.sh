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
