
[2026-02-25 16:41:56] tpgds-aihub0003:2387398:2387398 [3] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP3] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:41:56] tpgds-aihub0003:2387399:2387399 [4] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP4] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:41:56] tpgds-aihub0003:2387397:2387397 [2] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP2] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:41:56] tpgds-aihub0003:2387401:2387401 [6] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0003:2387396:2387396 [1] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0003:2387402:2387402 [7] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0003:2387395:2387395 [0] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP6] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 16:41:56 TP1] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56 TP7] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 16:41:56 TP0] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
Killed

6я

=None, decrypted_draft_config_file=None, forward_hooks=None)
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:40:53 TP9] Init torch distributed begin.
[W225 16:40:53.507612761 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:40:54 TP14] Init torch distributed begin.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:40:54 TP8] Init torch distributed begin.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
The module name  (originally ) is not a valid Python identifier. Please rename the original module to avoid import issues.
[2026-02-25 16:40:54 TP15] Init torch distributed begin.
[2026-02-25 16:40:54 TP12] Init torch distributed begin.
[2026-02-25 16:40:54 TP13] Init torch distributed begin.
[2026-02-25 16:40:54 TP10] Init torch distributed begin.
[2026-02-25 16:40:54 TP11] Init torch distributed begin.
[W225 16:40:55.056843901 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.137566524 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.216516700 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.309041586 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.327236249 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.327535356 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[W225 16:40:55.334670101 socket.cpp:767] [c10d] The client socket cannot be initialized to connect to [::ffff:10.99.91.49]:5000 (errno: 97 - Address family not supported by protocol).
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 8 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 13 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 14 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15

[2026-02-25 16:41:56] tpgds-aihub0006:4001371:4001371 [1] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP9] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:41:56] tpgds-aihub0006:4001370:4001370 [0] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP8] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error


[2026-02-25 16:41:56] tpgds-aihub0006:4001373:4001373 [3] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 16:41:56] tpgds-aihub0006:4001374:4001374 [4] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0006:4001375:4001375 [5] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0006:4001377:4001377 [7] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 16:41:56] tpgds-aihub0006:4001376:4001376 [6] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.82.101.249<37857> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 16:41:56 TP11] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 16:41:56 TP12] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56 TP13] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56 TP15] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 16:41:56 TP14] Scheduler hit an exception: Traceback (most recent call last):
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 2937, in run_scheduler_process
    scheduler = Scheduler(
                ^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 346, in __init__
    self.init_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 535, in init_model_worker
    self.init_tp_model_worker()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/scheduler.py", line 497, in init_tp_model_worker
    self.tp_worker = TpModelWorker(
                     ^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 246, in __init__
    self._init_model_runner()
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/managers/tp_worker.py", line 329, in _init_model_runner
    self._model_runner = ModelRunner(
                         ^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 365, in __init__
    min_per_gpu_memory = self.init_torch_distributed()
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/model_executor/model_runner.py", line 766, in init_torch_distributed
    initialize_model_parallel(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1590, in initialize_model_parallel
    _TP = init_model_parallel_group(
          ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 1359, in init_model_parallel_group
    return GroupCoordinator(
           ^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/parallel_state.py", line 330, in __init__
    self.pynccl_comm = PyNcclCommunicator(
                       ^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl.py", line 113, in __init__
    self.comm: ncclComm_t = self.nccl.ncclCommInitRank(
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 399, in ncclCommInitRank
    self.NCCL_CHECK(
  File "/app/sglang/sglang-latest/lib64/python3.12/site-packages/sglang/srt/distributed/device_communicators/pynccl_wrapper.py", line 374, in NCCL_CHECK
    raise RuntimeError(f"NCCL error: {error_str}")
RuntimeError: NCCL error: remote process exited or there was a network error

[2026-02-25 16:41:56] Received sigquit from a child process. It usually means the child failed.
Killed
