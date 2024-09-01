---
title: 내 파이썬 어플리케이션에서 호출하는 API 깔끔하게 디버그 로깅 찍어보기
description: 
date: 2023-11-08
tags:
  - python
  - logging
draft: false
---

## 배경

한은이: `requests` 모듈 디버깅할 때 어케 하시나요…

```python
url = 'https://catfact.ninja/fact'
response = requests.post(url=url, json={'haha': 'hoho'})
```

이런 간단한 코드가 안 돼서 보고있었는데 (해결은 함)

이럴 때 **request/response에 대한 정보들를 간단하게 디버그 레벨 로그로 찍어볼 수 있는 방법**이 필요…

[debugging - How can I see the entire HTTP request that's being sent by my Python application? - Stack Overflow](https://stackoverflow.com/questions/10588644/how-can-i-see-the-entire-http-request-thats-being-sent-by-my-python-application)

👆 이거로 보긴 했는데, 구현없이 더 쉽게!! 깔끔!!하게 ON/OFF하는 방법을 원했음.

## 방법

아래 두가지를 짬뽕해서 사용함

- `requests` 모듈의 [EventHooks](https://requests.readthedocs.io/en/latest/user/advanced/#event-hooks) (빌트인)
- [[request-toolbelt]] 라이브러리의 [dump_all()](https://toolbelt.readthedocs.io/en/latest/dumputils.html#requests_toolbelt.utils.dump.dump_all) 유틸 함수

## 예시 코드 (requests.Session)

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

## 예시 코드 (requests.get 메서드)

세션을 사용하지 않고, 각 호출에서 훅을 넘길 수도 있다.

```python
url = 'https://catfact.ninja/fact'

response = requests.get(url=url, hooks={'response': logging_hook})
```

![[내 파이썬 어플리케이션에서 호출하는 API 깔끔하게 디버그 로깅 찍어보기-20240901222804649.png]]
# 참고
[Advanced Usage — Requests 2.32.3 documentation](https://requests.readthedocs.io/en/latest/user/advanced/#event-hooks)