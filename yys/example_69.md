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

### 📌 과목별 수업 순서  

#### 1️⃣ 신경망 설명 큰 그림  
📌 참고 이미지:  

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n1.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n2.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n3.png" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/n4.png" width="70%">  


---

#### 2️⃣ 쉬운 예제 (시각화 포함)  

🛠 **R 코드: ** 

```r

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
```




