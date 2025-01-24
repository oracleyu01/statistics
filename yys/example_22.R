# 🎯 예제22. R에서의 그룹함수 max 를 알아야해요
# 
#   SQL               vs                R  
#   
#   max                                 max
#   min                                 min
#   sum                                sum
#   avg                                 mean
#   count                              length (세로)
#   table (가로)
# 
# ➡️ 문법1:  사원 테이블에서 최대월급을 출력하시오 !

SQL>  select  max(sal)
        from  emp;

R> 
  

#➡️ 문법2: 직업이 SALESMAN 인 사원들의 최대월급을 출력하시오 !

SQL>  select  max(sal)
        from  emp
        where  job='SALESMAN';

R>  
  
  
  
#➡️ 문법3. 부서번호, 부서번호별 최대월급을 출력하시오 !

SQL>  select  deptno,  max(sal)
        from  emp
        group   by  deptno ;

R>
  

# ➡️ 설명:  
#    aggregate( 값 컬럼명 ~ 그룹핑할 컬럼명, 테이블명, 그룹함수 )

          

# 😄 문제1. 직업, 직업별 토탈월급을 출력하시오 !
  
SQL> select  job, sum(sal)
from  emp
group  by  job;

R> 
