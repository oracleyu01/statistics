
# 🎯 예제63. 나이브 베이즈 모델의 성능을 높이는 하이퍼 파라미터

# 📌 라플라스 추정기 적용
P(스팸 |  비아그라  ∩ ￢ 돈   ∩  식료품 ∩  구독취소) = ?

P(비아그라|스팸) * P(￢ 돈 |스팸) * P(식료품 | 스팸) * P(구독취소|스팸) * P(스팸)   =  0  
 4/20 * 10/20 * 0/20 * 12/20 * 20/100

# 🛠 라플라스 값을 사용하여 계산 가능하도록 수정
P(비아그라|스팸) * P(돈 |스팸) * P(식료품 | 스팸) * P(구독취소|스팸) * P(스팸)   =   ? 
5/24 * 11/24 * 1/24 * 13/24 * 20/100

P(비아그라|햄) * P(돈 |햄) * P(식료품 | 햄) * P(구독취소|햄) * P(햄)   =  ?
2/84 * 15/84 * 9/84 * 24/84 * 80/100

# 📌 나이브 베이즈 모델의 성능을 높이기 위한 하이퍼파라미터
laplace 값을 0.001 ~ 0.1 사이의 작은 값으로 설정하여 모델의 성능을 향상시킬 수 있음

# 🎯 나이브 베이즈 머신러닝을 이용하여 버섯 종류 분류

# 1. 데이터 불러오기
mush <- read.csv("c:\\data\\mushrooms.csv", stringsAsFactors=TRUE)
head(mush)

# 2. 데이터 탐색
prop.table(table(mush$type))

# plotly를 사용한 시각화
library(plotly)
colors <- c("lightgreen", "red")
fig <- plot_ly(labels = names(prop.table(table(mush$type))), 
               values = as.numeric(prop.table(table(mush$type))), 
               type = 'pie', 
               marker = list(colors = colors))
fig

# 3. 훈련 데이터와 테스트 데이터 분리
library(caret)
set.seed(1)
k <- createDataPartition(mush$type, p=0.8, list=FALSE)
train_data <- mush[k, ]
test_data <- mush[-k, ]

# 4. 모델 학습
library(e1071)
model <- naiveBayes(type ~ ., data=train_data)
model

# 5. 모델 예측
result <- predict(model, test_data[, -1])

# 6. 모델 평가
sum(result == test_data[, 1]) / length(test_data[, 1]) * 100
library(gmodels)
CrossTable(x=result, y=test_data[, 1], chisq=TRUE)

# 7. 모델 성능 개선 (라플라스 값 적용)
model2 <- naiveBayes(type ~ ., data=train_data, laplace=0.0001)
result2 <- predict(model2, test_data[, -1])

sum(result2 == test_data[, 1]) / length(test_data[, 1]) * 100
CrossTable(x=result2, y=test_data[, 1], chisq=TRUE)

# 8. 하이퍼파라미터 최적화
options(scipen=999)
y <- 0
jumpby <- 0.00001

for (i in 1:10) {
  y <- y + jumpby
  model2 <- naiveBayes(type ~ ., data=train_data, laplace=y) 
  result2 <- predict(model2, test_data[, -1])
  
  ct <- capture.output(a <- CrossTable(x=result2, y=test_data[, 1], print.chisq = FALSE))
  
  fn_value <- a$t[1, 2]
  accuracy <- sum(result2 == test_data[, 1]) / length(test_data[, 1]) * 100
  
  print(paste(y, '일때 FN 값', fn_value, '정확도는', accuracy))
}
