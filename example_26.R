# 🎯예제26. R에서의 그룹함수 mean 을 알아야해요
  
# ➡️문법1. 직업, 직업별 평균월급을 출력하시오 ! (세로출력)
  



# ➡️문법2. 위의 결과에서 소수점이하는 안나오게 반올림하시오 ! 


  
  
# ➡️문법3. 직업, 직업별 평균월급을 출력하는데 가로로 출력하시오 !


  
  

# 😊 문제1. 아래의 SQL을 R 로 구현하시오 

SQL> select  to_char(hiredate, 'RRRR'), round(avg(sal))
        from  emp
        group  by   to_char(hiredate,'RRRR')
        order  by    1  asc; 

R>
 
          
          
# 😄 문제2. 위의 코드를 좀 수정해서 아래의 SQL을 R 코드로 작성하시오 !
  
SQL> select  to_char(hiredate, 'RRRR') as 입사년도, count(*)  인원수
        from  emp
        group  by  to_char(hiredate,'RRRR')
        order  by  1  asc; 

R>
  
          
          

# 😄 문제3. 위의 결과를 라인 그래프로 시각화 하시오 !
  
          
          
          
          
