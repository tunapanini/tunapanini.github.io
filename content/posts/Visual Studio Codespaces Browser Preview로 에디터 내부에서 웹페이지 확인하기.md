---
title: "Visual Studio Codespaces: Browser Preview로 에디터 내부에서 웹페이지 확인하기"
description: "Visual Studio Codespaces에서 Browser Preview 확장을 활용해 에디터 내부에서 웹페이지를 확인하는 방법"
date: 2020-05-04
tags:
  - codespaces
  - vscode
draft: false
---
아이패드로 가볍게 웹 프론트엔드 코딩을 하기 위한 방법을 찾던 중, [Visual Studio Codespaces](https://visualstudio.microsoft.com/ko/services/visual-studio-online/) 공개 미리보기가 열려서 사용해보고 있습니다. VSCode Online에서 웹 프로젝트의 Web App을 서빙하면 Port Forwarding을 통해 결과를 확인할 수 있는 페이지를 띄워줍니다.

![](https://blog.kakaocdn.net/dn/kMfwB/btqDQ7VWhPr/kvQz2Db0vkFKBGi5dWpQ50/img.png)

이렇게 포트가 `Forwarded Ports`에 표시됩니다.

[다만 VSOnline의 Port Forwarding은 현재 http(s) 프로토콜만 지원하고 있습니다.](https://github.com/MicrosoftDocs/vsonline/issues/19)
Websocket을 지원하지 않기 때문에 변경점이 있을 때마다 페이지를 리프레시해야 합니다.

![](https://blog.kakaocdn.net/dn/cFWGJn/btqDRNioEeB/vNgWQBNu7NNff1cnlfnKx0/img.png)

웹소켓 연결이 되지 않는 모습.

# 해결

VSCode 에디터를 띄우는 머신에 직접 Chrome을 설치하고, VSCode Extension을 사용하여 localhost를 통해 프리뷰를 보는 방법을 시도했습니다.

![](https://blog.kakaocdn.net/dn/LlEwG/btqDUSP9nFo/OWldiDOVyhOwB5n7Zlnn1k/img.png)

Extension으로는 `Browser Preview`를 선택했습니다. VSOnline 환경에서도 설치되면서 에디터 안에서 Preview로 작동하는 것은 이것뿐이었습니다.

(Chrome 설치는 Ubuntu/Debian 기준으로 작성했습니다.)

### 1. Chrome deb 파일 다운로드

Chrome 페이지에서 직접 다운로드하거나 wget을 통해 다운로드합니다.

### 1-1. Chrome 페이지에서 직접 다운로드

[https://www.google.com/intl/ko_ALL/chrome/](https://www.google.com/intl/ko_ALL/chrome/)

`Chrome 제품군` > `기타 플랫폼`

`기타 데스크톱 OS용 다운로드`의 `Linux`

또는 wget으로 다운로드할 수 있습니다.

### 1-2. wget을 통해 다운로드

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

### 2. Chrome 설치

```
sudo apt install ./google-chrome-stable_current_amd64.deb
```

### 3. Chrome 실행 경로 확인

```
whereis google-chrome-stable
```

또는

```
which google-chrome-stable
```

Chrome이 정상적으로 설치되었으면 아래와 같이 경로가 표시됩니다.

![](https://blog.kakaocdn.net/dn/beFm8M/btqDRxtm4B3/gqNDe9X4PJRq2KIUzmdD61/img.png)

### 4. Browser Preview의 Chrome 실행 경로 설정

먼저 VSCode Extension인 [Browser Preview](https://marketplace.visualstudio.com/items?itemName=auchenberg.vscode-browser-preview)를 설치하고 reload 해야 합니다.
설정에서 Browser-preview: Chrome Executable에 확인한 경로를 입력합니다.

![](https://blog.kakaocdn.net/dn/dnEWeZ/btqDTk7CobX/kqKHmHtwEMLKYJ8vMD0qkK/img.png)

# 결과

이제 코드를 바꾸면 Browser Preview를 통해 바로 결과가 반영됩니다.

![](https://blog.kakaocdn.net/dn/NEotQ/btqDRLx7EzA/VTYwjoKnaDSNxhkGVkLQk1/img.png)![](https://blog.kakaocdn.net/dn/pyRaY/btqDTllgf3x/bRBPV0D6C7HPOMR97OkvGk/img.png)

오른쪽이 Browser Preview로 확인한 모습입니다.

개발 중에 바로 확인하는 용도로는 괜찮습니다.

- 이미지가 깔끔하지는 않고 반응이 느립니다.
- 일부 스타일이 Chrome 브라우저로 직접 확인한 것과 다릅니다.

# 추가 - DevTools

Browser Preview로 페이지를 켜놓은 상태에서 `localhost:9222`에 접속하면 디버깅 목록에 표시되고 Chrome DevTools를 사용할 수 있습니다. _Browser Preview는 Chrome Headless를 기반으로 작동하며 원격 디버깅 포트가 기본적으로 9222로 설정되어 있습니다._

![](https://blog.kakaocdn.net/dn/dBFUfF/btqDUS3DOSV/0VmQd6dXbySCu42KZQKkD1/img.png)

Console 확인 외에는 너무 느려서 실용적이지 않습니다.

- `Debugger for Chrome Extension`을 사용하려고 했으나, attach할 때 디버깅 목록에는 표시되지만 실행 시 Not Found가 발생합니다. 아직 디버깅까지 필요하지 않아서 제외했습니다.

# 참고

- [https://github.com/MicrosoftDocs/vsonline/issues/19](https://github.com/MicrosoftDocs/vsonline/issues/19)
- [https://jootc.com/p/201811172232](https://jootc.com/p/201811172232)
- [https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04/](https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04/)
- [https://github.com/auchenberg/vscode-browser-preview](https://github.com/auchenberg/vscode-browser-preview)

+) 2020/4/30 이후로 Visual Studio Online 서비스가 Visual Studio Codespaces로 이름이 바뀌었습니다. ([https://devblogs.microsoft.com/visualstudio/introducing-visual-studio-codespaces/](https://devblogs.microsoft.com/visualstudio/introducing-visual-studio-codespaces/))
