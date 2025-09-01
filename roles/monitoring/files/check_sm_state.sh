# Путь к команде
SMINFO_CMD=$(command -v sminfo)

# Заголовки метрик
echo "# HELP infiniband_sm_state Subnet Manager state: 3 - MASTER, 2 - STANDBY, 0 - DOWN" > "$OUT_FILE"
echo "# TYPE infiniband_sm_state gauge" >> "$OUT_FILE"

# Попробуем получить вывод sminfo
if OUTPUT=$($SMINFO_CMD 2>&1); then
    # Парсим значения, если команда отработала успешно
    SM_LID=$(echo "$OUTPUT" | grep -oP 'sm lid \K\d+')
    SM_GUID=$(echo "$OUTPUT" | grep -oP 'sm guid \K0x[0-9a-fA-F]+')
    SM_STATE=$(echo "$OUTPUT" | grep -oP 'state \K\d+')

    # Добавим метрику
    echo "infiniband_sm_state{sm_lid=\"$SM_LID\", sm_guid=\"$SM_GUID\"} $SM_STATE" >> "$OUT_FILE"
else
    # Если команда не сработала, считаем что SM DOWN
    echo "infiniband_sm_state{sm_lid=\"\", sm_guid=\"\"} 0" >> "$OUT_FILE"
fi
