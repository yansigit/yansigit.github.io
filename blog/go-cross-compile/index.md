# Go Cross Compile


# HOW
고 언어의 장점 중 하나는 크로스-컴파일 및 멀티플랫폼 지원이 쉽다는 것이다.

간단한 환경 변수 설정을 통해 얼마든지 다양한 플랫폼으로의 빌드가 가능하다.

명령어로도 빌드가 얼마든지 가능하지만 좀 더 쉬운 접근을 위해 `makefile` 또한 이용 가능하다.
<!--more-->
```makefile
cc_on_win:
    @echo "Cross Compile"
    set GOOS=linux& set GOARCH=arm& set GOARM=7& go build -o bin/linux_arm_v7 test.go
    set GOOS=windows& set GOARCH=amd64& go build -o bin/windows_x64 test.go
    set GOOS=linux& set GOARCH=386& go build -o bin/linux_x86 test.go

cc_on_linux:
    @echo "Cross Compile"
    GOOS=linux GOARCH=arm GOARM=7 go build -o bin/linux_arm_v7 test.go
    GOOS=windows GOARCH=amd64 go build -o bin/windows_x64 test.go
    GOOS=linuxt GOARCH=386 go build -o bin/linux_x86 test.go
```

