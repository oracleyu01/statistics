### 🎯 예제 30: R에서 `SELF JOIN` 사용법 💡

---

#### **😊 기본 예제**

✅ **예제 1**: 아래의 `SELF JOIN` SQL을 R로 구현하시오.

✅ **SQL 코드**
```sql
SELECT 사원.ename, 관리자.ename
FROM emp 사원, emp 관리자
WHERE 사원.mgr = 관리자.empno;
```

✅ **R 코드**
```r
x <- merge(emp, emp, by.x="mgr", by.y="empno", suffixes=c(".사원", ".관리자"))
x[, c("ename.사원", "ename.관리자")]
```

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT 사원.ename, 관리자.ename
FROM emp 사원, emp 관리자
WHERE 사원.mgr = 관리자.empno AND 사원.sal > 관리자.sal;
```

✅ **R 코드**
```r
x <- merge(emp, emp, by.x="mgr", by.y="empno", suffixes=c(".사원", ".관리자"))
x <- x[x$sal.사원 > x$sal.관리자, ]
x[, c("ename.사원", "ename.관리자")]
```

**문제 2**: 위의 결과 데이터를 조직도로 시각화하시오.
```r

```

**문제 3**: `googleVis`를 이용해 조직도를 시각화하시오.
```r

```

📌 **설명**:
- `width=600`: 조직도 그래프의 너비를 600 픽셀로 설정
- `height=250`: 조직도 그래프의 높이를 250 픽셀로 설정
- `size='middle'`: 조직도 노드 크기를 중간 크기로 지정 (가능한 값: `small`, `large`)
- `allowCollapse=T`: 클릭하여 하위 노드를 숨기거나 표시할 수 있도록 허용

---

#### **😊 추가 실습 문제**

**문제 4**: 부서 위치별 총 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT d.loc, SUM(e.sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.loc;
```

✅ **R 코드** (세로 출력)
```r

```

✅ **R 코드** (가로 출력)
```r

```

📌 **설명**:
- `na.action` 기본값은 `na.omit`, 즉 `NA` 값을 포함하는 행을 제거합니다.
- `na.pass`는 `NA` 값을 그대로 유지하도록 설정합니다.

**문제 5**: 위의 결과를 막대 그래프로 시각화하시오.
```r

```
