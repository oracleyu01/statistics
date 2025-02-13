## ▣ 예제74. 앙상블

## 1. K-폴드 교차검증 (10-폴드)

[이론ppt](https://gamma.app/docs/k--ighwhjes460otkm?mode=doc)

### 1️⃣ 예제1. iris 데이터를 분류하는 의사결정 트리 모델 생성
```r
# 예제1. iris 데이터를 분류하는 의사결정 트리 모델을 생성하는데
#  훈련과 테스트를 미리 9대 1로 나누고 
#  훈련 데이터만 가지고 K-holdout 교차 검정을 해서 모델을 만들고
#  평가하시오 !


# 필요한 패키지 설치 및 로드
install.packages("C50")
install.packages("caret")
library(C50)
library(caret)

# 데이터 불러오기
iris <- read.csv("c:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 80:20으로 훈련(train) / 테스트(test) 세트 분할
set.seed(123)  # 재현성을 위한 시드 설정
train_idx <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train_data <- iris[train_idx, ]
test_data  <- iris[-train_idx, ]  # 테스트 데이터 (20%)
dim(train_data)
dim(test_data)

# 10-Fold 교차 검정 설정 (훈련 데이터에서 수행)
control <- trainControl(method = "cv", number = 10)  # 10-Fold Cross Validation


# C5.0 모델 학습 (훈련 데이터만 사용)
model <- train(Species ~ ., data = train_data, 
               method = "C5.0", 
               trControl = control,
               tuneGrid=expand.grid(trials=3, model='tree',
                                    winnow=FALSE))
# 모든 변수를 다 사용해서 학습하겠다. 
# 불필요한 변수를 제거해서 학습하려면 winnow=TRUE 


# 모델 성능 평가 (테스트 데이터에서 예측)
test_data[ ,-5]
predictions <- predict(model, test_data[ ,-5])
predictions
# 성능 지표 출력
conf_mat <- confusionMatrix(predictions, test_data$Species)
print(conf_mat)  # 0.9

# 훈련 데이틔 정확도 

predictions2 <- predict(model, train_data[ ,-5])
predictions2
# 성능 지표 출력
conf_mat2 <- confusionMatrix(predictions2, train_data$Species)
print(conf_mat2)

```

### 문제. k-holdout 교차검정을 해서 wine 데이터를 분류하는 머신러닝 모델을 생성하시오 !

```r

wine <- read.csv("c:\\data\\wine2.csv", stringsAsFactors =T)
head(wine)
dim(wine)

# C5.0 모델 학습 (훈련 데이터만 사용)
model <- train(Species ~ ., data = train_data, 
               method = "C5.0",   #<--- 다른 모델을 넣어서 학습 
               trControl = control,
               tuneGrid=expand.grid(trials=3, model='tree',
                                    winnow=FALSE))

# chatgpt 에게 method를 서포트 벡터머신으로 해서 스크립트 만들어줘

method = 'svmRadial'

```


## 📌 머신러닝 모델 검증 및 평가 기출문제  

### **📅 2024년 상반기 기출문제**  
#### **Q1. 데이터를 학습용(Training set)과 검증용(Validation set), 평가용(Test set)으로 나누는 방법 중 가장 올바른 것은?**  

1. 학습용 60%, 검증용 20%, 평가용 20%로 나눈다  
2. 학습용 90%, 검증용 5%, 평가용 5%로 나눈다  
3. 학습용 40%, 검증용 30%, 평가용 30%로 나눈다  
4. 학습용 80%, 검증용 10%, 평가용 10%로 나눈다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 1번. 학습용 60%, 검증용 20%, 평가용 20%로 나눈다**  
일반적으로 데이터는 **훈련(Training) 60~80%, 검증(Validation) 10~20%, 평가(Test) 10~20%**의 비율로 나눕니다.  
검증 데이터는 하이퍼파라미터 튜닝 및 모델 최적화를 위해 사용되며, 평가 데이터는 최종 성능 측정을 위해 사용됩니다.

</details>

---

### **📅 2023년 하반기 기출문제**  
#### **Q2. K-겹 교차검증(K-fold Cross Validation)에 대한 설명으로 옳지 않은 것은?**  

1. 전체 데이터를 K개의 부분집합으로 나눈다  
2. K-1개의 부분집합은 학습에 사용하고, 1개는 검증에 사용한다  
3. 모든 데이터가 한 번씩 검증 데이터로 사용된다  
4. K값이 작을수록 더 정확한 성능 평가가 가능하다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 4번. K값이 작을수록 더 정확한 성능 평가가 가능하다**  
K-겹 교차검증에서 K값이 너무 작으면 모델 평가의 신뢰도가 떨어질 수 있습니다.  
보통 K=5 또는 K=10이 적절하며, K값이 클수록 모델 평가가 안정적이지만 계산량이 증가할 수 있습니다.

</details>

---

### **📅 2023년 상반기 기출문제**  
#### **Q3. Hold-out 방식의 특징으로 가장 적절하지 않은 것은?**  

1. 데이터를 훈련용과 테스트용으로 분리한다  
2. 데이터가 충분히 많을 때 사용하기 적합하다  
3. 모든 데이터가 한 번씩 테스트 데이터로 사용된다  
4. 한 번의 평가만으로 모델의 성능을 측정한다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 3번. 모든 데이터가 한 번씩 테스트 데이터로 사용된다**  
Hold-out 방식은 데이터를 훈련용과 테스트용으로 한 번만 분리하는 방식이며, 일부 데이터만 테스트 데이터로 사용됩니다.  
모든 데이터가 테스트로 사용되는 것은 **K-겹 교차검증(K-fold Cross Validation)** 방식의 특징입니다.

</details>


---

## 2. 앙상블 학습 (배깅 & 부스팅)   

[이론 그림들](https://cafe.daum.net/oracleoracle/Sq3w/124) 


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

## 1. 단일 의사결정트리 모델

```R


# 필요한 패키지 설치 및 로드
install.packages("C50")
install.packages("caret")
library(C50)
library(caret)

# 데이터 불러오기
iris <- read.csv("d:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 80:20으로 훈련(train) / 테스트(test) 세트 분할
set.seed(123)  # 재현성을 위한 시드 설정
train_idx <- createDataPartition(iris$Species, p = 0.9, list = FALSE)
train_data <- iris[train_idx, ]
test_data  <- iris[-train_idx, ]  # 테스트 데이터 (20%)
dim(train_data)
dim(test_data)

# 10-Fold 교차 검정 설정 (훈련 데이터에서 수행)
control <- trainControl(method = "cv", number = 10)  # 10-Fold Cross Validation


# C5.0 모델 학습 (훈련 데이터만 사용)
model <- train(Species ~ ., data = train_data, 
               method = "C5.0", 
               trControl = control,
               tuneGrid=expand.grid(trials=3, model='tree',
                                    winnow=FALSE))
# 모든 변수를 다 사용해서 학습하겠다. 
# 불필요한 변수를 제거해서 학습하려면 winnow=TRUE 


# 모델 성능 평가 (테스트 데이터에서 예측)
test_data[ ,-5]
predictions <- predict(model, test_data[ ,-5])
predictions
# 성능 지표 출력
conf_mat <- confusionMatrix(predictions, test_data$Species)
print(conf_mat)  

# 훈련 데이틔 정확도 

predictions2 <- predict(model, train_data[ ,-5])
predictions2
# 성능 지표 출력
conf_mat2 <- confusionMatrix(predictions2, train_data$Species)
print(conf_mat2)



```

## 2. 배깅(Bagging) 모델

```R
# 필요한 패키지 설치 및 로드
install.packages("ipred")
install.packages("caret")
library(ipred)
library(caret)

# 데이터 불러오기
iris <- read.csv("d:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 80:20으로 훈련(train) / 테스트(test) 세트 분할
set.seed(123)  # 재현성을 위한 시드 설정
train_idx <- createDataPartition(iris$Species, p = 0.9, list = FALSE)
train_data <- iris[train_idx, ]
test_data  <- iris[-train_idx, ]
dim(train_data)
dim(test_data)

# 10-Fold 교차 검증 설정
control <- trainControl(method = "cv", 
                        number = 10)  # 10-Fold Cross Validation

# 배깅 모델 학습 (caret의 treebag 메소드 사용)
model <- train(Species ~ ., 
               data = train_data,
               method = "treebag",  # 배깅 메소드
               trControl = control,
               nbagg = 25)  # 25개의 의사결정나무 생성

# 테스트 데이터 예측
predictions <- predict(model, test_data[,-5])

# 테스트 데이터 성능 지표 출력
conf_mat <- confusionMatrix(predictions, test_data$Species)
print(conf_mat)

# 훈련 데이터 예측
predictions2 <- predict(model, train_data[,-5])

# 훈련 데이터 성능 지표 출력
conf_mat2 <- confusionMatrix(predictions2, train_data$Species)
print(conf_mat2)

# 교차 검증 결과 확인
print(model)


```

[부스팅_이론설명_그림](https://cafe.daum.net/oracleoracle/Sq3w/125)  

## 3. 부스팅(Boosting) 모델

```R
# 필요한 패키지 설치 및 로드
install.packages("gbm")
install.packages("caret")
library(gbm)
library(caret)

# 데이터 불러오기
iris <- read.csv("d:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 80:20으로 훈련(train) / 테스트(test) 세트 분할
set.seed(123)  # 재현성을 위한 시드 설정
train_idx <- createDataPartition(iris$Species, p = 0.9, list = FALSE)
train_data <- iris[train_idx, ]
test_data  <- iris[-train_idx, ]
dim(train_data)
dim(test_data)

# 10-Fold 교차 검증 설정
control <- trainControl(method = "cv", 
                        number = 10)  # 10-Fold Cross Validation

# 부스팅 모델의 튜닝 파라미터 그리드 설정
grid <- expand.grid(n.trees = c(100, 150),           # 트리의 개수
                    interaction.depth = c(3, 4),       # 트리의 깊이
                    shrinkage = c(0.1),               # 학습률
                    n.minobsinnode = c(10))           # 말단 노드의 최소 관측치 수

# 부스팅 모델 학습
model <- train(Species ~ ., 
               data = train_data,
               method = "gbm",  # Gradient Boosting Machine
               trControl = control,
               tuneGrid = grid,
               verbose = FALSE)  # 학습 과정 출력 억제

# 테스트 데이터 예측
predictions <- predict(model, test_data[,-5])

# 테스트 데이터 성능 지표 출력
conf_mat <- confusionMatrix(predictions, test_data$Species)
print(conf_mat)

# 훈련 데이터 예측
predictions2 <- predict(model, train_data[,-5])

# 훈련 데이터 성능 지표 출력
conf_mat2 <- confusionMatrix(predictions2, train_data$Species)
print(conf_mat2)

# 최적의 모델 파라미터와 성능 확인
print(model)

# 변수 중요도 확인
plot(varImp(model))


```

## 4. 랜덤 포레스트 모델

```r
# 필요한 패키지 설치 및 로드
install.packages("randomForest")
install.packages("caret")
library(randomForest)
library(caret)

# 데이터 불러오기
iris <- read.csv("c:\\data\\iris2.csv", stringsAsFactors = TRUE)

# 80:20으로 훈련(train) / 테스트(test) 세트 분할
set.seed(123)  # 재현성을 위한 시드 설정
train_idx <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train_data <- iris[train_idx, ]
test_data  <- iris[-train_idx, ]
dim(train_data)
dim(test_data)

# 10-Fold 교차 검증 설정
control <- trainControl(method = "cv", 
                       number = 10)  # 10-Fold Cross Validation

# 랜덤 포레스트 튜닝 파라미터 설정
grid <- expand.grid(mtry = c(2, 3, 4))  # 각 분할에서 사용할 변수 개수

# 랜덤 포레스트 모델 학습
model <- train(Species ~ ., 
              data = train_data,
              method = "rf",  # Random Forest
              trControl = control,
              tuneGrid = grid,
              ntree = 500)    # 생성할 트리의 개수

# 테스트 데이터 예측
predictions <- predict(model, test_data[,-5])

# 테스트 데이터 성능 지표 출력
conf_mat <- confusionMatrix(predictions, test_data$Species)
print(conf_mat)

# 훈련 데이터 예측
predictions2 <- predict(model, train_data[,-5])

# 훈련 데이터 성능 지표 출력
conf_mat2 <- confusionMatrix(predictions2, train_data$Species)
print(conf_mat2)

# 최적의 모델 파라미터와 성능 확인
print(model)

# 변수 중요도 확인
plot(varImp(model))

```

# 🌲 랜덤 포레스트 mtry 파라미터 설명

## 📌 기본 개념
`mtry`는 트리의 각 분할(split)에서 고려할 변수의 개수를 의미합니다.

## 💡 쉬운 비유
마치 문제를 풀 때:
- mtry=2: 2개의 힌트만 보고 답을 추측
- mtry=3: 3개의 힌트를 보고 답을 추측
- mtry=4: 4개의 힌트를 모두 보고 답을 추측

## 🎯 예시: 집값 예측
전체 변수가 4개라고 가정:
- 평수
- 층수
- 역세권
- 건축연도

### mtry=2인 경우
- 각 분할에서 4개 변수 중 2개만 랜덤 선택
- 예: "평수와 층수만 보고 결정" 또는 "역세권과 건축연도만 보고 결정"

### mtry=3인 경우
- 각 분할에서 4개 변수 중 3개 선택
- 예: "평수, 층수, 역세권을 보고 결정"

### mtry=4인 경우
- 모든 변수를 다 사용
- "모든 정보를 다 보고 결정"

## ✨ 특징
- 값이 작을수록: 트리들이 더 다양해짐 (일반화 성능 ↑)
- 값이 클수록: 더 정확한 개별 예측 가능 (과적합 위험 ↑)

#### 핵심 요약 자료에 관련된 내용을 먼저 보고 아래의 문제를 풉니다. 

## 📌 머신러닝 앙상블 학습 기출문제  

### **📅 2024년 상반기 기출문제**  
#### **Q1. 랜덤 포레스트(Random Forest)에 대한 설명으로 옳지 않은 것은?**  

1. 배깅(Bagging)을 기반으로 한 앙상블 학습 방법이다  
2. 각 트리 생성 시 모든 특성을 사용한다  
3. 과적합을 줄일 수 있는 장점이 있다  
4. 여러 개의 의사결정나무를 생성하여 다수결로 최종 결과를 도출한다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 2번. 각 트리 생성 시 모든 특성을 사용한다**  
랜덤 포레스트는 **각 트리를 생성할 때 랜덤하게 일부 특성을 선택**하여 훈련하는 것이 특징입니다.  
이는 모델의 다양성을 증가시키고 과적합을 방지하는 데 도움을 줍니다.

</details>

---

### **📅 2023년 하반기 기출문제**  
#### **Q2. 부스팅(Boosting) 알고리즘의 특징으로 가장 적절한 것은?**  

1. 이전 모델이 잘못 예측한 데이터에 더 높은 가중치를 부여한다  
2. 각 모델은 서로 독립적으로 학습된다  
3. 모든 모델의 예측 결과를 단순 평균한다  
4. 데이터를 임의 복원추출하여 학습한다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 1번. 이전 모델이 잘못 예측한 데이터에 더 높은 가중치를 부여한다**  
부스팅은 이전 모델이 틀린 데이터에 가중치를 더 부여하여 점진적으로 개선하는 방식입니다.  
이로 인해 약한 학습기를 결합하여 강력한 모델을 생성할 수 있습니다.

</details>

---

### **📅 2023년 상반기 기출문제**  
#### **Q3. 배깅(Bagging)에 대한 설명으로 옳은 것은?**  

1. 약한 학습기를 순차적으로 학습시킨다  
2. 오분류된 데이터에 가중치를 부여한다  
3. 부트스트랩 샘플링을 통해 여러 개의 훈련 데이터셋을 생성한다  
4. 특성 선택 시 모든 특성을 반드시 사용해야 한다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 3번. 부트스트랩 샘플링을 통해 여러 개의 훈련 데이터셋을 생성한다**  
배깅(Bagging)은 **부트스트랩 샘플링**을 사용하여 여러 개의 훈련 데이터셋을 생성한 후,  
각 학습기에서 독립적으로 모델을 학습하고 이를 결합하여 최종 결과를 도출하는 방식입니다.

</details>

---

## XGBoost와 LightGBM 설명 및 실습

### XGBoost (eXtreme Gradient Boosting)
XGBoost는 gradient boosting framework의 구현체로, 다음과 같은 특징을 가집니다:

- 병렬 처리를 통한 빠른 수행 속도
- 과적합 방지를 위한 정규화 포함
- 트리 가지치기 기능
- 결측치 자체 처리 기능

# XGBoost와 LightGBM 설명 및 실습

## XGBoost (eXtreme Gradient Boosting)

XGBoost는 gradient boosting framework의 구현체로, 다음과 같은 특징을 가집니다:

* 병렬 처리를 통한 빠른 수행 속도
* 과적합 방지를 위한 정규화 포함 
* 트리 가지치기 기능
* 결측치 자체 처리 기능

## 📌 XGBoost vs LightGBM 예측 과정 비교

### 📍 초기 상황 예측하려는 아파트 정보:

실제 가격: 5억원
평수: 32평
층수: 13층
지하철역까지 거리: 500m (역세권)
건축연도: 2018년
학군: 상위 10%
주차: 세대당 1.2대

### 📍 XGBoost 예측 과정

#### 1단계 - 평수로 나누기 [전체 데이터를 평수로 그룹 나눔]

* 30평 미만: 3.5억원
* 30-40평: 4억원 ← 우리 아파트 
* 40평 이상: 4.8억원

첫 예측: 4억원 (실제가격과 차이: -1억원)

#### 2단계 - 역세권 반영 [모든 평수 그룹을 역세권으로 다시 나눔]
30-40평 그룹에서:
* 역세권: +7000만원 ← 우리 아파트
* 비역세권: +3000만원

두 번째 예측: 4억원 + 7000만원 = 4.7억원 (실제가격과 차이: -3000만원)

#### 3단계 - 층수 반영 [모든 그룹을 층수로 나눔]
30-40평 & 역세권 그룹에서:
* 10층 이상: +2000만원 ← 우리 아파트
* 10층 미만: +1000만원

세 번째 예측: 4.7억원 + 2000만원 = 4.9억원 (실제가격과 차이: -1000만원)

### 📍 LightGBM 예측 과정

#### 1단계 - 평수로 나누기 [전체 데이터를 평수로 그룹 나눔]
* 30평 미만: 3.5억원
* 30-40평: 4.5억원 ← 우리 아파트
* 40평 이상: 4.8억원

첫 예측: 4.5억원 (실제가격과 차이: -5000만원)

#### 2단계 - 가장 오차 큰 그룹만 역세권으로 나누기 [30-40평 그룹만 역세권으로 나눔]
* 역세권: 4.8억원 ← 우리 아파트
* 비역세권: 4.3억원

두 번째 예측: 4.8억원 (실제가격과 차이: -2000만원)

#### 3단계 - 다시 오차 큰 그룹만 층수로 나누기 [30-40평 & 역세권 그룹만 층수로 나눔]
* 10층 이상: 4.9억원 ← 우리 아파트
* 10층 미만: 4.7억원

세 번째 예측: 4.9억원 (실제가격과 차이: -1000만원)

### 📍 두 방식의 차이점 비교

1. **초기 예측의 차이**
  * XGBoost: 4억원으로 시작 (-1억원 차이)
  * LightGBM: 4.5억원으로 시작 (-5000만원 차이)

2. **분석 방식의 차이**
  * XGBoost:
    * 매번 모든 그룹을 나눔
    * 예: 4억 → 4.7억 → 4.9억
    * 천천히 정확하게 접근
  * LightGBM:
    * 오차가 큰 그룹만 나눔
    * 예: 4.5억 → 4.8억 → 4.9억
    * 빠르게 대략적으로 접근

3. **최종 결과**
  * 둘 다 4.9억원으로 예측
  * 실제 가격 5억원과 -1000만원 차이
  * 하지만 도달하는 과정이 다름

### 📍 이해하기 쉬운 비유

**XGBoost:**
* 마치 등산할 때 모든 등산객이 같이 이동하는 것
* 느리지만 안전하고 실수가 적음

**LightGBM:**
* 마치 잘 못가는 등산객만 도와가며 이동하는 것
* 빠르지만 위험할 수 있고 실수할 수 있음

이런 식으로 두 알고리즘은 같은 목표(정확한 예측)를 향해 다른 방식으로 접근합니다. **XGBoost는 더 신중하고, LightGBM은 더 효율적인 방식**을 택하고 있습니다.

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
  
## 📌 LightGBM & XGBoost 기출문제  

### **📅 2024년 상반기 기출문제**  
#### **Q1. LightGBM의 특징으로 옳지 않은 것은?**  

1. Leaf-wise 방식으로 트리를 생성한다  
2. XGBoost에 비해 상대적으로 학습 속도가 빠르다  
3. 메모리 사용량이 적은 편이다  
4. 적은 데이터셋에서 더 좋은 성능을 보인다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 4번. 적은 데이터셋에서 더 좋은 성능을 보인다**  
LightGBM은 **대량의 데이터에서 성능이 뛰어난** 알고리즘으로, 작은 데이터셋에서는 과적합이 발생할 가능성이 높습니다.  
또한, **Leaf-wise 성장 방식**을 사용하여 불균형한 트리를 만들기 때문에 훈련 속도가 빠르지만,  
적은 데이터에서는 오버피팅의 위험이 커질 수 있습니다.

</details>

---

### **📅 2023년 하반기 기출문제**  
#### **Q2. XGBoost에 대한 설명으로 가장 적절한 것은?**  

1. Level-wise 방식으로 트리를 생성한다  
2. 과적합을 방지하기 위한 정규화 항이 없다  
3. CPU 멀티스레딩을 지원하지 않는다  
4. 결측치 처리가 불가능하다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 1번. Level-wise 방식으로 트리를 생성한다**  
XGBoost는 **Level-wise 방식**을 사용하여 균형 잡힌 트리를 성장시키므로,  
Leaf-wise 방식을 사용하는 LightGBM보다 과적합 위험이 적습니다.  
또한 **L1/L2 정규화 항을 포함**하여 과적합을 방지하고,  
CPU 멀티스레딩을 지원하며, 결측치를 자동으로 처리하는 기능도 갖추고 있습니다.

</details>

---

### **📅 2023년 상반기 기출문제**  
#### **Q3. LightGBM과 XGBoost의 차이점으로 옳은 것은?**  

1. LightGBM은 Level-wise, XGBoost는 Leaf-wise 방식을 사용한다  
2. LightGBM은 Leaf-wise, XGBoost는 Level-wise 방식을 사용한다  
3. 두 알고리즘 모두 동일한 트리 생성 방식을 사용한다  
4. 두 알고리즘 모두 결측치 처리가 불가능하다  

<details>
<summary><b>정답 보기</b></summary>

**정답: 2번. LightGBM은 Leaf-wise, XGBoost는 Level-wise 방식을 사용한다**  
LightGBM은 **Leaf-wise 방식**으로 트리를 생성하여 깊이가 깊어질 수 있지만 빠른 학습 속도를 제공합니다.  
반면, XGBoost는 **Level-wise 방식**을 사용하여 트리를 균형 있게 성장시키며 과적합을 방지하는 효과가 있습니다.

</details>

---

