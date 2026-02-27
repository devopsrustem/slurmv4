Шаг 1 — Диагностика через TCP (5 минут)
Добавить на все 4 ноды и перезапустить:
bashexport MC_FORCE_TCP=true
Если заработает — проблема в RDMA (GID/device). Если нет — проблема в портах или регистрации сессий.

Шаг 2 — Если TCP работает, исправляем RDMA
bashexport MC_GID_INDEX=3
export MC_TCP_BIND_ADDRESS=10.99.91.X  # RoCE IP каждой ноды
И расширить --disaggregation-ib-device со всеми физическими NIC:
bash--disaggregation-ib-device mlx5_0,mlx5_1,mlx5_2,mlx5_3,mlx5_4,mlx5_5,mlx5_6,mlx5_7
Проверить что GID index 3 реально RoCEv2/IPv4:
bashshow_gids | grep mlx5_0
# Должно быть ::ffff:10.99.91.X на индексе 3

Шаг 3 — Проверить коллизии портов после запуска
bashss -tlnp | grep python | awk '{print $4}' | sort -t: -k2 -n
# Все 8 портов TransferEngine на ноде должны быть уникальными

Шаг 4 — Если ничего не помогает: NIXL
bash--disaggregation-transfer-backend nixl
pip install nixl
Подтверждённо работает на H20 с mlx5_bond окружением.

Добавить к логированию на время диагностики:
bashexport GLOG_v=3
export MC_YLT_LOG_LEVEL=debug
export MC_TE_METRIC=1
Искать в логах: "Find best gid index" — если там fe80:: или нули вместо ::ffff:10.99.91.X — GID неправильный.
