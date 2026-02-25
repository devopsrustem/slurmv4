((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
#10.82.101.249     tpgds-aihub0003.delta.sbrf.ru tpgds-aihub0003
10.99.91.49     tpgds-aihub0003.delta.sbrf.ru tpgds-aihub0003
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ p^C install sglang 
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ python3 -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
10.99.91.49
