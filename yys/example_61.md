# 📊 KNN 머신러닝

## 🔍 KNN의 원리
새로 들어온 데이터가 기존 데이터(예: 악성종양, 양성종양) 중에서 어느 데이터에 더 인접해 있는지를 거리를 계산하여 가장 가까운 데이터를 이웃으로 선택하는 방식입니다.

거리를 계산할 때 사용하는 수학식은 **유클리드 거리 공식**입니다.

## 🧠 머신러닝의 종류
1. **📘 지도학습**: 정답이 있는 데이터를 기계가 학습하는 방식
2. **📙 비지도학습**: 정답이 없는 데이터를 기계가 스스로 분류하는 방식
3. **📗 강화학습**: 환경만 제공하고 데이터를 기계가 스스로 만들어내도록 학습하는 방식

## ⚠️ 오버피팅(Overfitting)
훈련 데이터에 너무 최적화되어 테스트 데이터의 정확도가 상대적으로 낮아지는 상태

## ⚡ 언더피팅(Underfitting)
훈련 데이터의 정확도도 낮은 상태로 학습된 상태

## 📐 유클리드 거리 공식을 R로 구현하기

### 📌 예제 1: 두 점의 좌표 지정
```{r}
a <- c(2,4)
b <- c(5,6)
```

### 📌 예제 2: 두 점 사이의 거리 계산
```{r}
sqrt(sum((a - b)^2))
```
**출력:** 3.605551

### 📌 예제 3: 거리 계산 함수 생성
```{r}
distance <- function(a, b) {
  return(sqrt(sum((a - b)^2)))
}

distance(a, b)
```

## 🏥 유방암 환자의 양성 종양과 악성 종양 분류하기 (KNN)

### 📊 1단계: 데이터 수집
```{r}
wbcd <- read.csv("c:\\data\\wisc_bc_data.csv", stringsAsFactors=TRUE)
nrow(wbcd)  # 569
ncol(wbcd)  # 32
```

### 🔍 2단계: 데이터 탐색
```{r}
# 결측치 확인
colSums(is.na(wbcd))

# 종속변수의 데이터 비율
table(wbcd$diagnosis)
prop.table(table(wbcd$diagnosis))

# 데이터 스케일링 (최대최소 정규화)
wbcd2 <- wbcd[, c(-1, -2)]  # ID 및 정답 컬럼 제거
normalize <- function(x) { return((x - min(x)) / (max(x) - min(x))) }
wbcd_n <- as.data.frame(lapply(wbcd2, normalize))
summary(wbcd_n)
```

### 🎯 3단계: 모델 훈련
```{r}
set.seed(1)
library(caret)
train_indx <- createDataPartition(wbcd$diagnosis, p=0.9, list=FALSE)
wbcd_train <- wbcd_n[train_indx, ]
wbcd_test <- wbcd_n[-train_indx, ]
wbcd_train_label <- wbcd$diagnosis[train_indx]
wbcd_test_label <- wbcd$diagnosis[-train_indx]
```

### 📊 4단계: 모델 성능 평가
```{r}
library(class)
set.seed(1)
result1 <- knn(train=wbcd_train, test=wbcd_test, cl=wbcd_train_label, k=1)
sum(result1 == wbcd_test_label) / length(wbcd_test_label) * 100
```

### 🚀 5단계: 모델 성능 개선
```{r}
accuracies <- data.frame(k = integer(), accuracy = numeric())
for (i in seq(1, 27, 2)) {
  result1 <- knn(train=wbcd_train, test=wbcd_test, cl=wbcd_train_label, k=i)
  accuracy <- sum(result1 == wbcd_test_label) / length(wbcd_test_label) * 100
  accuracies <- rbind(accuracies, data.frame(k = i, accuracy = accuracy))
  print(paste(i, '개 일때 정확도 ', accuracy))
}
```

### 📉 K 값에 따른 정확도 시각화
```{r}
library(plotly)
fig <- plot_ly(accuracies, x = ~k, y = ~accuracy, type = 'scatter', mode = 'lines+markers', line = list(color = 'red'))
fig <- fig %>% layout(title = "K 값에 따른 정확도", xaxis = list(title = "K 값"), yaxis = list(title = "정확도"))
fig
```
