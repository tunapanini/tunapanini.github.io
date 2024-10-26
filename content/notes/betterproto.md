---
tags:
  - python
  - 🌱
date: 2024-10-26
---

[Better Protobuf / gRPC Support for Python](https://github.com/danielgtaylor/python-betterproto)
Python으로 Protobuf 3/ gRPC를 사용 지원을 위한 프로젝트
- Protobuf 3 / gRPC 인터페이스를 파이썬 코드로 자동 생성
- Python 3.7+ 아래 피쳐들 지원함:
	- `async` / `await`
	- 이넘(Enum)
	- 데이터 클래스(dataclasses)
	- Timezone-aware(시간대 정보를 갖는) `datetime` 과 `timedelta` 오브젝트
	- 상대 경로 임포트
	- [[mypy|Mypy]] 타입 체크
- [[Pydantic]] 모델도 지원
- 레거시 기능과 환경은 지원하지 않음 (e.g. Protobuf 2)

# 설치

```sh
# Install both the library and compiler
pip install "betterproto[compiler]"

# Install just the library (to use the generated code output)
pip install betterproto
```

# Troubleshooting

## optional 필드를 사용할 수 없음? (버전올리면 해결?)

> protos/route_guide.proto: is a proto3 file that contains optional fields, but code generator protoc-gen-python_betterproto hasn't been updated to support optional fields in proto3. Please ask the owner of this code generator to support proto3 optional.--python_betterproto_out:  
