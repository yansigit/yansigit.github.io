# Using Mongodb in Golang


# ODM for MongoDB

MongoDB에도 `ORM`과 비슷한 `ODM` 프레임웍이 있는데 바로 [MGM](https://github.com/Kamva/mgm) 이라는 프로젝트. 저번달에 따끈따끈하게 나온 프로젝트인거 같다.

사실 MongoDB 같은 경우에는 SQL 기반이 아니라 JSON 혹은 BSON 기반이라 ODM을 쓸것까지는 없을 것 같지만, 아직 MongoDB에 익숙하지 않기도 하고 짜여진 구조체를 기반으로 편리하게 데이터베이스와 소통할 수 있다는 장점과 빠른 개발이 가능할것이라는 생각에 한번 사용해보기로 했다.
<!--more-->
```go
import (
   "github.com/Kamva/mgm"
   "go.mongodb.org/mongo-driver/mongo/options"
)

func init() {
   // Setup mgm default config
   err := mgm.SetDefaultConfig(nil, "mgm_lab", options.Client().ApplyURI("mongodb://root:12345@localhost:27017"))
}
```

공식 MongoDB 드라이버 기반이라 이렇게 옵션 부분을 같이 Import 해줘야 한다.

사용하는 방법도 간편하다. 이렇게 `mgm.SetDefaultConfig`을 이용해 데이터베이스와 연결시켜 준 다음 `mgm` 객체를 통해 편리하게 문서를 쓰고 지우면 된다.
