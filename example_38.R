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
# 😊문제2.  데이터 시각화를 빠르게 하기 위해 모아놓은 활용 코드를 빠르게
#             불러올 수 있게 하는 swith 함수 사용법을 연습니다.
# 
# 
# 
# 
# 😊문제3.  bar_plot.R 이라는 이름으로 여러분들이 빨리 가져다 쓸 수 있는
#            막대 그래프 그리는 코드를 c:\\data 밑에 저장하시오 !
# 
# 
# 
# 
# 😊문제4.  bar_plot.R 스크립트를 화면에 출력하게 하시오 !
# 
# cat( readLines("bar_plot.R"), sep = "\n")
# 
# 설명:  readLines 함수로 bar_plot.R 을 불러오고 cat 으로 화면에 코드를 출력하는데
#       sep="\n" 으로 라인과 라인은 엔터로 구분해서 출력하겠다라고 합니다. 
# 
# 😊 문제5  특급 데이터 분석가 코드처럼 시각화 코드 모음을 불러오는 코드에
#             스크립트를 추가하시오 !
# 
# yys.R 스크립트를 여시고 아래의 내용을 수정하세요 !
# 
# # 사용자가 선택할 수 있는 옵션 출력
# cat("1: 막대 그래프 코드 \n")
# cat("2: 원형 그래프 코드 \n")
# 
# # 사용자 입력 받기 
# num <- as.integer( readline(prompt="번호를 선택하세요:" ))
# 
# # switch 문을 사용해서 선택에 따라 다른 메세지 출력
# result <- switch( num, 
#                 "1" = cat( readLines("bar_plot.R"), sep = "\n"),
#                 "2" = "두번째 옵션을 선택했습니다.",
#                 "유효하지 않은 선택입니다."
# )
# 
# cat(result, "\n")
# 
# 😊 문제6. 원형 그래프 코드도 쉽게 사용할 수 있도록 yys.R 에 두번째 번호에
#                 추가하시오 !
# 
# c://data 밑에 pie_plot.R 이라는 이름으로 아래의 스크립트를 저장하고
# 
# 
# # plotly 패키지 로드
# library(plotly)
# 
# # 작업 디렉토리 설정
# setwd("c:\\data")
# 
# # 데이터 로드
# usedcars <- read.csv("usedcars.csv", header = TRUE)
# 
# # 건수 계산산
# color_counts <- table(usedcars$model)
# 
# # 사용자 정의 색상 목록
# colors <- c("gold", "skyblue", "tomato", "lightgreen", "purple", "orange", "pink", "cyan")
# 
# # plotly를 사용한 원형 그래프 생성
# fig <- plot_ly(labels = names(color_counts), 
#              values = as.numeric(color_counts), 
#              type = 'pie', 
#              marker = list(colors = colors))
# 
# # 그래프 출력
# fig
# 
# 그리고 나서  yys.R 을 아래와 같이 수정합니다.
# 
# 
# # 사용자가 선택할 수 있는 옵션 출력
# cat("1: 막대 그래프 코드 \n")
# cat("2: 원형 그래프 코드 \n")
# 
# # 사용자 입력 받기 
# num <- as.integer( readline(prompt="번호를 선택하세요:" ))
# 
# # switch 문을 사용해서 선택에 따라 다른 메세지 출력
# result <- switch( num, 
#                 "1" =  cat( readLines("bar_plot.R"), sep = "\n"),
#                 "2" =  cat( readLines("pie_plot.R"), sep = "\n"),
#                 "유효하지 않은 선택입니다."
# )
# 
# cat(result, "\n")
# 
# * 데이터 시각화 그래프의 종류 10가지
# 
# 1. 막대 그래프
# 2. 원형 그래프
# 3. 산포도(산점도) 그래프
# 4. 라인 그래프
# 5. 히스토그램 그래프
# 6. 박스 그래프 
# 7. 특수 그래프1( 소리를 시각화)  
# 8. 특수 그래프2( 워드 클라우드)
# 9. 특수 그래프3( 지도 그래프) 
# 10. 특수 그래프4 (사회적 관계망 그래프)
# 
