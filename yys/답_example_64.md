### 📌 5장. 의사결정트리 - 랜덤 포레스트의 기본 모델

#### 🏗 1. 의사결정트리 및 규칙 기반 알고리즘
1. **의사결정트리**
2. **규칙 기반 알고리즘**
   - OneR 알고리즘
   - Riper 알고리즘

---

### 🎯 예제64. 규칙 기반 알고리즘

#### 🔍 규칙 기반 알고리즘이란?
- `if` 조건을 기반으로 데이터를 분류하는 알고리즘
- OneR 알고리즘과 Riper 알고리즘이 있음

#### 📌 OneR 알고리즘
- 하나의 조건(변수)만 사용하여 데이터를 분류하는 알고리즘
- 단순하지만 오류 발생 가능성이 높음

📌 **예제:** 심장질환 예측
```r
# 가슴통증 하나만 보고 심장질환을 예측
```

#### 📌 Riper 알고리즘
- 여러 개의 조건을 조합하여 데이터를 분류하는 알고리즘

📌 **예제:** 가슴통증 + 호흡곤란 = 심장질환

---

### 🛠 OneR 알고리즘을 사용한 독버섯 데이터 분류

#### 🔹 1. 데이터 불러오기
```r
mush <- read.csv("c:\\data\\mushrooms.csv", stringsAsFactors=TRUE)
```

#### 🔹 2. 데이터 탐색
```r
colSums(is.na(mush))  # 결측치 확인
```

#### 🔹 3. 훈련 및 테스트 데이터 분리
```r
library(caret)
set.seed(1)
k <- createDataPartition(mush$type, p=0.8, list=F)
train_data <- mush[k, ]
test_data <- mush[-k, ]
```

#### 🔹 4. OneR 모델 생성 및 훈련
```r
install.packages("OneR")
library(OneR)
model <- OneR(type ~ ., data=train_data)
model  # 규칙 확인
```

#### 🔹 5. 모델 예측
```r
result <- predict(model, test_data[, -1])
```

#### 🔹 6. 모델 평가
```r
sum(result == test_data[, 1]) / nrow(test_data) * 100  # 정확도 계산
```

#### 🔹 7. 모델 개선 (Riper 알고리즘 적용)
```r
install.packages("RWeka")
library(RWeka)
model2 <- JRip(type ~ ., data=train_data)
model2  # 규칙 확인
```

#### 🔹 8. 모델 평가 및 예측
```r
result2 <- predict(model2, test_data[, -1])
sum(result2 == test_data[, 1]) / nrow(test_data) * 100  # 정확도 계산
```

---

### 🎯 예제 166. 화장품 구매 고객 데이터 분석

#### 🔹 1. 데이터 불러오기 및 탐색
```r
data <- read.csv("c:\\data\\skin.csv", stringsAsFactors=TRUE)
colSums(is.na(data))  # 결측치 확인
```

#### 🔹 2. 훈련 및 테스트 데이터 분리
```r
set.seed(1)
k <- createDataPartition(data$cupon_react, p=0.8, list=F)
train_data <- data[k, ]
test_data <- data[-k, ]
```

#### 🔹 3. Riper 모델 생성 및 평가
```r
model2 <- JRip(cupon_react ~ ., data=train_data)
result2 <- predict(model2, test_data)
accuracy <- sum(result2 == test_data$cupon_react) / nrow(test_data) * 100
```

#### 🔹 4. 정보 획득량 계산 (가장 중요한 컬럼 찾기)
```r
install.packages("FSelector")
library(FSelector)
information.gain(cupon_react ~ ., data, unit='log2')
```

---

### 🎯 예제. 지방간 원인 분석

#### 🔹 1. 데이터 불러오기
```r
fat <- read.csv("c:\\data\\fatliver2.csv", stringsAsFactors=T, fileEncoding = "euc-kr")
```

#### 🔹 2. 정보 획득량 계산
```r
wg <- information.gain(FATLIVER ~ ., fat, unit='log2')
wg  # 가장 영향력 있는 변수 확인
