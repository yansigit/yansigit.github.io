# Virtualbox With Docker(hyper V)




## 쉬운 설정법

버추얼박스 6.0 버전부터 Hyper-V를 켠 상태로도 이용할 수 있게 되었다.
<!--more-->
```
cd "C:\Program Files\Oracle\VirtualBox\"
vboxmanage setextradata "<가상머신이름>" "VBoxInternal/NEM/UseRing0Runloop" 0
```

`cmd`를 켜고 위와 같이 해주면 끝


