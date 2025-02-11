## 🧠 신경망 수업 준비  

### 📌 목차  
1. 신경망 설명 큰 그림  
2. 쉬운 예제 (시각화 포함)  
3. 관련 연습문제  
4. 관련 이론  
5. 실전 예제  
6. 관련 연습문제  
7. 데이콘 도전  

---

#### 1️⃣ 신경망 설명 큰 그림  
📌 참고 이미지:  

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n1.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n2.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/netq2.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n4.png" width="70%">  


---

#### 2️⃣ 쉬운 예제 (시각화 포함)  

🛠 **R 코드:** 

```r
#1. 데이터 만들기

# 필요한 패키지 설치 및 로드
install.packages("nnet")  # 신경망 모델을 위한 패키지
install.packages("gridExtra")

library(MASS) 
library(ggplot2) 
library(caret)
library(gridExtra)  
library(nnet)  # 신경망 모델

# 데이터 시각화 함수 (결정경계 없이)
plot_data_only <- function(data, title) {
  ggplot(data, aes(x = x1, y = x2, color = y)) +
    geom_point() +
    labs(x = "Feature 0", y = "Feature 1", title = title) +
    theme_minimal()
}

# 결정경계 시각화 함수 (결정경계 추가)
plot_with_decision_boundary <- function(model, data, title) {
  grid <- expand.grid(
    x1 = seq(min(data$x1) - 1, max(data$x1) + 1, length.out = 100),
    x2 = seq(min(data$x2) - 1, max(data$x2) + 1, length.out = 100)
  )

  grid$prob <- predict(model, newdata = grid, type = "raw")
  grid$y <- as.factor(ifelse(grid$prob > 0.5, 1, 0))

  ggplot(data, aes(x = x1, y = x2, color = y)) +
    geom_point() +
    geom_contour(data = grid, aes(x = x1, y = x2, z = as.numeric(y)), bins = 1, color = "deepskyblue3") +
    labs(x = "Feature 0", y = "Feature 1", title = title) +
    theme_minimal()
}

# 랜덤으로 데이터 생성
set.seed(8)
n <- 100
mu1 <- c(2, 2)    
mu2 <- c(-2, -2)  
sigma <- matrix(c(1, 0, 0, 1), 2, 2)

x1 <- mvrnorm(n, mu1, sigma)  
x2 <- mvrnorm(n, mu2, sigma)

data <- data.frame(
  x1 = c(x1[, 1], x2[, 1]),
  x2 = c(x1[, 2], x2[, 2]),
  y = as.factor(c(rep(0, n), rep(1, n)))
)

#2. 데이터 확인하기
#3. 훈련과 테스트 데이터 분리하기
#4. 이상치 추가하기
#5. 모델 생성하기
#6. 모델 예측
#7. 모델 평가
#8. 데이터 시각화
#9. 결정경계 시각화 
```

#### 모델 개선1 

```r

#1. 새로운 신경망 모델 생성
#2. 새로운 모델 예측
#3. 새로운 모델 평가
#4. 새로운 모델 시각화

```

#### 모델 개선2

```r

#1. 새로운 신경망 모델 생성
#2. 새로운 모델 예측
#3. 새로운 모델 평가
#4. 새로운 모델 시각화

```


#### 모델 개선3

```r

#1. 새로운 신경망 모델 생성
#2. 새로운 모델 예측
#3. 새로운 모델 평가
#4. 새로운 모델 시각화

```


#### 3️⃣ 관련 연습문제  

##### 🏠 문제: 신경망을 활용한 부동산 허위매물 탐지  
부동산 시장에서 허위 매물(존재하지 않는 매물 또는 과장 광고)이 큰 문제가 되고 있습니다.  
주어진 데이터에서 월세, 보증금, 근저당설정금액을 독립변수로 사용하여  
부동산 허위매물 여부를 예측하는 신경망 모델을 구축하세요.  

##### 📌 데이터 설명

| **컬럼명**              | **설명**                              | **데이터 유형**  |
|------------------------|---------------------------------|----------------|
| 월세                  | 해당 매물의 월세 가격                | 연속형 변수       |
| 보증금                | 해당 매물의 보증금                  | 연속형 변수       |
| 근저당설정금액          | 해당 매물에 설정된 근저당 금액          | 연속형 변수       |
| 부동산허위매물여부      | 1: 허위 매물, 0: 정상 매물 (타겟 변수) | 범주형 변수       |


```r
# 데이터 생성 (컬럼명 변경)
set.seed(8)
n <- 100
mu1 <- c(2, 2)    
mu2 <- c(-2, -2)  
sigma <- matrix(c(1, 0, 0, 1), 2, 2)

x1 <- mvrnorm(n, mu1, sigma)  
x2 <- mvrnorm(n, mu2, sigma)

data <- data.frame(
  월세 = c(x1[, 1], x2[, 1]),
  보증금 = c(x1[, 2], x2[, 2]),
  근저당설정금액 = c(x1[, 2] * 1.5, x2[, 2] * 1.5),  # 변형된 값 추가
  부동산허위매물여부 = as.factor(c(rep(0, n), rep(1, n)))
)


```

---

#### 4️⃣ 관련 이론  

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/netq2.png" width="60%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/sig1.png" width="60%">   

##### ✨ Sigmoid 함수 만들기  

Sigmoid는 그리스어 *시그마*에서 유래한 단어입니다.  
시그마의 영어 표기가 *S*여서, S자 모양의 함수라는 뜻으로 *Sigmoid*라는 이름이 붙었습니다.  

- 0~1 사이의 데이터를 출력하여 확률처럼 숫자를 나타낼 수 있습니다.  
- 순전파(Forward Propagation) 시 유용하며, 역전파(Backpropagation) 시 미분이 용이합니다.  

```r
# Sigmoid 함수 정의
sigmoid <- function(x) {
  1 / (1 + exp(-x))
}

# Sigmoid 함수 테스트
sigmoid(3)  # 0.95
sigmoid(-3) # 0.04

# Sigmoid 함수 시각화
x_values <- seq(-10, 10, by = 0.1)
y_values <- sigmoid(x_values)

plot(x_values, y_values, type = "l", col = "red")
```

##### ✨  소프트 맥스 함수 만들기 

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/netq2.png" width="70%">   
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/soft1.png" width="60%">   
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/soft2.png" width="60%">   
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/soft3.png" width="60%">   

softmax 함수의 의미는 그냥 최대값을 출력하는 max 가 아니라
좀 부드러운 최대값을 출력한다는 의미로 softmax 함수로 이름을 지었습니다.

입력값 ( 98,  73 )  ---->  softmax ---->  (  0.8, 0.2 )  -------->  (  1,  0 )
                      
```r

softmax <- function(x) {
                     exp_x <- exp( x - max(x) )  # 너무 큰값이 들어오면
                     exp_x / sum(exp_x)           # 계산이 안되서 빼줌
                       }
values <- c(2, 1)
softmax( values )   #  0.7310586 0.2689414

```
##### ✨  간단한 3층 신경망 만들기 !

```r

# 입력 벡터
x <- c(1, 2)

# 첫번째 은닉층의 가중치
W1 <- matrix( c(1,3,5,2,4,6),  nrow=2, ncol=3, byrow=TRUE)

# 첫번째 은닉층의 출력
h1 <-  sigmoid( x  %*% W1 )
print(h1)  

# 두번째 은닉층의 가중치
W2 <- matrix( c(3, 4, 5, 6, 7, 8) , nrow=3, ncol=2, byrow=TRUE)

# 두번째층의 입력
z2 <-  sigmoid(h1 %*% W2)
print(z2) 

# 출력층의 가중치
W3 <- matrix( c(0.4, 0.2, 0.3, 0.2) , nrow=2, ncol=2, byrow=TRUE)

# 출력층의 입력
z3 <-  softmax(z2 %*% W3)
print(z3)  #  0.5744425   0.4255575

```
#### 5️⃣ 실제 데이터로 신경망 만들기 

R 을 이용해서 와인을 분류하는 신경망 만들기

```r

#1. 데이터 불러오기
wine <- read.csv("c:\\data\\wine2.csv", stringsAsFactors=T)
head(wine)
unique(wine$Type)

# 그 이후의 코드들 


```

#### 6️⃣ 실제 데이터로 신경망 만들기 관련 문제   

##### 🏠 문제: iris 의 품종을 분류하는 인공신경망을 R 로 생성하시오 !


```r

#1. 데이터 불러오기
iris <- read.csv("c:\\data\\iris2.csv", stringAsFactors=T)
head(iris)
unique(iris$Species) #종속변수 : Species


```


