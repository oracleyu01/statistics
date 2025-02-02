# 📌 예제 67: 로지스틱 회귀 (p326)

## 📚 관련 자료
- [로지스틱 회귀 개요](https://cafe.daum.net/oracleoracle/Sotv/707)
- [로지스틱 오차 함수 관련 수업](https://cafe.daum.net/oracleoracle/Sotv/709)
- [R 코드](https://cafe.daum.net/oracleoracle/Sotv/708)

## 🔍 로지스틱 회귀 개요
로지스틱 회귀의 오차 함수는 **시그모이드 함수**를 이용해서 만들어졌습니다.

### ✨ 핵심 개념
- 로지스틱 회귀의 오차 함수를 이해하려면 **로그 함수의 성질**을 알아야 합니다.
- 모델의 기본 개념과 수학적 원리는 별도의 프린트물로 수업 진행됨.

---

## 📌 로지스틱 회귀 모델을 R로 구현하기

### 📌 R 내장 데이터셋 `mtcars` 사용
```r
# 데이터 불러오기
data(mtcars)

# 데이터 확인
head(mtcars)
```
**데이터 설명:** 32종의 자동차에 대한 속성을 포함하고 있으며, 자동차의 연비와 성능 관련 정보를 담고 있습니다.

---

## 🔍 로지스틱 회귀 모델 생성
```r
# 로지스틱 회귀 모델 생성
model <- glm(am ~ mpg + wt + hp, data = mtcars, family = binomial)
```
### 📌 변수 설명
- **종속변수:** `am` (변속기 형태: 0 = automatic, 1 = manual)
- **독립변수:** `mpg` (연비), `wt` (차량 무게), `hp` (마력)
- 10개의 독립변수 중 **3개만** 사용하여 로지스틱 회귀 모델을 생성

### 📌 독립변수 포함 방식 (빅데이터 분석 필기 시험 대비)
1. **단계적 제거 (Backward Elimination)**: 처음 모든 변수를 넣고 불필요한 변수를 제거하는 방식
2. **단계적 추가 (Forward Selection)**: 처음 소수의 변수를 넣고 성능을 보며 추가하는 방식

**참고:** `family = binomial`은 로지스틱 회귀 모델을 의미합니다. (옵션: `gaussian`, `poisson`, `Gamma`)

---

## 📌 모델 분석 및 성능 평가

### 📌 모델 요약
```r
summary(model)
```
**결과:** `wt` 변수만이 통계적으로 유의한 변수로 나옴.

### 📌 모델 계수 해석
```r
coef(model)
```
출력 결과:
```r
 (Intercept)          mpg           wt           hp
-15.72137053   1.22930209  -6.95492382   0.08389345
```
회귀식:
$$ y = -15.7213 + 1.2293 \times x_1 - 6.9549 \times x_2 + 0.0839 \times x_3 $$

### 📌 예측값 계산
```r
predicted_probabilities <- predict(model, type = "response")
```
훈련 데이터에 대한 예측 확률 출력.

### 📌 예측값 확인
```r
head(predicted_probabilities)
```

### 📌 실제 클래스로 변환
```r
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)
```
**기준:** 예측 확률이 `0.5`보다 크면 `1`, 작으면 `0`으로 분류.

### 📌 혼동 행렬 계산
```r
table(Predicted = predicted_classes, Actual = mtcars$am)
```
결과: **거의 모든 값을 맞췄으나 2개가 틀림.**

### 📌 정확도 계산
```r
accuracy <- mean(predicted_classes == mtcars$am)
accuracy
```
출력 결과: **0.937 (93.7%)**

---

## 📌 모델 성능 향상
로지스틱 회귀에는 **KNN의 K 값과 같은 하이퍼파라미터가 없음.**  
👉 성능 향상을 위해 **독립변수의 개수를 늘리는 방법** 사용.

### 📌 개선된 모델 생성
```r
model2 <-  glm(am ~ mpg + wt + hp + cyl + drat + vs + gear +carb,
                      data=mtcars, family=binomial)
```

### 📌 예측값 계산
```r
predicted_probabilities2 <- predict(model2, type = "response")
```
훈련 데이터에 대한 예측 확률 출력.

### 📌 예측값 확인
```r
head(predicted_probabilities2)
```

### 📌 실제 클래스로 변환
```r
predicted_classes2 <- ifelse(predicted_probabilities2 > 0.5, 1, 0)
```

### 📌 혼동 행렬 계산
```r
table(Predicted = predicted_classes2, Actual = mtcars$am)
```
결과: **거의 모든 값을 맞췄으나 2개가 틀림.**

### 📌 정확도 계산
```r
accuracy <- mean(predicted_classes2 == mtcars$am)
accuracy
```
출력 결과: **100% 정확도** 🎯

---

## 📌 로지스틱 회귀의 한계 및 대안 모델
### ❌ 로지스틱 회귀 단점
1. 모델의 복잡도가 증가하면 과적합 위험
2. 이상치(Outlier)와 노이즈 데이터에 민감

### ✅ 대안 모델
- **서포트 벡터 머신 (SVM)**: 비선형 관계를 잘 표현 가능
- **랜덤 포레스트 (Random Forest)**: 이상치와 노이즈에 강한 성능 제공

---

📌 **추가 학습을 원하면 서포트 벡터 머신(SVM) 또는 랜덤 포레스트(Random Forest) 모델을 활용해보세요!** 🚀   

---

## 📌 랜덤 포레스트 모델로 종속변수 예측 (문제)

### 📌 문제 정의
**랜덤 포레스트 모델을 사용하여 독립변수 3개(mpg, wt, hp)로 종속변수(am)를 예측하고 훈련 데이터의 정확도를 계산합니다.**

### 📌 코드 구현
```r
library(randomForest) 
set.seed(123)

# 랜덤 포레스트 모델 생성
model_rf <- randomForest(as.factor(am) ~ mpg + wt + hp, data=mtcars, ntree=500)

# 예측값 계산
result <- predict(model_rf, mtcars)

# 예측값 확인
head(result)

# 혼동 행렬(confusion matrix) 계산
table(Predicted = result, Actual = mtcars$am)

# 모델 성능 평가 (정확도 계산)
accuracy <- mean(result == mtcars$am)
accuracy
```

---

## 📌 로지스틱 회귀 모델 (문제)

### 📌 문제 정의
**binary.csv 데이터를 사용하여 `admit`을 종속변수로 하는 로지스틱 회귀 모델을 생성합니다. 독립변수는 `gpa`와 `rank`입니다.**

### 📌 코드 구현
```r
# 데이터 불러오기
mydata <- read.csv("c:\\data\\binary.csv", header=T)
head(mydata)

# 훈련과 테스트 데이터 분할 (8:2 비율)
library(caret)
set.seed(123)
k <- createDataPartition(mydata$admit, p=0.8, list=FALSE)
train_data <- mydata[k, ]
test_data <- mydata[-k, ]
nrow(train_data)   # 320
nrow(test_data)    # 80

# 로지스틱 회귀 모델 생성
model <- glm(admit ~ gpa + rank, data=train_data, family=binomial)
summary(model)
coef(model)

# 훈련 데이터 예측
train_pred <- predict(model, train_data, type="response")
train_pred_class <- ifelse(train_pred > 0.5, 1, 0)
head(train_pred_class)

# 테스트 데이터 예측
test_pred <- predict(model, test_data, type="response")
test_pred_class <- ifelse(test_pred > 0.5, 1, 0)

# 정확도 계산
train_accuracy <- mean(train_pred_class == train_data$admit)
test_accuracy <- mean(test_pred_class == test_data$admit)

train_accuracy  # 0.728125
test_accuracy   # 0.7125
```

---

## 📌 독립변수 추가하여 성능 확인 (문제 190)

### 📌 문제 정의
**로지스틱 회귀 모델에 독립변수 `gre`를 추가하여 모델 성능이 향상되는지 확인합니다.**

### 📌 코드 구현
```r
# 데이터 불러오기
mydata <- read.csv("c:\\data\\binary.csv", header=T)
head(mydata)

# 훈련과 테스트 데이터 분할 (8:2 비율)
library(caret)
set.seed(123)
k <- createDataPartition(mydata$admit, p=0.8, list=FALSE)
train_data <- mydata[k, ]
test_data <- mydata[-k, ]

# 로지스틱 회귀 모델 생성 (독립변수 추가)
model2 <- glm(admit ~ gpa + gre + rank, data=train_data, family=binomial)
summary(model2)
coef(model2)

# 훈련 데이터 예측
train_pred2 <- predict(model2, train_data, type="response")
train_pred_class2 <- ifelse(train_pred2 > 0.5, 1, 0)
head(train_pred_class2)

# 테스트 데이터 예측
test_pred2 <- predict(model2, test_data, type="response")
test_pred_class2 <- ifelse(test_pred2 > 0.5, 1, 0)

# 정확도 계산
train_accuracy <- mean(train_pred_class2 == train_data$admit)
test_accuracy <- mean(test_pred_class2 == test_data$admit)

train_accuracy
test_accuracy
```

---



