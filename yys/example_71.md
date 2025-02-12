## ▣ 예제71. k-means 클러스터링

### 🔹 이론 수업
- [k-means 알고리즘 이론](https://gamma.app/docs/k-means--4ov3477vf6k7vlo?mode=present#card-dmgv3307t1m4qax)

---

## ■ 실습1. 간단한 k-means 실습

### 1️⃣ 기본 데이터셋 생성
```r
c <- c(3,4,1,5,7,9,5,4,6,8,4,5,9,8,7,8,6,7,2,1)
row <- c('A','B','C','D','E','F','G','H','I','J')
col <- c('X','Y')
data <- matrix(c, nrow=10, ncol=2, byrow=TRUE, dimnames=list(row, col))
data
```

### 2️⃣ 데이터 시각화
```r


```

### 3️⃣ k-means 모델 생성 및 군집화 (k=2)
```r


```

### 4️⃣ 군집화된 결과와 기존 데이터를 합치기
```r


```

### 5️⃣ 중심점 시각화
```r


```

### 6️⃣ 원래 데이터와 중심점 함께 시각화
```r


```

### 7️⃣ 경계를 포함한 시각화
```r


```

---

## 🔹 연습 문제

### 문제1️⃣: 아래 데이터를 3개의 군집으로 분류하여 시각화하시오.
```r
c <- c(10, 9, 1, 4, 10, 1, 7, 10, 3, 10, 1, 1, 6, 7)
row <- c('apple', 'bacon', 'banana', 'carrot', 'salary', 'cheese', 'tomato')
col <- c('X','Y')  # X축: 단맛, Y축: 아삭한 정도
data <- matrix(c, nrow=7, ncol=2, byrow=TRUE, dimnames=list(row,col))
data
```

### 문제2️⃣: 위 데이터를 2개의 군집으로 분류하여 시각화하시오.

---

## 🔹 국영수 성적 데이터 군집화 (Segmentation)

[데이터 다운로드](https://github.com/oracleyu01/statistics/blob/main/yys/academy.csv)   


### 1️⃣ 데이터 불러오기  
```r
academy <- read.csv("c:\\data\\academy.csv")
academy
```

### 2️⃣ 수학점수와 영어점수 선택
```r


```

### 3️⃣ k-means 군집화 (k=4)
```r


```

### 4️⃣ 학생번호, 수학점수, 영어점수, 군집번호 출력
```r


```

### 5️⃣ 군집 시각화
```r


```

> **💡 마케팅 활용:** 세분화된 그룹에 맞춰 마케팅 전략을 정교하게 설계 가능

---

## 🔹 유방암 데이터 군집화 (비지도 학습)

### 1️⃣ 데이터 불러오기
```r
wisc <- read.csv("c:\\data\\wisc_bc_data.csv")
ncol(wisc)
head(wisc)
```

### 2️⃣ 필요한 컬럼 선택
```r


```

### 3️⃣ k-means 군집화 (k=2)
```r



```

### 4️⃣ 시각화
```r


```

> **💡 그래프 해석:**
> - **2번 클러스터:** 정상환자 그룹으로 데이터 밀집 → 특성이 균일
> - **1번 클러스터:** 암환자 그룹으로 데이터가 넓게 분포 → 다양한 유형 존재

---

## 🔹 연습 문제

### 문제: 아이리스 데이터를 정답 없이 3개의 군집으로 분류하여 시각화하시오.
```r
iris <- read.csv("c:\\data\\iris2.csv", header=T)
```

---


## 🔹 텍스트를 분석하여 성향이 비슷한 텍스트 분류하기

🔗 [관련 링크](https://cafe.daum.net/oracleoracle/Sotv/824)

### ✅ 특성
1. **전자제품**에 관심이 있는 사람들의 글
2. **맛집**에 관심이 있는 사람들의 글

### 1️⃣ 필요한 패키지 설치 및 로드
```r
install.packages("tm")
install.packages("SnowballC")
install.packages("cluster")
install.packages("factoextra")

library(tm)
library(SnowballC)
library(cluster)
library(factoextra)
```

### 2️⃣ 텍스트 데이터 생성 및 처리
```r
texts <- c(
  "I just bought a new smartphone and it's amazing!",
  "The battery life of this laptop is incredible.",
  "Check out this new wireless earbuds, they are fantastic.",
  "This tablet has a stunning display quality.",
  "This smartwatch has excellent features.",
  "I love exploring new restaurants in the city.",
  "The food at this restaurant is delicious.",
  "Just tried a new cafe, and their coffee is great.",
  "You should try the sushi at this place, it's top-notch.",
  "I had the best pizza at this new Italian restaurant."
)

# 텍스트 전처리 및 TF-IDF 변환


# K-means 클러스터링 및 시각화






```


### 문제. 당신은 소셜 미디어 분석가입니다. 사용자들이 작성한 리뷰를 분석하여 주요 토픽을 파악하는 과제를 받았습니다. 아래의 15개 리뷰를 분석하여 3개의 주요 토픽으로 분류해주세요.

```r

reviews <- c(
    # 영화 관련 리뷰
    "The special effects in this movie were amazing!",
    "Great acting performance by the lead actor.",
    "The plot twist at the end was unexpected.",
    "This movie's cinematography is breathtaking.",
    "The soundtrack really enhanced the movie experience.",
    
    # 게임 관련 리뷰
    "This game has incredible graphics.",
    "The multiplayer mode is really fun.",
    "Character customization options are extensive.",
    "The game's storyline is very engaging.",
    "Smooth gameplay and responsive controls.",
    
    # 여행 관련 리뷰
    "The beach resort had stunning views.",
    "Local food was absolutely delicious.",
    "Hotel service exceeded my expectations.",
    "Beautiful hiking trails in this area.",
    "The cultural experience was unforgettable."
)

```


