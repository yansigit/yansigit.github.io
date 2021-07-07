# Hot Reloading on Golang Project


# Hot Reloading

웹 어플리케이션을 개발할 때 항상 유용하게 사용하는 기능이 Hot-Reloading 기능이다.

템플릿이나 기능을 약간 바꾸고 확인하고 싶을 때,
코드를 변경하고 일일히 빌드를 새로 해주기란 여간 귀찮은 일이 아니기 때문이다.
<!--more-->
닷넷 코어나 노드JS 기반 프레임워크들에서 작업했을 때는 항상 기본적으로 포함된 기능들이라
신경쓰지 않고 개발할 수 있었는데 고 언어에서 작업하려다 보니 여간 그리운게 아니라
관련 패키지가 있는지 검색했더니..
역시나 개발자들 마음은 한가지인가 보다.

[AIR 깃허브 페이지](https://github.com/cosmtrek/air)

사용법은 다음과 같다.

```shell script
go get -u github.com/cosmtrek/air
```

먼저 `go get` 으로 해당 모듈을 다운받아 준다.

해당 모듈에는 `air.exe` 파일이 포함되어 있으며 받자마자 바로 실행 가능하다.

다음 프로젝트 루트 폴더로 들어가 `air.conf` 파일을 생성해준다.
혹은 air 모듈의 디렉토리 내부에 있는 `air_example.conf` 파일을 복사해 이름을 변경해주어도 된다.

해당파일은 리눅스용이므로 적절히 윈도우에서 사용 가능하도록 변경해주었다.

```toml
# Config file for [Air](https://github.com/cosmtrek/air) in TOML format

# Working directory
# . or absolute path, please note that the directories following must be under root.
root = "."
tmp_dir = "tmp"

[build]
# Just plain old shell command. You could use `make` as well.
cmd = "go build -o ./tmp/main.exe ."
# Binary file yields from `cmd`.
bin = "tmp/main.exe"
# Customize binary.
full_bin = "set APP_ENV=dev& set APP_USER=air& tmp\\main.exe"
# Watch these filename extensions.
include_ext = ["go", "pug", "html"]
# Ignore these filename extensions or directories.
exclude_dir = ["assets", "tmp", "vendor", "frontend/node_modules"]
# Watch these directories if you specified.
include_dir = []
# Exclude files.
exclude_file = []
# It's not necessary to trigger build each time file changes if it's too frequent.
delay = 1000 # ms
# Stop to run old binary when build errors occur.
stop_on_error = true
# This log file places in your tmp_dir.
log = "air_errors.log"

[log]
# Show log time
time = false

[color]
# Customize each part's color. If no color found, use the raw app log.
main = "magenta"
watcher = "cyan"
build = "yellow"
runner = "green"

[misc]
# Delete tmp directory on exit
clean_on_exit = true
```

```shell script
air -c air.conf
```

다음 `air` 커맨드를 통해 conf 파일을 지정하고 프로젝트를 watch 시키면,
파일이 변경될 때 마다 자동으로 재 빌드 작업하고 실행해줄 것이다.
