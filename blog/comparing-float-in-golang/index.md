# Comparing Float in Golang

Go 언어에서 Float 변수 비교하기
<!--more-->
# Error of Floating Point

2진수로 데이터를 나타내는 컴퓨터에게 실수를 완벽하게 표현하는 것은 불가능하다.

컴퓨터는 컴공과라면 컴퓨터 구조시간에 배울 '부동소수점'을 이용해 실수를 표현하게 되는데 고 언어에서도
역시 실수 연산 과정에서 오차가 나게 된다.

그러므로 만약 아래의 코드를 돌린다면

```go
var test float32 = 10.0
for i:=0; i<10; i++ {
    test -= 0.1
}
fmt.Println(test)
fmt.Println(test == 9.0)
```

```
8.999996
false
```

아래와 같이 의도치 않은 결과가 나올 수 있다.

부동소수점 비교를 위해서는 다음과 같이 함수를 따로 짜주고 해당 함수를 통해 비교해줘야 한다.

```go
package main

import (
    "fmt"
    "math"
)

const float64EqualityThreshold = 1e-9

func almostEqual(a, b float64) bool {
    return math.Abs(a - b) <= float64EqualityThreshold
    // a - b 가 음수일 수 있기 때문에 math.Abs를 통해 절대값으로 만들어 줌
}

func main() {
    a := 0.1
    b := 0.2
    fmt.Println(almostEqual(a + b, 0.3))
}
```

이렇게 하면 근사값을 통해 해당 두 실수가 _거의_ 일치하는지 확인할 수 있다.
