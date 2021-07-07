# ORACLE DB 팁 정리

ORACLE DB 팁 정리
<!--more-->
# 팁

# 1. 예전 명령어 체계 사용

계정 생성, 권한 부여 등 편하게 할 수 있음

`alter session set "_ORACLE_SCRIPT"=true;` 

# 1. 날짜 포맷 변경

DATE Format을 변경하는 방법은 크게는 4가지 방법이 있습니다.

여기서 4번은 일회성이고 나머지 1-3은 반 영구적인 변경방법 입니다.

### **1. INIT[dbname].ora 화일 수정**

- NLS_DATE_FORMAT = 'RR-MM-DD' 이와 같이 변수와 값을 추가.

### **2. Shell 프로그램 이용**

- C Shell: OS 상태에서 `setenv NLS_DATE_FORMAT 'RR/MM/DD'`추가.
- B Shell: `NLS_DATE_FORMAT='RR/MM/DD'`

    `export NLS_DATE_FORMAT` 추가.

- K Shell: B Shell 방법과 추가로 `export NLS_DATE_FORMAT='RR/MM/DD'` 로 표현 가능

### **3. SYS.PROPS$ VIEW를 이용하여 UPDATE하는 방법**

### **4. Session 에서 set 하는 방법**

- SQLPLUS 상태에서 `ALTER SESSION SET "NLS_DATE_FORMAT"='RR/MM/DD'` 실행
- 단 SESSION 내에서만 활용가능

# 2. 서버 인코딩 변경

출처: [http://egloos.zum.com/sstories/v/9584689](http://egloos.zum.com/sstories/v/9584689)

```sql
-- SYS 계정 로그인 후
select * from nls_database_parameters where parameter like '%CHARACTERSET%';
select VALUE$ from sys.props$ where name='NLS_LANGUAGE';

update sys.props$ set value$='AL32UTF8' where name='NLS_CHARACTERSET';
update sys.props$ set value$='AL32UTF8' where name='NLS_NCHAR_CHARACTERSET';
update sys.props$ set value$='KOREAN_KOREA.AL32UTF8' where name='NLS_LANGUAGE';
commit;

shutdown immediate;
startup;
```

```bash
nano /etc/profile

# 끝부분에 아래 명령어 추가
export NLS_LANG=KOREAN_KOREA.AL32UTF8

# 다음 재접속 하거나
source /etc/profile
```

```sql
-- 그래도 안될 경우에 다음꺼 해보자 (난 안해도 됬었음)
-- 다음 다시 sqlplus에서 sys 계정으로 로그인하고
alter system enable restricted session;
alter system set job_queue_processes=0;
alter system set aq_tm_processes=0;
alter database open;
alter database character set AL32UTF8;

shutdown immidiate;
startup mount;
```
