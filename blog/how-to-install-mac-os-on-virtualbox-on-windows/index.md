# Installing Mac OS on Virtualbox on Windows


## 1. 개요

맥을 사자니 돈이 너무 없고, 해킨토시를 하자니 노트북이라 깔고 설정하기 귀찮다면

**답은 바로 가상머신**

<!--more-->
## 2. VMDK 다운받기

먼저 `vmdk` 가상 하드파일을 다운받는다. 구글에 검색하면 많이 나온다. 눈치껏 제일 안전할 것 같은 사이트를 고르자.

대략 `8GB` 정도이며 구글드라이브 주소가 제공된 경우 대역폭 초과로 다운로드가 안될 확률이 많으니 토렌트를 이용하는게 좋다.

속도도 빨라`50MB/S` 정도 나온다.

## 3. 버추얼박스 Extension Pack 설치

버추얼박스는 이미 설치되어 있을테니 `Extension Pack`만 받아 설치하자

[버추얼박스 다운로드 페이지](https://www.virtualbox.org/wiki/Downloads)에 있다. 

## 4. 가상머신 생성

이제 가상머신을 만들 차례다.

메모리는 넉넉잡아 `8GB` 정도 잡아주고, 디스크는 다운 받아놓은 `.vmdk` 디스크를 임포트 해주자.

이제 다 끝났으면 좋겠지만.. 아직 설정할게 남았다.

## 5. 가상머신 설정

가상머신 설정 창으로 들어간다.

1. `시스템 - 마더보드 - 칩셋` 부분을 `PIIX3`으로
2. `시스템 - 마더보드 - 프로세서` 에서 `프로세서 개수`를 `실제 프로세스 개수의 반 (최소 4개)`
3. `디스플레이 - 비디오메모리 ` 부분을 `128MB`
4. `USB - USB 컨트롤러 사용하기` 부분을 `USB 3.0 컨트롤러`로 설정

그 다음 `cmd`창을 켜고

```shell
cd "C:\Program Files\Oracle\VirtualBox\"
VBoxManage modifyvm "<가상머신이름>" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "<가상머신이름>" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "<가상머신이름>" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "<가상머신이름>" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "<가상머신이름>" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "<가상머신이름>" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
```

위 명령어를 쭉쭉 쳐준다. 

`ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc` 부분이 참으로 인상깊다.. **미안해요 애플!**

## 6. 가상머신 실행

다음 가상머신을 실행하면 해킨토시 깔 때 봤던 커널 로그들이 조르륵 뜨기 시작한다.

괜시리 또 마음이 쫄린다.  무한부팅 걸리거나 커널 패닉이 일어나면 지금까지 했던게 말짱 도루묵이다.

부팅이 되기를 간절히 기도하며 기다리다 보면.. 안된다..

---

### 2020/09/15 추가 

아무래도 Hyper-V 떄문에 안되었던 모양인데, 지금은 아예 해킨토시로 사용하고 있기 때문에 테스트는 해보지 않았다.

해킨토시 설치 과정과 Intel 무선랜 칩에서 Broadcom 무선랜카드로 변경한 과정은 나중에 포스팅하겠다.

