▣  예제73. ROC 커브와 cut-off 

이론 수업자료: https://cafe.daum.net/oracleoracle/Sotv/851

실습 자료 : https://cafe.daum.net/oracleoracle/Sotv/854

독일 은행 은행 대출금 불이행자 예측 모델 만들기

# 데이터 로드
credit <- read.csv("c:\\data\\credit.csv", stringsAsFactors=TRUE)

# 결측치 확인
colSums(is.na(credit))

# 데이터 분할
library(caret)
set.seed(1)
k <- createDataPartition(credit$default, p=0.9, list=F)
train_data <- credit[k, ]
test_data <- credit[-k, ]
nrow(train_data)  #900
nrow(test_data)   #100


# 모델 생성 및 훈련(의사결정트리 모델 만들기)

#install.packages("C50")
library(C50)
credit_model <- C5.0(train_data[, -17], train_data[, 17])

# 모델 예측
result <- predict(credit_model, test_data[, -17])

# 모델 평가
accuracy <- sum(result == test_data[, 17]) / 100
accuracy  # 0.67  <---  의사결정 나무 1개로 예측한 정확도

# ROC 곡선 그리기
credit_test_prob <- predict(credit_model, test_data[, -17], type="prob")
credit_test_prob

# type="prob" 를 사용하면 확률을 볼 수 있습니다.
# 확률 정보가 있어야 roc 곡선을 그릴 수 있습니다. 
            no        yes
17  0.88151261 0.11848739
32  0.84999999 0.15000001

# roc 곡선 그릴때 필요한 데이터 프레임 생성 

credit_results <- data.frame(
  actual_type = test_data[, 17],    #  정답
  predict_type = result,              # 예측값
  prob_yes = round(credit_test_prob[, 2], 5),   # 채무 불이행할 확률
  prob_no = round(credit_test_prob[, 1], 5)     # 채무 이행할 확률
)

head(credit_results)

# 민감도, 특이도, 정밀도 계산

# 민감도 : (환자입장) 암환자를 암환자로 잘 예측한 비율
# 특이도 : (환자입장) 정상환자를 정상환자로 잘 예측한 비율
# 정밀도 :(모델입장) 모델이 암환자로 예측한 환자중에서 실제로 암환자인 비율

library(caret)
sensitivity(credit_results$predict_type, credit_results$actual_type, positive='yes')
specificity(credit_results$predict_type, credit_results$actual_type, negative='no')
posPredValue(credit_results$predict_type, credit_results$actual_type, positive='yes')

# 위의 데이터 3개는 roc 곡선을 그릴때 꼭 필요한 데이터는 아니지만
# roc 곡선과 같이 결과로 보여줘야하는 데이터여서 출력함

# ROC 곡선 그리기
install.packages("ROCR")
library(ROCR)
pred <- prediction(predictions = credit_results$prob_yes, labels = credit_results$actual_type)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
perf  #  26 data points

plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)  # 대각선 그래프 표시

# AUC 계산
value <- performance(pred, measure = "auc")
auc <- unlist(value@y.values)
auc  #0.64 출력,  1에 가까울 수록 좋은 모델

# 최적의 Cut-off 지점 찾기
cutoff_data <- data.frame(cut = perf@alpha.values[[1]], tpr = perf@y.values[[1]], fpr = perf@x.values[[1]])
cutoff_data   # cut-off 값, tpr과 fpr 데이터를 추출해서 cutoff_data 라는 데이터 프레임생성

# tpr 에서 fpr 을 뺀값인 distance 라는 컬럼을 추가합니다.
# 최적의 cut-off 지점이 distance 값이 최대가 되는 지점 입니다.

cutoff_data$distance <- cutoff_data$tpr - cutoff_data$fpr
optimal_cutoff <- cutoff_data[which.max(cutoff_data$distance), "cut"]
optimal_cutoff  #0.191

# 최적의 Cut-off 지점 시각화
optimal_tpr <- cutoff_data[which.max(cutoff_data$distance), "tpr"]
optimal_fpr <- cutoff_data[which.max(cutoff_data$distance), "fpr"]
optimal_tpr  #0.7   최적의 cutoff 지점의 tpr 값
optimal_fpr  # 0.34   최적의 cutoff 지점의 fpr 값

# ROC 곡선 그리기 및 CUT-OFF 지점 포인트 찍기
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
points(optimal_fpr, optimal_tpr, col = "red", pch = 19)
text(optimal_fpr, optimal_tpr, labels = round(optimal_cutoff, 2), pos = 4, col = "red")

빅분기 실기 문제1: 데이터 로드 및 전처리문제:

유방암 데이터를 wisc_bc_data.csv 파일에서 로드하고 전처리하십시오.
불필요한 id 컬럼을 제거하고 diagnosis 컬럼을 factor 타입으로 변환하십시오.

답:
data <- read.csv("c:\\data\\wisc_bc_data.csv", stringsAsFactors=TRUE)
head(data)

data <- data[  ,  -1 ]
data$diagnosis <- as.factor(data$diagnosis)
str(data)
 
빅분기 실기 문제2  : 데이터 분할문제:

데이터를 훈련 데이터(90%)와 테스트 데이터(10%)로 나누십시오.

답:
library(caret)
set.seed(1)
k <-  createDataPartition(data$diagnosis, p=0.9, list=F)
train_data <-  data[ k,  ]
test_data <-  data[-k,   ]
nrow(train_data)  # 513
nrow(test_data)   # 56

빅분기 실기 문제3: 모델 생성 및 훈련문제:

C5.0 알고리즘을 사용하여 의사결정트리 모델을 생성하고 훈련하십시오.

답:
library(C50)
wisc_model <-  C5.0( train_data[  , -1], train_data[  , 1] )  

빅분기 실기 문제 4: 모델 예측문제:

훈련된 모델을 사용하여 테스트 데이터에 대해 예측하십시오.
답:
result <- predict( wisc_model,  test_data[  , -1] )  
result

빅분기 실기  문제 5: 모델 평가문제:

모델의 정확도를 계산하십시오.
답:

accuracy <-  sum( result == test_data[  , 1]) / nrow( test_data)
accuracy   #0.98
 

빅분기 실기  문제 6: ROC 곡선 그리기문제:

ROC 곡선을 그리고 AUC 값을 계산하십시오.

답:
# ROC 곡선 그리기
wisc_test_prob <- predict(wisc_model, test_data[, -1], type="prob")
wisc_test_prob

 # roc 곡선 그릴때 필요한 데이터 프레임 생성 

wisc_results <- data.frame(
  actual_type = test_data[, 1],    #  정답
  predict_type = result,              # 예측값
  prob_M = round(wisc_test_prob[, 2], 5),   # 암일 확률
  prob_B = round(wisc_test_prob[, 1], 5)     # 정상일 확률
)

library(caret)
sensitivity(wisc_results$predict_type, wisc_results$actual_type, positive='M')
specificity(wisc_results$predict_type, wisc_results$actual_type, negative='B')
posPredValue(wisc_results$predict_type, wisc_results$actual_type, positive='M')

# ROC 곡선 그리기
install.packages("ROCR")
library(ROCR)
pred <- prediction(predictions = wisc_results$prob_M, labels = wisc_results$actual_type)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
perf  #  26 data points

plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)  # 대각선 그래프 표시


# AUC 계산
value <- performance(pred, measure = "auc")
auc <- unlist(value@y.values)
auc  # 0.9748299

 
빅분기 실기  문제 7: 최적의 Cut-off 지점 찾기문제:

최적의 Cut-off 지점을 찾고 ROC 곡선에 시각화하십시오.

답:

# 최적의 Cut-off 지점 찾기
cutoff_data <- data.frame(cut = perf@alpha.values[[1]], tpr = perf@y.values[[1]], fpr = perf@x.values[[1]])
cutoff_data   # cut-off 값, tpr과 fpr 데이터를 추출해서 cutoff_data 라는 데이터 프레임생성

# tpr 에서 fpr 을 뺀값인 distance 라는 컬럼을 추가합니다.
# 최적의 cut-off 지점이 distance 값이 최대가 되는 지점 입니다.

cutoff_data$distance <- cutoff_data$tpr - cutoff_data$fpr
optimal_cutoff <- cutoff_data[which.max(cutoff_data$distance), "cut"]
optimal_cutoff  #0.191

# 최적의 Cut-off 지점 시각화
optimal_tpr <- cutoff_data[which.max(cutoff_data$distance), "tpr"]
optimal_fpr <- cutoff_data[which.max(cutoff_data$distance), "fpr"]
optimal_tpr  #0.7   최적의 cutoff 지점의 tpr 값
optimal_fpr  # 0.34   최적의 cutoff 지점의 fpr 값

# ROC 곡선 그리기 및 CUT-OFF 지점 포인트 찍기
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
points(optimal_fpr, optimal_tpr, col = "red", pch = 19)
text(optimal_fpr, optimal_tpr, labels = round(optimal_cutoff, 2), pos = 4, col = "red")

점심시간 문제.  독일 은행 데이터를 이용한 의사결정트리 모델의 정확도를
  0.67 에서 좀더 올리고 ROC 곡선과 cut-off 를 시각화 하시오 !

독일 은행 은행 대출금 불이행자 예측 모델 만들기

힌트: credit_model <- C5.0(train_data[, -17], train_data[, 17], trials=100) 

# 데이터 로드
credit <- read.csv("c:\\data\\credit.csv", stringsAsFactors=TRUE)

# 결측치 확인
colSums(is.na(credit))

# 데이터 분할
library(caret)
set.seed(1)
k <- createDataPartition(credit$default, p=0.9, list=F)
train_data <- credit[k, ]
test_data <- credit[-k, ]
nrow(train_data)  #900
nrow(test_data)   #100


# 모델 생성 및 훈련(의사결정트리 모델 만들기)

#install.packages("C50")
library(C50)
credit_model <- C5.0(train_data[, -17], train_data[, 17])

# 모델 예측
result <- predict(credit_model, test_data[, -17])

# 모델 평가
accuracy <- sum(result == test_data[, 17]) / 100
accuracy  # 0.67  <---  의사결정 나무 1개로 예측한 정확도

# ROC 곡선 그리기
credit_test_prob <- predict(credit_model, test_data[, -17], type="prob")
credit_test_prob

# type="prob" 를 사용하면 확률을 볼 수 있습니다.
# 확률 정보가 있어야 roc 곡선을 그릴 수 있습니다. 
            no        yes
17  0.88151261 0.11848739
32  0.84999999 0.15000001

# roc 곡선 그릴때 필요한 데이터 프레임 생성 

credit_results <- data.frame(
  actual_type = test_data[, 17],    #  정답
  predict_type = result,              # 예측값
  prob_yes = round(credit_test_prob[, 2], 5),   # 채무 불이행할 확률
  prob_no = round(credit_test_prob[, 1], 5)     # 채무 이행할 확률
)

head(credit_results)

# 민감도, 특이도, 정밀도 계산

# 민감도 : (환자입장) 암환자를 암환자로 잘 예측한 비율
# 특이도 : (환자입장) 정상환자를 정상환자로 잘 예측한 비율
# 정밀도 :(모델입장) 모델이 암환자로 예측한 환자중에서 실제로 암환자인 비율

library(caret)
sensitivity(credit_results$predict_type, credit_results$actual_type, positive='yes')
specificity(credit_results$predict_type, credit_results$actual_type, negative='no')
posPredValue(credit_results$predict_type, credit_results$actual_type, positive='yes')

# 위의 데이터 3개는 roc 곡선을 그릴때 꼭 필요한 데이터는 아니지만
# roc 곡선과 같이 결과로 보여줘야하는 데이터여서 출력함

# ROC 곡선 그리기
install.packages("ROCR")
library(ROCR)
pred <- prediction(predictions = credit_results$prob_yes, labels = credit_results$actual_type)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
perf  #  26 data points

plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)  # 대각선 그래프 표시

# AUC 계산
value <- performance(pred, measure = "auc")
auc <- unlist(value@y.values)
auc  #0.64 출력,  1에 가까울 수록 좋은 모델

# 최적의 Cut-off 지점 찾기
cutoff_data <- data.frame(cut = perf@alpha.values[[1]], tpr = perf@y.values[[1]], fpr = perf@x.values[[1]])
cutoff_data   # cut-off 값, tpr과 fpr 데이터를 추출해서 cutoff_data 라는 데이터 프레임생성

# tpr 에서 fpr 을 뺀값인 distance 라는 컬럼을 추가합니다.
# 최적의 cut-off 지점이 distance 값이 최대가 되는 지점 입니다.

cutoff_data$distance <- cutoff_data$tpr - cutoff_data$fpr
optimal_cutoff <- cutoff_data[which.max(cutoff_data$distance), "cut"]
optimal_cutoff  #0.191

# 최적의 Cut-off 지점 시각화
optimal_tpr <- cutoff_data[which.max(cutoff_data$distance), "tpr"]
optimal_fpr <- cutoff_data[which.max(cutoff_data$distance), "fpr"]
optimal_tpr  #0.7   최적의 cutoff 지점의 tpr 값
optimal_fpr  # 0.34   최적의 cutoff 지점의 fpr 값

# ROC 곡선 그리기 및 CUT-OFF 지점 포인트 찍기
plot(perf, main = "ROC 커브", col = "blue", lwd = 2)
abline(a = 0, b = 1, lwd = 2, lty = 2)
points(optimal_fpr, optimal_tpr, col = "red", pch = 19)
text(optimal_fpr, optimal_tpr, labels = round(optimal_cutoff, 2), pos = 4, col = "red")

