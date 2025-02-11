## ▣ 예제73. 모델평가 실습1   


### 예제. 유방암 데이터를 분류하는 머신러인 모델의 정확도와 다른 성능 척도들을 모두 출력하시오

### ✅ 단계1: 데이터 로드 및 전처리
```r
data <- read.csv("c:\\data\\wisc_bc_data.csv", stringsAsFactors=TRUE)
data <- data[, -1]
data$diagnosis <- as.factor(data$diagnosis)
```

### ✅ 단계2: 데이터 분할
```r
set.seed(1)
k <- createDataPartition(data$diagnosis, p=0.9, list=F)
train_data <- data[k, ]
test_data <- data[-k, ]
```

### ✅ 단계3: 모델 생성 및 훈련
```r
library(C50)
wisc_model <- C5.0(train_data[, -1], train_data[, 1])
```

### ✅ 단계4: 모델 예측
```r
result <- predict(wisc_model, test_data[, -1])
```

### ✅ 단계5: 모델 평가
```r
accuracy <- sum(result == test_data[, 1]) / nrow(test_data)
accuracy   # 0.98
```

### ✅ 단계6: ROC 곡선 그리기 및 AUC 계산
```r
wisc_test_prob <- predict(wisc_model, test_data[, -1], type="prob")
wisc_results <- data.frame(
  actual_type = test_data[, 1],
  predict_type = result,
  prob_M = round(wisc_test_prob[, 2], 5),
  prob_B = round(wisc_test_prob[, 1], 5)
)
pred <- prediction(predictions = wisc_results$prob_M, labels = wisc_results$actual_type)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
value <- performance(pred, measure = "auc")
auc <- unlist(value@y.values)
auc  # 0.9748299
```

문제.독일 은행 대출금 불이행자 예측 모델을 생성하고 단계별로 코드를 작성하세요.

✅ 단계1: 데이터 로드 및 전처리

```r
credit <- read.csv("c:\\data\\credit.csv", stringsAsFactors=TRUE)
colSums(is.na(credit))  # 결측치 확인
credit$default <- as.factor(credit$default)

``` 

✅ 단계2: 데이터 분할
✅ 단계3: 모델 생성 및 훈련
✅ 단계4: 모델 예측
✅ 단계5: 모델 평가
✅ 단계6: ROC 곡선 그리기 및 AUC 계산


