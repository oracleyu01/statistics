
# 🎯예제19. R에서 날짜 연산을 하려면 반드시 날짜형으로 변환을 해야해요 !
  
#➡️ emp 데이터 프레임의 hiredate 가 어떤 데이터 유형인지 확인을 해보세요 !
  



  
# 설명:  csv 파일의 데이터를 불러와서 데이터 프레임을 구성하게 되면
#        R 이던 파이썬던 둘다 날짜형이 아니라 문자형으로 만들어집니다.

#➡️ 날짜함수를 SQL 과 비교하기 
 
#               SQL                vs               R  
# 
# 1.          sysdate                           Sys.Date()
# 2.          months_between                    difftime
# 3.          add_months                       lubridate 패키지를 이용
# 4.          last_day                         lubridate 패키지를 이용
# 5.          next_day                         lubridate 패키지를 이용

#😄 문제1.  R 에서 오늘 날짜를 출력하시오 !
  


#😄문제2.  아래의 SQL을 R 로 구현하시오 !  
#   
# 이름, 입사한 날짜부터 오늘까지 총 몇일 근무했는지 출력하시오 !
  
SQL> select  ename, sysdate - hiredate
      from  emp;



# 문자를 날짜로 변환해줘야합니다.

# emp 데이터 프레임에 hire_date 라는 새로운 변수가 생성이 됩니다. 




# 문제3. difftime 함수를 이용해서 입사한 날짜부터 오늘까지 
# 총 근무 일수를 출력하시오! 이름과 근무일수를 출력하시오 ! 
  
# 문법:   difftime( 날짜2, 날짜1 ) ?  날짜1  ~ 날짜2 까지의 일수를 출력
  


