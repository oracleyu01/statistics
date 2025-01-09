
🎯예제32. R 에서의 집합 연산자를 알아야해요

       SQL              vs               R 

    union  all                          rbind
    union                               rbind + unique
    intersect                           intersect
    minus                              setdiff

※  rbind 는 두개의 결과 집합을 위아래로 출력하고 싶을 때 사용하는 함수
    cbind 는 두개의 결과 집합을 양옆으로 출력하고 싶을 때 사용하는 함수 

※ setdiff 의 경우 R 에 내장된 setdiff 를 사용하면 안되고
   dplyr 패키지의 setdiff 함수를 사용해야합니다.

➡️ 문법1.  아래의 SQL의 결과를 R 로 구현하시오 !

SQL>  select  ename, sal, deptno
           from  emp
           where  deptno  in  ( 10 , 20 )
         union  all
         select  ename, sal, deptno
           from  emp
           where deptno = 20; 

R> 



설명: rbind(x1, x2) 는 x1의 결과와 x2 의 결과를 위아래로 출력하겠다는 뜻입니다.

😄문제.  아래의 SQL을 R 로 구현하시오 !

SQL>  select  deptno, sum(sal)
           from  emp
           group  by  rollup(deptno);

답:  




😄문제.  아래의 SQL의 결과를 R 로 구현하시오 !

SQL> select  job,  sum(sal)
          from  emp
          group  by  cube(job);

답: 




➡️ 문법2.  아래의 SQL의 결과를 R 로 구현하시오 !

SQL> select  ename, sal, deptno
          from emp
          where deptno  in  ( 10, 20 )
        union
        select  ename, sal, deptno
          from  emp
         where deptno = 10;

※ union 은 union all 과 다르게 중복된 행을 제거해서 출력합니다.

R>  




➡️ 문법3.  아래의 SQL을 R 로 구현하시오 !

SQL>  select   ename, sal, deptno
          from  emp
          where deptno  in  ( 10, 20 )
         minus
         select  ename, sal, deptno
           from  emp
          where deptno = 10;

R>  




※  setdiff 함수가 이름이 중복되어 있습니다.
    내장 함수 setdiff 도 있고 dplyr  패키지의 setdiff 도 있습니다.
    그런데 dplyr 의 setdiff 를 쓰기 위해서 library(dplyr) 를 해주면
    내장 함수를 불러오지 않고 dplyr 패키지의 setdiff 를 불러옵니다.


😄문제. emp2.csv 에는 존재하는데 emp.csv 에는 존재하지 않는 데이터가 무엇인지
          출력하시오 !

emp2.csv 데이터 있는곳 : https://cafe.daum.net/oracleoracle/Soei/28

답:
emp2 <- read.csv("emp2.csv", header=T)

library(dplyr)

#1. emp2 에는 있는데 emp 에 없는것 찾을 때

setdiff(emp2, emp)

<--- jack 이 나옵니다.

#2. emp 에는 있는데 emp2 에는 없는거 찾을 때

setdiff(emp, emp2)

<-- 아무것도 안나옵니다. 

➡️ 문법4.  아래의 SQL을 R 로 구현하시오 !

SQL>  select   ename, sal, deptno
          from  emp
          where deptno  in  ( 10, 20 )
         intersect
         select  ename, sal, deptno
           from  emp
          where deptno = 10;

R>  




😄문제. emp.csv 와 emp2.csv  파일의 교집합 데이터를 찾으시오 !




😄문제. emp.csv 와 emp2.csv 와의 교집합의 갯수를 출력하시오!


※ nrow 함수 : 데이터 프레임의 건수를 세는 함수
   ncol  함수 :  데이터 프레임의 컬럼수를 세는 함수

  컬럼 하나의 갯수를 구할 때는 length 를 쓰고 
  데이터 프레임의 전체 건수를 구할 때는 nrow 를 씁니다.

  예: length(emp$empno)

