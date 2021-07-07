# Understanding Nil and Null in Golang


고 언어에서 nil 과 null

<!--more-->

# Null ==> Nil

고 언어에서는 `null `대신 `nil`을 사용한다.

다만 기억할 것은 고 언어에서 `nil` 값을 리턴해주는 것은 금지다.

```go
package main
import "fmt"

func main() {
	someRandom := getString()
	fmt.Println(someRandom)
}

func getString() string {
	return nil // This WON'T compile
}
```

다만 포인터, 즉 주소값이 `nil` 인것은 기능하다

```go
package main
import "fmt"

type SomeStruct struct {
	name string
}

func main() {
	s := getSomeStruct()
	fmt.Println(s.name) // It will crash here
}

func getSomeStruct() *SomeStruct {
	return nil // This WILL compile
}
```

출저: [newfivefour.com](https://newfivefour.com/golang-null-nil.html)
