### 🎯 예제66. 회귀트리와 모델트리 (p335)

#### 📌 회귀트리란?
#### 수치를 예측하는 트리(tree)
#### 회귀트리 = 회귀 모델 + 의사결정트리 모델

#### 🔗 관련 자료: https://cafe.daum.net/oracleoracle/Sotv/676

#### ✅ 데이터 분할 기준: 표준편차 축소 (SDR, Standard Deviation Reduction)
#### 집값을 예측하는 데 중요한 평수 기준을 찾는 과정

#### 📊 원본 데이터   
```r   
평수 <- c(30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100)
집값 <- c(100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240)
```  

#### ✅ 60평 기준으로 나누기
```r   
그룹_A_평수 <- c(30, 35, 40, 45, 50, 55, 60)
그룹_B_평수 <- c(65, 70, 75, 80, 85, 90, 95, 100)
그룹_A_집값 <- c(100, 110, 120, 130, 140, 150, 160)
그룹_B_집값 <- c(170, 180, 190, 200, 210, 220, 230, 240)
```

#### ✅ 80평 기준으로 나누기
```r  
그룹_C_평수 <- c(30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80)
그룹_D_평수 <- c(85, 90, 95, 100)
그룹_C_집값 <- c(100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200)
그룹_D_집값 <- c(210, 220, 230, 240)
```   

#### ✅ 표준편차 축소(SDR) 계산   
```r  
전체_표준편차 <- sd(집값)

sdr_60 <- 전체_표준편차 - (length(그룹_A_집값) / length(집값) * sd(그룹_A_집값) + length(그룹_B_집값) / length(집값) * sd(그룹_B_집값))
sdr_80 <- 전체_표준편차 - (length(그룹_C_집값) / length(집값) * sd(그룹_C_집값) + length(그룹_D_집값) / length(집값) * sd(그룹_D_집값))

cat("전체 데이터의 표준편차:", 전체_표준편차, "\n")
cat("평수 60으로 나누었을 때의 표준편차 축소:", sdr_60, "\n")
cat("평수 80으로 나누었을 때의 표준편차 축소:", sdr_80, "\n")
```   

#### ✅ 표준편차 축소(SDR)가 더 큰 60평 기준이 더 나은 회귀트리 모델을 생성할 수 있음

#### 🎯 R을 이용한 회귀트리 모델 생성 (p339)
#### ✅ 목표: 와인의 품질(수치형 데이터)을 예측하는 회귀트리 모델 생성

#### 📌 데이터 로드   
```r  
wine <- read.csv("c:\\data\\whitewines.csv", header=T)
head(wine)
```

#### ✅ 종속변수 정규분포 확인   
```r  
hist(wine$quality)
```

#### ✅ 결측치 확인
```r  
colSums(is.na(wine))
```

#### ✅ 훈련 데이터와 테스트 데이터 분리  
```r  
library(caret)
set.seed(1)
train_num <- createDataPartition(wine$quality, p=0.9, list=F)

train_data <- wine[train_num,]
test_data <- wine[-train_num,]

nrow(train_data)  # 4409
nrow(test_data)   # 489
```

#### ✅ 회귀트리 모델 생성   
```r  
install.packages("rpart")
library(rpart)

model <- rpart(quality ~ ., data=train_data)
model
```   

#### ✅ 생성된 모델 시각화   
```r  
install.packages("rpart.plot")
library(rpart.plot)

rpart.plot(model, digits=3)   # 소수점 3자리까지 표시
```

#### ✅ 테스트 데이터 예측   
```r  
result <- predict(model, test_data[, -12])
```   

#### ✅ 모델 성능 평가 (상관계수 확인)   
```r  
cor(result, test_data[, 12])   # 0.5150889
```

#### ✅ 모델 성능 향상 (모델트리 적용)   
```r  
install.packages("Cubist")
library(Cubist)

model2 <- cubist(x=train_data[, -12], y=train_data[, 12])
result2 <- predict(model2, test_data[, -12])

cor(result2, test_data[, 12])   # 0.59 로 향상됨
```

#### ✅ 랜덤 포레스트 적용  
```r  
library(randomForest)
set.seed(1)
model_rf <- randomForest(quality ~ ., data=train_data, ntree=500, mtry=3)
result_rf <- predict(model_rf, test_data[, -12])

cor(result_rf, test_data[, 12])  # 0.7468368 (더 높은 성능)
```

#### ✅ 성능 비교
#### 회귀트리 -> 모델트리 -> 랜덤포레스트 순으로 성능 향상
#### cor 값: 0.51 -> 0.59 -> 0.74

#### ✅ MAE (Mean Absolute Error) 계산   
```r  
mae <- function(actual, predicted) { mean(abs(actual - predicted)) }
mae(test_data[, 12], result_rf)  # 오차 계산
```   

#### ✅ 결론: 랜덤포레스트가 가장 높은 예측 성능을 보임
