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
plot(data)
```

### 3️⃣ k-means 모델 생성 및 군집화 (k=2)
```r
km <- kmeans(data, 2)
km
```

### 4️⃣ 군집화된 결과와 기존 데이터를 합치기
```r
cbind(data, km$cluster)
```

### 5️⃣ 중심점 시각화
```r
plot(round(km$center), col=c("red", "blue"), pch=22, bg="dark blue", 
     xlim=range(0:10), ylim=range(0:10))
```

### 6️⃣ 원래 데이터와 중심점 함께 시각화
```r
plot(round(km$center), col=c("red", "blue"), pch=22, bg="dark blue", 
     xlim=range(0:10), ylim=range(0:10))
par(new=T)
plot(data, col=c("red","blue"), xlim=range(0:10), ylim=range(0:10))
```

### 7️⃣ 경계를 포함한 시각화
```r
install.packages("factoextra")
library(factoextra)
km <- kmeans(data, 2)
fviz_cluster(km, data=data, stand=F)
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

### 1️⃣ 데이터 불러오기
```r
academy <- read.csv("c:\\data\\academy.csv")
academy
```

### 2️⃣ 수학점수와 영어점수 선택
```r
a2 <- academy[, c(3,4)]
a2
```

### 3️⃣ k-means 군집화 (k=4)
```r
set.seed(1)
km <- kmeans(a2, 4)
km
```

### 4️⃣ 학생번호, 수학점수, 영어점수, 군집번호 출력
```r
result <- cbind(academy[, c(1, 3, 4)], km$cluster)
result
```

### 5️⃣ 군집 시각화
```r
library(factoextra)
fviz_cluster(km, data=a2, stand=F)
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
wisc2 <- wisc[, 3:32]  # 환자번호와 정답 데이터 제외
head(wisc2)
```

### 3️⃣ k-means 군집화 (k=2)
```r
set.seed(1)
km <- kmeans(wisc2, 2)
km
cbind(wisc$id, wisc$diagnosis, km$cluster)
```

### 4️⃣ 시각화
```r
library(factoextra)
fviz_cluster(km, data=wisc2, stand=F)
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

> **💡 라인별 시각화된 결과 확인 후 검사받고 점심시간!** 🍽️


