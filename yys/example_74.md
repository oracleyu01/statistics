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

## 빅데이터분석기사 문제 정리

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
