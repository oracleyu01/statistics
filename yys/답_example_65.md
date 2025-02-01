### 📌 예제65. 의사결정트리


### 🌳 의사결정트리란?
- 불순도를 줄이는 질문을 계속 던지면서 데이터를 분류하는 알고리즘
- **순도(Impurity)**
  - 순도가 높다: 같은 데이터들이 대부분이다.
  - 불순도가 높다: 여러 종류의 데이터들이 섞여있다.

💡 **예제**: 초콜릿과 사탕을 분류할 때, 순도가 점점 높아지도록 질문을 던져서 분류하는 방식

---

### 📊 정보획득량 계산하는 3가지 방법 (빅데이터 분석기사 필기)
1. **지니계수** (수업)
2. **엔트로피** (조장 스터디)
3. **카이제곱**

#### 문제1. **구매여부에 가장 영향이 큰 독립변수 찾기**
```r
# 데이터 생성
buy <- data.frame(
  cust_name = c('SCOTT', 'SMITH', 'ALLEN', 'JONES', 'WARD'),
  card_yn = c('Y', 'Y', 'N', 'Y', 'Y'),
  intro_yn = c('Y', 'Y', 'N', 'N', 'Y'),
  before_buy_yn = c('Y', 'Y', 'Y', 'N', 'Y'),
  buy_yn = c('Y', 'Y', 'N', 'Y', 'Y')
)

# 정보획득량 구하기
install.packages("FSelector")
library(FSelector)
library(doBy)  # 정렬 라이브러리

weights <- information.gain(buy_yn ~ ., buy[, c(2:5)], unit='log2')
weights
orderBy(~ attr_importance, weights)  # 정보획득량이 높은 순서
```

#### 문제2. **위 결과를 막대 그래프로 시각화**
```r
# 그래프 패키지 로드
library(plotly)

graphics.off()  # 기존 그래픽 창 닫기

# 정보획득량 데이터를 정렬 후 저장
info_gain_df <- data.frame(col1 = rownames(weights), col2 = weights$attr_importance)

# 색상 지정
colors <- c("gold", "skyblue", "tomato")

# 막대 그래프 생성
fig <- plot_ly(info_gain_df, x = ~col1, y = ~col2, type = 'bar', marker = list(color = colors))
fig
```

---

### 📌 R을 이용한 의사결정트리 모델 구축
**데이터:** 화장품 고객 데이터 (`skin.csv`)

#### 🔄 **의사결정트리 순서**
1. 데이터 불러오기
2. 데이터 탐색
3. 훈련 데이터와 테스트 데이터 분리
4. 의사결정트리 모델 생성
5. 테스트 데이터 예측
6. 모델 성능 확인
7. 모델 성능 평가 및 개선

---

### 🛠 **코드 구현**
#### 1️⃣ 데이터 불러오기
```r
setwd("c:\\data")
skin <- read.csv("skin.csv", stringsAsFactors=TRUE, fileEncoding = "euc-kr")
head(skin)
str(skin)

# 나이 컬럼을 팩터형 변환
skin$age <- as.factor(skin$age)
str(skin)
```

#### 2️⃣ 데이터 탐색
```r
colSums(is.na(skin))  # 결측치 확인
```

#### 3️⃣ 훈련 데이터와 테스트 데이터 분리
```r
library(caret)
set.seed(1)
train_num <- createDataPartition(skin$cupon_react, p=0.8, list=FALSE)
train_data <- skin[train_num, ]
test_data  <- skin[-train_num, ]
```

#### 4️⃣ 의사결정트리 모델 생성
```r
install.packages("C50")
library(C50)

model <- C5.0(train_data[, c(-1, -7)], train_data[, 7])
summary(model)
plot(model)  # 질문 나무 시각화
```

#### 5️⃣ 테스트 데이터 예측
```r
train_result <- predict(model, train_data[, c(-1, -7)])
sum(train_result == train_data[, 7]) / nrow(train_data) * 100  # 훈련 데이터 정확도

test_result <- predict(model, test_data[, c(-1, -7)])
sum(test_result == test_data[, 7]) / nrow(test_data) * 100  # 테스트 데이터 정확도
```

#### 6️⃣ 모델 성능 개선 (다수결 적용)
```r
model2 <- C5.0(train_data[, c(-1, -7)], train_data[, 7], trials=5)

train_result2 <- predict(model2, train_data[, c(-1, -7)])
sum(train_result2 == train_data[, 7]) / nrow(train_data) * 100  # 훈련 데이터 정확도

test_result2 <- predict(model2, test_data[, c(-1, -7)])
sum(test_result2 == test_data[, 7]) / nrow(test_data) * 100  # 테스트 데이터 정확도
```

🛑 **훈련 데이터 정확도는 100%인데 테스트 정확도는 60% → 오버피팅 발생**  
💡 **적절한 `trials` 값 조정 필요**

---

### 🌼 **문제1: `iris` 데이터셋을 이용한 의사결정트리 모델 생성**
```r
iris <- read.csv("iris2.csv", stringsAsFactors=TRUE)
head(iris)

library(caret)
set.seed(1)
train_num <- createDataPartition(iris$Species, p=0.8, list=FALSE)
train_data <- iris[train_num, ]
test_data  <- iris[-train_num, ]

library(C50)
y <- 0
jumpby <- 1

options(scipen=999)  # 지수표현 방지
for (i in 1:10) {
  model <- C5.0(train_data[, -5], train_data[, 5], trials=y)
  test_result <- predict(model, test_data[, -5])
  accuracy <- sum(test_result == test_data[, 5]) / nrow(test_data) * 100
  y <- y + jumpby
  print(paste(i, '일때 정확도:', accuracy))
}

```
### 🎯 (의사결정트리 실습예제: 은행 대출 불이행자 예측 모델)

## 📌 1. 데이터 불러오기
```r
credit <- read.csv("credit.csv", stringsAsFactors=T)
head(credit)
```

## 🔍 2. 데이터 탐색
```r
str(credit)
```

### 📑 데이터 설명
- `checking_balance`: 예금계좌
- `saving_balance`: 적금계좌
- `amount`: 대출금액
- `default`: 채무불이행 여부 (종속변수)

## 📊 3. 대출금액 분포 확인 (히스토그램)
```r
hist(credit$amount)
summary(credit$amount)
```

## 🔍 4. 정답 컬럼 확인
```r
prop.table(table(credit$default))
```

## 🔍 5. 결측치 확인
```r
colSums(is.na(credit))
```

## ✂ 6. 훈련 데이터와 테스트 데이터 분리
```r
library(caret)
set.seed(1)
train_num <- createDataPartition(credit$default, p=0.9, list=F)
train_data <- credit[train_num, ]
test_data <- credit[-train_num, ]
nrow(train_data)   # 900
nrow(test_data)    # 100
```

## 🏗 7. 모델 생성
```r
library(C50)
credit_model <- C5.0(train_data[, -17], train_data[, 17])
```

## 📊 8. 모델 확인
```r
summary(credit_model)
```

## 🎯 9. 모델 예측
```r
train_result <- predict(credit_model, train_data[, -17])
test_result <- predict(credit_model, test_data[, -17])
```

## 📈 10. 모델 평가
```r
# 훈련 정확도
sum(train_result == train_data[, 17]) / 900 * 100  # 83.33 %

# 테스트 정확도
sum(test_result == test_data[, 17]) / 100 * 100   # 67%
```

## 🚀 11. 모델 개선 (trials 파라미터 적용)
```r
y <- 1
jumpby <- 1
options(scipen=999)  
for (i in 1:20) {
  credit_model2 <- C5.0(train_data[, -17], train_data[, 17], trials=y)
  test_result2 <- predict(credit_model2, test_data[, -17])
  accuracy <- sum(test_result2 == test_data[, 17]) / 100 * 100
  y <- y + jumpby
  print(paste(i, '일때', accuracy))
}
```

## 🛠 12. 최적 모델 평가
```r
library(gmodels)
credit_model2 <- C5.0(train_data[, -17], train_data[, 17], trials=6)
test_result2 <- predict(credit_model2, test_data[, -17])
x <- CrossTable(test_data[, 17], test_result2)
x$t
```

## 🏆 13. 최종 문제
```r
# 와인 데이터 (wine2.csv)를 활용하여 와인의 종류를 분류하는 
# 의사 결정 트리 모델을 생성하고 정확도를 올려보세요!
