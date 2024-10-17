---
tags:
  - 🌱
draft: true
date: 2024-10-10
---

# FastAPI란?

FastAPI는 Python으로 작성된 현대적인 고성능 웹 프레임워크로, 빠르고 간편하게 API를 개발할 수 있도록 설계되었습니다. **비동기 프로그래밍**과 **Python 타입 힌트**를 적극 활용하여 높은 생산성과 성능을 제공합니다.

# 설치 및 기본 사용법

```
pip install fastapi
pip install uvicorn[standard]  _# ASGI 서버_
```

```python
from fastapi import FastAPI
app = FastAPI()

@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
```
  
[[Uvicorn]]으로 리로드 옵션과 로컬 실행

```sh
uvicorn main:app --reload
```

# 주요 기능

## 경로 운영 및 요청 처리

- **경로 데코레이터**: @app.get(), @app.post() 등 HTTP 메서드에 따라 사용합니다.
- **경로 매개변수**: URL 경로에서 변수를 추출합니다.
- **쿼리 매개변수**: 함수 인자로 기본 값을 지정하여 쿼리 파라미터를 처리합니다.

## 요청 바디 및 데이터 모델링

  [[Pydantic]] 모델을 사용하여 요청 바디를 정의합니다.

```python
from pydantic import BaseModel

class Item(BaseModel):
    name: str
    price: float
    is_offer: bool = None

@app.post("/items/")
async def create_item(item: Item):
    return item

```

## 자동 문서화

- **Swagger UI**: /docs 경로에서 자동으로 API 문서를 제공합니다.
- **ReDoc**: /redoc 경로에서도 확인 가능합니다.

## 비동기 프로그래밍

- `async`/`await` 키워드를 사용하여 비동기 함수를 정의합니다.
- 동기 함수도 사용 가능하지만, 비동기 함수를 활용하면 성능이 향상됩니다.

## 의존성 주입

- **의존성 주입 시스템**을 통해 공통 기능(예: 데이터베이스 연결)을 효율적으로 관리합니다.

```python
from fastapi import Depends

async def common_parameters(q: str = None):
    return {"q": q}

@app.get("/items/")
async def read_items(commons: dict = Depends(common_parameters)):
    return commons
```

## 미들웨어

요청 및 응답에 대한 처리를 추가할 수 있습니다.

```python
@app.middleware("http")
async def add_process_time_header(request, call_next):
    response = await call_next(request)
    return response
```

# 실제 사용 사례

- **고성능 API 서버**: 대규모 트래픽을 처리해야 하는 API 서버에 사용됩니다.
- **마이크로서비스 아키텍처**: 경량 프레임워크로서 마이크로서비스에 적합합니다.
- **데이터 검증이 중요한 서비스**: 입력 데이터의 유효성 검사가 필수적인 서비스에서 유용합니다.

# 주요 기능 설명

- **비동기 엔드포인트 작성 방법**: async def로 함수 정의.
- **의존성 주입 사용 방법**: Depends를 활용한 공통 기능 관리.

# 다른 파이썬 웹 프레임워크와의 비교

- **Flask와 비교**: Flask보다 더 많은 기능을 제공하며, 타입 힌트를 활용합니다.
- **Django와 비교**: Django보다 가볍고, 비동기 처리를 기본 지원합니다.

## # Django와의 주요 차이점

- **비동기 지원**: FastAPI는 [[ASGI]]를 기반으로 비동기를 기본 지원하지만, [[Django]]는 기본적으로 [[WSGI]]를 사용하며 동기적으로 동작합니다.
- **타입 힌트 활용**: FastAPI는 타입 힌트를 적극 활용하여 개발 생산성과 코드 안정성을 높입니다.
- **성능**: FastAPI는 높은 성능을 제공하며, 마이크로서비스나 고성능 API 서버에 적합합니다.
- **내장 기능**: [[Django]]는 ORM, 인증, 어드민 등 다양한 기능을 내장하고 있지만, FastAPI는 경량화에 초점을 맞추어 필요한 기능을 선택적으로 사용합니다.


# DRAFT

- **Starlette**를 기반으로 하며, 높은 성능과 비동기 기능을 제공합니다.

# 관련
- [[Django Ninja]]