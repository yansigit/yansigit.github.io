# ORACLE DB 계정

ORACLE DB 계정 설명
<!--more-->
## 계정

### 1. 관리자 계정

- **SYS**
    - 데이터 베이스 관리자 (DBA)
    - Super User (SYSDBA)
        - 데이터베이스 생성 및 삭제 가능
    - Data dictionary 소유자
- **SYSTEM**
    - DBA
    - 관리자에 필요한 테이블 및 뷰 생성
    - 데이터베이스 생성 불가
<!-- more -->
### 관리자 계정 접속

`sqlplus sys/123 as sysdba`

## 2. 샘플 사용자 계정

- BI (Business Intelligence)
- HR (Human Resources)
- OE (Order Entry)
- PM (Product Media)
- IX (Information Exchange)
- SH (Sales)
- scott
    - 실습 사용자 계정
    - 따로 활성화 시켜줘야 함

## 비밀번호 변경

`alter user scott identified by tiger;`

## sqlplus 내부에서 계정 변경

`conn {유저명}`

`conn {유저명}/{패스워드}`

## scott 계정 활성화

[scott 계정](/scott%20%E1%84%80%E1%85%A8%E1%84%8C%E1%85%A5%E1%86%BC%2044927495b5f24c71bbf63af9f6eb7df0) 문서 참조
