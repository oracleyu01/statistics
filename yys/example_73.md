## ▣ 예제73. 모델평가 실습1   


---

## 🔹 독일 은행 대출금 불이행자 예측 모델 만들기

### ✅ 데이터 로드 및 전처리
```r
credit <- read.csv("c:\\data\\credit.csv", stringsAsFactors=TRUE)
colSums(is.na(credit))  # 결측치 확인
```

### ✅ 데이터 분할
```r
library(caret)
set.seed(1)
k <- createDataPartition(credit$default, p=0.9, list=F)
train_data <- credit[k, ]
test_data <- credit[-k, ]
nrow(train_data)  #900
nrow(test_data)   #100
```

### ✅ 모델 생성 및 훈련 (의사결정트리 모델)
```r
library(C50)
credit_model <- C5.0(train_data[, -17], train_data[, 17])
```

### ✅ 모델 예측 및 평가
```r
result <- predict(credit_model, test_data[, -17])
accuracy <- sum(result == test_data[, 17]) / 100
accuracy  # 0.67  <--- 의사결정 나무 1개로 예측한 정확도
```

### ✅ ROC 곡선 그리기
```r
credit_test_prob <- predict(credit_model, test_data[, -17], type="prob")

credit_results <- data.frame(
  actual_type = test_data[, 17],
  predict_type = result,
  prob_yes = round(credit_test_prob[, 2], 5),
  prob_no = round(credit_test_prob[, 1], 5)
)
```

### ✅ 민감도, 특이도, 정밀도 계산
```r
library(caret)
sensitivity(credit_results$predict_type, credit_results$actual_type, positive='yes')
specificity(credit_results$predict_type, credit_results$actual_type, negative='no')
posPredValue(credit_results$predict_type, credit_results$actual_type, positive='yes')
```

### ✅ ROC 곡선 그리기 및 AUC 계산
```r
install.packages("ROCR")
library(ROCR)
pred <- prediction(predictions = credit_results$prob_yes, labels = credit_results$actual_type)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
value <- performance(pred, measure = "auc")
auc <- unlist(value@y.values)
auc  # 0.64 출력, 1에 가까울수록 좋은 모델
```

### ✅ 최적의 Cut-off 지점 찾기 및 시각화
```r
cutoff_data <- data.frame(cut = perf@alpha.values[[1]], tpr = perf@y.values[[1]], fpr = perf@x.values[[1]])
cutoff_data$distance <- cutoff_data$tpr - cutoff_data$fpr
optimal_cutoff <- cutoff_data[which.max(cutoff_data$distance), "cut"]
optimal_tpr <- cutoff_data[which.max(cutoff_data$distance), "tpr"]
optimal_fpr <- cutoff_data[which.max(cutoff_data$distance), "fpr"]
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
points(optimal_fpr, optimal_tpr, col = "red", pch = 19)
text(optimal_fpr, optimal_tpr, labels = round(optimal_cutoff, 2), pos = 4, col = "red")
```

---

### 문제. 유방암 데이터를 분류하는 머신러인 모델의 정확도와 다른 성능 척도들을 모두 출력하시오

### ✅ 문제 1: 데이터 로드 및 전처리
```r
data <- read.csv("c:\\data\\wisc_bc_data.csv", stringsAsFactors=TRUE)
data <- data[, -1]
data$diagnosis <- as.factor(data$diagnosis)
```

### ✅ 문제 2: 데이터 분할
```r
set.seed(1)
k <- createDataPartition(data$diagnosis, p=0.9, list=F)
train_data <- data[k, ]
test_data <- data[-k, ]
```

### ✅ 문제 3: 모델 생성 및 훈련
```r
library(C50)
wisc_model <- C5.0(train_data[, -1], train_data[, 1])
```

### ✅ 문제 4: 모델 예측
```r
result <- predict(wisc_model, test_data[, -1])
```

### ✅ 문제 5: 모델 평가
```r
accuracy <- sum(result == test_data[, 1]) / nrow(test_data)
accuracy   # 0.98
```

### ✅ 문제 6: ROC 곡선 그리기 및 AUC 계산
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

### ✅ 문제 7: 최적의 Cut-off 지점 찾기 및 시각화
```r
cutoff_data <- data.frame(cut = perf@alpha.values[[1]], tpr = perf@y.values[[1]], fpr = perf@x.values[[1]])
cutoff_data$distance <- cutoff_data$tpr - cutoff_data$fpr
optimal_cutoff <- cutoff_data[which.max(cutoff_data$distance), "cut"]
optimal_tpr <- cutoff_data[which.max(cutoff_data$distance), "tpr"]
optimal_fpr <- cutoff_data[which.max(cutoff_data$distance), "fpr"]
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
points(optimal_fpr, optimal_tpr, col = "red", pch = 19)
text(optimal_fpr, optimal_tpr, labels = round(optimal_cutoff, 2), pos = 4, col = "red")
```

