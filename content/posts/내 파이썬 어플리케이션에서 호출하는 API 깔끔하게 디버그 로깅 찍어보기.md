---
title: 내 파이썬 어플리케이션에서 호출하는 API 깔끔하게 디버그 로깅 찍어보기
description: 
date: 2023-11-08
tags:
  - python
  - logging
draft: false
---


> 한은이: `requests` 모듈 디버깅할 때 어케 하시나요…

## 문제 상황

최근에 아래와 같은 간단한 코드를 디버깅할 일이 있었음:

```python
url = 'https://catfact.ninja/fact'
response = requests.post(url=url, json={'haha': 'hoho'})
```


이 코드가 작동하지 않아서 원인을 파악하고 해결했지만, **request/response에 대한 정보를 간단하게 디버깅 레벨에서 확인할 방법**이 필요했음.

## 찾아본 내용

[How can I see the entire HTTP request that's being sent by my Python application? - Stack Overflow](https://stackoverflow.com/questions/10588644/how-can-i-see-the-entire-http-request-thats-being-sent-by-my-python-application)에서 관련 정보를 찾아보긴 했음. 하지만 이 방식은 구현이 필요하고 번거로움. 더 간단하고 쉽게, **ON/OFF**할 수 있는 방법이 필요했음.

## 해결 방법

아래 두가지를 조합해서 사용하기로 함

1. requests 모듈의 [EventHooks](https://requests.readthedocs.io/en/latest/user/advanced/#event-hooks) 
2. [[notes/request-toolbelt]] 라이브러리의 `dump_all()`) 유틸 함수

## 예시 코드

### requests.Session 활용

세션을 사용해서 한 번 설정한 후, 요청에 대한 로그를 쉽게 남길 수 있음.

```python
import requests

session = requests.Session()

# dump_all() 유틸로 로깅(print)하는 메서드를 만듬
def logging_hook(response, *args, **kwargs):
	from requests_toolbelt.utils import dump
	data = dump.dump_all(response)
	print(data.decode('utf-8'))

# requests 세션 이벤트 훅으로 추가
session.hooks["response"].append(logging_hook)

url = 'https://catfact.ninja/fact'
response = session.post(url=url)
```

![[내 파이썬 어플리케이션에서 호출하는 API 깔끔하게 디버그 로깅 찍어보기-20240901222841832.png]]

### 개별 requests 호출에 이벤트 훅 적용

세션을 사용하지 않고, 각 호출에서 훅을 넘길 수도 있음.

```python
url = 'https://catfact.ninja/fact'

response = requests.get(url=url, hooks={'response': logging_hook})
```

![[내 파이썬 어플리케이션에서 호출하는 API 깔끔하게 디버그 로깅 찍어보기-20240901222804649.png]]

이렇게 하면 개별 호출에서 로깅을 간편하게 추가할 수 있음.

[[example-request-toolbelts-with-event-hooks.ipynb]]

# 참고 자료

- [Advanced Usage — Requests 2.32.3 documentation](https://requests.readthedocs.io/en/latest/user/advanced/#event-hooks)
- [request-toolbelt.utils.dump.dump_all](https://toolbelt.readthedocs.io/en/latest/dumputils.html#requests_toolbelt.utils.dump.dump_all)


이 방법을 통해 API 호출을 디버깅할 때 깔끔하게 request/response 로그를 확인할 수 있음. 필요에 따라 ON/OFF 가능하다는 점이 특히 유용함.
