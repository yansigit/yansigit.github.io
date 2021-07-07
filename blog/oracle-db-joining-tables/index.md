# ORACLE DB 테이블 조인

ORACLE DB 테이블 조인
<!--more-->

## 테이블 조인

## EQUI JOIN

> 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치하는 행을 연결하여 결과를 생성

> 컬럼명 앞에 테이블명을 기술해 어느 소속 컬럼인지 확실히 할 수 있다.

> 만약 같은 절에 같은 컬럼명이 두개이상 있다면 명확히 해줘야한다.

> 별칭을 사용할 수도 있음 `from emp e, dept d`

```sql
select emp.empno, emp.ename, dept.dname from emp, dept where emp.deptno = dept.deptno;

EMPNO ENAME      DNAME
---------- ---------- --------------
      7369 SMITH      RESEARCH
      7499 ALLEN      SALES
      7521 WARD       SALES
      7566 JONES      RESEARCH
      7654 MARTIN     SALES
      7698 BLAKE      SALES
      7782 CLARK      ACCOUNTING
      7839 KING       ACCOUNTING
      7844 TURNER     SALES
      7900 JAMES      SALES
      7902 FORD       RESEARCH

     EMPNO ENAME      DNAME
---------- ---------- --------------
      7934 MILLER     ACCOUNTING

select e.empno, e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;

EMPNO ENAME      DNAME
---------- ---------- --------------
      7369 SMITH      RESEARCH
      7499 ALLEN      SALES
      7521 WARD       SALES
      7566 JONES      RESEARCH
      7654 MARTIN     SALES
      7698 BLAKE      SALES
      7782 CLARK      ACCOUNTING
      7839 KING       ACCOUNTING
      7844 TURNER     SALES
      7900 JAMES      SALES
      7902 FORD       RESEARCH

     EMPNO ENAME      DNAME
---------- ---------- --------------
      7934 MILLER     ACCOUNTING

SQL> r
  1  select e.empno, e.ename, d.dname
  2  from emp e, dept d
  3  where e.deptno = d.deptno
  4* and e.ename = 'ALLEN'

     EMPNO ENAME      DNAME
---------- ---------- --------------
      7499 ALLEN      SALES
```

## NON-EQUI JOIN

> WHERE 절에 = 연산자 이외의 비교 연산자 사용

```sql
SQL> select e.ename, e.sal, s.grade
  2  from emp e, salgrade s
  3  where e.sal >= s.losal and e.sal <= s.hisal;

ENAME             SAL      GRADE
---------- ---------- ----------
SMITH             800          1
JAMES             950          1
WARD             1250          2
MARTIN           1250          2
MILLER           1300          2
TURNER           1500          3
ALLEN            1600          3
CLARK            2450          4
BLAKE            2850          4
JONES            2975          4
FORD             3000          4

ENAME             SAL      GRADE
---------- ---------- ----------
KING             5000          5

SQL> r
  1  select e.ename, e.sal, s.grade
  2  from emp e, salgrade s
  3* where e.sal between s.losal and s.hisal

ENAME             SAL      GRADE
---------- ---------- ----------
SMITH             800          1
JAMES             950          1
WARD             1250          2
MARTIN           1250          2
MILLER           1300          2
TURNER           1500          3
ALLEN            1600          3
CLARK            2450          4
BLAKE            2850          4
JONES            2975          4
FORD             3000          4

ENAME             SAL      GRADE
---------- ---------- ----------
KING             5000          5
```

## EQUI + NON-EQUI JOIN

```sql
SQL> r
  1  select e.ename, d.dname, s.grade
  2  from emp e, dept d, salgrade s
  3  where e.deptno = d.deptno
  4* and e.sal between s.losal and s.hisal

ENAME      DNAME               GRADE
---------- -------------- ----------
MILLER     ACCOUNTING              2
CLARK      ACCOUNTING              4
KING       ACCOUNTING              5
SMITH      RESEARCH                1
JONES      RESEARCH                4
FORD       RESEARCH                4
JAMES      SALES                   1
WARD       SALES                   2
MARTIN     SALES                   2
TURNER     SALES                   3
ALLEN      SALES                   3

ENAME      DNAME               GRADE
---------- -------------- ----------
BLAKE      SALES                   4
```

## SELF JOIN

> 원하는 데이터가 하나의 테이블에 모두 있음

> 자신의 테이블을 별칭을 통해 연결해 원하는 값을 검색

```sql
SQL> r
  1  select e.ename "사원", m.ename "팀장"
  2  from emp e, emp m
  3* where e.mgr = m.empno

사원       팀장
---------- ----------
FORD       JONES
ALLEN      BLAKE
WARD       BLAKE
MARTIN     BLAKE
TURNER     BLAKE
JAMES      BLAKE
MILLER     CLARK
JONES      KING
BLAKE      KING
CLARK      KING
SMITH      FORD

SQL> r
  1  select e.ename || ' 사원의 매니저는 ' || m.ename || '입니다'
  2  from emp e, emp m
  3* where e.mgr = m.empno

E.ENAME||'사원의매니저는'||M.ENAME||'입니다'
-----------------------------------------------------
FORD 사원의 매니저는 JONES입니다
ALLEN 사원의 매니저는 BLAKE입니다
WARD 사원의 매니저는 BLAKE입니다
MARTIN 사원의 매니저는 BLAKE입니다
TURNER 사원의 매니저는 BLAKE입니다
JAMES 사원의 매니저는 BLAKE입니다
MILLER 사원의 매니저는 CLARK입니다
JONES 사원의 매니저는 KING입니다
BLAKE 사원의 매니저는 KING입니다
CLARK 사원의 매니저는 KING입니다
SMITH 사원의 매니저는 FORD입니다

11 행이 선택되었습니다.
```

## OUTER JOIN

> 조인 조건을 만족하지 못하더라도 해당 행을 결과에 포함

### LEFT OUTER JOIN

> `where e.mgr = m.empno(+);`

```sql
SQL> select e.ename, m.ename
  2  from emp e, emp m
  3  where e.mgr = m.empno(+);

ENAME      ENAME
---------- ----------
FORD       JONES
ALLEN      BLAKE
WARD       BLAKE
MARTIN     BLAKE
TURNER     BLAKE
JAMES      BLAKE
MILLER     CLARK
JONES      KING
BLAKE      KING
CLARK      KING
SMITH      FORD

ENAME      ENAME
---------- ----------
KING

SQL> r
  1  select e.ename "사원", m.ename "관리자"
  2  from emp e left outer join emp m
  3* on e.mgr = m.empno

사원       관리자
---------- ----------
FORD       JONES
ALLEN      BLAKE
WARD       BLAKE
MARTIN     BLAKE
TURNER     BLAKE
JAMES      BLAKE
MILLER     CLARK
JONES      KING
BLAKE      KING
CLARK      KING
SMITH      FORD

사원       관리자
---------- ----------
KING
```

### RIGHT OUTER JOIN

```sql
SQL> r
  1  select e.ename, d.dname
  2  from emp e, dept d
  3* where e.deptno(+) = d.deptno

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
KING       ACCOUNTING
TURNER     SALES
JAMES      SALES
FORD       RESEARCH

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
           OPERATIONS

SQL> r
  1  select e.ename, d.dname
  2  from emp e right outer join dept d
  3* on e.deptno = d.deptno

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
KING       ACCOUNTING
TURNER     SALES
JAMES      SALES
FORD       RESEARCH

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
           OPERATIONS
```
