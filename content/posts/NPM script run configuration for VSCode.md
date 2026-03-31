---
tags:
  - npm
  - vscode
date: 2024-08-04
---

VSCode에서 NPM 스크립트를 실행 구성(Run Configuration)으로 등록하면, 단축키 하나로 실행할 수 있습니다.

# 예시 - npx 커맨드

`.vscode/launch.json`에 아래와 같이 설정합니다.

```json
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

- **name**: 실행 구성의 이름
- **command**: 실행할 명령어
- **type**: 실행 타입 (예: `node-terminal`은 Node.js 터미널에서 실행)
- **request**: `launch`로 설정하면 디버깅 시작 시 실행

# 참고

- [VSCode NPM Script Extension](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)
