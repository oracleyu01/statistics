# 🎯 예제28. R에서의 equi join 을 알아야해요 
# 
#           SQL              vs             R
# 
#        equi  join
#       non  equi join                   merge 
#       outer  join
#       self   join  

# ➡️문법1.  dept.csv 를 내려받아 dept 데이터 프레임을 생성하시오 

dept <- read.csv("dept.csv", header=T)
dept

# ➡️문법2.  이름과 부서위치를 출력하시오 !

SQL> select  e.ename, d.loc
            from  emp  e,  dept   d
            where  e.deptno = d.deptno ;

R>  x <- merge( emp,  dept , by="deptno") 

      x[      , c("ename", "loc") ]

# 😊 문제1. DALLAS 에서 근무하는 사원들의 이름과 월급과 부서위치를 
#           출력하시오 !


R> 
        
        

# 😊 문제2. 커미션이 null 인 사원들의 이름과 부서위치와 커미션을 
#           출력하시오 !

R>  
        
        
