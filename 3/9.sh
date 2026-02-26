((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$   /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000 8998   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:794: Starting router on 0.0.0.0:8000 | mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", Some(8998))], decode_urls: ["http://10.99.91.49:30001"], prefill_policy: None, decode_policy: None } | policy: CacheAware { cache_threshold: 0.3, balance_abs_threshold: 64, balance_rel_threshold: 1.5, eviction_interval_secs: 60, max_tree_size: 67108864 } | max_payload: 512MB
2026-02-26 13:55:38  INFO smg::app_context: /home/runner/work/sglang/sglang/src/app_context.rs:412: Tokenizer path is not provided, will load from worker on the fly
2026-02-26 13:55:38  INFO smg::data_connector::factory: /home/runner/work/sglang/sglang/src/data_connector/factory.rs:51: Initializing data connector: Memory
2026-02-26 13:55:38  INFO smg::mcp::manager: /home/runner/work/sglang/sglang/src/mcp/manager.rs:90: No static MCP servers connected
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:833: Initializing workers for routing mode: PrefillDecode { prefill_urls: [("http://10.99.91.39:30000", Some(8998))], decode_urls: ["http://10.99.91.49:30001"], prefill_policy: None, decode_policy: None }
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:851: Worker initialization job submitted (will complete in background)
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:863: No MCP config provided, skipping MCP server initialization
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:875: Workers initialized: 0 total, 0 healthy
2026-02-26 13:55:38  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 definition_id=local_worker_registration
2026-02-26 13:55:38  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:197: Workflow started instance_id=35c93114-7e47-47b7-93d1-e681154323bf definition_id=local_worker_registration
2026-02-26 13:55:38  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:169: Initializing RouterManager in single-router mode
2026-02-26 13:55:38  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:177: Created single router with ID: http-pd
2026-02-26 13:55:38  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=detect_connection_mode attempt=1
2026-02-26 13:55:38  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=detect_connection_mode attempt=1
2026-02-26 13:55:38  INFO smg::routers::router_manager: /home/runner/work/sglang/sglang/src/routers/router_manager.rs:216: Set default router to http-pd
2026-02-26 13:55:38  INFO smg::core::worker_manager: /home/runner/work/sglang/sglang/src/core/worker_manager.rs:350: Starting load monitoring with interval: 30s
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:907: Rate limiting is disabled (max_concurrent_requests = -1)
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:985: Router ready | workers: []
2026-02-26 13:55:38  INFO smg::server: /home/runner/work/sglang/sglang/src/server.rs:1018: Starting server on 0.0.0.0:8000
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=detect_connection_mode duration_ms=1001
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=discover_metadata attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=detect_connection_mode duration_ms=1002
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=discover_metadata attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=discover_metadata duration_ms=10
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=discover_dp_info attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=discover_dp_info duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=discover_metadata duration_ms=11
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=discover_dp_info attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=create_worker attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=discover_dp_info duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=create_worker duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=register_workers attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=register_workers duration_ms=0
2026-02-26 13:55:39  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-26 13:55:39  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:121: Loading tokenizer '/app/models/Deepseek-R1/' from source: /app/models/Deepseek-R1/
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=create_worker attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=activate_workers duration_ms=0
2026-02-26 13:55:39  INFO smg::policies::registry: /home/runner/work/sglang/sglang/src/policies/registry.rs:89: Assigning policy cache_aware to new model /app/models/Deepseek-R1/
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=register_workers attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=create_worker duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=activate_workers attempt=1
2026-02-26 13:55:39  WARN smg::core::steps::worker::shared::update_policies: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/update_policies.rs:62: Model /app/models/Deepseek-R1/ has conflicting load_balance_method: prefill=Some("follow_bootstrap_room"), decode=Some("round_robin")
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=register_workers duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=update_policies attempt=1
2026-02-26 13:55:39  INFO smg::core::steps::worker::shared::activate: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/activate.rs:31: Activated 1 worker(s) (marked as healthy)
2026-02-26 13:55:39  WARN smg::core::steps::worker::shared::update_policies: /home/runner/work/sglang/sglang/src/core/steps/worker/shared/update_policies.rs:62: Model /app/models/Deepseek-R1/ has conflicting load_balance_method: prefill=Some("follow_bootstrap_room"), decode=Some("round_robin")
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=register_tokenizer attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=activate_workers duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=activate_workers attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=update_policies duration_ms=0
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=update_policies attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=update_policies duration_ms=0
2026-02-26 13:55:39  INFO smg::tokenizer::registry: /home/runner/work/sglang/sglang/src/tokenizer/registry.rs:141: Successfully registered tokenizer '/app/models/Deepseek-R1/' with id: b5e1f926-0fca-4038-a31d-aeeda00491a2
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:208: Step started instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=register_tokenizer attempt=1
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=35c93114-7e47-47b7-93d1-e681154323bf step_id=register_tokenizer duration_ms=224
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=35c93114-7e47-47b7-93d1-e681154323bf duration_ms=1238
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:259: Workflow completed instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 duration_ms=1238
2026-02-26 13:55:39  INFO smg::workflow::event: /home/runner/work/sglang/sglang/src/workflow/event.rs:220: Step succeeded instance_id=c2d6835f-a5cd-4c44-bbf4-cecdc9683987 step_id=register_tokenizer duration_ms=224



[dcbsr_dev@tpgds-aihub0001 ~]$ curl -X POST http://10.82.101.193:8000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "default",
    "messages": [{"role": "user", "content": "Hello! What is 2+2?"}],
    "max_tokens": 50
  }'
{"error":{"type":"Internal Server Error","code":"decode_internal_error","message":"Decode transfer failed for request rank=0 decode_req.req.rid='32b8f521b1ec468a98cb5d2da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead"}}[dcbsr_dev@tpgds-aihub0001 ~]$ 

[2026-02-26 16:56:26 TP5] Prefill transfer failed for request rank=5 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.49:15070 is not alive
Req(rid=31c9952e7f0c44fa94ddbeec39b006a3, input_ids=[0, 128803, 19923, 3, 1999, 344, 223, 20, 13, 20, 33, 128804], output_ids=[128798], self.grammar=None, self.sampling_params=<sglang.srt.sampling.sampling_params.SamplingParams object at 0x7f9096ea7980>)
Req(rid=31c9952e7f0c44fa94ddbeec39b006a3, input_ids=[0, 128803, 19923, 3, 1999, 344, 223, 20, 13, 20, 33, 128804], output_ids=[128798], self.grammar=None, self.sampling_params=<sglang.srt.sampling.sampling_params.SamplingParams object at 0x7f4e36a8deb0>)
[2026-02-26 16:56:26 TP4] Prefill transfer failed for request rank=4 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.49:16911 is not alive
[2026-02-26 16:56:26 TP3] Prefill transfer failed for request rank=3 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.49:15799 is not alive
[2026-02-26 16:56:26 TP2] Prefill transfer failed for request rank=2 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.49:16422 is not alive
[2026-02-26 16:56:26 TP1] Prefill transfer failed for request rank=1 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.49:16960 is not alive
[2026-02-26 16:56:26] INFO:     10.99.91.39:48574 - "POST /v1/chat/completions HTTP/1.1" 500 Internal Server Error
[2026-02-26 16:56:38 TP0] Prefill batch, #new-seq: 1, #new-token: 1, #cached-token: 0, token usage: 0.00, #running-req: 0, #queue-req: 0, #prealloc-req: 0, #inflight-req: 0, input throughput (token/s): 0.08, 


ncake session 10.99.91.35:16553 is not alive
[2026-02-26 16:56:26 TP10] Prefill transfer failed for request rank=10 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.35:16765 is not alive
[2026-02-26 16:56:26 TP9] Prefill transfer failed for request rank=9 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.35:15467 is not alive
[2026-02-26 16:56:26 TP8] Prefill transfer failed for request rank=8 req.rid='31c9952e7f0c44fa94ddbeec39b006a3' req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Decode instance could be dead, remote mooncake session 10.99.91.35:16183 is not alive

da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:56:26 TP9] Decode transfer failed for request rank=9 decode_req.req.rid='32b8f521b1ec468a98cb5d2da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:56:26 TP8] Decode transfer failed for request rank=8 decode_req.req.rid='32b8f521b1ec468a98cb5d2da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead


[2026-02-26 16:56:26 TP1] Decode transfer failed for request rank=1 decode_req.req.rid='32b8f521b1ec468a98cb5d2da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead
[2026-02-26 16:56:26 TP2] Decode transfer failed for request rank=2 decode_req.req.rid='32b8f521b1ec468a98cb5d2da98654e2' decode_req.req.bootstrap_room=4073374190146881990 with exception KVTransferError(bootstrap_room=4073374190146881990): Failed to get kvcache from prefill instance, it might be dead


