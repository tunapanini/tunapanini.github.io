---
draft: true
date: 2025-02-10
---
# 준비물

- 라즈베리파이5 본체
- 터치스크린 LCD
- SD 카드 (최소 32GB)

# 라즈베리파이 OS 설치 (64비트)

단일 HA OS로 설치하면 간단하게 구동하고 로컬 네트워크로 접근할 수 있음.

하지만 나는 라즈베리파이5 자체를 서버 + 대시보드(브라우저)로 사용하기 위해 라즈베리파이 OS를 설치해서 HA OS를 가상머신으로 올려줄 거임

# 라즈베리파이 OS 꿉기

간단하게 라즈베리파이 공식 홈페이지에서 [Raspberry Pi Imager](https://www.raspberrypi.com/software/)를 설치함

- 내 디바이스
- 원하는 OS (라즈베리파이 OS, 일반/특수 목적 OS 등 다양함)
- 대상 스토리지(SD 카드)

라즈베리파이 OS로 꾸울 때 중간에 설정을 할 수 있음.

아이디랑 호스트 변경 및 암호로 접근하도록 설정해둠. 

나중에 ssh 연결에 사용.

```
아이디: tunapanini
비번: –

호스트: tunapanini.local
```

# ssh 연결

위 처럼 설정해뒀다면, 동일한 네트워크에서 간단하게 ssh + 암호로 접근할 수 있음

```sh
# ssh-keygen -R tunapanini.local
ssh tunapanini@tunapanini.local
```

![[attachments/Home Assistant 대시보드 만들기 with 라즈베리파이5 + LCD 터치스크린-20250209212622259.png]]

tunapanini로 로그인 완 

룰루

(근데 왜 2024년 11월?)

아래처럼 패키지 업데이트부터 슈슉 해줌

```
sudo apt-get update
sudo apt-get update -y
```

# 라즈베리파이 OS 가상머신 올리기 1트 - Pimox, Proxmox 실패

> [!info]
> 실패 로그임. 
> 가상머신 띄우는 방법만 찾으신다면 아래로 내려가세용


[Pimox - Proxmox V7 for the Raspberry Pi](github.com/pimox/pimox7)를 설치할 것임.

인터렉티브 설치를 지원함. 

기존 `/etc/hosts`

![[attachments/Home Assistant 대시보드 만들기 with 라즈베리파이5 + LCD 터치스크린-20250209213828855.png]]

설정을 하는데 값이 맞는 건지 잘 모르겠음.

OVERWITE 되는 것들 백업 해두고, 일단 진행.

![[attachments/Home Assistant 대시보드 만들기 with 라즈베리파이5 + LCD 터치스크린-20250209213712092.png]]

![[attachments/Home Assistant 대시보드 만들기 with 라즈베리파이5 + LCD 터치스크린-20250209214611716.png]]

추측하기로는 pimox 가 debian bullseye 을 지원하는데, 라즈베리파이5와 호환되는 최신 버전은 bookworm 이어서 안 되는 거 같음. 

실패!

레딧에서 라즈베리파이5로 성공했다는 글과 PDF 설명서를 봤지만, 너무나 복잡해서

pass

# 라즈베리파이5에 OS로 Ubuntu 올리기?

실질적으로 비교한 수치는 없었으나, 라즈베리파이 OS가 최적화가 더 잘되어있다고 함

pass

# 라즈베리파이5 OS 가상머신 올리기 2트 - virt-manager

대신 `virt-manager` 사용

왜 진작 이걸 안 알아봤을까?

TBD…

# Reference

- [Proxmox를 사용하여 라즈베리 파이에서 VM을 실행하는 방법](new.atsit.in/21025/


