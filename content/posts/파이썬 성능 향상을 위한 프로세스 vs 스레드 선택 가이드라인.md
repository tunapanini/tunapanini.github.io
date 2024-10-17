---
tags:
  - 🌱
  - python
draft: false
date: 2024-10-10
---

# I/O 바운드 작업이 많은 경우

- 스레드를 활용하여 동시성을 향상시킬 수 있습니다.
- 작업이 스레드 안전(thread safe)하고, [[GIL]]의 영향이 적을 때.
- 스레드는 프로세스 내에서 메모리를 공유하므로 메모리 사용량이 적습니다.
- 하지만 CPU 바운드 작업에서는 GIL로 인해 멀티스레딩의 이점이 제한됩니다.


# CPU 바운드 작업이 많은 경우

### 프로세스 기반 병렬 처리하기

- 각 프로세스는 독립된 메모리 공간과 [[GIL]]을 가지므로, GIL의 제약을 받지 않고 병렬 처리가 가능합니다.
- [[Uvicorn]]의 워커 수를 늘리거나, 작업을 별도의 프로세스로 분리하여 처리합니다.
- [asyncio](https://docs.python.org/3/library/asyncio.html)의 `run_in_executor`와 `ThreadPoolExecutor` / `ProcessPoolExecutor`를 사용하여 CPU 바운드 작업을 비동기적으로 프로세스 풀에서 실행할 수 있습니다. (참고: [Event Loop — Python 3.13.0 documentation](https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.loop.run_in_executor))

### 백그라운드 작업으로 분리하기

- [[Celery]]와 같은 작업 큐를 사용하여 CPU 바운드 작업을 별도의 워커 프로세스로 처리합니다.
- 웹 요청 처리와 무거운 연산 작업을 분리하여 웹 서버의 응답 속도를 유지할 수 있습니다.

## 실제 적용 시 고려 사항


- 애플리케이션의 특성과 배포 환경에 따라 최적의 방안을 선택해야 합니다.
- 프로파일링을 통해 성능을 측정하고, 적절한 워커 수와 스레드 수를 결정합니다.
