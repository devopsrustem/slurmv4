
Summary:
  Total:	80.0035 secs
  Slowest:	16.9997 secs
  Fastest:	2.1150 secs
  Average:	8.4074 secs
  Requests/sec:	2.4999
  
  Total data:	208592 bytes
  Size/request:	2065 bytes

Response time histogram:
  2.115 [1]	|■■
  3.604 [1]	|■■
  5.092 [6]	|■■■■■■■■■■■
  6.580 [17]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  8.069 [22]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  9.557 [21]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  11.046 [16]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  12.534 [11]	|■■■■■■■■■■■■■■■■■■■■
  14.023 [4]	|■■■■■■■
  15.511 [1]	|■■
  17.000 [1]	|■■


Latency distribution:
  10% in 5.1888 secs
  25% in 6.6515 secs
  50% in 8.3323 secs
  75% in 10.0073 secs
  90% in 12.0470 secs
  95% in 13.0460 secs
  99% in 16.9997 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0165 secs, 2.1150 secs, 16.9997 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0004 secs
  resp wait:	8.3906 secs, 2.1075 secs, 16.9896 secs
  resp read:	0.0001 secs, 0.0001 secs, 0.0009 secs

Status code distribution:
  [200]	101 responses

Error distribution:
  [99]	Post "http://10.82.101.193:8000/v1/chat/completions": context deadline exceeded (Client.Timeout exceeded while awaiting headers)




./hey_linux_amd64 -n 10 -c 2 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions









  23534980@sigma.sbrf.ru@CAB-WSN-0052363:/home/work/23534980@sigma.sbrf.ru$ ./hey_linux_amd64 -n 10 -c 2 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions

Summary:
  Total:	53.3455 secs
  Slowest:	7.9777 secs
  Fastest:	3.1785 secs
  Average:	5.1506 secs
  Requests/sec:	0.1875
  
  Total data:	14355 bytes
  Size/request:	2050 bytes

Response time histogram:
  3.179 [1]	|■■■■■■■■■■■■■
  3.658 [1]	|■■■■■■■■■■■■■
  4.138 [0]	|
  4.618 [0]	|
  5.098 [3]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  5.578 [0]	|
  6.058 [0]	|
  6.538 [1]	|■■■■■■■■■■■■■
  7.018 [0]	|
  7.498 [0]	|
  7.978 [1]	|■■■■■■■■■■■■■


Latency distribution:
  10% in 3.4238 secs
  25% in 5.0322 secs
  50% in 5.0976 secs
  75% in 7.9777 secs
  0% in 0.0000 secs
  0% in 0.0000 secs
  0% in 0.0000 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0025 secs, 3.1785 secs, 7.9777 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0001 secs
  resp wait:	5.1479 secs, 3.1724 secs, 7.9718 secs
  resp read:	0.0001 secs, 0.0001 secs, 0.0001 secs

Status code distribution:
  [200]	7 responses

Error distribution:
  [3]	Post "http://10.82.101.193:8000/v1/chat/completions": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

./hey_linux_amd64 -n 10 -c 2 -t 60 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"default","messages":[{"role":"user","content":"1+666"}],"max_tokens":12048}' \
  http://10.82.101.193:8000/v1/chat/completions
