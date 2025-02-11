## ▣ 예제74. 모델 평가3

### 🔹 모델 평가 이론 수업
- [모델 평가 이론](https://cafe.daum.net/oracleoracle/Sotv/818)

---

## 🔹 카파 통계량 문제

#### ✅ 문제: 아래의 데이터에 대한 카파 통계량을 구하시오.

| 실제 \ 예측 | False | True | 합계 |
|------------|------|------|------|
| False      | 70   | 30   | 100  |
| True       | 40   | 60   | 100  |
| 합계       | 110  | 90   | 200  |

#### ✅ 정답 코드
```r
a <- as.table(matrix(c(70, 30, 40, 60), byrow=T, nrow=2, ncol=2))
a
library(caret)
kappa(a)   # 0.3
```

---

## 🔹 실제 머신러닝 모델에서 정확도와 카파 통계량 출력하기

### 1️⃣ 데이터 불러오기 및 전처리
```r
setwd("c:\\data")
wbcd <- read.csv("wisc_bc_data.csv", header=T, stringsAsFactors=FALSE)
wbcd$diagnosis <- factor(wbcd$diagnosis, levels=c("B","M"), labels=c("Benign", "Maliganant"))
```

### 2️⃣ 데이터 정규화 및 훈련/테스트 분리
```r
set.seed(2)
wbcd_shuffle <- wbcd[sample(569), ]
wbcd2 <- wbcd_shuffle[, -1]
normalize <- function(x) { (x - min(x)) / (max(x) - min(x)) }
wbcd_n <- as.data.frame(lapply(wbcd2[, 2:31], normalize))
train_num <- round(0.9 * nrow(wbcd_n), 0)
wbcd_train <- wbcd_n[1:train_num, ]
wbcd_test <- wbcd_n[(train_num+1):nrow(wbcd_n), ]
wbcd_train_label <- wbcd2[1:train_num, 1]
wbcd_test_label <- wbcd2[(train_num+1):nrow(wbcd_n), 1]
```

### 3️⃣ KNN 모델 생성 및 평가
```r
library(class)
result1 <- knn(train=wbcd_train, test=wbcd_test, cl=wbcd_train_label, k=21)
data.frame(result1, wbcd_test_label)
sum(result1 == wbcd_test_label)
```

### 4️⃣ 모델 성능 평가
```r
library(gmodels)
actual_type <- wbcd_test_label
predict_type <- result1
positive_value <- 'Maliganant'
negative_value <- 'Benign'
g <- CrossTable(actual_type, predict_type)
x <- sum(g$prop.tbl * diag(2))
```

| 지표      | 값 |
|-----------|-----|
| 정확도    | 0.9122807 |
| 카파 통계량 | 0.8224 |
| 민감도    | 0.8148148 |
| 특이도    | 1.0 |
| 정밀도    | 1.0 |
| 재현율    | 0.8148148 |
| F1-score  | 0.8979592 |

---

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

## 🔹 마지막 문제: 독일 은행 데이터로 성능 척도 계산하기

### ✅ 데이터: `credit.csv`

| 지표      | 설명 |
|-----------|-----------------------------------------------------------------|
| 정확도    | 전체 예측 중 올바르게 예측한 비율 |
| 카파 통계량 | 모델의 예측이 무작위 예측보다 얼마나 나은지 평가하는 지표 |
| 민감도    | 실제 양성 중 올바르게 예측한 비율 |
| 특이도    | 실제 음성 중 올바르게 예측한 비율 |
| 정밀도    | 양성 예측 중 실제 양성의 비율 |
| 재현율    | 실제 양성 중 올바르게 예측한 비율 (민감도와 동일) |
| F1-score  | 정밀도와 재현율의 조화평균 |

---



