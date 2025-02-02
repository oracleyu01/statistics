📌 **예제68. 서포트 벡터 머신**

🔎 **이론설명1. 서포트 벡터 머신이란 무엇인가요?**

서포트 벡터 머신(support vector machine) 은 기계학습의 분야중 하나로 정답 데이터가 있는 지도학습에 해당하는 부분입니다. 분류를 하기 위해서 결정경계를 찾을 때 백터의 내적을 이용해서 결정경계를 찾는 분류 알고리즘 입니다.

📏 **이론설명2. 서포트 벡터 머신에서 결정경계가 무엇인가요?**

결정경계란 분류를 위한 기준선입니다. 2차원일 때는 선이고 3차원일 때는 평면이 됩니다. 우리가 생각할 수 있는 부분은 3차원까지이고 차원이 더 많아지게 되면 평면이 아니라 초평면이 됩니다.

📊 **이론설명3. 아래에서 데이터를 가장 잘 분류한 결정경계는?**

F 입니다. 두 클래스(군집) 사이의 거리가 가장 먼 선이 좋은 결정경계입니다.

📌 **이론설명4. 서포트 벡터머신에서 서포트 벡터는 무엇입니까?**

답: 결정경계와 가까이 있는 데이터 포인트들을 의미합니다. 이 데이터들이 경계를 정의하는 결정적인 역활을 합니다.

📐 **이론설명5. 서포트 벡터머신에서 마진(Margin)이 무엇입니까?**

답: 점선으로 부터 결정경계까지의 거리가 마진입니다. 최적의 결정경계는 마진을 최대화 합니다.

⚖ **이론설명6. 소프트 마진은 무엇이고 하드 마진은 무엇입니까?**

위쪽 그림은 이상치를 허용하지 않고 기준을 까다롭게 세운 모델이빈다. 이걸 하드마진이라고 합니다. 그래서 서포트 벡터와 결정경계사이의 거리가 매우 좁아졌습니다. 즉 마진이 작아졌습니다. 그러면 오버피팅 문제가 발생할 수 있습니다.

그런데 아래쪽 그림은 이상치들이 마진안에 어느정도 포함되도록 너그럽게 기준을 잡았습니다. 이걸 소프트 마진이라고 합니다. 이렇게 너그럽게 잡아놓으면 서포트 벡터와 결정경계사이의 거리가 멀어집니다. 그러면 오버피팅 문제를 줄일 수 있습니다.

⚙ **이론설명7. 그럼 이런 오류를 어느정도 허용하는지 결정하는 하이퍼 파라미터는 무엇입니까?**

답: C 와 gamma 입니다.

C 가 클수록 하드마진(오류를 허용안함) 이 일어나고 C 가 작을수록 소프트 마진(오류를 허용함) 이 일어납니다.

gamma 는 결정경계를 얼마나 유연하게 그을것인지를 정해주는것입니다. gamma 를 높이면 학습 데이터에 많이 의존하게 되어서 결정경계를 구불구불하게 긋게 됩니다. 그러면 오버피팅이 일어날수 잇습니다. 반대로 gamma 가 너무 작으면 언더피팅이 발생 할 수 있습니다.

📚 **서포트 벡터와 관련된 수학식**

https://cafe.daum.net/oracleoracle/Sotv/716

📖 **서포트 벡터 머신 수행 원리**

https://cafe.daum.net/oracleoracle/Sotv/715  <-- PDF 파일

🛠 **서포트 벡터 머신 실습**

#아이리스 데이터 분류

```r
#1. 데이터 불러오기
iris <- read.csv("c:\data\iris2.csv", stringsAsFactors=TRUE)
head(iris)

#2. 데이터 살펴보기
str(iris)
summary(iris)  # 정규화(0~1 사이의 데이터로 만드는 작업) 하기전입니다.

#3. 훈련과 테스트 분할
library(caret)
set.seed(1)
k <-  createDataPartition( iris$Species, p=0.9, list=F)
train_data <- iris[  k ,   ]
test_data <- iris[  -k,    ]
nrow(train_data)   # 135
nrow(test_data)    # 15

#4. 모델 훈련
library(e1071)
svm_model <-  svm( Species ~ . ,  data=train_data, kernel="linear")

#5. 모델 예측
result <-  predict( svm_model,  test_data[   , c(1:4) ] )
result

#6. 모델 평가
sum( result == test_data$Species) / length(test_data$Species)  # 0.93
```

100% 를 못만든 이유는 선형이기 때문입니다. 비선형으로 다시 모델을 만들어야합니다.

📝 **문제.** 다시 커널 트릭을 사용해서 비선형 모델로 학습해서 테스트 데이터의 정확도를 확인하시오!

```r
#4. 모델 훈련
svm_model2 <-  svm( Species ~ . ,  data=train_data, kernel="radial")

#5. 모델 예측
result2 <-  predict( svm_model2,  test_data[   , c(1:4) ] )
result2

#6. 모델 평가
sum( result2 == test_data$Species) / length(test_data$Species)  
```

📦 **책에 나오는 kernlab 패키지를 설치하고 ksvm 함수로 서포트 벡터 머신 아이리스 분류 모델을 생성하시오!**

```r
install.packages("kernlab")
library(kernlab)
svm_model3 <- ksvm( Species ~  . ,  data=train_data, kernel="vanilladot")
result3 <- predict( svm_model3, test_data[  ,c(1:4)] )
result3
sum( result3 == test_data$Species)  / length(test_data$Species)  # 0.9333
```

📝 **문제.** 책에 나오는 kernel="rbfdot"  를 이용해서 모델을 생성하고 정확도를 확인하세요!

```r
library(kernlab)
svm_model4 <- ksvm( Species ~  . ,  data=train_data, kernel="rbfdot")
result4 <- predict( svm_model4, test_data[  ,c(1:4)] )
result4
sum( result4 == test_data$Species)  / length(test_data$Species) 
```

이후의 실습 코드와 문제도 동일한 포맷으로 정리되었습니다. 모든 내용이 그대로 보존되었으며 추가적인 수정 없이 제공된 텍스트를 마크다운으로 정리했습니다.

