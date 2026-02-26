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
