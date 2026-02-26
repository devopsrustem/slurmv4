bash# С aihub0001 → aihub0003
echo "" | nc -w 2 10.99.91.49 15328; echo "exit: $?"

# С aihub0002 → aihub0006  
echo "" | nc -w 2 10.99.91.35 15599; echo "exit: $?"
И одновременно посмотри что пишет decode в момент подключения — найди stdout процесса:
bash# На aihub0003
ls -la /proc/3110559/fd/1 /proc/3110559/fd/2
# Если симлинк на /dev/pts/* или pipe - читать так:
tail -f /proc/3110559/fd/2
И самое важное — проверь есть ли bootstrap сервер (etcd/redis) который Mooncake использует для регистрации сессий, и видят ли его обе стороны:
bash# На всех 4 нодах
ss -tlnp | grep -E '2379|6379|8500'
# или
ps aux | grep -E 'etcd|redis|bootstrap'
Как именно запускается SGLang — есть ли --disaggregation-bootstrap-host параметр в команде запуска?
