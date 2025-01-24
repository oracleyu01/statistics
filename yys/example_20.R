# 🎯 ▣ 예제20. R에서의 데이터 변환함수를 알아야 해요
 
# ➡️     SQL          vs              R 

# 1.   to_char                     as.character, format
# 2.   to_number                as.integer
# 3.   to_date                    as.Date 

#➡️ 이름과 입사한 요일을 출력하시오 !
 
# SQL> select  ename, to_char( hiredate, 'day')
#      from  emp;



# 설명: format( 특정날짜, 옵션) 

# 옵션의 종류 : 
# %A : 요일
# %Y : 년도 4자리
# %y : 년도 2자리
# %m : 달
# %d  : 일
 
# 😄문제1. 내가 무슨요일에 태어났는지 출력하시오 !
  
SQL> select  to_char( to_date('1999/11/17', 'RRRR/MM/DD'), 'day')
      from  dual;



# 😄 문제2. 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오 !
  
SQL>  select  ename, hiredate
from  emp
where  to_char(hiredate,'RRRR') ='1981';



