# Golang Cheet Sheets for Algo Test


# Scan

```go
var test [5]int
for i:=0; i<5; i++ {
   fmt.Scan(&test[i])
}
fmt.Print(test)
// 입력 1 4 5 2 3
// 출력 [1,4,5,2,3]
```
<!--more-->
<details>
  <summary>사족</summary>

간단한 건데 난 처음에 For문으로 돌아가며 Scan으로 입력 받으면 하나하나 입력을 따로 넣어줘야 한다고 생각했었는데

그냥 입력을 한꺼번에 그냥 공백으로 나눠줘도 알맞게 들어가는 듯 하다.

덕분에 쉬운 백준 코딩 문제를 몇번이나 틀렸다.. ㅠㅠ

</details>

# Sort

```go
import (
	"sort"
    "fmt"
)
func main() {
	str := []string{"c", "a", "b"}
	sort.Strings(str)
    fmt.Println("Strings: ", str) // 출력: a b c

	ints := []int{70, 2, 4}
	sort.Ints(ints)
    fmt.Println("Ints:   ", ints) // 출력: 2 4 70

	s := sort.IntsAreSorted(ints)
    fmt.Println("Sorted: ", s) // 출력: true
    
    mySlice := make([]myDataType, 0)
    mySlice = append(mySlice, myDataType{"김형준", 42})
    mySlice = append(mySlice, myDataType{"홍길동", 28})
    mySlice = append(mySlice, myDataType{"임꺽정", 38})
 
    sort.Slice(mySlice, func(i, j int) bool {
        return mySlice[i].age < mySlice[j].age
    })
    
    fmt.Println(mySlice) // 출력: [{홍길동 28} {임꺽정 38} {김형준 42}]
}
```

# 입력 값 읽기

`fmt.scanln()` 는 공백 EOF으로 판단하고 자꾸 자르는 경향이 있어 불편했다.

```go
scanner := bufio.NewScanner(os.Stdin)
scanner.Scan() // 한번만 읽기
for scanner.Scan() {
	line := scanner.Text()
	fmt.Println(line)
} // 계속 읽기
```

이렇게 스캐너로 읽어 들이거나

```go
r := bufio.NewReader(os.Stdin)
str, err := r.ReadString('\n')
```

버퍼 리더를 이용해 읽어 들어야 정상적으로 스페이스를 포함해 들어간다

# Scanner 버퍼 용량 늘리기

스캐너 버퍼의 기본 크기는 65536 바이트이다.

만약 입력값이 커 이 크기를 더 늘리고 싶다면

```go
scanner := bufio.NewScanner(os.Stdin)
buff := make([]byte, 1200000)
scanner.Buffer(buff, 1200000)
```

이렇게 버퍼 크기를 재 설정 해주면 된다.



# Try - Catch 구현하기

고 언어에서는 Try - Catch 구문이 지원되지 않는다.

```go
package main
 
import (
    "fmt"
)
 
func main() {
    fmt.Println("result:", divide(1, 0))
 
    fmt.Println("Today is good day.")
}
 
func divide(a, b int) int {
    defer func() {
        if err := recover(); err != nil {
            fmt.Println(err)
        }
    }()
 
    return a / b
}
```

대신 이렇게 `defer` 함수를 통해 (종료 시 반드시 호출이 보장된다) `recover()` 함수를 호출해 복구시킨다.

`recover()` 함수는 응용프로그램이 패닉 상태라면 에러값을 얻고 정상 상태로 복구해준다.
