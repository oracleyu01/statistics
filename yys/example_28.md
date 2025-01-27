### 🎯 예제 28: R에서 `EQUI JOIN` 사용법 💡

---

#### **😊 SQL vs R JOIN 비교**

| 번호 | SQL JOIN 유형   | R 대응 함수  |
|----|---------------|-------------|
| 1  | `EQUI JOIN`   | `merge()`   |
| 2  | `NON-EQUI JOIN` | -           |
| 3  | `OUTER JOIN`  | -           |
| 4  | `SELF JOIN`   | -           |

---

#### **😊 기본 예제**

✅ **예제 1**: `dept.csv` 파일을 내려받아 `dept` 데이터 프레임을 생성하시오.
```r
dept <- read.csv("dept.csv", header=TRUE)
dept
```

✅ **예제 2**: 이름과 부서 위치를 출력하시오.

✅ **SQL 코드**
```sql
SELECT e.ename, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;
```

✅ **R 코드**
```r
x <- merge(emp, dept, by="deptno")
x[, c("ename", "loc")]
```

---

#### **😊 실습 문제**

**문제 1**: `DALLAS`에서 근무하는 사원들의 이름, 월급, 부서 위치를 출력하시오.
```r

```

**문제 2**: 커미션이 `NULL`인 사원들의 이름, 부서 위치, 커미션을 출력하시오.
```r

```
