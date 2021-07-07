# Client Software for Mongo Db Mongodb Compass

Mongo DB 관리 클라이언트, MongoDB Compass
<!--more-->

# MongoDB Compass

 MongoDB를 위한 관리 툴은 여러 종류가 있는데, `scoop`에는 `compass` 하나밖에 없는 듯 하여 해당 소프트웨어를 사용하는 것으로 결정했다.

설치는 다음 명령어를 통해 가능하다.

```
scoop install mongodb-compass-community
```

다음 접속 스키마를 통해 클라이언트에서 MongoDB 서버로 연결하는데

MongoDB가 로컬에 기본포트인 `27013`에서 연결되어 있다면 따로 뭐 적을 필요 없이 버튼 클릭하면 자동으로 접속된다.

혹은 직접

```
mongodb://localhost:27017/
```

이런 식으로 적어주고 버튼을 눌러줘도 된다
