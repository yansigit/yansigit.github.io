# About Go Module


고 모듈이 등장하기 전까지, 개발자들은 GOPATH 등의 환경변수를 이용해
프로젝트 및 패키지 종속성을 관리해야 했다.

<!--more-->

그러나 고 버전 1.11버전부터 공식적으로 고 모듈 기능이 추가되어
더욱 쉽고 간편하게 패키지를 관리하는 것이 가능해졌다.

# HOW TO USE

사용 방법은 다음과 같다.

먼저 프로젝트 디렉토리로 사용할 디렉토리를 만든다. 어디든지 상관없다.

```shell script
mkdir goProject
```

다음 `go mod init` 명령어를 통해 모듈 프로젝트로 초기화시킨다.

```shell script
go mod init github.com/yansigit/hello
```

init 이후의 `github.com/yansigit/hello` 인수는 모듈의 이름이다.

모듈 이름을 해당 명령어를 통해 작성할 수도 있고 소스코드 파일에

`package <패키지명> // import github.com/yansigit/hello`

이런 식으로 주석으로 달아준 다음 `go mod init`만 해줘도 상관없는 듯 하다.

아무튼 실행하게 되면, `go.mod`라는 파일 하나가 프로젝트 루트에 생성된다.

파일을 열어보면 다음과 같이 되어있을 것이다.

```
module github.com/yansigit/hello

go 1.13
```

이제 소스파일을 작성해보자.

```shell script
touch test.go
```

```go
package main

import (
	// "fmt"
	"github.com/gin-gonic/gin"
	// "net/http"
)
func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
```

다음, `go` 명령어를 사용하면 자동으로 import된 패키지를 찾고 `GOPATH/pkg/mod` 디렉터리 밑에 설치된다.
이 때 프로젝트 루트 디렉터리에 go.sum 파일도 함께 생성된다.

이 파일은 설치된 모듈의 해시 값을 저장해두고, 매 go 커맨드가 실행되기 전에
설치 되어있는 모듈의 해시 값과 go.sum에 저장된 해시 값을 비교하여
설치된 모듈의 유효성을 검증하는 역할을 한다. 

```shell script
go get -u
```

명령어를 통해 import 시킨 패키지들을 받아온다.

굳이 go 명령어를 사용하면 자동으로 받아오는데 왜 `go get`까지 해주냐면..

이유는 모르겠으나 goland IDE에서 해당 명령어를 쳐주지 않으면 패키지를 찾을 수 없는지 빨갛게 뜬다.

```
module github.com/yansigit/hello

go 1.13

require (
	github.com/gin-gonic/gin v1.5.0
	github.com/go-playground/universal-translator v0.17.0 // indirect
	github.com/json-iterator/go v1.1.9 // indirect
	github.com/leodido/go-urn v1.2.0 // indirect
	github.com/mattn/go-isatty v0.0.12 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	golang.org/x/sys v0.0.0-20200121082415-34d275377bf9 // indirect
	gopkg.in/go-playground/validator.v9 v9.31.0 // indirect
	gopkg.in/yaml.v2 v2.2.7 // indirect
)

```

`go.mod`에서도 의존성 관련 정보들이 업데이트 된다.

필요할 때 마다 `go.mod` 파일을 수정해 모듈을 관리할 수 있다.

만약, 새로운 모듈을 추가하고 싶다면
`go get <module-path>@<module-query>` 커맨드를 사용한다.

```shell script
go get github.com/fatih/color@latest 
```

Module query에 대한 더 자세한 내용은 [공식문서](https://golang.org/cmd/go/#hdr-Module_queries)를 통해 확인하실 수 있다.

버전 지정이 필요가 없다면 코드에서 바로 import 하면
go 커맨드가 실행될 때 자동으로 추가될 것이다.

- - -

참고 및 출처: <https://velog.io/@kimmachinegun/Go-Go-Modules-살펴보기-7cjn4soifk>
