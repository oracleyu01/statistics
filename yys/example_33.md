### 🎯 예제 33: R에서 `순위 출력` 사용법 💡

---

#### **😊 SQL vs R 순위 함수 비교**

| 번호 | SQL 함수  | R 대응 함수  |
|----|---------|---------|
| 1  | `RANK()`  | `rank()` |

---

#### **😊 기본 예제**

✅ **예제 1**: 이름과 월급, 월급에 대한 순위를 출력하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) AS 순위
FROM emp;
```

✅ **R 코드**
```r

```

📌 **설명**:
- `rank(-emp$sal, ties.method="min")`: 높은 월급부터 순위를 부여하려면 음수(`-`)를 붙여야 함

✅ **`ties.method` 옵션**
| 번호 | 옵션  | 설명 |
|----|------|------|
| 1  | `min` | 오라클 `RANK()`와 동일 (동순위는 같은 값) |
| 2  | `max` | 동순위가 존재하면 다음 순위는 건너뜀 |
| 3  | `first` | 동순위가 존재하면 먼저 나온 데이터를 높은 순위로 부여 |

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) AS 순위
FROM emp
WHERE job='SALESMAN';
```

✅ **R 코드**
```r

```

---

✅ **예제 2**: `DENSE_RANK()`를 R로 구현하시오.

✅ **SQL 코드**
```sql
SELECT ename, sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS 순위
FROM emp;
```

✅ **R 코드**
```r

```

📌 **설명**:
- `dense_rank()`는 동일 순위가 존재해도 다음 순위를 건너뛰지 않음

**문제 2**: `emp20.csv`를 읽어와 `emp20` 데이터 프레임을 생성하고, `DENSE_RANK()`를 이용하여 이름과 나이, 나이의 순위를 출력하시오.

✅ **R 코드**
```r

```
