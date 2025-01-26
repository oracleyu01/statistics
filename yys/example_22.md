### 🎯 예제 22: R에서의 그룹 함수 `max` 알아보기 💡

---

#### **😊 그룹 함수 비교: SQL vs R**

| 번호 | SQL     | R       |
|----|---------|---------|
| 1  | `MAX`   | `max`   |
| 2  | `MIN`   | `min`   |
| 3  | `SUM`   | `sum`   |
| 4  | `AVG`   | `mean`  |
| 5  | `COUNT` | `length` (세로) |
| 6  | -       | `table` (가로) |

---

#### **😊 기본 예제**

✅ **예제 1**: 사원 테이블에서 최대 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT MAX(sal)
FROM emp;
```

✅ **R 코드**
```r

```

✅ **예제 2**: 직업이 `SALESMAN`인 사원들의 최대 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT MAX(sal)
FROM emp
WHERE job = 'SALESMAN';
```

✅ **R 코드**
```r

```

✅ **예제 3**: 부서번호별 최대 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;
```

✅ **R 코드**
```r

```

✅ **설명**: `aggregate(값 컬럼명 ~ 그룹핑할 컬럼명, 테이블명, 그룹 함수)`를 사용합니다.

---

#### **😊 실습 문제**

**문제 1**: 직업별 총 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT job, SUM(sal)
FROM emp
GROUP BY job;
```

✅ **R 코드**
```r

```
