
# 1. 데이터 불러오기
health <- read.csv("c://data//health01.csv")
head(health)
summary(health)
# 2. 공복당 혈당 수치를 기준으로 당뇨 여부 컬럼 생성하기 
#    공복혈당이 110 이상이면 당뇨병(1) , 그렇지 않으면 
#    당뇨병이 아님(0) 으로 컬럼 생성 

health$당뇨병 <- ifelse(health$공복혈당 >= 110, 1, 0)
head(health)
# 3. 불필요한 컬럼 제거하기 
health_cleaned <- health[   , -5]
head(health_cleaned)
# 4. 상관 행렬 구하기 
round(cor(health_cleaned),3)

# 5. 데이터 시각화

library(psych)

pairs.panels(health_cleaned, pch='.')

# 상관관계 분석과 회귀분석의 차이 ?

# 상관관계는 두 변수간의 선형관계의 강도와 방향을 측정 
# 회귀분석은 하나의 변수(독립변수)가 다른 변수(종속변수)에
# 미치는 영향을 추정하고 예측 
