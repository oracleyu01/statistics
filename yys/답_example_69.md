## 예제69. 신경망

🔗 [관련 링크](https://cafe.daum.net/oracleoracle/Sotv/746)

---

### 🧠 1. Sigmoid 함수 만들기

Sigmoid 함수는 그리스어 '시그마'에서 유래한 것으로, S 자 모양을 띄는 함수이므로 시그모이드(sigmoid)라는 이름이 붙었습니다.

✔️ 0~1 사이의 데이터를 출력하여 확률 값을 표현할 수 있어 유용합니다.  
✔️ 역전파 과정에서 미분이 용이하여 신경망 학습에 적합합니다.

```r
sigmoid <- function(x) {
  1 / (1 + exp(-x))
}

sigmoid(3)  # 0.95
sigmoid(-3) # 0.04

x_values <- seq(-10, 10, by=0.1)
y_values <- sigmoid(x_values)

plot(x_values, y_values, type="l", col="red")
```

---

### 🔢 2. Softmax 함수 만들기

Softmax 함수는 단순한 최대값 출력이 아닌, 확률적 분포를 고려하여 부드럽게 값을 변환하는 함수입니다.

✅ 입력값 예시:
- (98, 73) → Softmax → (0.8, 0.2)  
- (98, 73) → Max → (1, 0)  

```r
softmax <- function(x) {
  exp_x <- exp(x - max(x))  # 큰 값 보정
  exp_x / sum(exp_x)
}

values <- c(2, 1)
softmax(values)  # 0.7310586 0.2689414
```

---

### 🔗 3. 3층 신경망 R 구현하기

```r
# 입력 벡터
x <- c(1, 2)

# 첫 번째 은닉층 가중치
W1 <- matrix(c(1,3,5,2,4,6), nrow=2, ncol=3, byrow=TRUE)
h1 <- sigmoid(x %*% W1)

# 두 번째 은닉층 가중치
W2 <- matrix(c(3, 4, 5, 6, 7, 8), nrow=3, ncol=2, byrow=TRUE)
z2 <- sigmoid(h1 %*% W2)

# 출력층 가중치
W3 <- matrix(c(0.4, 0.2, 0.3, 0.2), nrow=2, ncol=2, byrow=TRUE)
z3 <- softmax(z2 %*% W3)
print(z3)  # 0.5744425 0.4255575
```

✅ **순전파(Forward Propagation)**까지 완료하였습니다.
✅ 역전파(Backpropagation)는 Python과 딥러닝에서 학습할 예정입니다.

---

### 🍷 4. R을 이용한 와인 분류 신경망

```r
# 데이터 불러오기
wine <- read.csv("c:\\data\\wine2.csv", stringsAsFactors=TRUE)

# 결측치 확인
colSums(is.na(wine))

# 데이터 정규화
normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
wine_n <- as.data.frame(lapply(wine[,-1], normalize))
wine2 <- cbind(Type=wine$Type, wine_n)

# 훈련 및 테스트 데이터 분리
library(caret)
set.seed(1)
k <- createDataPartition(wine2$Type, p=0.9, list=FALSE)
train_data <- wine2[k,]
test_data <- wine2[-k,]

# 모델 학습
install.packages("nnet")
library(nnet)
model <- nnet(Type ~ ., data=train_data, size=2)

# 모델 예측 및 평가
result <- predict(model, test_data[,-1], type="class")
accuracy <- sum(result == test_data[,1]) / length(test_data[,1])
print(accuracy)  # 100%
```

---

### 🌿 5. Iris 데이터 신경망 분류

```r
# 데이터 불러오기
iris <- read.csv("c:\\data\\iris2.csv", stringsAsFactors=TRUE)

# 데이터 정규화
iris_n <- as.data.frame(lapply(iris[,-5], normalize))
iris2 <- cbind(Species=iris$Species, iris_n)

# 훈련 및 테스트 데이터 분리
set.seed(5)
k <- createDataPartition(iris2$Species, p=0.9, list=FALSE)
train_data <- iris2[k,]
test_data <- iris2[-k,]

# 모델 학습
model <- nnet(Species ~ ., data=train_data, size=2)

# 모델 예측 및 평가
result <- predict(model, test_data[,-1], type="class")
accuracy <- sum(result == test_data[,1]) / length(test_data[,1])
print(accuracy)  # 100%
```

---

### 🏗️ 6. 콘크리트 강도 예측 신경망

```r
# 데이터 로드
concrete <- read.csv("c:\\data\\concrete.csv")

# 데이터 정규화
concrete_norm <- as.data.frame(lapply(concrete, normalize))

# 훈련 및 테스트 데이터 분리
set.seed(1)
k <- createDataPartition(concrete_norm$strength, p=0.8, list=FALSE)
train_data <- concrete_norm[k,]
test_data <- concrete_norm[-k,]

# 모델 학습
install.packages("neuralnet")
library(neuralnet)
concrete_model <- neuralnet(strength ~ ., data=train_data, hidden=c(5,2))

# 예측 및 평가
result <- compute(concrete_model, test_data[,1:8])
cor(result$net.result, test_data[,9])  # 0.94
```

---

### 📊 7. 실험 결과 시각화

```r
library(ggplot2)
data <- data.frame(
  Experiment = c('1번 실험', '2번 실험', '3번 실험', '4번 실험'),
  Correlation_Coefficient = c(0.82, 0.94, 0.96, 0.95)
)

# 막대 그래프 생성
ggplot(data, aes(x=Experiment, y=Correlation_Coefficient, fill=Experiment)) +
  geom_bar(stat='identity') +
  theme_minimal() +
  ggtitle("Correlation Coefficient by Experiment") +
  xlab("Experiment") +
  ylab("Correlation Coefficient")
```

---

✅ **완료!** 🎉
이제 신경망을 활용한 분류 및 회귀 모델을 잘 활용할 수 있습니다. 필요한 경우 추가 실험을 진행해보세요! 🚀

