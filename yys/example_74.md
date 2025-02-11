## ▣ 예제74. 앙상블

## 🔹 K-폴드 교차검증 (10-폴드)

### 1️⃣ 데이터 불러오기
```r
credit <- read.csv("c:\\data\\credit.csv", stringsAsFactors=TRUE)
```

### 2️⃣ 10-폴드 교차검증 설정
```r
library(caret)
folds <- createFolds(credit$default, k=10)
```

### 3️⃣ 교차검증 수행 및 카파 지수 출력
```r
library(C50)
library(irr)
cv_results <- lapply(folds, function(x) {  
  credit_train <- credit[-x, ]
  credit_test  <- credit[x, ]
  credit_model <- C5.0(default ~ ., data=credit_train, trials=100)
  credit_pred <- predict(credit_model, credit_test)
  credit_actual <- credit_test$default
  kappa <- kappa2(data.frame(credit_actual, credit_pred))$value
  return (kappa)
})
mean(unlist(cv_results))  # 카파 지수 평균값
```

---

## 🔹 앙상블 학습 (배깅 & 부스팅)

### 1️⃣ 배깅을 사용한 모델 생성
```r
library(ipred)
set.seed(1)
my_bag <- bagging(Species ~ ., data=iris_train, nbagg=25)
p_bag <- predict(my_bag, iris_test[, -5])
bagging_accuracy <- sum(iris_test$Species == p_bag) / length(iris_test$Species)
cat("Accuracy with bagging:", bagging_accuracy, "\n")
```

### 2️⃣ 부스팅을 사용한 모델 생성
```r
install.packages("adabag")
library(adabag)
set.seed(1)
m_adaboost <- boosting(Species ~ ., data=iris_train, mfinal=50)
p_adaboost <- predict(m_adaboost, iris_test[, -5])
boosting_accuracy <- sum(iris_test$Species == p_adaboost$class) / length(iris_test$Species)
cat("Accuracy with boosting:", boosting_accuracy, "\n")
```

---
