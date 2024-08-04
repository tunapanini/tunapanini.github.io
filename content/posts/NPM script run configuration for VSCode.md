---
aliases: 
tags:
  - vscode
date: 2024-08-04
drafts: false
---


# 예시 - npx 커맨드 

```
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "싱크",
			"command": "npx quartz sync",
			"type": "node-terminal",
			"request": "launch"
		}
	]
}
```
- name: 실행 구성의 이름
- command: 실행할 명령어 지정
- type: 실행할 타입
	- node-terminal: Node.js 터미널
	- [ ] TBD
- request: 실행 요청
	- launch: 디버깅을 시작할 때 실행
	- [ ] TBD

# References
https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script