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
R 코드
r
코드 복사
attach(emp)

# 그룹별 합계 계산
tapply(sal, list(job, deptno), sum)

# 급여 데이터 시각화
pie(emp$sal, col = rainbow(14))
3. 요약
SQL은 데이터의 집계와 정렬에 강점이 있으며, 구조화된 데이터를 처리하는 데 적합합니다.
R은 데이터 분석과 시각화에 탁월하며, 코드가 간결하고 효율적입니다.
