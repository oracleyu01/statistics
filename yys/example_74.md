## ▣ 예제74. 앙상블

## 1. K-폴드 교차검증 (10-폴드)

[이론ppt](https://gamma.app/docs/k--ighwhjes460otkm?mode=doc)

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

## 2. 앙상블 학습 (배깅 & 부스팅)   

[이론ppt](https://gamma.app/docs/-2t95d86mazbklxl) 


# 앙상블 학습 예제

## 1. 앙상블 모델의 필요성 분석

### 정확도 60% 모델로 90% 정확도 달성을 위한 계산

```R
ret_err <- function(n, err) {
  sum <- 0 
  for(i in floor(n/2):n) { 
    sum <- sum + choose(n,i) * err^i * (1-err)^(n-i)
  }
  sum
}

for(j in 1:60) {
  err <- ret_err(j, 0.4)
  cat(j, '--->', 1 - err, '\n') 
  if(1 - err >= 0.9) break
}
```

**결과:**
```
48 ---> 0.8966186 
49 ---> 0.8718449 
50 ---> 0.9021926 
```

**결론:** 60%의 정확도를 보이는 모델 50개를 앙상블하면 90% 이상의 정확도 달성 가능

## 2. 단일 의사결정트리 모델

```R
# 데이터 로드 및 전처리
iris <- read.csv("c:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 데이터 분할
library(caret)
set.seed(1)
in_train <- createDataPartition(iris$Species, p = 0.9, list = FALSE)
iris_train <- iris[in_train, ]
iris_test  <- iris[-in_train, ]

# 모델 생성 및 예측
library(C50)
model <- C5.0(Species ~ ., data = iris_train)
result <- predict(model, iris_test)

# 정확도 평가
accuracy <- sum(iris_test$Species == result) / length(iris_test$Species)
```

## 3. 배깅(Bagging) 모델

```R
# 데이터 분할
set.seed(1)
in_train <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
iris_train <- iris[in_train, ]
iris_test  <- iris[-in_train, ]

# 배깅 모델 생성
library(ipred)
my_bag <- bagging(Species ~ ., data = iris_train, nbagg = 25)

# 예측 및 평가
p_bag <- predict(my_bag, iris_test[, -5])
bagging_accuracy <- sum(iris_test$Species == p_bag) / length(iris_test$Species)
```

**결과:** 정확도가 0.93에서 0.96으로 향상

### 실습 문제
- 배깅 모델의 `nbagg` 파라미터를 조정하여 정확도 변화 관찰

## 4. 부스팅(Boosting) 모델

```R
# 기본 부스팅 모델
library(adabag)
m_adaboost <- boosting(Species ~ ., data = iris_train)
p_adaboost <- predict(m_adaboost, iris_test[, -5])
```

### 하이퍼파라미터 튜닝 예시
```R
# mfinal 파라미터 조정
m_adaboost <- boosting(Species ~ ., data = iris_train, mfinal=50)
```

## 이수자 평가 문제

### 문제 1: 부트스트랩 샘플링을 사용하는 앙상블 기법
- 정답: **배깅(Bagging)**
- 설명: 복원 추출로 다수의 부트스트랩 데이터셋 생성

### 문제 2: 약한 학습기를 강한 학습기로 만드는 기법
- 정답: **부스팅 - GBM**
- 특징: 
  - 경사하강법 사용
  - 가중치 업데이트
  - 점진적 성능 개선

### 주요 앙상블 기법 비교
| 기법 | 특징 | 대표 알고리즘 |
|------|------|--------------|
| 배깅 | 복원 추출, 병렬 학습 | Random Forest |
| 부스팅 | 순차적 학습, 가중치 조정 | AdaBoost, GBM |


## XGBoost와 LightGBM 설명 및 실습

### XGBoost (eXtreme Gradient Boosting)
XGBoost는 gradient boosting framework의 구현체로, 다음과 같은 특징을 가집니다:

- 병렬 처리를 통한 빠른 수행 속도
- 과적합 방지를 위한 정규화 포함
- 트리 가지치기 기능
- 결측치 자체 처리 기능

```R
# XGBoost를 이용한 iris 분류
library(xgboost)
library(caret)

# 데이터 준비
iris <- read.csv("iris2.csv", stringsAsFactors = TRUE)
set.seed(1)
in_train <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train <- iris[in_train, ]
test <- iris[-in_train, ]

# 레이블 인코딩
train_labels <- as.numeric(train$Species) - 1
test_labels <- as.numeric(test$Species) - 1

# 데이터 매트릭스 변환
train_matrix <- as.matrix(train[, -5])
test_matrix <- as.matrix(test[, -5])

# XGBoost 데이터셋 생성
dtrain <- xgb.DMatrix(data = train_matrix, label = train_labels)
dtest <- xgb.DMatrix(data = test_matrix, label = test_labels)

# 파라미터 설정
params <- list(
  objective = "multi:softmax",
  num_class = 3,
  max_depth = 3,
  eta = 0.3,
  nrounds = 100
)

# 모델 학습
xgb_model <- xgb.train(
  params = params,
  data = dtrain,
  nrounds = 100,
  watchlist = list(eval = dtest, train = dtrain),
  early_stopping_rounds = 10,
  verbose = 0
)

# 예측
predictions <- predict(xgb_model, test_matrix)
accuracy <- sum(predictions == test_labels) / length(test_labels)
cat("XGBoost Accuracy:", accuracy, "\n")
```

### LightGBM
LightGBM은 Microsoft에서 개발한 gradient boosting framework로, 다음과 같은 특징이 있습니다:

- Leaf-wise 트리 성장 전략 (vs Level-wise)
- 히스토그램 기반 알고리즘 사용
- 더 빠른 훈련 속도와 더 적은 메모리 사용
- 대규모 데이터셋에 효과적

```R
# LightGBM을 이용한 iris 분류
library(lightgbm)
library(caret)

# 데이터 준비
iris <- read.csv("iris2.csv", stringsAsFactors = TRUE)
set.seed(1)
in_train <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train <- iris[in_train, ]
test <- iris[-in_train, ]

# 레이블 인코딩
train_labels <- as.numeric(train$Species) - 1
test_labels <- as.numeric(test$Species) - 1

# LightGBM 데이터셋 생성
dtrain <- lgb.Dataset(
  data = as.matrix(train[, -5]),
  label = train_labels
)

# 파라미터 설정
params <- list(
  objective = "multiclass",
  num_class = 3,
  max_depth = 3,
  learning_rate = 0.1,
  num_leaves = 31,
  metric = "multi_logloss"
)

# 모델 학습
lgb_model <- lgb.train(
  params = params,
  data = dtrain,
  nrounds = 100,
  verbose = 0
)

# 예측
predictions <- predict(lgb_model, as.matrix(test[, -5]))
predictions_matrix <- matrix(predictions, ncol = 3, byrow = TRUE)
predicted_classes <- max.col(predictions_matrix) - 1
accuracy <- sum(predicted_classes == test_labels) / length(test_labels)
cat("LightGBM Accuracy:", accuracy, "\n")
```

### XGBoost와 LightGBM 비교

| 특징 | XGBoost | LightGBM |
|------|---------|----------|
| 트리 성장 | Level-wise | Leaf-wise |
| 메모리 사용 | 상대적으로 많음 | 상대적으로 적음 |
| 학습 속도 | 빠름 | 매우 빠름 |
| 작은 데이터셋 | 좋은 성능 | 과적합 우려 |
| 큰 데이터셋 | 좋은 성능 | 매우 좋은 성능 |
| 파라미터 튜닝 | 상대적으로 쉬움 | 상대적으로 어려움 |

### 주요 하이퍼파라미터

#### XGBoost 주요 파라미터
- `max_depth`: 트리의 최대 깊이
- `eta`: 학습률
- `gamma`: 리프 노드의 추가 분할을 위한 최소 손실 감소값
- `subsample`: 데이터 샘플링 비율
- `colsample_bytree`: 피처 샘플링 비율

#### LightGBM 주요 파라미터
- `num_leaves`: 한 트리가 가질 수 있는 최대 잎 개수
- `learning_rate`: 학습률
- `max_depth`: 트리의 최대 깊이
- `min_data_in_leaf`: 리프 노드가 가져야 할 최소 데이터 수
- `feature_fraction`: 피처 샘플링 비율

### 사용 권장 사항
1. **데이터 크기에 따른 선택**
   - 작은 데이터셋 (<10,000 samples): XGBoost 권장
   - 큰 데이터셋 (>100,000 samples): LightGBM 권장

2. **리소스 제약에 따른 선택**
   - 메모리 제약이 있는 경우: LightGBM 권장
   - 학습 시간이 중요한 경우: LightGBM 권장

3. **모델 안정성에 따른 선택**
   - 안정적인 성능이 필요한 경우: XGBoost 권장
   - 성능 최적화가 중요한 경우: LightGBM 권장
