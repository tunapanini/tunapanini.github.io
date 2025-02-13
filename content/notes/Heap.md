---
aliases:
  - 힙
tags:
  - datastructure
  - 🌱
---
# 힙은 우선순위 큐에 사용하는 트리의 한 종류

- [[완전 이진 트리]]
- 자식 노드 값이 부모 노드보다 항상 작음
- 즉, 최상위 노드가 항상 최소값을 가짐

# 시간 복잡도

- O(1)으로 최소값 조회
- O(log N)으로 최상위 노드 삭제
	- 마지막(맨 하층 우측) 노드를 최상위로 올린 뒤, 자식 노드 값과 비교하여 swap 과정이 $\log_{2}{N}$ 
- O(log N)으로 노드 삽입
	- 마지막에 노드 추가하고 부모 노드와 비교해서 swap 과정이 $\log_{2}{N}$ 