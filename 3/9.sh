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
