# PostmarketOS on Nexus5

# INTRO

실험 대상은 넥서스 5. 굳이 넥서스 5를 고른 이유는, 구글의 레퍼런스 폰인만큼 부트로더 언락도 쉽고
이미 여러 프로젝트의 개발 1호기로 사용되고 있기에 우분투나 페도라 등에서 혹시 이미 넥서스5용 OS를 개발해놓지 않았을까
하는 기대감 때문이었다. 결과적으로는 NO 라고 이야기 할 수 있지만.
<!--more-->
리눅스 개발보드가 널렸는데 그런거나 사지 굳이 이런 삽질을 하는 이유는...

1. 재밌을 것 같다는 이유가 첫번째.

2. 라즈베리 파이가 성능대비 너무 비싸다는게 두번째.
넥서스5는 중고나라에서 3만원에 구입했는데
제대로 구동되기만 한다면 화면과 스피커, 카메라, 와이파이 모듈까지 달린 SNAPDRAGON 800 ARM 개발보드를 단돈 3만원에 구입한거나 마찬가지.

3. 세번째도 역시 재밌을 것 같아서.

# WHICH OS?

## 1. Ubuntu Touch

처음에 생각했던 OS는 [우분투 터치](https://ubports.com/)

예전에 유튜브에서 우분투 터치가 넥서스 5 위에서 구동되는 것을 보기도 했고
캐노니컬에서 공식 프로젝트로 진행했었던 만큼 (현재는 개발중단되어 커뮤니티 차원에서 개발중이다.)
안정성 하나는 믿을 수 있지 않을까 싶어서였다.

그러나 직접 써본 결과는..

설치 애플리케이션부터 에러가 뿜어져 나오고 설치 이후에도 최적화의 문제인지 제대로 된 구동이 힘들어 건너뛰기.

## 2. Termux

그래도 레퍼런스 기기인데 해외 괴수들에 의해 리눅스 배포판 중 하나라도 포팅이 되어있지 않을까... 했지만

의외로 우분투, 페도라 등 메이저 OS 중 하나도 포팅된 전력이 없었다.

그래서 안드로이드를 갈아치우고 리눅스만 얹어보자는 야심찬 생각을 접어야 할까

생각하며 시도한게 [Termux](https://f-droid.org/en/packages/com.termux/).

Termux는 안드로이드 터미널 에뮬레이터로 안드로이드상에서 리눅스와 유사한 환경을 제공한다.

그리고 Chroot 와 비슷한 Proot라는 기술을 이용해 리눅스 배포판의 코어파일을 내려받고

안드로이드 위에서 리눅스를 돌릴 수도 있게 한다!

F-DROID 에 [AnLinux](https://f-droid.org/en/packages/exa.lnx.a) 를 검색하면

자동으로 스크립트를 생성해 제공해주는 어플을 내려받을 수 있다.

의외로 쓸만하긴 했지만.. 그래도 여전히 안드로이듣 상에서 잡아먹는 쓸모없는 자원 낭비를 없애고 싶었다.

## 3. PostmarketOS

[PostmarketOS](https://postmarketos.org/)는 안드로이드의 짧은 사후지원을 대체해 훨씬 긴 (15년 이상) 기간의 사후지원을 목표로 하는 프로젝트다.

즉, 해당 프로젝트는 여전히 '휴대기기용' 운영체제가 주된 목적이다.

그러나 내 관심을 끈 이유는 바로 해당 운영체제의 '완전한 리눅스 커널 기반'을 목표로 하는 것이다.

실제로 해당 프로젝트는 **Alpine Linux 기반**이며, 넥서스 5는 공식적으로 지원하고 있는 기기 중 하나라 이미 리눅스 Mainline 커널이 적용되어 있다.

다만 다른 기기들은 안드로이드 커널을 그대로 사용하는 수준인 듯 하다. 대부분의 기기들도 사용자들에 의해 포팅되어 구동 확인에 그친것 같고...

# Installing postmarketOS

아무튼, 해당 OS 펌웨어 파일을 내려받아 기기에 바로 적용시킬 수는 없고, 아직은 사용자가 스스로 빌드하여 적용해야 한다.

빌드 환경은 리눅스만 지원하고 있어 윈도우 사용자라면 가상머신이나 도커를 이용해야 한다.

나의 경우에는 도커 `ubuntu` 컨테이너를 통해 빌드환경을 조성했다.

그리고 도커를 사용할 경우 반드시 `--privileged` 옵션을 주어야 한다! (개발자들한테 도커에서 빌드 안되는거 같다고 이슈 작성했다가 비추 먹었다..)

리눅스 환경이 준비되었다면 빌드 및 사용에 필수적인 패키지들을 내려받는다.

```shell script
apt install python3 python3-pip coreutils procps qemu binfmt-support qemu-user-static sudo nano git
```

postmarketOS 빌드를 도와줄 pmbootstrap은 루트 사용자의 실행을 제한하고 있다. 새 사용자를 만들어주자.

```shell script
adduser <user name>
```

그리고 `/etc/sudoer`에 사용자를 추가해 `sudo` 명령어를 사용할 수 있게 한다.

그리고 해당 사용자로 로그인해 다음 명령어를 실행, pmbootstrap을 설치한다.

```shell script
pip3 install --user pmbootstrap
```

다음 환경변수 PATH 를 지정해 명령어를 바로 사용할 수 있게 한다.

아래 명령어를 실행해 일시적으로 지정해주거나

```shell script
export PATH=$PATH:~/.local/bin/
```

`~/.profile` 파일을 수정해 시작 시 자동으로 지정해줄 수도 있다. (아마 대부분 기본 적용되어 있을 것이다)

```shell script
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

pmbootstrap 설치가 끝났다. 이제 빌드를 할 차례.

```shell script
pmbootstrap init
```

위 명령어를 실행하면 빌드를 도와줄 마법사가 실행된다. 원하는 옵션을 넣으면 해당 옵션해 해당하는 세팅을 알아서 맞춰준다.

```shell script
pmbootstrap install
```

위 명령어를 입력하면 `init`으로 세팅된 옵션에 맞춰 빌드를 시작한다.

뒤에 아무 매개변수도 주지 않으면 나중에 pmbootstrap이나 직접 ADB 등을 통해 USB 연결을 통해 설치하게 되는데

도커에서 아직 지원되는 부분이 아니라 아래와 같이 펌웨어를 zip파일로 만들어 TWRP 등 커스텀 리커버리로 올려줘야 한다.

```shell script
pmbootstrap install --android-recovery-zip --recovery-install-partition data
pmbootstrap export # /tmp/postmarketOS-export/ 내부에 zip 생성
```

이렇게 하면 `/tmp/postmarketOS-export/` 내부에 펌웨어 파일이 생성된다. 이 파일을 내려받고 플래싱할 준비를 하자.

```shell script
fastboot format system
fastboot format userdata
```

안드로이드 SDK 내부의 `fastboot` 를 이용하여 `system`, `userdata` 파티션을 깨끗이 포맷해준다.

넥서스 5에서 `system` 파티션의 크기는 얼마 1G 남짓이다.
용량이 부족할 것 같아 설치 파티션을 변경하려 애썼는데, 명령어줄 상에서는 아무리 삽질해도 적용이 되지 않아
zip 파일의 스크립트를 직접 변경해주었다.

`pmos-*.zip -> chroot 폴더 -> install_options` 의 `SYSTEM_PARTLABEL` 옵션을 `data`로 바꿔 `userdata` 파티션을 사용하도록 변경했다.

```
DEVICE='lg-hammerhead'
FLAVOR='postmarketos-qcom-msm8974'
FLASH_KERNEL='true'
ISOREC='false'
KERNEL_PARTLABEL='boot'
INITFS_PARTLABEL='RECOVERY'
SYSTEM_PARTLABEL='data'
INSTALL_PARTITION='data'
CIPHER='aes-cbc-plain64'
FDE='false'
```

다음 TWRP의 `sideload` 기능을 이용해 zip 파일을 플래싱해주었다. **이 때 모든 파티션을 언마운트 해주고 플래싱해야 한다.**

```shell script
adb sideload pmos-*.zip
```

다음 리부트하면, postmarketOS 로고가 뜨며 부팅될 것이다. 이제 안드로이드 대신 완전한 리눅스를 사용할 수 있다!

Wifi 연결이 필요하다면 수동으로 WIFI 연결을 지정해주거나

```shell script
$ sudo nmcli device wifi list ifname wlan0
$ sudo nmcli device wifi connect "$SSID" password "$PASSWORD" ifname "wlan0"
```

혹은 마법사를 이용할 수도 있다

```shell script
sudo nmtui
```
