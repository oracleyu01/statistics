# 🎯예제25. R에서의 그룹함수 sum 을 알아야해요

#➡️ 문법1. 직업, 직업별 토탈월급을 출력하시오 !

SQL> select  job, sum(sal)
from  emp
group  by   job;

R>
  
  

#➡️문법2. 직업, 직업별 토탈월급을 가로로 출력하시오 !

SQL> select sum( decode(job, 'ANALYST', sal, null )  ) as  "ANALYST", 
            sum( decode(job, 'CLERK', sal, null )  ) as  "CLERK", 
            sum( decode(job, 'MANAGER', sal, null )  ) as  "MANAGER", 
            sum( decode(job, 'SALESMAN', sal, null )  ) as  "SALESMAN", 
            sum( decode(job, 'PRESIDENT', sal, null )  ) as  "PRESIDENT", 
       from  emp; 

R> 

# 설명: tapply( 값 컬럼, 그룹핑할 컬럼, 그룹함수)

# ➡️ 문법3.  위의 결과를 원형 그래프로 시각화 하시오 !

  
  
  
  
  
# 설명: \n 이 뜻이 줄바꿈(엔터)입니다. 

# 😄문제1. 부서번호, 부서번호별 토탈월급을 가로로 출력하시오 !

  
  
# 😄문제2. 위의 결과를 원형 그래프로 시각화 하시오 !

  
