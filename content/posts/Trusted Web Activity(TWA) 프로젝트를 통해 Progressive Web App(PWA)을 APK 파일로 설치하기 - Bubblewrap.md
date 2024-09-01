---
title: "[Bubblewrap] Trusted Web Activity(TWA) 프로젝트를 통해 Progressive Web App(PWA)을 APK 파일로 설치하기"
description: 
date: 2020-05-26
tags:
  - typescript
  - react
  - pwa
draft: false
---
Trusted Web Activity(TWA)는 Custom Tabs를 기반으로한 프로토콜을 사용하여 Progressive Web App(PWA) 또는 다른 웹앱 컨텐츠를 열 수 있는 새로운 방법입니다.

배포 상태의 PWA을 Android 프로젝트를 만들어 apk파일로 설치하고싶고, 단순하게 앱을 열면 PWA가 실행되는 기능(`Add to Home Screen`과 동일한 기능)만 원한다면.

`Bubblewrap` Nodejs 라이브러리를 이용하여 TWA 프로젝트를 쉽게 생성, 빌드하여 APK 파일을 만들 수 있습니다.

# 준비

- 배포 상태의 Progressive Web App
- [JDK8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) 설치
- [Android SDK](https://developer.android.com/studio) 설치

# Bubblewrap CLI 설치 및 TWA 프로젝트 생성

**bubblewrap/cli 설치**

```
npm install -g bubblewrap
```

## PWA manifest.json 파일을 기반으로 TWA 프로젝트 생성

```
bubblewrap init --manifest https://your-pwa.com/manifest.json
```

## Bubblewrap 초기 Path 설정

맨 처음 init 커맨드를 실행할 때, `JDK` 와 `Android SDK` Path를 입력하게 되어있습니다. 각각 설정된 Path를 수동으로 입력해주면 됩니다.

Path를 잘못 입력했다면 `${USER_HOME}/.llama-pack/llama-pack-config.json` 에서 수정할 수 있습니다.

```
vim ~/.llama-pack/llama-pack-config.json
```

```
// Windows 환경 기준
{"jdkPath":"C:\\Program Files\\Java\\jdk1.8.0_251","androidSdkPath":"C:\\Users\\{USER_NAME}\\AppData\\Local\\Android\\Sdk"}
```

그리고 TWA 정보를 입력합니다. `manifest`에서 받아온 값을 토대로 하기때문에 문제가 없다면 기본값을 그대로 쓰면 될 것 같습니다.

![](https://blog.kakaocdn.net/dn/P3HDw/btqEqsj2oa4/fb8uh6Szgo7WHllHJn9PT0/img.png)

마지막에 `Location of the Signing Key` 와 `Key name` 은 기존에 생성한 키가 있다면 따로 설정해주면 됩니다.

프로젝트 생성이 끝난 후 `Signing Key` 가 없는 경우 자동으로 새로 생성할 건지 물어봅니다. 질문에 따라 정보를 입력하면 지정한 이름으로 `.keystore` 파일을 생성합니다.

# Bubblewrap 빌드, apk 파일 생성

```
bubblewrap build
```

성공적으로 빌드되면 `app-release-signed.apk` 파일이 생성됩니다.

`bubblewrap install` 커맨드를 이용하면 adb를 사용하여 실행할 수도 있습니다.

# DigitalAssetLinks 추가

apk를 실행하면 웹브라우저같이 URL 인풋이 활성화된 화면으로 뜹니다. 앱처럼 보이게하려면 [DigitalAssetLinks](https://developers.google.com/digital-asset-links/v1/getting-started?hl=ko)를 추가해야합니다.

아래 방법 중 하나로 json파일을 작성하여 PWA가 있는 도메인의 `.well-known/assetlinks.json` 으로 접근할 수 있도록 추가합니다.

1. [Peter's Asset Link Tool App](https://play.google.com/store/apps/details?id=dev.conn.assetlinkstool&hl=ko) 사용

apk를 설치한 상태에서 위 앱을 설치하여 엽니다. package name으로 apk를 검색하고 선택하면 나오는 json을 그대로 복사해서 사용합니다.

2. 직접 작성

위 앱을 설치하기가 귀찮다면 직접 작성합니다. `package_name` 과 `앱 서명 인증서의 SHA256 지문` 만 찾아서 예시와 같이 작성하면 됩니다.

`https://your-pwa.com/.well-known/assetlinks.json` 예시

```
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.your-pwa.twa",
    "sha256_cert_fingerprints": ["<sha256_cert_fingerprints>"]
  }
}]
```

SHA256 지문은 아래 커맨드를 실행했을 때 나오는 값 중에 찾아서 사용합니다.

```
keytool -list -v -keystore android.keystore
```

DigitalAssetLinks 추가하고 상단바가 없어진 모습.

![](https://blog.kakaocdn.net/dn/bohitF/btqEo7VcQcf/NNrn9wABUlkmWf1oIZImLK/img.png)

# 참고

- [https://developers.google.com/web/android/trusted-web-activity/quick-start](https://developers.google.com/web/android/trusted-web-activity/quick-start)
- [https://dreamaz.tistory.com/530](https://dreamaz.tistory.com/530)
- [https://developer.android.com/training/app-links/verify-site-associations?hl=ko](https://developer.android.com/training/app-links/verify-site-associations?hl=ko)
