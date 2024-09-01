---
title: "Visual Studio Codespaces: Browser Preview로 에디터 내부에서 웹페이지 확인하기"
description: 
date: 2020-05-04
tags:
  - codespaces
  - vscode
draft: false
---
아이패드로 가볍게 웹 프론트엔드 코딩하기 위한 방법 찾던 중, [Visual Studio Codespaces](https://visualstudio.microsoft.com/ko/services/visual-studio-online/) 공개미리 보기가 열려서 사용해 보고있다. VSCode Online에서 웹프로젝트를 Web App을 서빙하면 Port Forwarding하여 결과를 확인할 수 있는 페이지를 띄워준다.

![](https://blog.kakaocdn.net/dn/kMfwB/btqDQ7VWhPr/kvQz2Db0vkFKBGi5dWpQ50/img.png)

이렇게 포트가&nbsp; `Forwarded Ports` &nbsp;에 표시됨

[근데 VSOnline의 Port Forwarding은 현재 http(s) 프로토콜만 지원하고 있음.](https://github.com/MicrosoftDocs/vsonline/issues/19)  
Websocket을 지원하지 않기 때문에 변경점이 있을 때마다 페이지 리프레쉬해야 표시됨...

![](https://blog.kakaocdn.net/dn/cFWGJn/btqDRNioEeB/vNgWQBNu7NNff1cnlfnKx0/img.png)

웹소켓이 연결이 안 된다...

# 해결

VSCode 에디터를 띄우는 머신에 직접 Chrome을 깔고, VsCode Extension을 사용하여 localhost를 통해 프리뷰를 보려했다.

![](https://blog.kakaocdn.net/dn/LlEwG/btqDUSP9nFo/OWldiDOVyhOwB5n7Zlnn1k/img.png)

Extension으로는 `Browser Preview`를 선택했다. VSOnline 환경에서도 인스톨되면서 에디터 안에서 Preview로 작동하는 건 이것밖에 못 찾았다.

   
   
(Chrome 설치는 Ubuntu/Debian 기준으로 작성)

### 1. Chrome deb 파일 다운로드

Chrome 페이지에서 직접 다운로드 또는 wget 통해 다운로드한다.

### 1-1. Chrome 페이지에서 직접 다운로드

[https://www.google.com/intl/ko_ALL/chrome/](https://www.google.com/intl/ko_ALL/chrome/)

`Chrome 제품군` > `기타 플랫폼`

`기타 데스크톱 OS용 다운로드`의 `Linux`

또는 wget으로 다운로드

### 1-2. wget 통해 다운로드

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

### 2. Chrome 설치

```
sudo apt install ./google-chrome-stable_current_amd64.deb
```

### 3. Chrome 실행경로 확인

```
whereis google-chrome-stable
```

또는

```
which google-chrome-stable
```

Chrome이 정상적으로 설치되었으면 아래와 같이 경로가 표시됨.

![](https://blog.kakaocdn.net/dn/beFm8M/btqDRxtm4B3/gqNDe9X4PJRq2KIUzmdD61/img.png)

### 4. Browser Preview의 Chrome 실행경로 설정

먼저 VSCode Extension인 [Browser Preview](https://marketplace.visualstudio.com/items?itemName=auchenberg.vscode-browser-preview) 설치하고 reload 해야함.  
설정에서Browser-preview: Chrome Executable에 확인한 경로를 복사해서 넣는다.

![](https://blog.kakaocdn.net/dn/dnEWeZ/btqDTk7CobX/kqKHmHtwEMLKYJ8vMD0qkK/img.png)

# 결과

이제 코드를 바꾸면 Browser Preview 를 통해 바로 결과가 반영된다.

  

![](https://blog.kakaocdn.net/dn/NEotQ/btqDRLx7EzA/VTYwjoKnaDSNxhkGVkLQk1/img.png)![](https://blog.kakaocdn.net/dn/pyRaY/btqDTllgf3x/bRBPV0D6C7HPOMR97OkvGk/img.png)

  

오른쪽이 Browser Preview로 확인한 것

개발 중에 바로 확인하는 용도로는 괜찮은 것 같다.

- 이미지가 깔끔하진 않고 반응이 느리다.
- 일부 스타일이 Chrome 브라우저로 직접 확인한 것과 다르다...

# 추가 - DevTools

Browser Preview로 페이지를 켜놓은 상태에서 `localhost:9222` 에 접속하면 디버깅 목록에 표시되고 Chrome DevTools를 사용할 수 있다. _Browser Preview는 Chrome Headless를 기반으로 작동하며 원격 디버깅 포트가 기본적으로 9222로 설정된 상태이다._

![](https://blog.kakaocdn.net/dn/dBFUfF/btqDUS3DOSV/0VmQd6dXbySCu42KZQKkD1/img.png)

Console 보는 것 외에는 너무 느려서 하기 힘듬.

 
 - 대신 `Debbuger for Chrome Extension`을 사용하려고 했는데, attach할 때 디버깅 목록에 표시되나 실행 시 Not Found 뜸. 아직 디버깅까지 필요하진 않아서 제외함.
 

# 참고

- [https://github.com/MicrosoftDocs/vsonline/issues/19](https://github.com/MicrosoftDocs/vsonline/issues/19)
- [https://jootc.com/p/201811172232](https://jootc.com/p/201811172232)
- [https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04/](https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04/)
- [https://github.com/auchenberg/vscode-browser-preview](https://github.com/auchenberg/vscode-browser-preview)

+) 2020/4/30 이후로 Visual Studio Online 서비스가 Visual Studio Codespaces로 이름이 바뀌었음. ([https://devblogs.microsoft.com/visualstudio/introducing-visual-studio-codespaces/](https://devblogs.microsoft.com/visualstudio/introducing-visual-studio-codespaces/))  
 