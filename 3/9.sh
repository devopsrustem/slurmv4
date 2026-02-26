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


Это binary garbage на входе — классический признак несовместимости протокола или ABI. Проверь версии Mooncake на обеих сторонах:
bash# На aihub0001 (prefill)
python3 -c "import mooncake; print(mooncake.__version__)" 2>/dev/null || \
pip show mooncake 2>/dev/null | grep Version

# На aihub0003 (decode)  
python3 -c "import mooncake; print(mooncake.__version__)" 2>/dev/null || \
pip show mooncake 2>/dev/null | grep Version
И проверь что за библиотека используется через LD_PRELOAD:
bash# На aihub0001
cat /opt/mooncake-libs/run-with-new-libstdc.sh

# Какой libmooncake.so грузится
ls -la /opt/mooncake-libs/
python3 -c "import mooncake._transfer_engine; print(mooncake._transfer_engine.__file__)"

https://github.com/kvcache-ai/Mooncake/tree/main


[dcbsr_dev@tpgds-aihub0001 ~]$ . /app/sglang/sglang-0.5.8.post1/bin/activate
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ python3 -c "import mooncake; print(mooncake.__version__)" 2>/dev/null || \
pip show mooncake 2>/dev/null | grep Version
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ pip show mooncake
WARNING: Package(s) not found: mooncake

[dcbsr_dev@tpgds-aihub0003 ~]$ python3 -c "import mooncake; print(mooncake.__version__)" 2>/dev/null || \
pip show mooncake 2>/dev/null | grep Version
[dcbsr_dev@tpgds-aihub0003 ~]$ . /app/sglang/sglang-latest/bin/activate
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ python3 -c "import mooncake; print(mooncake.__version__)" 2>/dev/null || \
pip show mooncake 2>/dev/null | grep Version
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0003 ~]$ ls -la /opt/mooncake-libs/
python3 -c "import mooncake._transfer_engine; print(mooncake._transfer_engine.__file__)"
total 1920
drwxr-xr-x   3 root root      73 Feb 26 13:06 .
drwxr-xr-x. 11 root root     197 Feb 17 15:59 ..
drwxrwxrwx   2 root root      27 Feb 26 13:07 config
-rwxr-xr-x   1 root root 1958696 Feb 19 15:22 libstdc++.so.6
-rwxr-xr-x   1 root root      74 Feb 17 16:03 run-with-new-libstdc.sh
