#!/bin/bash

DIR="/opt/node-exporter/textfile_collector"

# Если таймер iblinkinfo не активен — удалить его метрику
if ! systemctl is-active --quiet iblinkinfo-exporter.timer; then
    rm -f "$DIR/ib_link_metrics.prom"
fi

# Если таймер check-sm не активен — удалить его метрику
if ! systemctl is-active --quiet check-sm-state.timer; then
    rm -f "$DIR/infiniband_sm.prom"
fi
