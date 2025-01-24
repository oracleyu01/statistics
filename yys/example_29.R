# 🎯 예제29. R에서의 outer join 을 알아야해요

# ➡️문법1. 아래의 아우터 조인 SQL을 R 로 구현하시오 !

# SQL> select  e.ename,  d.loc
#       from  emp  e,  dept   d
#       where  e.deptno (+) = d.deptno ; 

R> 
        
        

# 설명: all.y=T 는 dept 테이블 쪽에 데이터가 모두 나오게 해라 !



# 😊 문제1. 아래의 SQL의 결과를 R 로 구현하시오 !

# SQL> select  e.ename, d.loc
#            from   emp   e,   dept   d
#            where  e.deptno = d.deptno (+);

R>
             
             

# 😊문제2.  아래의 SQL을 R 로 구현하시오 !
# 
# SQL> select  e.ename, d.loc
#         from   emp   e   full  outer  join   dept   d
#         on ( e.deptno = d.deptno );

R>  
              
              
