### 🎯 예제 26: R에서의 그룹 함수 `mean` 알아보기 💡

---

#### **😊 기본 예제**

✅ **예제 1**: 직업별 평균 월급을 출력하시오. (세로 출력)

✅ **SQL 코드**
```sql
SELECT job, AVG(sal)
FROM emp
GROUP BY job;
```

✅ **R 코드**
```r

```

✅ **예제 2**: 위의 결과에서 소수점 이하를 반올림하여 출력하시오.

✅ **R 코드**
```r

```

✅ **예제 3**: 직업별 평균 월급을 가로로 출력하시오.

✅ **SQL 코드**
```sql
SELECT ROUND(AVG(DECODE(job, 'ANALYST', sal, NULL))) AS "ANALYST", 
       ROUND(AVG(DECODE(job, 'CLERK', sal, NULL))) AS "CLERK", 
       ROUND(AVG(DECODE(job, 'MANAGER', sal, NULL))) AS "MANAGER", 
       ROUND(AVG(DECODE(job, 'SALESMAN', sal, NULL))) AS "SALESMAN", 
       ROUND(AVG(DECODE(job, 'PRESIDENT', sal, NULL))) AS "PRESIDENT"
FROM emp;
```

✅ **R 코드**
```r

```

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT TO_CHAR(hiredate, 'RRRR'), ROUND(AVG(sal))
FROM emp
GROUP BY TO_CHAR(hiredate, 'RRRR')
ORDER BY 1 ASC;
```

✅ **R 코드**
```r

```

**문제 2**: 위의 코드를 수정하여 아래의 SQL을 R 코드로 구현하시오.

✅ **SQL 코드**
```sql
SELECT TO_CHAR(hiredate, 'RRRR') AS 입사년도, COUNT(*) AS 인원수
FROM emp
GROUP BY TO_CHAR(hiredate, 'RRRR')
ORDER BY 1 ASC;
```

✅ **R 코드**
```r

```

**문제 3**: 위의 결과를 라인 그래프로 시각화하시오.

✅ **R 코드**
```r

```
