# ORACLE DB 에러 대응

ORACLE DB 에러 대응
<!--more-->
## 에러 대응

### 로컬에서 `sqlplus` 에러 뜰 경우

#### `TNS lost contact` 에러

1. 먼저 해당 바이너리 퍼미션 확인

    `ls -l $ORACLE_HOME/bin/oracle`

2. 퍼미션이 `-rwsr-s--x` 이 아닐 경우 변경

    `chmod 6751 $ORACLE_HOME/bin/oracle`

3. 다시 `sqlplus` 접속하여 정상작동 확인
