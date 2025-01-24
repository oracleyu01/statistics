# 🎯예제33. R 에서의 순위 출력을 알아야해요
# 
# SQL               vs            R  
# 
# rank                           rank 
# 
# ➡️문법1.  이름과 월급, 월급에 대한 순위를 출력하시오 !
# 
# SQL> select  ename, sal, rank()  over ( order by sal desc) 순위
# from emp;
# 
# R> 
# 
# 
# 
# 설명: rank( -emp$sal, ties.method="min") 여기서 마이너스(-) 를 써야 
# 월급이 높은 사원부터 순위를 부여합니다. 
# 
# ➡️ ※ ties.method 의 옵션 ?   
# 
# 1. min :  오라클의 rank 함수와 똑같습니다. 
# 2. max :   2등이 두명이면 둘다 3등으로 출력합니다.
# 3. first :  오라클의 rank 와 같은데 순위가 같은 데이터 있으면
# 인덱스 순서가 먼저 나온 데이터를 높은 순위로 부여합니다.
# 
# 😊문제1.   아래의 SQL을 R 로 구현하시오 !
# 
# SQL> select  ename, sal,  rank()  over ( order  by  sal  desc  ) 순위
# from  emp
# where  job='SALESMAN';
# 
# R>
# 
# 
# 
# 
# 
# ➡️ 문법2. 오라클의 dense_rank 를 R 로 구현하시오.
# 
# SQL> select  ename, sal, dense_rank()  over  ( order  by  sal  desc )  순위
# from   emp;
# 
# ※  dense_rank는 2등이 두명이면 그 다음 등수가 바로 3등이 나오는 함수입니다.
# 
# R> 
# 
# 😊 문제2.  emp20.csv 로 emp20 데이터 프레임을 구성하고 이름과 나이와 나이의 
# 순위를 출력하는데 dense_rank() 함수를 이용해서 순위를 출력하시오!
# 
# 
# 
# 
