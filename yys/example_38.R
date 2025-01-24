# 🎯 예제38. 데이터 시각화2 ( 원형 그래프)
# 
# ➡️  문법1. R 내장 함수를 이용해서 원형 그래프 그리기 !
# 
# emp <- read.csv("emp.csv", header=T)
# 
# job_cnt <- table(emp$job)
# 
# pie( job_cnt, 
#    main="직업별 빈도 원형 그래프" ,
#    col=rainbow( length(job_cnt) ),
#    labels= paste(names(job_cnt), "\n", job_cnt ) )
# 
# # 위의 색깔이 촌스러우므로 다른 색깔로 변경하시오 !
# 
# job_cnt <- table(emp$job)
# 
# colors <- c("skyblue", "coral", "seagreen", "gold", "orchid")
# 
# pie( job_cnt, 
#    main="직업별 빈도 원형 그래프" ,
#    col= colors,
#    labels= paste(names(job_cnt), "\n", job_cnt ) )
# 
# ➡️  문법2.  plotly 시각화 패키지로 원형 그래프 그리기 
# 
# 원형 그래프는 데이터간의 비율을 한눈에 파악할 때 유용한 그래프 입니다.
# 
# 
# 
# 
# 
# 설명: plotly 를 이용하면 더 세련된 그래프를 그릴 수 있고 홈페이지에 그래프 넣을때
#       아주 편합니다. 
# 
# 😊문제1. 중고차의 모델별 건수를 가지고 다음과 같이 원형 그래프를 그리시오 !
#            usedcars.csv 를 불러와서 그리세요 ! 
# 
# 
# 
# 
# 

