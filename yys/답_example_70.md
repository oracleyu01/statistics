## ▣ 예제70. 연관 분석  p415

### 1. 이론:
- [연관 분석 이론](https://cafe.daum.net/oracleoracle/Sotv/777)

### 2. 수학식 설명:
- [수학식 해석](https://cafe.daum.net/oracleoracle/Sotv/778)

---

## ◼ 지지도, 신뢰도, 향상도 점심시간 문제

```r
data1 <-  data.frame(
  빵=c(0, 1, 0, 1, 1),
  계란=c(0, 1, 0, 0, 0 ),
  우유= c(1, 0, 1, 1, 1 )
)

support <- sum(data1$빵==1 & data1$우유==1 ) / nrow(data1)
support
```

### 지지도, 신뢰도, 향상도를 계산하시오.

- **지지도(Support)**: 전체 거래 중 특정 품목이 포함된 거래의 비율
- **신뢰도(Confidence)**: 특정 품목을 샀을 때 다른 품목도 함께 구매할 확률
- **향상도(Lift)**: 특정 품목을 샀을 때 다른 품목을 살 영향도

---

## △ R을 이용한 연관 분석

### 1. 데이터를 로드합니다.
```r
x <- data.frame(
  beer = c(0, 1, 1, 1, 0),
  bread = c(1, 1, 0, 1, 1),
  cola = c(0, 0, 1, 0, 1),
  diapers = c(0, 1, 1, 1, 1),
  eggs = c(0, 1, 0, 0, 0),
  milk = c(1, 0, 1, 1, 1)
)
```

### 2. 연관 분석 패키지를 설치합니다.
```r
install.packages("arules")
library(arules)
```

### 3. 데이터를 행렬로 변환합니다.
```r
x2 <- as.matrix(x, "Transaction")
x2
```

### 4. apriori 함수를 이용한 연관 분석
```r
rule1 <- apriori(x2, parameter = list(supp = 0.2, conf = 0.6, target = "rules"))
rule1
```

연관된 물품들을 보여주며, 지지도 20% 이상, 신뢰도 60% 이상인 연관 규칙들만 표시됩니다.

### 5. 가장 연관성이 높은 항목 표시
```r
inspect(sort(rule1, by = "lift")[1:10])
```

## ◼ 연관 규칙 해석

- **지지도(Support)**: 전체 거래 중 특정 품목이 포함된 거래 비율
- **신뢰도(Confidence)**: 특정 품목을 샀을 때 다른 품목도 함께 구매할 확률
- **향상도(Lift)**: 특정 품목을 샀을 때 다른 품목을 구매할 영향도

향상도 계산 공식:
```r
향상도(시리얼 → 우유) = P(시리얼 & 우유) / (P(시리얼) * P(우유))
```

---

## ◼ 연관 규칙 시각화
```r
install.packages("sna")
install.packages("rgl")
library(sna)
library(rgl)

b2 <- t(as.matrix(x)) %*% as.matrix(x)
b2

diag(b2)
diag(diag(b2))

b3 <- b2 - diag(diag(b2))
b3

gplot(b3, displaylabel = TRUE, vertex.cex = sqrt(diag(b2)), vertex.col = "green",
      edge.col = "blue", boxed.labels = FALSE, arrowhead.cex = .3, 
      label.pos = 3, edge.lwd = b3 * 2)
```

### ◼ 그래프 해석
- **노드(Node)**: 각 아이템을 나타냄
- **엣지(Edge) 굵기**: 두 아이템이 함께 등장하는 빈도를 의미함
- **엣지 방향**: 연관 규칙의 방향을 의미함
- 예를 들어, 빵과 우유의 엣지가 굵으면 함께 구매되는 경우가 많음을 의미합니다.


## ▣ 연관규칙 두번째 실습

### 건물 업종 연관 분석

건물 20개를 조사하여 업종별 입점 여부를 분석하는 데이터 (`building.csv`).

```r
bd <- read.csv("c:\\data\\building.csv", header=T)
bd2 <-  bd[ , -1]
bd2

bd2[is.na(bd2)] <- 0
bd2

bd3 <- as.matrix(bd2, "Transaction")
bd3

library(arules)
rule2 <-  apriori(bd3, parameter = list(supp=0.2, conf=0.6, target="rule"))

inspect(sort(rule2))
```

### 특정 업종의 연관성 분석

#### 보습학원 연관 분석
```r
rule3 <- subset(rule2, subset= lhs %in% '보습학원' & confidence >0.7)
inspect(sort(rule3))
```

#### 병원과 연관된 업종 분석
```r
rule4 <- subset(rule2, subset= lhs %in% '병원' & confidence >0.7)
inspect(sort(rule4))
```

### 연관 분석 시각화
```r
bd <- read.csv("c:\\data\\building.csv", header=T)
colSums(is.na(bd))
bd[is.na(bd)] <- 0
bd2 <- bd[ , -1]

bd3 <- t(as.matrix(bd2)) %*% as.matrix(bd2)
bd4 <- bd3 - diag(diag(bd3))

gplot(bd4, displaylabel=T, vertex.cex=sqrt(diag(bd3)), vertex.col="green",
      edge.col="blue", boxed.labels=F, arrowhead.cex = .3, 
      label.pos = 3, edge.lwd = bd4*2)
```

**그래프 해석:**
- **노드(Node):** 업종을 나타냄
- **엣지(Edge):** 업종 간의 연관성을 나타냄
- **굵은 엣지:** 함께 등장하는 빈도가 높음을 의미함

---

## ◼ 전세 사기 예방 연관 분석

등기부 등본 및 전세 시세 데이터를 기반으로 연관 분석을 수행.

```r
if (!require("arules")) {
  install.packages("arules")
  library(arules)
}

set.seed(123)
data <- data.frame(
  contract_id = paste0("전세방", 1:94),
  무자본_갭투자 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.6, 0.4))),
  시세보다_저렴한_전세가 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.4, 0.6))),
  근저당권_설정_금액_비율 = factor(sample(c("낮음", "중간", "높음"), 94, replace = TRUE, prob = c(0.2, 0.3, 0.5))),
  전세_사기_발생 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.5, 0.5)))
)

data_trans <- as(data[, -1], "transactions")
rules <- apriori(data_trans, parameter = list(supp = 0.1, conf = 0.3))
filtered_rules <- subset(rules, subset = rhs %pin% "전세_사기_발생=1" & lhs %pin% "근저당권_설정_금액_비율=높음" & lhs %pin% "시세보다_저렴한_전세가=1")

inspect(sort(filtered_rules, by = "lift"))
```

**연관 분석을 통한 사기 예방 가능성** 🚀

---

## ◼ 보이스 피싱 예방을 위한 연관 분석

보이스 피싱 사기 패턴을 분석하여 연관 규칙을 도출.

```r
if (!requireNamespace("arules", quietly = TRUE)) {
  install.packages("arules")
}
library(arules)

data <- list(
  "서울중앙지검에 이주화 수사관 다름 아니라 명의도용 고소 고발 몇 확인차 전화",
  "통화 괜찮으실까요 우선 사건 내용 말씀드리기 전 명의 도용한 주범 대해 말씀드릴 텐데요"
)

transactions <- as(data, "transactions")
frequent_items <- apriori(transactions, parameter = list(supp = 0.1, conf = 0.1, maxlen = 10))
inspect(sort(frequent_items))
```

**금융 사기 탐지, 전세 사기, 보이스 피싱 예방 등에 활용 가능**

---

## ◼ Groceries 데이터를 활용한 연관 분석 실습

```r
if (!require("arules")) {
  install.packages("arules")
  library(arules)
}

data("Groceries")
rules <- apriori(Groceries, parameter = list(supp=0.01, conf=0.5))
inspect(sort(rules, by = "lift")[1:10])
```

**연관 분석이 마트 판매 데이터뿐만 아니라 다양한 분야에서 활용 가능함을 확인**


