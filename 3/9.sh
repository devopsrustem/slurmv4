
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
