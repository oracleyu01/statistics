## ▣ 예제72. 모델 평가

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

## 🔹 독버섯 데이터 분류 (나이브 베이즈)

### 1️⃣ 데이터 불러오기 및 분할
```r
mush <- read.csv("c:\\data\\mushrooms.csv", stringsAsFactors=TRUE)
library(caret)
set.seed(1)
k <- createDataPartition(mush$type, p=0.8, list=F)
train_data <- mush[k, ]
test_data <- mush[-k, ]
```

### 2️⃣ 모델 훈련 및 예측
```r
library(e1071)
model <- naiveBayes(type ~ ., data=train_data, laplace=0.0001)
result <- predict(model, test_data[, -1])
```

### 3️⃣ 성능 평가
```r
library(gmodels)
actual_type <- test_data[, 1]
predict_type <- result
positive_value <- 'poisonous'
negative_value <- 'edible'
g <- CrossTable(actual_type, predict_type)
x <- sum(g$prop.tbl * diag(2))
```

| Laplace | 정확도 | 카파 통계량 | 민감도 | 특이도 | 정밀도 | 재현율 | F1-score |
|---------|--------|------------|--------|--------|--------|--------|---------|
| 0.0001  | ?      | ?          | ?      | ?      | ?      | ?      | ?       |
| 0.0002  | ?      | ?          | ?      | ?      | ?      | ?      | ?       |
| 0.0003  | ?      | ?          | ?      | ?      | ?      | ?      | ?       |
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

> **💡 추가 과제:** ROC 곡선과 앙상블 학습은 다음 주 머신러닝 수업에서 진행합니다. 

**📌 자유 시간:**
- 자습 및 스터디
- 취업 상담
- 목요일 제출 예정인 K-means 문제 풀이 준비

