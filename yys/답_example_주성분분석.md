# 📊 주성분 분석(PCA)의 원리

## 🔍 1. 주성분 분석(PCA)란?
고차원의 데이터를 낮은 차원의 데이터로 변환하여, 머신러닝, 데이터마이닝, 통계 분석, 노이즈 제거 등 다양한 분야에서 사용됩니다.

## 🤔 2. 왜 중요할까?
데이터가 간단해져 이해하기 쉬워지고, 저장 공간도 절약됩니다. 예를 들어, 학생들의 성적(국어, 수학, 영어 등)에서 중요한 정보를 쉽게 찾을 수 있습니다.

## 🎓 3. 예제: 학생 성적 분석
- **PC1:** 학생들의 전반적인 학업 성취도를 나타냅니다. 모든 과목에서 높은 점수를 받은 학생들이 높은 PC1 점수를 갖습니다.
- **PC2:** 특정 과목에 대한 성취도를 나타냅니다. 예를 들어, 수학에서 높은 점수를 받은 학생들이 높은 PC2 점수를 갖습니다.

**요약:**
- **PC1:** 전체 성적이 높은 학생들.
- **PC2:** 특정 과목에서 두드러지는 학생들.

PCA는 학생들의 성적 데이터에서 중요한 패턴을 찾아내어 학습 성과를 효과적으로 분석하는 데 도움을 줍니다.

## 🧭 주성분 분석(PCA) 원리

모든 과목이 3과목이고 국어(X축), 수학(Y축), 영어(Z축)이라고 하자.
- **PC1:** 국어, 수학, 영어를 가장 잘 설명하는 직선.
- **PC2:** PC1과 직교하는 직선.
- **PC3:** PC1과 PC2와 직교하는 또 다른 직선.

## 🖥 구현 R 코드

### 📦 필요한 패키지 설치 및 로드
```{r}
install.packages("ggplot2")
install.packages("plotly")
install.packages("scatterplot3d")

library(ggplot2)
library(plotly)
library(scatterplot3d)
```

### 📊 데이터 생성 및 PCA 수행
```{r}
set.seed(123)
num_students <- 100
data <- data.frame(
  국어 = rnorm(num_students, mean = 70, sd = 10),
  수학 = rnorm(num_students, mean = 65, sd = 12),
  영어 = rnorm(num_students, mean = 75, sd = 8)
)

pca_result <- prcomp(data, scale. = TRUE)
pca_scores <- data.frame(pca_result$x)
```

### 📈 3D 시각화
```{r}
# 주성분 방향 벡터
pc1_vector <- pca_result$rotation[,1]
# 데이터 중심
center <- colMeans(data)

s3d <- scatterplot3d(data$국어, data$수학, data$영어, pch = 19, color = "blue", main = "3D PCA Plot",
                     xlab = "국어", ylab = "수학", zlab = "영어")

s3d$points3d(center[1] + pc1_vector[1] * c(-10, 10), center[2] + pc1_vector[2] * c(-10, 10), center[3] + pc1_vector[3] * c(-10, 10), type = "l", col = "red", lwd = 3)
```

### 📊 Plotly를 사용한 인터랙티브 시각화
```{r}
plot_ly(x = ~data$국어, y = ~data$수학, z = ~data$영어, type = 'scatter3d', mode = 'markers',
        marker = list(size = 3, color = 'blue')) %>%
  add_trace(x = center[1] + pc1_vector[1] * c(-10, 10), y = center[2] + pc1_vector[2] * c(-10, 10), z = center[3] + pc1_vector[3] * c(-10, 10),
            type = 'scatter3d', mode = 'lines', line = list(color = 'red', width = 5)) %>%
  layout(scene = list(xaxis = list(title = '국어'),
                      yaxis = list(title = '수학'),
                      zaxis = list(title = '영어'),
                      title = "3D PCA Plot with PC1"))
```

---

## 🧐 주성분 분석(PCA) 원리

### 📏 주성분 찾는 과정
- **Step 1:** 데이터의 평균을 계산하여 중심을 맞춘다.
- **Step 2:** 각 데이터 포인트와 중심 사이의 거리를 계산한다.
- **Step 3:** **수직 거리의 합이 최소가 되는 직선을 찾는다.** (가장 큰 변동성을 설명하는 방향)

이러한 과정으로 주성분이 결정되며, **PC1이 가장 큰 변동성을 설명하는 직선**이 됩니다.

---

## 🏥 문제: 유방암 데이터를 주성분 분석하여 2차원으로 시각화하기

### 📦 패키지 로드 및 데이터 로드
```{r}
install.packages("ggplot2")
install.packages("plotly")

library(ggplot2)
library(plotly)

bc_data <- read.csv("c:\\data\\wisc_bc_data.csv")
bc_data$diagnosis <- as.factor(bc_data$diagnosis)
```

### 🔬 주성분 분석 수행
```{r}
pca_result <- prcomp(bc_data[, 3:32], scale. = TRUE)
pca_scores <- data.frame(pca_result$x)
pca_scores$diagnosis <- bc_data$diagnosis
```

### 📊 2차원 시각화
```{r}
p <- ggplot(pca_scores, aes(x = PC1, y = PC2, color = diagnosis)) +
  geom_point(size = 3) +
  labs(title = "PCA 결과", x = "PC1", y = "PC2") +
  theme_minimal()

# plotly를 사용한 인터랙티브 시각화
p_interactive <- ggplotly(p)

# 시각화 출력
p_interactive
```



## 📌 PCA 코드 구현

### 📦 필요한 패키지 설치 및 로드
```{r}
install.packages("ggplot2")
install.packages("plotly")

library(ggplot2)
library(plotly)
```

### 🌸 아이리스 데이터셋을 사용한 PCA
```{r}
# 데이터 로드
iris_data <- read.csv("c:\\data\\iris2.csv")

# 주성분 분석 수행
pca_result <- prcomp(iris_data[, 1:4], scale. = TRUE)
```

### 🔬 PCA 결과 확인
```{r}
summary(pca_result)
```

### 📊 주성분 점수 추출
```{r}
pca_scores <- data.frame(pca_result$x)
pca_scores$Species <- iris_data$Species
```

### 🖼 2차원 시각화
```{r}
p <- ggplot(pca_scores, aes(x = PC1, y = PC2, color = Species)) +
  geom_point(size = 3) +
  labs(title = "PCA 결과", x = "PC1", y = "PC2") +
  theme_minimal()

# plotly를 사용한 인터랙티브 시각화
p_interactive <- ggplotly(p)

# 시각화 출력
p_interactive
```

---

## 🧐 질문: PCA 결과 해석

### ❓ 1. 아래 코드의 결과 숫자가 의미하는 것은?
```{r}
pca_result
```
출력 예시:
```
Standard deviations (1, .., p=4):  
[1] 1.7061120 0.9598025 0.3838662 0.1435538
```
- **표준편차 값이 클수록 데이터의 변동성이 크다** → 첫 번째 주성분이 가장 큰 변동을 설명함.

### ❓ 2. PC1, PC2, PC3의 의미는?
- **PC1:** 원본 데이터에서 가장 많은 정보를 담고 있는 방향.
- **PC2:** PC1과 직교하는 방향에서 변동을 설명하는 직선.
- **PC3:** PC1과 PC2와 직교하는 또 다른 방향.

---

## 🔬 문제: 유방암 데이터 주성분 분석

### 📦 패키지 로드 및 데이터 로드
```{r}
install.packages("ggplot2")
install.packages("plotly")

library(ggplot2)
library(plotly)

bc_data <- read.csv("c:\\data\\wisc_bc_data.csv")
bc_data$diagnosis <- as.factor(bc_data$diagnosis)
```

### 🧪 주성분 분석 수행
```{r}
pca_result <- prcomp(bc_data[, 3:32], scale. = TRUE)
pca_scores <- data.frame(pca_result$x)
pca_scores$diagnosis <- bc_data$diagnosis
```

### 📊 2차원 시각화
```{r}
p <- ggplot(pca_scores, aes(x = PC1, y = PC2, color = diagnosis)) +
  geom_point(size = 3) +
  labs(title = "PCA 결과", x = "PC1", y = "PC2") +
  theme_minimal()

# plotly를 사용한 인터랙티브 시각화
p_interactive <- ggplotly(p)

# 시각화 출력
p_interactive
