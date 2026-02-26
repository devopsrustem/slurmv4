aihub2
[2026-02-26 16:00:13 TP10] Prefill transfer failed for request rank=10 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.35:16581 is not alive
[2026-02-26 16:00:13 TP9] Prefill transfer failed for request rank=9 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.35:15596 is not alive
[2026-02-26 16:00:13 TP8] Prefill transfer failed for request rank=8 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.35:15599 is not alive


aihub6
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ss -tlnp | grep -E "15599"
LISTEN 0      128          0.0.0.0:15599      0.0.0.0:*    users:(("sglang::schedul",pid=484964,fd=249))
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ ss -tlnp | grep -E "16581"
LISTEN 0      128          0.0.0.0:16581      0.0.0.0:*    users:(("sglang::schedul",pid=484966,fd=249))
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0006 ~]$ 


[2026-02-26 16:00:13 TP11] Decode transfer failed for request rank=11 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP10] Decode transfer failed for request rank=10 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP9] Decode transfer failed for request rank=9 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP8] Decode transfer failed for request rank=8 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead


aihub3
[2026-02-26 16:00:13 TP4] Decode transfer failed for request rank=4 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP3] Decode transfer failed for request rank=3 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP2] Decode transfer failed for request rank=2 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:00:13 TP1] Decode transfer failed for request rank=1 decode_req.req.rid='41ffeddd069d40b8b7efd4dc64585ebb' decode_req.req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Failed to get kvcache from prefill instance, it might be dead


aihub1
[2026-02-26 16:00:13 TP4] Prefill transfer failed for request rank=4 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.49:15288 is not alive
[2026-02-26 16:00:13 TP3] Prefill transfer failed for request rank=3 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.49:16838 is not alive
[2026-02-26 16:00:13 TP2] Prefill transfer failed for request rank=2 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.49:16027 is not alive
[2026-02-26 16:00:13 TP1] Prefill transfer failed for request rank=1 req.rid='05d7da4356e3481b93e3312fa7397608' req.bootstrap_room=887504041590801090 with exception KVTransferError(bootstrap_room=887504041590801090): Decode instance could be dead, remote mooncake session 10.99.91.49:15328 is not alive

[dcbsr_dev@tpgds-aihub0003 ~]$ ss -tlnp | grep -E 15328 
LISTEN 0      128          0.0.0.0:15328      0.0.0.0:*    users:(("sglang::schedul",pid=3110559,fd=254))
[dcbsr_dev@tpgds-aihub0003 ~]$ 
