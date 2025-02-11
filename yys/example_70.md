## ▣ 예제70. 연관 분석

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


```

### 3. 데이터를 행렬로 변환합니다.
```r



```

### 4. apriori 함수를 이용한 연관 분석
```r



```

연관된 물품들을 보여주며, 지지도 20% 이상, 신뢰도 60% 이상인 연관 규칙들만 표시됩니다.

### 5. 가장 연관성이 높은 항목 표시
```r


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

# 앞의 코드들 작성..

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
# 1. 데이터 불러오기 
bd <- read.csv("c:\\data\\building.csv", header=T)



```

### 특정 업종의 연관성 분석

#### 보습학원 연관 분석
```r


```

#### 병원과 연관된 업종 분석
```r


```

### 연관 분석 시각화
```r

gplot(bd4 , displaylabel=T , vertex.cex=sqrt(diag(bd3)) , vertex.col = "green" ,
             edge.col="blue" , boxed.labels=F , arrowhead.cex = .3 , 
             label.pos = 3 , edge.lwd = bd4*2) 

```

**그래프 해석:**
- **노드(Node):** 업종을 나타냄
- **엣지(Edge):** 업종 간의 연관성을 나타냄
- **굵은 엣지:** 함께 등장하는 빈도가 높음을 의미함

---

## ◼ 전세 사기 예방 연관 분석

등기부 등본 및 전세 시세 데이터를 기반으로 연관 분석을 수행.

```r

# 필요한 패키지 설치 및 로드
if (!require("arules")) {
  install.packages("arules")
  library(arules)
}

# 가상의 데이터 생성
set.seed(123) # 결과 재현을 위해 시드 설정
data <- data.frame(
  contract_id = paste0("전세방", 1:94),
  무자본_갭투자 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.6, 0.4))),
  시세보다_저렴한_전세가 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.4, 0.6))),
  근저당권_설정_금액_비율 = factor(sample(c("낮음", "중간", "높음"), 94, replace = TRUE, prob = c(0.2, 0.3, 0.5))),
  가압류_가처분_권리_제한 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.7, 0.3))),
  다수의_전세권_설정 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.7, 0.3))),
  압류_경매_절차_진행 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.7, 0.3))),
  신탁_등기 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.9, 0.1))),
  건물_용도 = factor(sample(c("주거용", "비주거용"), 94, replace = TRUE, prob = c(0.8, 0.2))),
  전세_사기_발생 = factor(sample(c(0, 1), 94, replace = TRUE, prob = c(0.5, 0.5)))
)

View(data)





```

**연관 분석을 통한 사기 예방 가능성** 🚀

---

## ◼ 보이스 피싱 예방을 위한 연관 분석

보이스 피싱 사기 패턴을 분석하여 연관 규칙을 도출.

```r

# 필요한 패키지 설치 및 로드
if (!requireNamespace("arules", quietly = TRUE)) {
  install.packages("arules")
}
library(arules)

# 불필요한 단어들을 제거하는 함수 정의
remove_stop_words <- function(text, stop_words) {
  text <- unlist(strsplit(text, " "))
  text <- text[!(text %in% stop_words)]
  return(text)
}

# Stop words 리스트
stop_words <- c("있습니까", "입니다", "에", "는", "이", "이요", "있고", "라고", "의", "와", "과", "로", "에", "를", "과", "다", "가", "은", "는", "의", "들", "것", "입니다", "이요",
                "괜찮으실까요", "우선", "전", "네", "지금", "제가", "저희", "좀", "한", "이번", "있는", "없는", "대해서", "들", "이런", "하게", "해서", "아니면", "어떤", "또는",
                "사건", "이유", "말씀드리기", "말씀", "드릴", "드렸는데요", "텐데요", "건", "내용", "제", "저", "안", "말씀을", "부탁드립니다", "답변", "관해서", "부탁", "합니다", "문의")

# 보이스 피싱 텍스트 데이터를 리스트로 준비합니다.
data <- list(
  "서울중앙지검에 이주화 수사관 다름 아니라 명의도용 고소 고발 몇 확인차 전화",
  "통화 괜찮으실까요 우선 사건 내용 말씀드리기 전 명의 도용한 주범 대해 말씀드릴 텐데요",
  "지인분 아시는 분 바로 말씀 주세요",
  "전라도 광주 태생 40대 남성 김성우 사람 알고",
  "일면식 없고 전혀 모르는 사람 김성호 사람 대해 여쭤보는 이유 저희 지검 이번 김성호 주범 금융범죄 사기단 검거",
  "문 안 대량 대포통장 신용카드 개인 정보 들어 파일 증거 물품 압수",
  "명의 농협 하나은행 통장 발견 연락",
  "농협 하나은행 통장"
  # 추가 문장을 단어로 분리하여 추가
)





```



