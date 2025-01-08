

# 🎯 예제21. R에서의 일반함수를 알아야 해요
# 
#        Oracle          vs        R 
# 1.      nvl                     ifelse
# 2.     decode                ifelse
# 3.     case                    ifelse                         

#➡️문법:  이름과 커미션을 출력하는데 커미션이 null 인 사원들은 0 으로 출력하시오

SQL>  select  ename, nvl( comm, 0 )
from   emp;



#➡️설명: ifelse( 조건,  바꿀값, 기본값 )
# is.na(emp$comm)은 커미션이 null 이면 True 이고 아니면 false 입니다. 
# 조건이 True 면 바꿀값을 출력하고 False 면 기본값을 출력해라 !
#   
#😄 문제.  tatanic2.csv 를 가지고 tat 라는 데이터 프레임을 만드시오 !
  
  

#😄 문제.  age2 라는 컬럼(변수)을 생성하는데 tat 의 age 컬럼으로 데이터를
# 만들고 결측치는 31 로 채워넣어서 만드시오 !



# 😄문제. 이름, 부서번호, 보너스를 출력하는데 부서번호가 10번이면 5000 을 출력하고
# 그렇지 않고 20번이면 4000 을 출력하고 나머지 부서번호는 0 을 출력하시오!
#   
#   SQL> select  ename, deptno, decode( deptno, 10, 5000, 
#                                       20, 4000, 0 ) 보너스
#         from  emp;


# 😄문제. 이름, 월급, 등급을 출력하는데 월급이 3000 이상이면 A 등급을 출력하고
# 2000 이상이고 300 보다 작으면 B 를 출력하고 나머지는 C를 출력하시오!
  
# SQL> select  ename, sal, case  when  sal >= 3000  then  'A'
# when  sal >= 2000  then  'B'
# else  'C'  end  등급 
# from  emp ;
 
# R> 
 
# 😄문제.  tat 데이터 프레임에 women_child 파생변수를 추가하는데 
# 성별이 여자이거나 나이가 12이하면 1로 값을 만들고 아니면 0으로 값을 
# 만드시오




