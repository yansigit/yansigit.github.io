# Port Forwarding on Android Emulator


## Telnet으로 포트 열기

[https://developer.android.com/studio/run/emulator-networking?hl=ko](https://developer.android.com/studio/run/emulator-networking?hl=ko)

```powershell
telnet localhost 5554 # putty에서는 raw로 연결
add <protocol>:<host-port>:<guest-port>
```
<!--more-->
## ADB로 포트 열기 (이 방법 추천)

[https://developer.android.com/studio/command-line/adb?hl=ko#forwardports](https://developer.android.com/studio/command-line/adb?hl=ko#forwardports)

```powershell
adb forward tcp:6100 tcp:7100
```
