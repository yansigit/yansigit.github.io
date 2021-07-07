# ORACLE DB Scott 계정

ORACLE DB Scott 계정에 대해서
<!--more-->

## scott 계정

## 1. 개요

Oracle DB의 대표적인 예제 사용자 계정

## 2. 활성화 하기

1. 관리자 계정 SYS 또는 system으로 접속
    - `sqlplus sys/123123 as sysdba`
2. 오라클 12C 버전부터는 사용자 계정 생성 및 권한 부여 시 `C##` 키워드를 붙여야 한다
    - 귀찮으므로
    - `alter session set "_ORACLE_SCRIPT"=true;`
    - 명령을 통해 예전 방식을 사용할 수  있게 한다.
    - 이는 일회용이며 `sqlplus` 를 종료 후 재실행하면 다시 실행시켜야 한다.
3. `scott.sql` 파일을 찾는다.
    - 보통 `$ORACLE_HOME\rdbms\admin\` 디렉토리에 위치해있다.
    - 오라클 설치 위치인 `$ORACE_HOME` 디렉토리는 sqlplus 내부에서 `?`로 대체할 수 있는 듯
        - 예) `@ ?/rdbms/admin/scott.sql`
    - 18c 도커 버전에서는 왠지 안보인다. 따라서 구글링해보니 다음 위치에 있는 스크립트가 대체할 수 있는 듯 하다.
        - `$ORACLE_HOME\rdbms\admin\utlsampl.sql`
4. 다음 `sqlplus` 내에서 스크립트 파일을 실행시킨다.
    - `@ ?/rdbms/admin/utlsampl.sql`
5. 로그인하여 확인해본다.
    - `sqlplus SCOTT/tiger`

## 3. 같이 생성되는 테이블

- DEPT
    - 부서
- EMP
    - 사원
- SALGRADE
    - 급여등급
- BONUS
    - 보너스
