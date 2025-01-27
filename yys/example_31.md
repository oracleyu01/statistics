### 🎯 예제 31: R에서 `집합 연산자` 사용법 💡

---

#### **😊 SQL vs R 집합 연산 비교**

| 번호 | SQL 연산자      | R 대응 함수         |
|----|---------------|-----------------|
| 1  | `UNION ALL`   | `rbind`         |
| 2  | `UNION`       | `rbind + unique` |
| 3  | `INTERSECT`   | `intersect`     |
| 4  | `MINUS`       | `setdiff` (dplyr) |

📌 **설명**:
- `rbind()`: 두 개의 결과 집합을 위아래로 결합
- `cbind()`: 두 개의 결과 집합을 양옆으로 결합
- `setdiff()`는 `dplyr` 패키지의 함수를 사용해야 함

---

#### **😊 기본 예제**

✅ **예제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (10, 20)
UNION ALL
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 20;
```

✅ **R 코드**
```r



```

✅ **설명**: `rbind(x1, x2)`는 두 데이터프레임을 위아래로 결합하는 함수입니다.

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT deptno, SUM(sal)
FROM emp
GROUP BY ROLLUP(deptno);
```

✅ **R 코드**
```r

```

**문제 2**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT job, SUM(sal)
FROM emp
GROUP BY CUBE(job);
```

✅ **R 코드**
```r

```

✅ **예제 2**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (10, 20)
UNION
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 10;
```

✅ **R 코드**
```r



```

✅ **설명**: `unique()`를 추가하여 중복을 제거함

---

✅ **예제 3**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (10, 20)
MINUS
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 10;
```

✅ **R 코드**
```r



```

✅ **설명**: `setdiff()`는 `dplyr` 패키지를 사용해야 함

---

**문제 3**: `emp2.csv`에는 존재하지만 `emp.csv`에는 없는 데이터를 출력하시오.

✅ **R 코드**
```r



```

✅ **예제 4**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (10, 20)
INTERSECT
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 10;
```

✅ **R 코드**
```r



```

✅ **설명**: `intersect()`를 사용하여 교집합을 구함

---

#### **😊 추가 실습 문제**

**문제 4**: `emp.csv`와 `emp2.csv` 파일의 교집합 데이터를 찾으시오.
```r


```

**문제 5**: `emp.csv`와 `emp2.csv` 파일의 교집합 개수를 출력하시오.
```r


```

📌 **설명**:
- `nrow()`: 데이터 프레임의 행 개수를 반환
- `ncol()`: 데이터 프레임의 컬럼 개수를 반환
- `length(emp$empno)`: 특정 컬럼의 개수를 구할 때 사용
