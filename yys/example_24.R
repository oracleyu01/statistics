# 🎯 예제24. R에서의 그룹함수 length 를 알야해요

# ➡️ 문법1. 직업, 직업별 인원수를 출력하시오 !

SQL> select  job, count(*)
      from  emp
      group  by  job; 

R> 


# ➡️ 문법2. 직업과 직업별 인원수를 가로로 출력하시오 !

SQL> select count( decode( job, 'ANALYST', empno, 1, null)  ) as "ANALYST",
            count( decode( job, 'CLERK', empno, 1, null)  ) as "CLERK",
            count( decode( job, 'MANAGER', empno, 1, null)  ) as "MANAGER",
            count( decode( job, 'SALESMAN', empno, 1, null)  ) as "SALESMAN"
          from  emp;

R>
  
  

# ➡️문법3. SQL과는 다르게 R은 데이터 시각화로 데이터를 한번에 
#          쉽게 파악이 가능합니다. 직업과 직업별 인원수를 원형 그래프로
#          시각화 하시오 !

            
            
# ➡️문법4. 위의 색깔이 촌스러우므로 다른 색깔로 변경하시오 !

            
# ※ table 함수와 원형 그래프를 그리는 pie 함수는 서로 짝꿍입니다.

          
# 😄 문제. 부서번호, 부서번호별 인원수를 원형 그래프로 시각화 하시오 !
#   
