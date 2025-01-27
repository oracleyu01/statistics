# 📊 KNN 머신러닝

## 🔍 KNN의 원리
새로 들어온 데이터가 기존 데이터(예: 악성종양, 양성종양) 중에서 어느 데이터에 더 인접해 있는지를 거리를 계산하여 가장 가까운 데이터를 이웃으로 선택하는 방식입니다.

거리를 계산할 때 사용하는 수학식은 **유클리드 거리 공식**입니다.

## 🧠 머신러닝의 종류
1. **📘 지도학습**: 정답이 있는 데이터를 기계가 학습하는 방식
2. **📙 비지도학습**: 정답이 없는 데이터를 기계가 스스로 분류하는 방식
3. **📗 강화학습**: 환경만 제공하고 데이터를 기계가 스스로 만들어내도록 학습하는 방식


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


## 🍏 책 138 페이지의 표를 코드로 구현하여 좌표 (4,4)와의 거리 계산 🍏

### 📋 데이터 테이블
| 재료   | 단맛 | 바삭한맛 | 음식종류 |
|--------|-----|--------|--------|
| 사과   | 10  | 9      | 과일   |
| 베이컨 | 1   | 4      | 단백질 |
| 바나나 | 10  | 1      | 과일   |
| 당근   | 7   | 10     | 채소   |
| 셀러리 | 3   | 10     | 채소   |

### 📌 거리 계산 코드
```{r}
x <- c(10, 1, 10, 7, 3)
y <- c(9, 4, 1, 10, 10)

temp <- c()
for (i in 1:5) {
  temp <- append(temp, distance(c(x[i], y[i]), c(4,4)))
}

print(temp)  # [1] 7.810250 3.000000 6.708204 6.708204 6.082763
```

### 📌 가장 작은 거리 출력
```{r}
print(min(temp))
```
**출력:** `3.000000`


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

## 🍷 문제. 와인의 품종을 분류하는  knn  머신러닝 모델을 생성하시오 !  🍷

### 📊 1단계: 데이터 수집
```{r}
wine <- read.csv("c:\\data\\wine2.csv", stringsAsFactors=TRUE)
nrow(wine)  # 177
ncol(wine)  # 14
```

### 🔍 2단계: 데이터 탐색
```{r}
# 결측치 확인
colSums(is.na(wine))

# 종속변수의 데이터 비율
table(wine$Type)
prop.table(table(wine$Type))

# 데이터 스케일링 (최대최소 정규화)
wine2 <- wine[, -1]  # 정답 컬럼 Type 제외
wine2_n <- as.data.frame(lapply(wine2, normalize))
summary(wine2_n)
```

### 🎯 3단계: 모델 훈련
```{r}
set.seed(10)
library(caret)
train_indx <- createDataPartition(wine$Type, p=0.9, list=FALSE)
wine_train <- wine2_n[train_indx, ]
wine_test <- wine2_n[-train_indx, ]
wine_train_label <- wine$Type[train_indx]
wine_test_label <- wine$Type[-train_indx]
```

### 📊 4단계: 모델 성능 평가
```{r}
accuracies <- data.frame(k = integer(), accuracy = numeric())
set.seed(10)
for (i in seq(1, 57, 2)) {
  result1 <- knn(train=wine_train, test=wine_test, cl=wine_train_label, k=i)
  accuracy <- sum(result1 == wine_test_label) / length(wine_test_label) * 100
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
