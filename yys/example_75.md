# 🌳 랜덤 포레스트, XGBoost, LightGBM 비교 분석

## 📍 초기 상황 

### 예측하려는 아파트 정보:
* 실제 가격: 5억원
* 평수: 32평
* 층수: 13층
* 지하철역까지 거리: 500m (역세권)
* 건축연도: 2018년
* 학군: 상위 10%
* 주차: 세대당 1.2대

## 📍 랜덤 포레스트 예측 과정

### [특징]
여러 개의 독립적인 트리를 동시에 만들어서 투표

#### 트리 1의 예측 (평수, 층수 위주로 본 트리)
* 32평 & 13층 기준으로 분석
* 예측가격: 4.8억원

#### 트리 2의 예측 (역세권, 학군 위주로 본 트리)
* 역세권 & 학군 상위 10% 기준으로 분석
* 예측가격: 5.1억원

#### 트리 3의 예측 (건축연도, 주차 위주로 본 트리)
* 2018년 & 주차 1.2대 기준으로 분석
* 예측가격: 5.2억원

#### 최종 예측
* 세 트리의 평균 (4.8억원 + 5.1억원 + 5.2억원) ÷ 3 = 5.03억원
* 실제가격과 차이: +300만원 (초과)

## 📍 세 가지 방식 비교

### 1. 예측 과정

**랜덤 포레스트:**
* 여러 트리가 동시에 독립적으로 예측
* 각자 다른 특성에 집중
* 마지막에 평균내서 결정
* 한번에 예측하고 끝남

**XGBoost:**
* 처음: 4억원 예측
* 다음: 4.7억원으로 수정
* 마지막: 4.9억원으로 수정
* 점차 개선해나감 (모든 그룹 동시에)

**LightGBM:**
* 처음: 4.5억원 예측
* 다음: 4.8억원으로 수정
* 마지막: 4.9억원으로 수정
* 점차 개선해나감 (큰 오차만 집중)

### 2. 비유로 이해하기

**랜덤 포레스트:**
* 마치 여러 전문가가 각자 예측하고 평균 내는 것
* 예: 부동산 전문가, 건축가, 투자자가 각각 예측

**XGBoost:**
* 마치 한 전문가가 모든 사례를 꼼꼼히 보면서 예측
* 예: 모든 자료를 순차적으로 분석

**LightGBM:**
* 마치 한 전문가가 중요한 사례만 골라서 예측
* 예: 핵심 자료만 빠르게 분석

### 3. 결과 비교
* 랜덤 포레스트: 5.03억원 (+300만원 차이)
* XGBoost: 4.9억원 (-1000만원 차이)
* LightGBM: 4.9억원 (-1000만원 차이)

### 4. 각 방식의 특징

**랜덤 포레스트:**
* 장점:
 * 여러 관점에서 동시에 분석
 * 이상치에 강함
 * 과적합 위험이 적음
* 단점:
 * 점진적 개선이 없음
 * 세밀한 패턴 학습이 어려움

**XGBoost:**
* 장점:
 * 정확한 예측
 * 안정적인 성능
* 단점:
 * 느린 학습 속도
 * 많은 메모리 사용

**LightGBM:**
* 장점:
 * 빠른 학습 속도
 * 효율적인 메모리 사용
* 단점:
 * 적은 데이터에서 불안정
 * 과적합 위험 있음

### 5. 사용하면 좋은 상황

**랜덤 포레스트:**
* 이상치가 많은 데이터
* 빠른 학습이 필요할 때
* 간단한 문제 해결할 때

**XGBoost:**
* 정확도가 매우 중요할 때
* 데이터가 적을 때
* 컴퓨터 성능이 좋을 때

**LightGBM:**
* 데이터가 매우 많을 때
* 빠른 학습이 필요할 때
* 자원이 제한적일 때

## 📍 결론
이처럼 세 알고리즘은 각각 다른 접근 방식으로 예측을 수행합니다:
* 랜덤 포레스트는 "여러 명이 동시에 독립적으로 예측"
* XGBoost는 "한 명이 천천히 꼼꼼하게 예측"
* LightGBM은 "한 명이 중요한 것만 빠르게 예측"

# 🤖 머신러닝 알고리즘 상황별 활용 가이드

## 📍 1. 기본적인 알고리즘

### KNN (K-Nearest Neighbors)
* 데이터의 패턴이 지역적으로 뚜렷할 때
* 설명이 쉬워야 할 때 (직관적 이해 필요)
* 이상치의 영향을 최소화하고 싶을 때
* 데이터가 적당한 크기일 때 (너무 크지 않을 때)

### 나이브 베이즈
* 텍스트 분류 문제 (스팸 메일 분류 등)
* 독립변수가 많고 상호작용이 적을 때
* 빠른 학습과 예측이 필요할 때
* 실시간 예측이 필요한 경우

### 의사결정트리
* 규칙을 명확하게 설명해야 할 때
* 데이터에 결측치가 있을 때
* 수치형/범주형 변수가 섞여 있을 때
* 변수 간 상호작용이 중요할 때

### 규칙기반 알고리즘
* 비즈니스 규칙이 명확할 때
* 설명 가능성이 매우 중요할 때
* 도메인 전문가의 지식을 직접 활용할 때
* 간단한 if-then 규칙으로 충분할 때

## 📍 2. 고급 알고리즘

### 서포트 벡터 머신(SVM)
* 고차원 데이터를 다룰 때
* 데이터 분포가 복잡할 때
* 정확한 분류 경계가 필요할 때
* 메모리가 충분하고 속도가 중요하지 않을 때

### 신경망
* 패턴이 매우 복잡할 때
* 데이터가 매우 많을 때
* 이미지/음성 등 비정형 데이터
* 높은 컴퓨팅 파워가 있을 때

### 다중회귀
* 선형적인 관계가 예상될 때
* 변수 간 영향력을 해석해야 할 때
* 간단한 예측 모델이 필요할 때
* 통계적 검정이 필요할 때

## 📍 3. 앙상블 계열

### 랜덤 포레스트
* 이상치가 많은 데이터
* 빠른 학습이 필요할 때
* 간단한 문제 해결할 때
* 과적합 방지가 중요할 때

### XGBoost
* 정확도가 매우 중요할 때
* 데이터가 적을 때
* 컴퓨터 성능이 좋을 때
* 시간적 여유가 있을 때

### LightGBM
* 데이터가 매우 많을 때
* 빠른 학습이 필요할 때
* 자원이 제한적일 때
* 대규모 데이터셋 처리할 때

## 📍 상황별 추천 알고리즘

### 1. 데이터 크기 기준

**적은 데이터 (수천 건 이하):**
* KNN
* 나이브 베이즈
* 의사결정트리
* 다중회귀

**중간 크기 데이터:**
* 랜덤 포레스트
* XGBoost
* SVM

**대용량 데이터:**
* LightGBM
* 신경망
* 규칙기반 (간단한 규칙의 경우)

### 2. 설명력 중요도 기준

**높은 설명력 필요:**
* 의사결정트리
* 규칙기반
* 다중회귀
* KNN

**중간 설명력:**
* 랜덤 포레스트
* XGBoost
* 나이브 베이즈

**낮은 설명력:**
* 신경망
* SVM
* LightGBM

### 3. 속도 중요도 기준

**빠른 학습/예측 필요:**
* 나이브 베이즈
* LightGBM
* 규칙기반
* KNN (예측 시)

**중간 속도:**
* 랜덤 포레스트
* 의사결정트리
* 다중회귀

**느린 속도 감수 가능:**
* XGBoost
* SVM
* 신경망 (학습 시)

### 4. 데이터 특성 기준

**정형 데이터:**
* XGBoost
* LightGBM
* 랜덤 포레스트
* 다중회귀

**비정형 데이터:**
* 신경망
* SVM
* 나이브 베이즈 (텍스트)

**혼합 데이터:**
* 의사결정트리
* 규칙기반
* 랜덤 포레스트


# 📝 머신러닝 개념 문제 풀이

## 문제 1
비지도학습에 대한 설명으로 다음 빈칸에 들어갈 말로 알맞은 것은?

"정답을 ( ), ( )이 이에 속한다."

#### 보기
1. 가르쳐주지 않고, 회귀분석
2. 가르쳐주고, 회귀분석  
3. 가르쳐주지 않고, 군집분석
4. 가르쳐주고, 군집분석

<details>
<summary>정답 보기</summary>
<div markdown="1">

**정답: ③ 가르쳐주지 않고, 군집분석**

- 비지도학습은 정답 라벨 없이 데이터의 패턴을 스스로 학습
- 군집분석(Clustering)은 대표적인 비지도학습 알고리즘
</div>
</details>

## 문제 2
로지스틱 회귀분석에 대한 설명으로 잘못된 것은?

#### 보기
1. 분류에 주로 사용한다.
2. 자료형이 범주형을 갖는 경우 사용하는 분석기법이다.
3. Y값은 0과 1사이이다.
4. 대표적인 비지도 학습 알고리즘이다.

<details>
<summary>정답 보기</summary>
<div markdown="1">

**정답: ④ 대표적인 비지도 학습 알고리즘이다.**

- 로지스틱 회귀분석은 지도학습의 대표적인 알고리즘
- 이진 분류를 위한 알고리즘으로 출력값이 0~1 사이의 확률값
</div>
</details>

## 문제 3
맨해튼 거리를 계산하시오. 점 A에서 2번째로 가까운 점의 거리는?

* 4개의 점: A(1,1), B(1,2), C(2,2), D(4,1)

#### 보기
1. 1
2. 2
3. 3
4. 4

<details>
<summary>정답 보기</summary>
<div markdown="1">

**정답: ② 2**

풀이:
1. A-B 거리: |1-1| + |1-2| = 1
2. A-C 거리: |1-2| + |1-2| = 2
3. A-D 거리: |1-4| + |1-1| = 3

따라서 A에서 2번째로 가까운 점은 C이고, 그 거리는 2이다.
</div>
</details>     

### 최종 실습 

#### 1. 최적의 하이퍼 파라미터 찾기 전 xgboost 코드

```r
# 필요한 라이브러리 로드
library(xgboost)
library(caret)
library(dplyr)
library(pROC)

setwd("d:\\data")

# 데이터 준비
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)

# 범주형 변수를 factor로 변환
categorical_cols <- c("checking_balance", "credit_history", "purpose", 
                     "savings_balance", "employment_duration", "other_credit",
                     "housing", "job", "phone", "default")

credit[categorical_cols] <- lapply(credit[categorical_cols], as.factor)

# default 변수를 factor로 변환 (levels를 "No"와 "Yes"로 지정)
credit$default <- factor(ifelse(credit$default == "yes", "Yes", "No"), levels = c("No", "Yes"))

# 범주형 변수를 더미 변수로 변환
dummy_cols <- c("checking_balance", "credit_history", "purpose", 
                "savings_balance", "employment_duration", "other_credit",
                "housing", "job", "phone")

# 수치형 변수 선택
numeric_cols <- c("months_loan_duration", "amount", "percent_of_income",
                 "years_at_residence", "age", "existing_loans_count", "dependents")

# 전체 데이터에 대한 더미 변수 생성
credit_dummies <- model.matrix(~.-1, data = credit[dummy_cols])
credit_final <- cbind(data.frame(credit_dummies), credit[numeric_cols], default = credit$default)

# 데이터 분할
set.seed(123)
train_index <- createDataPartition(credit_final$default, p = 0.8, list = FALSE)
train_data <- credit_final[train_index, ]
test_data <- credit_final[-train_index, ]

# XGBoost 모델 학습을 위한 기본 파라미터 설정
xgb_params <- list(
  objective = "binary:logistic",
  eval_metric = "auc",
  max_depth = 6,
  eta = 0.3,
  gamma = 0,
  colsample_bytree = 0.8,
  min_child_weight = 1,
  subsample = 0.8
)

# 훈련 데이터 변환
train_matrix <- xgb.DMatrix(
  data = as.matrix(train_data[, !names(train_data) %in% "default"]),
  label = as.numeric(train_data$default) - 1
)

# 테스트 데이터 변환
test_matrix <- xgb.DMatrix(
  data = as.matrix(test_data[, !names(test_data) %in% "default"]),
  label = as.numeric(test_data$default) - 1
)

# 모델 학습
xgb_model <- xgb.train(
  params = xgb_params,
  data = train_matrix,
  nrounds = 100,
  watchlist = list(train = train_matrix, test = test_matrix),
  verbose = 1
)

# 변수 중요도 확인
importance_matrix <- xgb.importance(model = xgb_model)
print("Variable Importance:")
print(importance_matrix)

# 모델 예측
predictions_prob <- predict(xgb_model, test_matrix)
predictions_class <- factor(ifelse(predictions_prob > 0.5, "Yes", "No"), levels = c("No", "Yes"))

# 혼동 행렬 생성
confusion_matrix <- confusionMatrix(predictions_class, test_data$default)
print("Confusion Matrix and Statistics:")
print(confusion_matrix)

# ROC 커브 그리기
roc_obj <- roc(test_data$default, predictions_prob)
plot(roc_obj, main = "ROC Curve")
auc_value <- auc(roc_obj)
cat("\nAUC:", auc_value, "\n")

# 성능 메트릭 계산
precision <- confusion_matrix$byClass["Pos Pred Value"]
recall <- confusion_matrix$byClass["Sensitivity"]
f1_score <- confusion_matrix$byClass["F1"]

cat("\nModel Performance Metrics:\n")
cat("Accuracy:", confusion_matrix$overall["Accuracy"], "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1 Score:", f1_score, "\n")
cat("AUC:", auc_value, "\n")

# 변수 중요도 시각화
xgb.plot.importance(importance_matrix)

```

#### 2. 최적의 하이퍼 파라미터 찾는 xgboost 코드 (시간 오래걸림)    

```r
# 필요한 라이브러리 로드
library(xgboost)
library(caret)
library(dplyr)

setwd("d:\\data")
# 데이터 준비
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)

# 범주형 변수를 factor로 변환
categorical_cols <- c("checking_balance", "credit_history", "purpose", 
                      "savings_balance", "employment_duration", "other_credit",
                      "housing", "job", "phone", "default")
credit[categorical_cols] <- lapply(credit[categorical_cols], as.factor)

# default 변수를 factor로 변환 (levels를 "No"와 "Yes"로 지정)
credit$default <- factor(ifelse(credit$default == "yes", "Yes", "No"), levels = c("No", "Yes"))

# 범주형 변수를 더미 변수로 변환
dummy_cols <- c("checking_balance", "credit_history", "purpose", 
                "savings_balance", "employment_duration", "other_credit",
                "housing", "job", "phone")

# 수치형 변수 선택
numeric_cols <- c("months_loan_duration", "amount", "percent_of_income",
                  "years_at_residence", "age", "existing_loans_count", "dependents")

# 전체 데이터에 대한 더미 변수 생성
credit_dummies <- model.matrix(~.-1, data = credit[dummy_cols])
credit_final <- cbind(data.frame(credit_dummies), credit[numeric_cols], default = credit$default)

# 교차 검증을 위한 trainControl 설정
ctrl <- trainControl(
  method = "cv",
  number = 10,
  verboseIter = TRUE,
  classProbs = TRUE,
  summaryFunction = twoClassSummary
)

# 튜닝할 하이퍼파라미터 그리드 설정 (규모를 좀 줄여서 실행 시간 단축)
xgb_grid <- expand.grid(
  nrounds = c(100, 200),
  max_depth = c(3, 6),
  eta = c(0.01, 0.1),
  gamma = c(0, 0.5),
  colsample_bytree = c(0.6, 1.0),
  min_child_weight = c(1, 5),
  subsample = c(0.6, 1.0)
)

# train 함수를 사용한 모델 학습 및 파라미터 튜닝
set.seed(123)
xgb_tune <- train(
  x = credit_final[, !names(credit_final) %in% "default"],
  y = credit_final$default,
  method = "xgbTree",
  trControl = ctrl,
  tuneGrid = xgb_grid,
  metric = "ROC"
)

# 최적 파라미터 확인
print("Best Tuning Parameters:")
print(xgb_tune$bestTune)

# 교차 검증 결과 확인
print("Cross-validation Results:")
print(xgb_tune$results)

# 최종 모델의 변수 중요도 확인
importance <- varImp(xgb_tune)
print("Variable Importance:")
print(importance)

# 최종 모델의 성능 평가를 위한 데이터 분할
set.seed(123)
train_index <- createDataPartition(credit_final$default, p = 0.8, list = FALSE)
train_data <- credit_final[train_index, ]
test_data <- credit_final[-train_index, ]

# 최종 모델 예측
predictions_prob <- predict(xgb_tune, newdata = test_data[, !names(test_data) %in% "default"], type = "prob")
predictions_class <- predict(xgb_tune, newdata = test_data[, !names(test_data) %in% "default"])

# 혼동 행렬 생성
confusion_matrix <- confusionMatrix(predictions_class, test_data$default)
print("Confusion Matrix and Statistics:")
print(confusion_matrix)

# ROC 커브 그리기
library(pROC)
roc_obj <- roc(test_data$default, predictions_prob[,"Yes"])
plot(roc_obj, main = "ROC Curve")
auc_value <- auc(roc_obj)
cat("\nAUC:", auc_value, "\n")

# 최적의 파라미터 저장
best_params <- xgb_tune$bestTune
cat("\nBest Parameters:\n")
print(best_params)

# 성능 메트릭 계산
precision <- confusion_matrix$byClass["Pos Pred Value"]
recall <- confusion_matrix$byClass["Sensitivity"]
f1_score <- confusion_matrix$byClass["F1"]

cat("\nModel Performance Metrics:\n")
cat("Accuracy:", confusion_matrix$overall["Accuracy"], "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1 Score:", f1_score, "\n")
cat("AUC:", auc_value, "\n")

```

#### 3. lightgbm 으로 했을때 코드 

```r

# 필요한 라이브러리 로드
library(lightgbm)
library(caret)
library(dplyr)
library(pROC)

setwd("d:\\data")

# 데이터 준비
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)

# 범주형 변수를 factor로 변환
categorical_cols <- c("checking_balance", "credit_history", "purpose", 
                     "savings_balance", "employment_duration", "other_credit",
                     "housing", "job", "phone", "default")
credit[categorical_cols] <- lapply(credit[categorical_cols], as.factor)

# default 변수를 factor로 변환 (levels를 "No"와 "Yes"로 지정)
credit$default <- factor(ifelse(credit$default == "yes", "Yes", "No"), levels = c("No", "Yes"))

# 범주형 변수를 더미 변수로 변환
dummy_cols <- c("checking_balance", "credit_history", "purpose", 
                "savings_balance", "employment_duration", "other_credit",
                "housing", "job", "phone")

# 수치형 변수 선택
numeric_cols <- c("months_loan_duration", "amount", "percent_of_income",
                 "years_at_residence", "age", "existing_loans_count", "dependents")

# 전체 데이터에 대한 더미 변수 생성
credit_dummies <- model.matrix(~.-1, data = credit[dummy_cols])
credit_final <- cbind(data.frame(credit_dummies), credit[numeric_cols], default = credit$default)

# 교차 검증을 위한 trainControl 설정
ctrl <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE,
  classProbs = TRUE,
  summaryFunction = twoClassSummary
)

# LightGBM을 위한 파라미터 그리드 설정
lgb_grid <- expand.grid(
  num_leaves = c(20, 31, 50),
  max_depth = c(4, 6, 8),
  learning_rate = c(0.01, 0.05, 0.1),
  feature_fraction = c(0.7, 0.8, 0.9),
  bagging_fraction = c(0.7, 0.8, 0.9),
  min_data_in_leaf = c(10, 20, 30),
  num_iterations = 100  # 고정값
)

# 데이터를 lgb.Dataset 형식으로 변환하는 함수
prepare_lgb_data <- function(data, label) {
  lgb.Dataset(
    data = as.matrix(data),
    label = as.numeric(label) - 1,
    categorical_feature = NULL  # 이미 더미 변수로 변환했으므로 NULL
  )
}

# 하이퍼파라미터 튜닝을 위한 함수
train_lgb <- function(params, train_data, train_label, valid_data, valid_label) {
  dtrain <- prepare_lgb_data(train_data, train_label)
  dvalid <- prepare_lgb_data(valid_data, valid_label)
  
  model <- lgb.train(
    params = params,
    data = dtrain,
    valids = list(valid = dvalid),
    nrounds = params$num_iterations,
    verbose = 0
  )
  
  return(model)
}

# 기본 파라미터 설정
base_params <- list(
  objective = "binary",
  metric = "auc",
  num_iterations = 100
)

# 결과 저장을 위한 데이터프레임 초기화
results <- data.frame()

# 5-fold 교차 검증 준비
folds <- createFolds(credit_final$default, k = 5, list = TRUE)

# 그리드 서치 실행
set.seed(123)
for(i in 1:nrow(lgb_grid)) {
  params <- c(base_params, as.list(lgb_grid[i,]))
  cv_scores <- numeric(5)
  
  for(fold in 1:5) {
    # 훈련/검증 데이터 분할
    valid_idx <- folds[[fold]]
    train_idx <- unlist(folds[-fold])
    
    train_data <- credit_final[train_idx, !names(credit_final) %in% "default"]
    valid_data <- credit_final[valid_idx, !names(credit_final) %in% "default"]
    train_label <- credit_final$default[train_idx]
    valid_label <- credit_final$default[valid_idx]
    
    # 모델 학습
    model <- train_lgb(params, train_data, train_label, valid_data, valid_label)
    
    # 검증 세트에 대한 예측
    pred <- predict(model, as.matrix(valid_data))
    cv_scores[fold] <- auc(valid_label, pred)
  }
  
  # 결과 저장
  results <- rbind(results, 
                  data.frame(lgb_grid[i,], 
                            mean_auc = mean(cv_scores),
                            sd_auc = sd(cv_scores)))
}

# 최적 파라미터 찾기
best_params <- results[which.max(results$mean_auc), ]
print("Best Parameters:")
print(best_params)

# 최종 모델 학습을 위한 데이터 분할
set.seed(123)
train_idx <- createDataPartition(credit_final$default, p = 0.8, list = FALSE)
train_data <- credit_final[train_idx, ]
test_data <- credit_final[-train_idx, ]

# 최적 파라미터로 최종 모델 학습
final_params <- c(base_params, as.list(best_params[1:6]))
dtrain <- prepare_lgb_data(
  train_data[, !names(train_data) %in% "default"],
  train_data$default
)

final_model <- lgb.train(
  params = final_params,
  data = dtrain,
  nrounds = 100
)

# 변수 중요도 확인
importance <- lgb.importance(final_model)
print("Variable Importance:")
print(importance)

# 테스트 세트 예측
test_pred_prob <- predict(
  final_model,
  as.matrix(test_data[, !names(test_data) %in% "default"])
)
test_pred_class <- factor(ifelse(test_pred_prob > 0.5, "Yes", "No"), levels = c("No", "Yes"))

# 혼동 행렬 생성
confusion_matrix <- confusionMatrix(test_pred_class, test_data$default)
print("Confusion Matrix and Statistics:")
print(confusion_matrix)

# ROC 커브 그리기
roc_obj <- roc(test_data$default, test_pred_prob)
plot(roc_obj, main = "ROC Curve")
auc_value <- auc(roc_obj)

# 성능 메트릭 출력
cat("\nModel Performance Metrics:\n")
cat("Accuracy:", confusion_matrix$overall["Accuracy"], "\n")
cat("Precision:", confusion_matrix$byClass["Pos Pred Value"], "\n")
cat("Recall:", confusion_matrix$byClass["Sensitivity"], "\n")
cat("F1 Score:", confusion_matrix$byClass["F1"], "\n")
cat("AUC:", auc_value, "\n")

# 변수 중요도 시각화
lgb.plot.importance(importance)

```





