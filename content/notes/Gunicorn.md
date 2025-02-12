---
tags:
  - 🌱
  - python
---
**gthread의 동작 원리 이해**: 멀티프로세스와 멀티스레드의 조합으로 동시성을 높이는 방법을 이해하고 설명할 수 있어야 합니다.

• **Gunicorn**: WSGI 서버로 동기식 웹 프레임워크와 함께 사용되며, gthread 워커를 통해 스레드 기반 동시성을 제공합니다.

• **[[Uvicorn]]**: ASGI 서버로 비동기식 웹 프레임워크(FastAPI 등)와 함께 사용되며, 비동기 프로그래밍을 지원합니다.

[[asyncio]]

CPU 바운드가 큰 경우 ProcessPollExecutor를 잘 써야 이벤트루프 성능을 효율적으로 쓸 수 있음.

# Related

- [WSGI]