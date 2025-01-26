### 🎯 예제 24: R에서의 그룹 함수 `length` 알아보기 💡

---

#### **😊 기본 예제**

✅ **예제 1**: 직업별 인원수를 출력하시오.

✅ **SQL 코드**
```sql
SELECT job, COUNT(*)
FROM emp
GROUP BY job;
```

✅ **R 코드**
```r

```

✅ **예제 2**: 직업과 직업별 인원수를 가로로 출력하시오.

✅ **SQL 코드**
```sql
SELECT COUNT(DECODE(job, 'ANALYST', empno, 1, NULL)) AS "ANALYST",
       COUNT(DECODE(job, 'CLERK', empno, 1, NULL)) AS "CLERK",
       COUNT(DECODE(job, 'MANAGER', empno, 1, NULL)) AS "MANAGER",
       COUNT(DECODE(job, 'SALESMAN', empno, 1, NULL)) AS "SALESMAN"
FROM emp;
```

✅ **R 코드**
```r

```

---

#### **😊 데이터 시각화**

✅ **예제 3**: 직업별 인원수를 원형 그래프로 시각화하시오.

✅ **R 코드**
```r

```

✅ **예제 4**: 위의 원형 그래프에서 색상을 변경하시오.

✅ **R 코드**
```r

```

📌 **참고**: `table` 함수와 `pie` 함수는 함께 사용됩니다.

---

#### **😊 실습 문제**

**문제 1**: 부서번호별 인원수를 원형 그래프로 시각화하시오.

✅ **R 코드**
```r

```
