### 🎯 예제 32: R에서 `서브쿼리` 사용법 💡

---

#### **😊 SQL 서브쿼리 유형**

| 번호 | 서브쿼리 유형                     | 설명 |
|----|------------------------|------|
| 1  | `Single Row Subquery`  | 하나의 값이 반환되는 서브쿼리 |
| 2  | `Multiple Row Subquery` | 여러 개의 값이 반환되는 서브쿼리 |
| 3  | `Multiple Column Subquery` | 여러 개의 컬럼 값을 반환하는 서브쿼리 |

---

#### **😊 기본 예제**

✅ **예제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename='JONES');
```

✅ **R 코드**
```r
threshold <- emp$sal[emp$ename == "JONES"]
result <- subset(emp, sal > threshold, select=c("ename", "sal"))
```

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);
```

✅ **R 코드**
```r
max_sal <- max(emp$sal)
result <- subset(emp, sal == max_sal, select=c("ename", "sal"))
```

✅ **예제 2**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE job='SALESMAN');
```

✅ **R 코드**
```r
valid_dept <- unique(emp$deptno[emp$job == "SALESMAN"])
result <- subset(emp, deptno %in% valid_dept, select=c("ename", "sal", "deptno"))
```

✅ **문제 2**: 아래의 SQL을 R 코드로 구현하시오. (관리자인 사원의 이름 출력)

✅ **SQL 코드**
```sql
SELECT ename
FROM emp
WHERE empno IN (SELECT mgr FROM emp);
```

✅ **R 코드**
```r
managers <- unique(emp$mgr[!is.na(emp$mgr)])
result <- subset(emp, empno %in% managers, select="ename")
```

✅ **문제 3**: 전국에서 등록금이 가장 비싼 학교의 이름과 등록금을 출력하시오.

📌 **데이터 다운로드**: [등록금 데이터](https://cafe.daum.net/oracleoracle/Soei/29)

✅ **R 코드**
```r
fees <- read.csv("fees.csv", header=TRUE)
max_fees <- max(fees$등록금)
result <- subset(fees, 등록금 == max_fees, select=c("학교명", "등록금"))
```

---

✅ **예제 3**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, job
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE comm IS NOT NULL)
AND job IN (SELECT job FROM emp WHERE comm IS NOT NULL);
```

✅ **R 코드**
```r
valid_dept <- unique(emp$deptno[!is.na(emp$comm)])
valid_job <- unique(emp$job[!is.na(emp$comm)])
result <- subset(emp, deptno %in% valid_dept & job %in% valid_job, select=c("ename", "sal", "job"))
```

✅ **문제 4**: 아래의 SQL을 R 코드로 구현하시오. (관리자가 아닌 사원의 이름과 월급 출력)

✅ **SQL 코드**
```sql
SELECT ename, sal
FROM emp
WHERE empno NOT IN (SELECT mgr FROM emp WHERE mgr IS NOT NULL);
```

✅ **R 코드**
```r
non_managers <- setdiff(emp$empno, unique(emp$mgr[!is.na(emp$mgr)]))
result <- subset(emp, empno %in% non_managers, select=c("ename", "sal"))
```
