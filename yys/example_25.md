### 🎯 예제 25: R에서의 그룹 함수 `sum` 알아보기 💡

---

#### **😊 기본 예제**

✅ **예제 1**: 직업별 총 월급을 출력하시오.

✅ **SQL 코드**
```sql
SELECT job, SUM(sal)
FROM emp
GROUP BY job;
```

✅ **R 코드**
```r

```

✅ **예제 2**: 직업별 총 월급을 가로로 출력하시오.

✅ **SQL 코드**
```sql
SELECT SUM(DECODE(job, 'ANALYST', sal, NULL)) AS "ANALYST", 
       SUM(DECODE(job, 'CLERK', sal, NULL)) AS "CLERK", 
       SUM(DECODE(job, 'MANAGER', sal, NULL)) AS "MANAGER", 
       SUM(DECODE(job, 'SALESMAN', sal, NULL)) AS "SALESMAN", 
       SUM(DECODE(job, 'PRESIDENT', sal, NULL)) AS "PRESIDENT"
FROM emp;
```

✅ **R 코드**
```r

```

📌 **설명**: `tapply(값 컬럼, 그룹핑할 컬럼, 그룹 함수)`를 사용하여 그룹 연산을 수행합니다.

---

#### **😊 데이터 시각화**

✅ **예제 3**: 위의 결과를 원형 그래프로 시각화하시오.

✅ **R 코드**
```r

```

📌 **참고**: `\n`은 줄바꿈(엔터)을 의미합니다.

---

#### **😊 실습 문제**

**문제 1**: 부서번호별 총 월급을 가로로 출력하시오.

✅ **R 코드**
```r

```

**문제 2**: 위의 결과를 원형 그래프로 시각화하시오.

✅ **R 코드**
```r

```
