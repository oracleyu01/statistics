
#🎯 예제16. SQL의 replace 함수를 R로 구현하는 방법을 알아야해요!
  
# ➡️ 오라클 SQL의 replace 함수와 같은 함수 입니다.
  
SQL>  select ename, replace( sal, 0, '*')
        from   emp;




# 설명: gsub( 변경전 데이터, 변경후 데이터, 컬럼)
 
# 😄 문제1. 아래의 SQL을 R 로 구현하시오 ! (카카오 뱅크 데이터 분석가 공석빈 제공)
# 
# select  ename, regexp_replace( sal, '[0-2]', '*')
#   from   emp;




# 설명: 정규 표현식은 SQL, R, 파이썬, 리눅스 쉘, 자바 모두 공통 입니다. 
