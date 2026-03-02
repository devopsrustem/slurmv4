https://arxiv.org/html/2508.01989v1


Отлично! Настроение боевое — две недели пробивались через эту стену, и вот оно работает.
Запрос с метриками:
bashcurl -s http://10.99.91.39:8000/generate \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Explain the theory of relativity in detail",
    "sampling_params": {
      "max_new_tokens": 200,
      "temperature": 0.7
    }
  }'
После ответа посмотри метрики напрямую с серверов:
bash# Prefill throughput
curl -s http://10.99.91.39:30000/get_server_info | python3 -m json.tool

# Decode throughput  
curl -s http://10.99.91.49:30001/get_server_info | python3 -m json.tool
Для нагрузочного теста (чтобы видеть реальную пропускную способность):
bashpython3 -m sglang.bench_serving \
  --backend sglang \
  --host 10.99.91.39 \
  --port 8000 \
  --num-prompts 20 \
  --request-rate 4 \
  --input-len 512 \
  --output-len 128
Присылай результаты — посмотрим TTFT (time to first token) и throughput. Для схемы 2P+2D с DeepSeek-R1 на H100 ожидаем TTFT < 500ms и decode > 1000 tok/s суммарно.
