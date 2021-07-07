# ORACLE DB SQL*PLUS 명령어 정리

ORACLE DB SQL*PLUS 명령어 정리
<!--more-->

## SQL*PLUS 명령어

> SQL 명령어를 간단하게 편집, 저장, 실행, 결과 보기 등 제공

### LIST # `L`

> SQL 버퍼에 있는 쿼리를 출력

> 맨 마지막으로 실행한 SQL 쿼리가 버퍼에 저장됨

```sql
SQL> select to_number('1444') + 1 from dual;

TO_NUMBER('1444')+1
-------------------
               1445

SQL> l
  1* select to_number('1444') + 1 from dual

SQL> select empno, ename, sal
  2  from emp
  3  where deptno = 20;

     EMPNO ENAME             SAL
---------- ---------- ----------
      7369 SMITH             800
      7566 JONES            2975
      7788 SCOTT            3000
      7876 ADAMS            1100
      7902 FORD             3000

SQL> l
  1  select empno, ename, sal
  2  from emp
  3* where deptno = 20
SQL> l 2
  2* from emp
SQL> l 2 3
  2  from emp
  3* where deptno = 20
```

### RUN # `R`, `/`

> 버퍼에 저장된 쿼리 실행

```sql
SQL> l
  1  select empno, ename, sal
  2  from emp
  3* where deptno = 20

SQL> r
  1  select empno, ename, sal
  2  from emp
  3* where deptno = 20

     EMPNO ENAME             SAL
---------- ---------- ----------
      7369 SMITH             800
      7566 JONES            2975
      7788 SCOTT            3000
      7876 ADAMS            1100
      7902 FORD             3000

SQL> /

     EMPNO ENAME             SAL
---------- ---------- ----------
      7369 SMITH             800
      7566 JONES            2975
      7788 SCOTT            3000
      7876 ADAMS            1100
      7902 FORD             3000
```

### `SAVE`

> 버퍼에 있는 쿼리를 파일로 저장

```sql
SQL> select 1+4 from dual;

       1+4
----------
         5

SQL> save example1
file example1.sql(이)가 생성되었습니다
```

### `GET`

> 파일의 명령어를 SQL 버퍼로 불러옴

```sql
SQL> get example1
  1* select 1+4 from dual

SQL> l
  1* select 1+4 from dual
```

## START # `START`, `@`

> 파일의 명령어를 실행

```sql
SQL> start example1

       1+4
----------
         5

SQL> @ example1

       1+4
----------
         5
```

### EDIT # `ED [파일명]`

> 버퍼에 있는 쿼리를 임시파일에 저장하고 편집기로 열어줌

> 뒤에 파일명을 명시하면 빈 내용의 새 파일을 만듬 (편집 종료해도 버퍼로 안불러옴)

```sql
SQL> l
  1* select 6+9 from dual
SQL> ed
file afiedt.buf(이)가 기록되었습니다

  1* select 16+19 from dual
SQL> l
  1* select 16+19 from dual
```

### `HOST`

> SQL*PLUS 내에서 `Shell` 열어줌

> 돌아올 때는 `exit`

```bash
SQL> host
sh-4.2# pwd
/root
sh-4.2# ls -l
total 12
-rw-r--r-- 1 root root 25 Apr 17 04:31 afiedt.buf
-rw-r--r-- 1 root root 23 Apr 17 04:24 example1.sql
-rw-r--r-- 1 root root 35 Apr 17 04:33 example2.sql
sh-4.2# exit
exit

SQL>
```

### `I`

> 현재 행의 다음 행에 문자열  삽입

```sql
SQL> l
  1  select empno, ename, job
  2  from emp
  3* where deptno = 10
SQL> 2
  2* from emp
SQL> 1
  1* select empno, ename, job
SQL> l
  1  select empno, ename, job
  2  from emp
  3* where deptno = 10
SQL> i and job = 'CLERK'           # 현재 행의 다음행에 and job = 'CLERK' 삽입
SQL> l
  1  select empno, ename, job
  2  from emp
  3  where deptno = 10
  4* and job = 'CLERK'
```

### `A`

> 현재 행의 끝에 문자열 추가

```sql
SQL> l
  1  select empno, ename, job
  2  from emp
  3  where deptno = 10
  4* and job = 'CLERK'
SQL> 1
  1* select empno, ename, job
SQL> a , sal                          # 현재 행의 끝에 , sal 추가
  1* select empno, ename, job, sal
SQL> r
  1  select empno, ename, job, sal
  2  from emp
  3  where deptno = 10
  4* and job = 'CLERK'

     EMPNO ENAME      JOB              SAL
---------- ---------- --------- ----------
      7934 MILLER     CLERK           1300
```

### `DEL`

> 행 삭제

`del` : 현재 행 삭제

`del n` : n번째 행 삭제

`del n1 n2` : n1부터 n2까지의 행 삭제

```sql
SQL> l
  1  select empno, ename, job, sal
  2  from emp
  3  where deptno = 10
  4* and job = 'CLERK'
SQL> del                             # 현재 행 삭제
SQL> l
  1  select empno, ename, job, sal
  2  from emp
  3* where deptno = 10

SQL> i and job = 'CLERK'
SQL> l
  1  select empno, ename, job, sal
  2  from emp
  3  where deptno = 10
  4* and job = 'CLERK'
SQL> del 3                           # 3행 삭제
SQL> l
  1  select empno, ename, job, sal
  2  from emp
  3* and job = 'CLERK'

SQL> del 2 3                         # 2~3 행 삭제
SQL> l
  1* select empno, ename, job, sal
```

### CHANGE # `C`

> 현재 행의 문자열을 교체

```sql
SQL> l
  1  select empno, ename, job, sal
  2  from emp
  3* where deptno = 20
SQL> 1
  1* select empno, ename, job, sal
SQL> c/job/deptno                             # 문자열 변경
  1* select empno, ename, deptno, sal
SQL> l
  1  select empno, ename, deptno, sal
  2  from emp
  3* where deptno = 20
```

## `{n} {문자열}`

> n 번째 행을 해당 문자열로 교체

> n이 0이면 첫번째 행 앞에 문자열 삽입

```sql
SQL> l
  1  select empno, ename, deptno, sal
  2  from emp
  3* where deptno = 20
SQL> 3 where sal >= 2000     # 3행 내용 교체
SQL> l
  1  select empno, ename, deptno, sal
  2  from emp
  3* where sal >= 2000

SQL> del 1
SQL> l
  1  from emp
  2* where sal >= 2000
SQL> 0 select ename          # 첫번째 줄에 내용 삽입
SQL> l
  1  select ename
  2  from emp
  3* where sal >= 2000
```

### CLEAR SCREEN # `CL SCR`

> 화면 내용 모두 삭제

### CLEAR BUFFER # `CL BUFF`

> 버퍼 모두 삭제

### `SPOOL {파일명}`

> 지금부터 작업 내용을 모두 파일로 저장

> 중지: `spool off`

```sql
sh-4.2# cat output.txt
SQL> select ename
  2  from emp
  3  where sal >= 3000;

ENAME
----------
KING
FORD

SQL> 1
  1* select ename
SQL> c/ename/sal
  1* select sal
SQL> r
  1  select sal
  2  from emp
  3* where sal >= 3000

       SAL
----------
      5000
      3000

SQL> spool off
```
