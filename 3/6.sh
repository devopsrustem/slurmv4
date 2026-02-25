
[2026-02-25 18:03:53] tpgds-aihub0003:2428394:2429745 [0] bootstrap.cc:345 NCCL WARN Bootstrap Root : mismatch in info from procs, nranks 16 vs 16, nroots 1 vs 1, iroot 0 vs 0, offset 0 vs 1305411586


[2026-02-25 18:07:45] tpgds-aihub0003:2431481:2432841 [0] bootstrap.cc:345 NCCL WARN Bootstrap Root : mismatch in info from procs, nranks 16 vs 16, nroots 1 vs 1, iroot 0 vs 0, offset 0 vs -981270526

[2026-02-25 18:08:45] tpgds-aihub0003:2431484:2431484 [3] os/linux.cc:200 NCCL WARN ncclOsSocketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 18:08:45 TP3] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
Killed


6я
[Gloo] Rank 9 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 10 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 12 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 11 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15
[Gloo] Rank 15 is connected to 15 peer ranks. Expected number of connected peer ranks is : 15

[2026-02-25 18:08:45] tpgds-aihub0006:4044156:4044156 [6] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 18:08:45] tpgds-aihub0006:4044151:4044151 [1] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 18:08:45] tpgds-aihub0006:4044157:4044157 [7] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 18:08:45 TP9] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45 TP14] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 18:08:45 TP15] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.

[2026-02-25 18:08:45] tpgds-aihub0006:4044152:4044152 [2] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 18:08:45] tpgds-aihub0006:4044154:4044154 [4] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 18:08:45] tpgds-aihub0006:4044150:4044150 [0] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts

[2026-02-25 18:08:45] tpgds-aihub0006:4044153:4044153 [3] misc/socket.cc:578 NCCL WARN socketPollConnect: connect to 10.99.91.49<36141> returned Connection refused, exceeded error retry count after 35 attempts
[2026-02-25 18:08:45 TP10] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45 TP8] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45 TP12] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
[2026-02-25 18:08:45 TP11] Scheduler hit an exception: Traceback (most recent call last):
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

[2026-02-25 18:08:45] Received sigquit from a child process. It usually means the child failed.
Killed

