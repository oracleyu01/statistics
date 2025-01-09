# 
# 🎯예제32. R 에서의 서브쿼리는 이렇게 작성하면 되요
# 
# ➡️  SQL 의 서브쿼리의 종류 3가지 ?
# 
# 1. single  row  subquery  :  서브쿼리에서 메인 쿼리로 하나의 값이 리턴되는 경우
# 2. multiple  row  subquery : 서브쿼리에서 메인 쿼리로 여러개의 값이 리턴되는 경우
# 3. multiple  column subquery  : 서브쿼리에서 메인쿼리로 여러개의 컬럼값들이
# 리턴되는 경우
# 
# ➡️  문법1. 아래의 SQL을 R 로 구현하시오 !
# 
# SQL>  select  ename, sal
# from  emp
# where  sal >  (  select  sal 
#                from  emp
#                where  ename='JONES');
# 
# R>
# 
# 
# 😊 문제1.  아래의 SQL을 R 로 구현하시오 !
# 
# SQL> select  ename, sal
# from emp
# where  sal =  ( select  max(sal)
#               from   emp );
# 
# R>
# 
# 
# ➡️문법2.  아래의 SQL을 R 로 구현하시오 !
# 
# SQL> select  ename, sal, deptno
# from  emp
# where deptno  in  ( select  deptno
#                   from  emp
#                   where  job='SALESMAN' );
# 
# R>  
# 
# 
# 
# 😊문제2. 아래의 SQL을 R 로 구현하시오 !  ( 관리자인 사원들의 이름을 출력 )
# 
# SQL>  select  ename
# from  emp
# where  empno  in   ( select  mgr
#                    from  emp );  
# 
# R> 
# 
# 
# 
# 
# 😊 문제3.  전국에서 등록금이 가장 비싼 학교이름, 등록금을
# 출력하여 제출하시오 !
# 
# 데이터 있는곳 : https://cafe.daum.net/oracleoracle/Soei/29
# 
# 답:
# 
# 
# ➡️ 문법3.  아래의 SQL을 R 로 구현하시오 !
# 
# SQL> select ename, sal, job
# from  emp
# where  deptno  in  ( select  deptno
#                    from  emp
#                    where comm  is  not  null  )
# and   job   in  ( select   job
#                 from emp
#                 where  comm  is  not  null  ); 
# 
# R> 
# 
# 
# 
# 😊문제4.  아래의 SQL을 R 로 구현하시오 !
# (관리자가 아닌 사원들의 이름과 월급 출력)
# 
# SQL> select  ename, sal
# from  emp
# where   empno   not    in   ( select   mgr
#                             from  emp
#                             where  mgr  is  not  null ); 
# 
# R> 
# 
# 
# 
