# Time Format in Golang


# Time format in Go Language

보통 프로그래밍 언어에서 시간과 날짜를 다룰 때 레이아웃은 `YYYY-MM-DD HH:MM:SS`와 같이 영문자를 이용한 방식이다.

고 언어에서는 타 언어와 다르게 숫자로 포맷을 지정해줘야 한다.
<!--more-->
```
2006-01-02 15:04:05
```

언뜻 보기에 보통의 날짜와 시간을 나타내는 문자열로 보일 수 있는데 사실 `date` 명령어를 쓸 때 출력 되는 결과의 순서라고 한다.

```shell
$ date
Mon Jan 2 15:04:05 -0700 MST 2006
0   1   2  3  4  5              6
```

해당 레이아웃 법칙을 이용해 직접 포맷을 지정해 줄 수 있고, 혹은 통상적으로 사용되는 포맷일 경우 미리 정해둔 상수를 통해서 정해 줄 수도 있다.

```go
const (
   ANSIC       = "Mon Jan _2 15:04:05 2006"
   UnixDate    = "Mon Jan _2 15:04:05 MST 2006"
   RubyDate    = "Mon Jan 02 15:04:05 -0700 2006"
   RFC822      = "02 Jan 06 15:04 MST"
   RFC822Z     = "02 Jan 06 15:04 -0700" // RFC822 with numeric zone
   RFC850      = "Monday, 02-Jan-06 15:04:05 MST"
   RFC1123     = "Mon, 02 Jan 2006 15:04:05 MST"
   RFC1123Z    = "Mon, 02 Jan 2006 15:04:05 -0700" // RFC1123 with numeric zone
   RFC3339     = "2006-01-02T15:04:05Z07:00"
   RFC3339Nano = "2006-01-02T15:04:05.999999999Z07:00"
   Kitchen     = "3:04PM"
   // Handy time stamps.
   Stamp      = "Jan _2 15:04:05"
   StampMilli = "Jan _2 15:04:05.000"
   StampMicro = "Jan _2 15:04:05.000000"
   StampNano  = "Jan _2 15:04:05.000000000"
)
```


