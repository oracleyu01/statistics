# 4. 오라클 Database와 R 연동하기

## 1. 오라클 DB 접속 확인
먼저 오라클 DB에 `c##scott` 계정으로 접속이 되는지 확인합니다.

```sql
sqlplus c##scott/tiger
```

## 2. JDBC 드라이버를 사용하는 패키지 설치
오라클과 R을 연동하기 위해 필요한 패키지를 설치하고 로드합니다.

```r
install.packages("DBI")
install.packages("RJDBC")

library(DBI)
library(RJDBC)
```

## 3. 오라클과 R 연동을 위한 JDBC 드라이버 다운로드
오라클과 R을 연동하려면 JDBC 드라이버를 다운로드해야 합니다.  
현재 사용 중인 오라클 버전을 확인하고, 해당 버전에 맞는 JDBC 드라이버를 다운로드합니다.

### 3.1 오라클 버전 확인
```sql
SELECT * FROM v$version;
```

예를 들어, 오라클 버전이 **21c**라면 `ojdbc8.jar`을 다운로드해야 합니다.  
[JDBC 드라이버 다운로드 링크](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)

## 4. 오라클 접속을 위한 3가지 정보 확인
오라클에 접속하려면 다음 3가지 정보를 확인해야 합니다.

1. **IP 주소 (건물 주소)**  
2. **포트번호 (그 건물의 층수)**  
3. **서비스 이름 (회사이름)**  

### 4.1 리스너 상태 확인
명령 프롬프트에서 아래 명령어를 실행하여 리스너 상태를 확인합니다.
```sh
lsnrctl status
```

### 4.2 예시 정보
| 항목 | 예시 |
|------|------|
| IP 주소 | 127.0.0.1 |
| 포트번호 | 1521 |
| 서비스 이름 | xe |

### 4.3 SQL*Plus를 이용한 접속
```sh
sqlplus c##scott/tiger@127.0.0.1:1521/xe
```

## 5. R에서 오라클과 연동하기
아래 코드를 실행하여 R과 오라클을 연동합니다.

```r
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_202')
library(rJava)
library(DBI)
library(RJDBC)

driver <- JDBC('oracle.jdbc.driver.OracleDriver', 'c:\\data\\ojdbc8.jar')

oracle_db <- dbConnect(driver, 'jdbc:oracle:thin:@127.0.0.1:1521/xe', 'c##scott','tiger')

emp_query <- 'SELECT * FROM emp'
emp_data <- dbGetQuery(oracle_db, emp_query)
emp_data   

```   


