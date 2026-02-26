
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$   /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router   --pd-disaggregation   --prefill http://10.99.91.39:30000,8998   --decode http://10.99.91.49:30001   --host 0.0.0.0   --port 8000
Error starting router: Configuration error: Invalid value for field 'worker_url': http://10.99.91.39:30000,8998 - Invalid URL format: invalid port number
Traceback (most recent call last):
  File "<frozen runpy>", line 198, in _run_module_as_main
  File "<frozen runpy>", line 88, in _run_code
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py", line 109, in <module>
    main()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py", line 105, in main
    launch_router(router_args)
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py", line 52, in launch_router
    raise e
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py", line 48, in launch_router
    router.start()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/router.py", line 319, in start
    self._router.start()
ValueError: Configuration error: Invalid value for field 'worker_url': http://10.99.91.39:30000,8998 - Invalid URL format: invalid port number
((sglang-0.5.8.post1) ) [dcbsr_dev@tpgds-aihub0001 ~]$ 




Investigated argument parsing discrepancy between Python and Rust layers




Rust-часть роутера валидирует URL строже. Посмотри актуальный синтаксис:

bash
/app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router --help | grep -A5 -i "prefill\|bootstrap"
И посмотри как именно router_args.py парсит и передаёт в Rust:

bash
grep -A20 "prefill" /app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py | head -40
Возможно bootstrap port передаётся отдельным аргументом:

bash
# Вариант 1 - отдельный аргумент
/app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router \
  --pd-disaggregation \
  --prefill http://10.99.91.39:30000 \
  --prefill-bootstrap-port 8998 \
  --decode http://10.99.91.49:30001 \
  --host 0.0.0.0 --port 8000



[dcbsr_dev@tpgds-aihub0001 ~]$ /app/sglang/sglang-latest/bin/python3 -m sglang_router.launch_router --help | grep -A5 -i "prefill\|bootstrap"
                        [--prefill-policy {random,round_robin,cache_aware,power_of_two,manual,bucket}]
                        [--decode-policy {random,round_robin,cache_aware,power_of_two,manual}]
                        [--cache-threshold CACHE_THRESHOLD]
                        [--balance-abs-threshold BALANCE_ABS_THRESHOLD]
                        [--balance-rel-threshold BALANCE_REL_THRESHOLD]
                        [--bucket-adjust-interval-secs BUCKET_ADJUST_INTERVAL_SECS]
--
                        [--prefill PREFILL [PREFILL ...]] [--decode URL]
                        [--worker-startup-timeout-secs WORKER_STARTUP_TIMEOUT_SECS]
                        [--worker-startup-check-interval WORKER_STARTUP_CHECK_INTERVAL]
                        [--log-dir LOG_DIR]
                        [--log-level {debug,info,warn,error}]
                        [--service-discovery]
--
                        [--prefill-selector PREFILL_SELECTOR [PREFILL_SELECTOR ...]]
                        [--decode-selector DECODE_SELECTOR [DECODE_SELECTOR ...]]
                        [--prometheus-port PROMETHEUS_PORT]
                        [--prometheus-host PROMETHEUS_HOST]
                        [--prometheus-duration-buckets PROMETHEUS_DURATION_BUCKETS [PROMETHEUS_DURATION_BUCKETS ...]]
                        [--request-id-headers [REQUEST_ID_HEADERS ...]]
--
    --prefill http://prefill1:8000 9000 --prefill http://prefill2:8000 \
    --decode http://decode1:8001 --decode http://decode2:8001 \
    --policy cache_aware

  # PD mode with optional bootstrap ports
  python -m sglang_router.launch_router --pd-disaggregation \
    --prefill http://prefill1:8000 9000 \    # With bootstrap port
    --prefill http://prefill2:8000 none \    # Explicitly no bootstrap port
    --prefill http://prefill3:8000 \         # Defaults to no bootstrap port
    --decode http://decode1:8001 --decode http://decode2:8001

  # PD mode with different policies for prefill and decode
  python -m sglang_router.launch_router --pd-disaggregation \
    --prefill http://prefill1:8000 --prefill http://prefill2:8000 \
    --decode http://decode1:8001 --decode http://decode2:8001 \
    --prefill-policy cache_aware --decode-policy power_of_two

    

options:
  -h, --help            show this help message and exit
--
                        for both prefill and decode unless overridden
                        (default: cache_aware)
  --prefill-policy {random,round_robin,cache_aware,power_of_two,manual,bucket}
                        Specific policy for prefill nodes in PD mode. If not
                        specified, uses the main policy (default: None)
  --decode-policy {random,round_robin,cache_aware,power_of_two,manual}
                        Specific policy for decode nodes in PD mode. If not
                        specified, uses the main policy (default: None)
  --cache-threshold CACHE_THRESHOLD
--
  Prefill-Decode disaggregated mode settings

  --mini-lb             Enable MiniLB (default: False)
  --pd-disaggregation   Enable PD (Prefill-Decode) disaggregated mode
                        (default: False)
  --prefill PREFILL [PREFILL ...]
                        Prefill server URL and optional bootstrap port. Can be
                        specified multiple times. Format: --prefill URL
                        [BOOTSTRAP_PORT]. BOOTSTRAP_PORT can be a port number,
                        'none', or omitted (defaults to none). (default: None)
  --decode URL          Decode server URL. Can be specified multiple times.
                        (default: None)
  --worker-startup-timeout-secs WORKER_STARTUP_TIMEOUT_SECS
                        Timeout in seconds for worker startup and registration
--
  --prefill-selector PREFILL_SELECTOR [PREFILL_SELECTOR ...]
                        Label selector for prefill server pods in PD mode
                        (format: key1=value1 key2=value2) (default: {})
  --decode-selector DECODE_SELECTOR [DECODE_SELECTOR ...]
                        Label selector for decode server pods in PD mode
                        (format: key1=value1 key2=value2) (default: {})

[dcbsr_dev@tpgds-aihub0001 ~]$ grep -A20 "prefill" /app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang_router/launch_router.py | head -40
    --prefill http://prefill1:8000 9000 --prefill http://prefill2:8000 \\
    --decode http://decode1:8001 --decode http://decode2:8001 \\
    --policy cache_aware

  # PD mode with optional bootstrap ports
  python -m sglang_router.launch_router --pd-disaggregation \\
    --prefill http://prefill1:8000 9000 \\    # With bootstrap port
    --prefill http://prefill2:8000 none \\    # Explicitly no bootstrap port
    --prefill http://prefill3:8000 \\         # Defaults to no bootstrap port
    --decode http://decode1:8001 --decode http://decode2:8001

  # PD mode with different policies for prefill and decode
  python -m sglang_router.launch_router --pd-disaggregation \\
    --prefill http://prefill1:8000 --prefill http://prefill2:8000 \\
    --decode http://decode1:8001 --decode http://decode2:8001 \\
    --prefill-policy cache_aware --decode-policy power_of_two

    """,
        formatter_class=CustomHelpFormatter,
    )

    RouterArgs.add_cli_args(parser, use_router_prefix=False)
    return RouterArgs.from_cli_args(parser.parse_args(args), use_router_prefix=False)


def main() -> None:
    router_args = parse_router_args(sys.argv[1:])
    launch_router(router_args)


if __name__ == "__main__":
    main()
[dcbsr_dev@tpgds-aihub0001 ~]$ 
