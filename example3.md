# 예제 3: SQL과 R의 차이점

## 1. R의 주요 특징
- **데이터 시각화**: R은 데이터 분석 결과를 다양한 형태의 그래프로 시각화할 수 있습니다.
- **코드 단순화**: R은 복잡한 SQL 코드를 간단하게 변환하여 작성할 수 있습니다.
- **강력한 데이터 분석 패키지**: R에는 데이터 분석에 유용한 패키지들이 많이 있습니다.

---

## 2. 예제 비교: SQL vs R

### SQL 코드
```sql
SELECT job, 
       SUM(DECODE(deptno, 10, sal, NULL)) AS "10",
       SUM(DECODE(deptno, 20, sal, NULL)) AS "20",
       SUM(DECODE(deptno, 30, sal, NULL)) AS "30"
FROM emp
GROUP BY job;
