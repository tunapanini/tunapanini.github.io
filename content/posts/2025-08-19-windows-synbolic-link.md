---
title: 윈도우(Windows)에서 심볼릭링크 생성하기
date: 2025-08-19
tags:
  - windows
---

PowerShell 기준으로 작성했습니다.

PowerShell을 관리자 권한으로 실행합니다.

![[Pasted image 20250819183953.png]]

```
New-Item -ItemType SymbolicLink -Path "C:\Users\User01\Obsidian\tunapanini.xyz" -Target "C:\Users\User01\workspace\tunapanini.github.io\content"
```

![[Pasted image 20250819184140.png]]

타겟에 파일 폴더가 생긴 모습입니다.

아이콘은 '바로 가기'처럼 생겼지만 유형은 '파일 폴더'로 표시됩니다.

# 참고
- [New-Item (Microsoft.PowerShell.Management) - PowerShell \| Microsoft Learn](https://learn.microsoft.com/ko-kr/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.5#7)
