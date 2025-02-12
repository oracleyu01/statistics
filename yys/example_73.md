## ▣ 예제73. 모델 평가: 실습

## 1. 성능 평가 지표 설명

| 지표 | 설명 |
|------|------|
| 정확도 | 전체 예측 중 올바른 예측의 비율 |
| 카파 통계량 | 우연에 의한 정확도를 보정한 지표 |
| 민감도 | 실제 양성 중 정확히 예측된 비율 |
| 특이도 | 실제 음성 중 정확히 예측된 비율 |
| 정밀도 | 양성 예측 중 실제 양성의 비율 |
| 재현율 | 민감도와 동일 |
| F1-score | 정밀도와 재현율의 조화평균 |

**참고 자료**: [모델 평가 이론](https://cafe.daum.net/oracleoracle/Sotv/818)

---

## 2. 실습: 카파 통계량 계산

### 📌 문제
다음 혼동 행렬에 대한 카파 통계량을 구하시오:

| 실제 \ 예측 | False | True | 합계 |
|------------|-------|------|------|
| False      | 70    | 30   | 100  |
| True       | 40    | 60   | 100  |
| 합계       | 110   | 90   | 200  |

### 💻 코드
```r
# 혼동 행렬 생성
a <- as.table(matrix(c(70, 30, 40, 60), 
                     byrow=TRUE, 
                     nrow=2, 
                     ncol=2))
```

## 3. 머신러닝 모델 평가

### 📌 데이터셋: Wisconsin Breast Cancer Data

#### 전체 코드: 
```r
setwd("c:\\data")
wbcd <-  read.csv("wisc_bc_data.csv", header=T, stringsAsFactors=FALSE)

# 2. 종속변수를 팩터로 변환하기
wbcd$diagnosis <- factor( wbcd$diagnosis,
                          levels= c("B","M"),
                          labels=c("Benign", "Maliganant") ) 
str(wbcd)
nrow(wbcd) #569

#2. sample 함수를 이용해서 데이터를 섞습니다. 
set.seed(2) 
sample(10) # 1부터 10까지의 숫자를 랜덤으로 섞어서 출력하는 코드
wbcd_shuffle <- wbcd[ sample(569),    ] # 설명:  wbcd[  행,  열 ]
wbcd_shuffle

#3. 최대 최소 정규화 
wbcd2 <-  wbcd_shuffle[ , -1 ] #id삭제
str(wbcd2) 

normalize <-  function(x) {
    return  ( (x-min(x)) / ( max(x) - min(x) ) )
}

wbcd_n <- as.data.frame( lapply( wbcd2[ , 2:31], normalize)  )
nrow( wbcd_n ) # 569 

#4. 훈련 데이터와 테스트 데이터를 9대 1로 분리합니다.
train_num <- round( 0.9 * nrow(wbcd_n), 0 ) #데이터를 9:1로 나눈다
train_num  # 512 

wbcd_train <- wbcd_n[ 1:train_num,  ]      # 훈련 데이터 구성
wbcd_test  <- wbcd_n[ (train_num+1) : nrow(wbcd_n),  ]   # 테스트 데이터 구성
nrow(wbcd_test)   # 57

wbcd_train_label <-  wbcd2[ 1:train_num,  1 ]     # 훈련 데이터의 정답
wbcd_test_label <- wbcd2[ (train_num+1) : nrow(wbcd_n), 1  ]  # 테스트 데이터 정답
wbcd_test_label

#5.  knn 모델을 생성합니다. 
# install.packages("class")
library(class)

result1 <- knn(train=wbcd_train, test=wbcd_test,   cl=wbcd_train_label, k=21)
result1

## 여기서 부터 실습 시작 

```

#### 단계 4: 성능 평가
| 평가 지표    | 값        |
|-------------|-----------|
| 정확도      | 0.9122807 |
| 카파 통계량 | 0.8224    |
| 민감도      | 0.8148148 |
| 특이도      | 1.0000000 |
| 정밀도      | 1.0000000 |
| 재현율      | 0.8148148 |
| F1-score    | 0.8979592 |

### 📌문제. 독버섯 머신러닝 모델의 정확도외에 다른 성능 지표를 출력하세요.

#### 모델 생성까지 수행하시고 그 이후부터는 예제의 스크립트를 활용해서 문제를 푸세요.
```r
#1. 데이터 불러오기
mush <- read.csv("c:\\data\\mushrooms.csv", stringsAsFactors=TRUE)

#2. 데이터 관찰하기
dim(mush)
str(mush)

#3. 훈련과 테스트 분할하기
library(caret)
set.seed(1)

k <-  createDataPartition( mush$type, p=0.8, list=F) #  훈련 데이터 80%
train_data  <- mush[ k,    ]
test_data <- mush[ -k,    ]

#4. 모델 훈련하기
library(e1071)
model <-  naiveBayes( type ~  . ,  data=train_data, laplace=0.0001 )

#5. 테스트 데이터 예측하기
result <-  predict( model,  test_data[    , -1] )  # 정답 빼고 넣어줍니다.

#6. 모델 평가하기 
library(gmodels)
sum(result == test_data[  , 1] )  / length( test_data[  , 1 ]) * 100
CrossTable(x=result, y=test_data[   , 1], chisq=TRUE )

#■다른 성능 척도 구하기 

actual_type <- test_data[  , 1]   #테스트 데이터의 실제값
predict_type <- result   #테스트 데이터의 예측값
positive_value <- 'poisonous' # 관심범주(yes)
negative_value <- 'edible'  # 관심범주(no)

#■ 정확도
library(gmodels)
g <- CrossTable( actual_type, predict_type )
x <- sum(g$prop.tbl *diag(2)) #정확도 확인하는 코드
x 




```


