# ORACLE DB 서브 쿼리 정리

ORACLE DB 서브 쿼리
<!--more-->

## 서브 쿼리

> 하나의 쿼리 처리에서 얻어진 결과를 다른 쿼리의 조건식에 전달해 결과 검색

## 언제 쓰이나?

- KING 사원과 같은 부서에서 근무하는 사원 출력
    1. 먼저 KING  사원의 부서번호를 구함
    2. 그 결과인 10으로 `where deptno = 10`을 통해 쿼리
- FORD 사원의 급여보다 많이 받는 사원 출력
    1. 역시 먼저 FORD 사원의 급여를 구해야함
- JONES 사원과 동일한 매니저인 사원 출력
    1. 역시 JONES 사원의 매니저 번호를 구해야함

## 서브 쿼리 구문 형식

```sql
select ename
from emp
where deptno = (select deptno from emp where ename = 'KING'

select ename
from emp
where salary > (select salary from emp where ename = 'FORD')

select empno, ename, salary
from emp
where salary = (select max(salary) from emp where deptno = 10)
```

- WHERE 조건 연산자 옆에 괄호로 묶어 표현함
- `order by` 절은 사용할 수 없음

## 서브 쿼리를 이용한 조인 쿼리 표현

```sql
select e.ename, d.dname
from emp e, (select deptno, dname from dept where deptno = 10) d
where e.deptno = d.deptno
```

- 해당 (서브쿼리절)을 인라인 뷰 라고도 한다.

## 다중 행 서브쿼리

> 서브 쿼리에서 반환되는 결과가 하나의 행 이상

### 다중 연산자

### `IN`

비교조건에서 서브 쿼리의 출력 결과 중 하나라도 일치하면 참

```sql
... where deptno in (select deptno from emp where ename = 'BLAKE')

... where (job, dedptno) in (select job, deptno from emp where ename = 'ALLEN')
```

#### `ALL`

서브 쿼리의 출력값들에 대한 where 비교조건이 모두 참인 결과만 출력

```sql
-- (그냥 예시임)
-- 30번 부서 연봉
select sal from emp where deptno = 30;

sal
----
1600
2850
950
1500

# 30번 부서 사원들의 급여보다 더 많이 받는 사원들 연봉 출력
select sal
from emp
where sal > all (select sal from emp where deptno = 30)

sal
----
2950
3000
5000
```

#### `ANY`

서브 쿼리 출력값들 각각에 대해 where 비교조건이 참인 결과를 모두 다 출력

```sql
select sal
from emp
where sal > any (select sal from emp where deptno = 30)

sal
----
-- 30번 부서의 최소 연봉 이상인 연봉 모두 출력
```
