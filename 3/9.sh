[dcbsr_dev@tpgds-aihub0003 ~]$ nc -zv 10.99.91.39 8998
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Connected to 10.99.91.39:8998.
Ncat: 0 bytes sent, 0 bytes received in 0.01 seconds.

[dcbsr_dev@tpgds-aihub0001 ~]$ ss -tlnp | grep -E '8998'
LISTEN 0      128      10.99.91.39:8998       0.0.0.0:*    users:(("python3",pid=824384,fd=121))        

((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ nc -zv 10.99.91.39 8998
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Connected to 10.99.91.39:8998.
Ncat: 0 bytes sent, 0 bytes received in 0.01 seconds.
