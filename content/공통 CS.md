---
tags:
  - 🌱
  - fuzz-cloud
---
## 컴퓨터 구조

- CPU ↘
	- **register**
	- ALU: Arithmetic & Logic Unit 연산
	- CU: Control Unit
- **캐시 메모리** ↘
- **메모리** ⤴
	- 휘발성
	- RAM / ROM
- **보조기억장치** ⤴
	- 비휘발성
	- 하드 디스크 드라이브
	- SSD(플래시 메모리 기반) ~~ USB

 CPU 👬 메모리 // 보조기억 장치

- main board & system bus + bus

### CPU

- 프로세스
	- 멀티코어 프로세서
- 스레드
	- 하드웨어 스레드
		- 멀티스레드 프로세서
		- 병렬
		- 논리 프로세서
	- 소프트웨어 스레드
		- concurrency → 논리적 실행 단위


### 메모리

- 주소(번지)
- 순서
	- 빅엔디안
	- 리틀엔디안
	- bi-endian

```
import sys
print(sys.byteorder)
```
![[공통 CS-20240925022021834.png]] 나는 little 엔디안
### 숫자 표현

부동소수점

2진수로 밖에 표현이 안 됨. 일반적인 10진 수로 떨어질 수 없는 소숫점이 나올 수 있음 → 오차 발생


$$ m \times 2^n \rightarrow m \times 10^n $$

- 부호 1bit
- 지수 8bit
- 가수(소수 부분) 23bit

#### ❔그럼 [Decimal](https://docs.python.org/ko/3/library/decimal.html) 은?

> 하드웨어 기반 이진 부동 소수점과는 달리, decimal 모듈은 사용자가 변경할 수 있는 정밀도(기본값은 28자리)를 가지며, 주어진 문제에 따라 필요한 만큼 커질 수 있습니다

$$ m \times 10^-n $$
이라면 
- 부호
- exponent n 정수 (소수몇째자리까지인지)
- 유효숫자 m

으악 즉, 

> 메모리 사용량을 증가시킬 수 있지만, 정확한 계산을 가능하게 합니다.




## 자료구조

### 스택

- push / pop
- LIFO: Last In First Out
- 🚐 뒤로가기 (e.g. 브라우저, 길찾기 방문 경로)

### 큐

- enqueue / deque
- FIFO: First In First Out
- 변형 큐
	- 원형
	- 덱(deque): double-ended queue
	- priority queue

### tree

- 구성요소
	- node
	- edge(link)
- 노드를 가르키는 용어
	- parent node
	- child node
	- sibling node
	- ancestor node
	- descendant node
	- root node
	- leaf node
- 트리에 대한 용어
	- degree
	- level(depth)
		- root node가 level 0
	- height = highest level
- tree traversal
	- 종류
		- 1. 전위 순회(preorder traversal)
		- 2. 중위 순회(inorder traversal)
		- 3. 후위 순회(postorder traversal)
		- 4. level0order traversal
	- 구현: 재귀…
- 종류
	- binary tree
		- skewed binary tree
		- full binray tree
	- perfect binary tree
	- complete binary tree
		- 마지막 level node 들이 왼쪽부터 채워짐

탐색 트리

- binary search tree
	- O(log n)
	- worst: skewed binary tree인 경우 O(n)
- heap
	- O(log n)
	- 최대힙 / 최소힙
		- 부모 <> 자식 우선순위 순서(크기)에 따라
	- 🚐 우선순위 큐

- [ ] TBD

## 대기중

- 운영체제
- 네트워크
- 데이터베이스

## 참고 자료

- [CS note: 개발자를 위한 컴퓨터 과학 용어집](https://csnote.net)
