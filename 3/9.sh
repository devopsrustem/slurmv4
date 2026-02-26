# На decode ноде (aihub0003)
ss -tlnp | grep -E '8998|15366|14579|mooncake|python'
И проверить с prefill ноды:
bash# На prefill (aihub0001) - попробовать разные порты
for port in 8998 15366 14579 18888; do
  nc -zv 10.99.91.49 $port 2>&1 | grep -v refused
done
И главное — посмотри что prefill пишет детально, конкретную строку с "not alive":
bashgrep -i "not alive\|mooncake session\|bootstrap\|transfer engine.*address\|transfer engine.*port" ~/prefill_node0.log | tail -20
Там должно быть видно какой адрес:порт prefill пытается зарегистрировать/найти для decode сессии. Вероятно там либо неправильный порт, либо decode регистрирует сессию не на том bootstrap сервере.
Также — как запускаешь, есть ли --disaggregation-bootstrap-room или аналогичный параметр?

[dcbsr_dev@tpgds-aihub0003 ~]$ ss -tlnp | grep -E '8998|15366|14579|mooncake|python'
LISTEN 0      2048     10.99.91.49:30001      0.0.0.0:*    users:(("python3",pid=3110165,fd=98))         

[dcbsr_dev@tpgds-aihub0001 ~]$ for port in 8998 15366 14579 18888; do
  nc -zv 10.99.91.49 $port 2>&1 | grep -v refused
done
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Version 7.92 ( https://nmap.org/ncat )
[dcbsr_dev@tpgds-aihub0001 ~]$ grep -i "not alive\|mooncake session\|bootstrap\|transfer engine.*address\|transfer engine.*port" ~/prefill_node0.log | tail -20
grep: /home/dcbsr_dev/prefill_node0.log: No such file or directory

*.log - вообще не существует в /app и в хомяке


Логи надо найти — они идут в stdout процесса:
bash# На decode ноде - найти куда пишет процесс
ls -la /proc/3110165/fd/1 /proc/3110165/fd/2

# Или читать напрямую из /proc
cat /proc/3110165/fd/1 2>/dev/null | tail -50
# или stderr:
cat /proc/3110165/fd/2 2>/dev/null | tail -50
Либо если запуск через systemd/screen/tmux:
bash# Найти где запущен процесс
ps aux | grep 3110165
# или
cat /proc/3110165/cmdline | tr '\0' ' '
И проверь — может TransferEngine слушает на 0.0.0.0 или на bond IP:
bash# На decode ноде
ss -tlnp | grep -v LISTEN.*:22
# все порты процессов python
ss -tlnp | grep python
