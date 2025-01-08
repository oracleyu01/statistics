# 🎯 예제30. R에서의 self join 을 알아야해요

# ➡️문법1. 아래의 SQL을 R 로 구현하시오 !

# SQL> select  사원.ename, 관리자.ename
#       from  emp  사원, emp  관리자
#       where  사원.mgr  = 관리자.empno; 

R>  
        
        
# 😄 문제1. 아래의 SQL을 R 로 구현하시오 !

# SQL> select  사원.ename, 관리자.ename
#       from  emp  사원, emp  관리자
#       where  사원.mgr  = 관리자.empno  and  사원.sal > 관리자.sal ;

R> 
            

# 😄 문제2. 문제1번의 결과 데이터를 이해하기 좋도록 시각화 하시오 !
#          사원 이름과 직속상사의 이름을 가지고 사원 테이블의 
#          조직도를 그리시오 !

           
           

# 😄 문제3.  위의 그래프를 구글의 googleVis 를 이용해서 시각화 하시오 !

           
           
# 설명: 
# width=600 :  조직도 그래프의 너비를 600 픽셀로 지정
# height=250 : 조직도 그래프의 높이를 250 픽셀로 지정
# size='middle'  : 조직도 그래프의 노드의 크기를 중간으로 지정 
#                  (small, large)
# allowCollapse=T : 조직도 그래프에서 노드를 클릭하여 
#                   해당 하위노드를 숨기거나 표시할 수 있게 허용하겠다. 

# 😄 문제4. 부서위치, 부서위치별 토탈월급을 출력하시오 ! 

# SQL> select  d.loc, sum(e.sal)
#       from  emp  e,  dept   d
#       where  e.deptno = d.deptno 
#       group  by  d.loc; 

# - 세로 출력: 
# R> 
        
        
# na.action 에 대한 기본값은 na.omit 인데 
# 이는 NA 값을 포함하는 행을 제외합니다.
# na.pass 는 NA값을 그대로 유지하도록 합니다. 

# - 가로 출력: 
  
R> 

# 😄 문제5. 위의 결과를 막대 그래프로 시각화 하시오 !
