# ORACLE DB 명령어 정리

ORACLE DB 명령어 정리
<!--more-->
## 명령어

### 테이블 출력

```sql
SELECT * FROM tab; /* 모든 테이블 출력 */

/* BIN$ 으로 시작하는 테이블이 있을 수 있으며 */
/* 이 테이블들은 삭제된 테이블이 혹시 몰라 남아있는 것 */
PURGE RECYCLEBIN; /* 삭제된 테이블 퍼지 */
```

```
TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
BONUS
TABLE

DEPT
TABLE

EMP
TABLE

TNAME
--------------------------------------------------------------------------------
TABTYPE        CLUSTERID
------------- ----------
SALGRADE
TABLE
```

### 테이블 구조 확인

```sql
DESC delpt; /* 테이블 구조 확인 */
```

```
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER(2)
 DNAME                                              VARCHAR2(14)
 LOC                                                VARCHAR2(13)
```

### SELECT

- 테이블에 저장되어 있는 데이터 조회

```sql
SELECT * FROM dept;
```

```
    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON
```

### 산술연산처리

- 숫자형 컬럼만 연산 가능

```sql
SELECT ename,sal*12 FROM emp;
```

```
ENAME          SAL*12
---------- ----------
SMITH            9600
ALLEN           19200
WARD            15000
JONES           35700
MARTIN          15000
BLAKE           34200
CLARK           29400
SCOTT           36000
KING            60000
TURNER          18000
ADAMS           13200

ENAME          SAL*12
---------- ----------
JAMES           11400
FORD            36000
MILLER          15600
```

### NULL 데이터

- 값이 없는 데이터
- NULL 데이터와 연산한 값은 모두 NULL

```sql
SQL> SELECT empno, ename, comm FROM emp;

     EMPNO ENAME            COMM
---------- ---------- ----------
      7369 SMITH
      7499 ALLEN             300
      7521 WARD              500
      7566 JONES
      7654 MARTIN           1400
      7698 BLAKE
      7782 CLARK
      7788 SCOTT
      7839 KING
      7844 TURNER              0
      7876 ADAMS

     EMPNO ENAME            COMM
---------- ---------- ----------
      7900 JAMES
      7902 FORD
      7934 MILLER

14 rows selected.

SQL> SELECT empno, ename, comm*100 FROM emp;

     EMPNO ENAME        COMM*100
---------- ---------- ----------
      7369 SMITH
      7499 ALLEN           30000
      7521 WARD            50000
      7566 JONES
      7654 MARTIN         140000
      7698 BLAKE
      7782 CLARK
      7788 SCOTT
      7839 KING
      7844 TURNER              0
      7876 ADAMS

     EMPNO ENAME        COMM*100
---------- ---------- ----------
      7900 JAMES
      7902 FORD
      7934 MILLER

14 rows selected.
```

### 별칭 (alias)

- 컬럼명을 변경해 출력할 수 있음

```sql
SQL> SELECT empno as num, ename as name FROM emp;

       NUM NAME
---------- ----------
      7369 SMITH
      7499 ALLEN
      7521 WARD
      7566 JONES
      7654 MARTIN
      7698 BLAKE
      7782 CLARK
      7788 SCOTT
      7839 KING
      7844 TURNER
      7876 ADAMS

       NUM NAME
---------- ----------
      7900 JAMES
      7902 FORD
      7934 MILLER

14 rows selected.

SQL> SELECT empno num, ename name FROM emp;

       NUM NAME
---------- ----------
      7369 SMITH
      7499 ALLEN
      7521 WARD
      7566 JONES
      7654 MARTIN
      7698 BLAKE
      7782 CLARK
      7788 SCOTT
      7839 KING
      7844 TURNER
      7876 ADAMS

       NUM NAME
---------- ----------
      7900 JAMES
      7902 FORD
      7934 MILLER

14 rows selected.

SQL> SELECT empno "<n u m>", ename "<n a m e>" FROM emp;

   <n u m> <n a m e>
---------- ----------
      7369 SMITH
      7499 ALLEN
      7521 WARD
      7566 JONES
      7654 MARTIN
      7698 BLAKE
      7782 CLARK
      7788 SCOTT
      7839 KING
      7844 TURNER
      7876 ADAMS

   <n u m> <n a m e>
---------- ----------
      7900 JAMES
      7902 FORD
      7934 MILLER

14 rows selected.

SQL> SELECT empno "<n u m>", sal*100 "$ S A L" FROM emp;

   <n u m>    $ S A L
---------- ----------
      7369      80000
      7499     160000
      7521     125000
      7566     297500
      7654     125000
      7698     285000
      7782     245000
      7788     300000
      7839     500000
      7844     150000
      7876     110000

   <n u m>    $ S A L
---------- ----------
      7900      95000
      7902     300000
      7934     130000
```

### || 연결 연산자

> 주의할 점

오라클에서 **문자열**은 **작은 따옴표**로 표현된다.

쌍 따옴표는 오직 `별칭`을 지칭할 때만 사용한다

```sql
SQL> SELECT ename, ' is a ', job FROM emp;

ENAME      'ISA'  JOB
---------- ------ ---------
SMITH       is a  CLERK
ALLEN       is a  SALESMAN
WARD        is a  SALESMAN
JONES       is a  MANAGER
MARTIN      is a  SALESMAN
BLAKE       is a  MANAGER
CLARK       is a  MANAGER
SCOTT       is a  ANALYST
KING        is a  PRESIDENT
TURNER      is a  SALESMAN
ADAMS       is a  CLERK

ENAME      'ISA'  JOB
---------- ------ ---------
JAMES       is a  CLERK
FORD        is a  ANALYST
MILLER      is a  CLERK

14 rows selected.

SQL> SELECT ename || ' is a ' || job FROM emp;

ENAME||'ISA'||JOB
-------------------------
SMITH is a CLERK
ALLEN is a SALESMAN
WARD is a SALESMAN
JONES is a MANAGER
MARTIN is a SALESMAN
BLAKE is a MANAGER
CLARK is a MANAGER
SCOTT is a ANALYST
KING is a PRESIDENT
TURNER is a SALESMAN
ADAMS is a CLERK

ENAME||'ISA'||JOB
-------------------------
JAMES is a CLERK
FORD is a ANALYST
MILLER is a CLERK

14 rows selected.
```

### DISTINCT

- 중복된 값은 제외하고 한 개 값만 출력
- 실험 결과 컬럼이 여러개일 경우 distinct 바로 오른쪽에 있는 컬럼에만 적용됨
    - 당연... 한거같긴 하다

```sql
SQL> select deptno from emp;

    DEPTNO
----------
        20
        30
        30
        20
        30
        30
        10
        20
        10
        30
        20

    DEPTNO
----------
        30
        20
        10

SQL> select distinct deptno from emp;

DEPTNO
----------
        30
        10
        20
```

### WHERE 조건절

- 조건을 특정
- 필요한 데이터만 검색
- **사용 가능한 비교 연산자**
    - =
    - >
    - <
    - >=
    - <=
    - <>, != *(같지 않다)*

```sql
SQL> select empno, ename, sal from emp where sal > 2000;

     EMPNO ENAME             SAL
---------- ---------- ----------
      7566 JONES            2975
      7698 BLAKE            2850
      7782 CLARK            2450
      7788 SCOTT            3000
      7839 KING             5000
      7902 FORD             3000

// 문자열 비교 시 대소문자 구별
SQL> select ename,sal from emp where ename='FORD';

ENAME             SAL
---------- ----------
FORD             3000

SQL> select ename,sal from emp where ename='Ford';

no rows selected

//날짜 데이터 비교
```

### LIKE 연산자

> 해당 문자를 포함하는지 여부

- 이름이 J로 시작하는 사원

    `WHERE ename LIKE 'J%';`

- 이름에 A를 포함하는 사원

    `WHERE ename LIKE '%A%';`

- 이름이 N으로 끝나는 사원

    `WHERE ename LIKE '%N';`

- 이름의 두 번째 문자가 A인 사원

    `WHERE ename LIKE '_A%';`

### IN 연산자

> 여러개의 값 중에서 일치하는 값이 있으면 참

> 두개말고 여러개도 가능

> 논리 연산자 OR 대신 사용 가능

> 날짜와 문자도 비교 가능

- 부서번호가 10, 20인 사원의 사번, 이름, 부서번호 출력

    ```sql
    select empno, ename, deptno from emp where deptno IN (10,20);

    EMPNO ENAME          DEPTNO
    ---------- ---------- ----------
          7369 SMITH              20
          7566 JONES              20
          7782 CLARK              10
          7788 SCOTT              20
          7839 KING               10
          7876 ADAMS              20
          7902 FORD               20
          7934 MILLER             10

    SQL> select empno, ename, job
      2  from emp
      3  where job in ('CLERK', 'MANAGER');

         EMPNO ENAME      JOB
    ---------- ---------- ---------
          7369 SMITH      CLERK
          7566 JONES      MANAGER
          7698 BLAKE      MANAGER
          7782 CLARK      MANAGER
          7876 ADAMS      CLERK
          7900 JAMES      CLERK
          7934 MILLER     CLERK
    ```

### BETWEEN A AND B 연산자

> A에서 B까지의 범위 값을 조회

> 논리연산자 AND 대신 사용 가능

- 급여가 2000에서 4000 사이인 사원의 이름 출력

```sql
select ename from emp where sal between 2000 and 4000;

ENAME
----------
JONES
BLAKE
CLARK
SCOTT
FORD
```

### 논리 연산자

- WHERE 절에 조건이 두 개 이상일 경우
    - **AND** : 두 조건을 모두 만족

    ```sql
    select ename, job, deptno from emp where job = 'CLERK' and deptno = 10;
    select ename, job, sal from emp where sal >= 2000 and sal <= 4000;
    ```

    - **OR** : 두 조건 중에서 한 가지만 만족

    ```sql
    select ename, job, deptno from emp where job = 'CLERK' or job = 'MANAGER';
    select ename, job, deptno from emp where deptno = 10 or deptno = 20;
    ```

- WHERE 절의 조건에 해당하지 않을 경우 검색
    - **NOT**

    ```sql
    select empno, ename, deptno from emp where not deptno = 20;
    ```

    - **NOT IN**

    > 부서 번호가 10, 20번이 아닌 사원

    ```sql
    select empno, ename, deptno from emp where deptno not in (10,20);
    ```

    - **NOT BETWEEN A AND B**

    > 연봉이 2000~4000이 아닌 사원

    ```sql
    select empno, ename, sal from emp where sal not between 2000 and 4000;
    ```

    - **NOT LIKE**

    > 이름에 A가 들어가지 않는 사원

    ```sql
    select empno, ename from emp where ename not like '%A%';
    ```

### IS NULL, IS NOT NULL

> 컬럼값이 NULL인지 아닌지 비교

> 관리자가 없는 사원과 있는 사원 출력

```sql
select empno, ename, mgr from emp where mgr is null;
select empno, ename, mgr from emp where mgr is not null;
```

### ORDER BY 절

> 쿼리 결과 순서 정렬

> 숫자, 문자, 날짜 정렬 가능 (A,B,C | 가나다 순)

`ORDER BY {기준컬럼명} {ASC | DESC}`

- **ASC**
    - 오름차순
    - 생략 가능

    ```sql
    select empno, ename, sal from emp order by sal;
    select empno, ename, sal from emp order by ename;
    select empno, ename, hiredate from emp order by hiredate;
    ```

- **DESC**
    - 내림차순

    ```sql
    select empno, ename, sal from emp order by sal desc;
    select empno, ename, sal from emp order by ename desc;
    select empno, ename, hiredate from emp order by hiredate desc;
    ```

> 여러 개를 기준으로 정렬 가능 (첫번째로 정렬 후 다음 기준으로 또 정렬)

`ORDER BY {기준컬럼명} {ASC | DESC}, {기준컬럼명2} {ASC | DESC}, ...`

```sql
select empno, ename, sal from emp order by sal desc, ename asc;
```
