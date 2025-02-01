
### 🎯 예제63. 나이브 베이즈 모델의 성능을 높이는 하이퍼 파라미터

### 📌 라플라스 추정기 적용
P(스팸 |  비아그라  ∩ ￢ 돈   ∩  식료품 ∩  구독취소) = ?

```{r}
P(비아그라|스팸) * P(￢ 돈 |스팸) * P(식료품 | 스팸) * P(구독취소|스팸) * P(스팸)   =  0  
4/20 * 10/20 * 0/20 * 12/20 * 20/100
```

### 🛠 라플라스 값을 사용하여 계산 가능하도록 수정
```{r}
P(비아그라|스팸) * P(돈 |스팸) * P(식료품 | 스팸) * P(구독취소|스팸) * P(스팸)   =   ? 
5/24 * 11/24 * 1/24 * 13/24 * 20/100

P(비아그라|햄) * P(돈 |햄) * P(식료품 | 햄) * P(구독취소|햄) * P(햄)   =  ?
2/84 * 15/84 * 9/84 * 24/84 * 80/100
```

### 📌 나이브 베이즈 모델의 성능을 높이기 위한 하이퍼파라미터
laplace 값을 0.001 ~ 0.1 사이의 작은 값으로 설정하여 모델의 성능을 향상시킬 수 있음

### 🎯 나이브 베이즈 머신러닝을 이용하여 버섯 종류 분류

#### 1. 데이터 불러오기
```{r}
mush <- read.csv("c:\\data\\mushrooms.csv", stringsAsFactors=TRUE)
head(mush)
```

#### 2. 데이터 탐색
```{r}
prop.table(table(mush$type))
```

#### plotly를 사용한 시각화
```{r}
library(plotly)
colors <- c("lightgreen", "red")
fig <- plot_ly(labels = names(prop.table(table(mush$type))), 
               values = as.numeric(prop.table(table(mush$type))), 
               type = 'pie', 
               marker = list(colors = colors))
fig
```

#### 3. 훈련 데이터와 테스트 데이터 분리
```{r}
library(caret)
set.seed(1)
k <- createDataPartition(mush$type, p=0.8, list=FALSE)
train_data <- mush[k, ]
test_data <- mush[-k, ]
```

#### 4. 모델 학습
```{r}
library(e1071)
model <- naiveBayes(type ~ ., data=train_data)
model
```

#### 5. 모델 예측
```{r}
result <- predict(model, test_data[, -1])
```

#### 6. 모델 평가
```{r}
sum(result == test_data[, 1]) / length(test_data[, 1]) * 100
library(gmodels)
CrossTable(x=result, y=test_data[, 1], chisq=TRUE)
```

#### 7. 모델 성능 개선 (라플라스 값 적용)
```{r}
model2 <- naiveBayes(type ~ ., data=train_data, laplace=0.0001)
result2 <- predict(model2, test_data[, -1])

sum(result2 == test_data[, 1]) / length(test_data[, 1]) * 100
CrossTable(x=result2, y=test_data[, 1], chisq=TRUE)
```

#### 8. 하이퍼파라미터 최적화
```{r}
options(scipen=999)
y <- 0
jumpby <- 0.00001

for (i in 1:10) {
  y <- y + jumpby
  model2 <- naiveBayes(type ~ ., data=train_data, laplace=y) 
  result2 <- predict(model2, test_data[, -1])
  
  ct <- capture.output(a <- CrossTable(x=result2, y=test_data[, 1], print.chisq = FALSE))
  
  fn_value <- a$t[1, 2]
  accuracy <- sum(result2 == test_data[, 1]) / length(test_data[, 1]) * 100
  
  print(paste(y, '일때 FN 값', fn_value, '정확도는', accuracy))
}

### 🎯 문제 1: 독감 데이터로 나이브 베이즈 모델 생성

### 📌 1. 데이터 로드
```r
flu <- read.csv("c:\\data\\flu.csv", stringsAsFactors=TRUE)
str(flu)
```

**📌 데이터 소개:**
- `patient_id` : 환자번호
- `chills` : 오한 여부 (`Y/N`)
- `runny_nose` : 콧물 여부 (`Y/N`)
- `headache` : 두통 정도 (`MILD/SEVERE`)
- `fever` : 열 여부 (`Y/N`)
- `flue` : 독감 여부 (`Y/N`)

---

### 📌 2. 나이브 베이즈 모델 생성
```r
library(e1071)

# 독감 여부 예측을 위한 모델 생성
model_flu <- naiveBayes(flu[, -6], flu[, 6], laplace=0.0001)
model_flu
```

---

### ✏ 3. 예측 수행 (쪽지시험)
```r
test_data2 <- data.frame(chills='Y', runny_nose='N', headache='MILD', fever='Y')

result2 <- predict(model_flu, test_data2)
result2  # 독감 여부 예측
```
✅ **결과:** 독감환자 예측됨

---

### 📌 4. 확률 출력 (라플라스 적용)
```r
library(naivebayes)

# 확률을 함께 예측하는 모델 생성
new_model <- naive_bayes(flue ~ ., data=flu[, -1], laplace=0.00001)
new_model

test_data2 <- data.frame(chills='Y', runny_nose='N', headache='MILD', fever='Y')
result3 <- predict(new_model, test_data2, type='prob')
result3  # 예측 확률 출력
```

✅ **결과:** 독감일 확률과 아닐 확률 출력됨

