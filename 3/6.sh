1-2
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ lscpu | grep -i numa
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-223


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ lscpu | grep -i numa
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-111


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ lscpu | grep -i numa
NUMA node(s):                            8
NUMA node0 CPU(s):                       0-13
NUMA node1 CPU(s):                       14-27
NUMA node2 CPU(s):                       28-41
NUMA node3 CPU(s):                       42-55
NUMA node4 CPU(s):                       56-69
NUMA node5 CPU(s):                       70-83
NUMA node6 CPU(s):                       84-97
NUMA node7 CPU(s):                       98-111


((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ numactl --cpunodebind=0 --membind=0
usage: numactl [--all | -a] [--balancing | -b]
               [--interleave= | -i <nodes>] [--weighted-interleave= | -w <nodes>]
               [--preferred= | -p <node>] [--preferred-many= | -P <nodes>]
               [--physcpubind= | -C <cpus>] [--cpunodebind= | -N <nodes>]
               [--membind= | -m <nodes>] [--localalloc | -l] command args ...
               [--localalloc | -l] command args ...
       numactl [--show | -s]
       numactl [--hardware | -H] [--cpu-compress]
       numactl [--version]
       numactl [--length | -L <length>] [--offset | -o <offset>] [--shmmode | -M <shmmode>]
               [--strict | -t]
               [--shmid | -I <id>] --shm | -S <shmkeyfile>
               [--shmid | -I <id>] --file | -f <tmpfsfile>
               [--huge | -u] [--touch | -T] 
               memory policy [--dump | -d] [--dump-nodes | -D]

memory policy is --preferred | -p, --membind | -m, --localalloc | -l,
                 --interleave | -i, --weighted-interleave | -w
<nodes> is a comma delimited list of node numbers or A-B ranges or all.
Instead of a number a node can also be:
  netdev:DEV the node connected to network device DEV
  file:PATH  the node the block device of path is connected to
  ip:HOST    the node of the network device host routes through
  block:PATH the node of block device path
  pci:[seg:]bus:dev[:func] The node of a PCI device
<cpus> is a comma delimited list of cpu numbers or A-B ranges or all
all ranges can be inverted with !
all numbers and ranges can be made cpuset-relative with +
the old --cpubind argument is deprecated.
use --cpunodebind or --physcpubind instead
use --balancing | -b to enable Linux kernel NUMA balancing
for the process if it is supported by kernel
<length> can have g (GB), m (MB) or k (KB) suffixes
