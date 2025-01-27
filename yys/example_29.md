### 🎯 예제 29: R에서 `OUTER JOIN` 사용법 💡

---

#### **😊 SQL vs R JOIN 비교**

| 번호 | SQL JOIN 유형     | R 대응 함수        |
|----|----------------|-----------------|
| 1  | `EQUI JOIN`    | `merge()`       |
| 2  | `NON-EQUI JOIN` | -               |
| 3  | `OUTER JOIN`   | `merge(all=TRUE)` |
| 4  | `SELF JOIN`    | -               |

---

#### **😊 기본 예제**

✅ **예제 1**: 아래의 `OUTER JOIN` SQL을 R로 구현하시오.

✅ **SQL 코드**
```sql
SELECT e.ename, d.loc
FROM emp e, dept d
WHERE e.deptno (+) = d.deptno;
```

✅ **R 코드**
```r


```

📌 **설명**: `all.y=TRUE`는 `dept` 테이블 쪽의 데이터가 모두 나오도록 설정합니다.

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT e.ename, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno (+);
```

✅ **R 코드**
```r


```

**문제 2**: 아래의 `FULL OUTER JOIN` SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT e.ename, d.loc
FROM emp e FULL OUTER JOIN dept d
ON (e.deptno = d.deptno);
```

✅ **R 코드**
```r


```
