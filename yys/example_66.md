# 🎯 예제66. 회귀트리와 모델트리 (p335)

## 📌 회귀트리란?
### 수치를 예측하는 트리(tree)
### 회귀트리 = 회귀 모델 + 의사결정트리 모델
## 📌 1. 표준편차 축소가 왜 필요한지?  


<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte1.png" alt="회귀트리1" width="30%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte2.png" alt="회귀트리2" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte3.png" alt="회귀트리3" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte4.png" alt="회귀트리4" width="70%"> 
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte5.png" alt="회귀트리5" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte6.png" alt="회귀트리6" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte7.png" alt="회귀트리7" width="70%">

---

## 📌 2. 점수를 예측하는데 있어서  중요한 변수가 무엇인가?   

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte8.png" alt="회귀트리8" width="70%">

---


## 📌 3. 간단한 와인 데이터 품질을 예측하기 위해 중요한 변수가 무엇인지? 

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree10.png" alt="회귀트리10" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree11.png" alt="회귀트리11" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree12.png" alt="회귀트리12" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree13.png" alt="회귀트리13" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree14.png" alt="회귀트리14" width="70%"> 
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree15.png" alt="회귀트리15" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree16.png" alt="회귀트리16" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree17.png" alt="회귀트리17" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree18.png" alt="회귀트리18" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree19.png" alt="회귀트리19" width="70%">

```r

install.packages("data.table")  # 패키지 설치 (최초 1회 실행)
library(data.table)

# 데이터 생성
df <- data.table(
  Index = 1:7,
  Alcohol = c(10.5, 10.7, 10.2, 11.0, 11.5, 11.3, 12.0),
  Volatile = c(0.310, 0.290, 0.250, 0.200, 0.400, 0.480, 0.500),
  Free_Sulfur = c(12.0, 15.0, 18.0, 8.0, 11.0, 14.0, 9.0),
  Quality = c(3, 4, 5, 5, 6, 7, 8)
)

# 전체 Quality의 표준편차 계산
sd_root <- sd(df$Quality)
print(paste("전체 Quality의 표준편차:", sd_root))

# 표준편차 축소(SDR) 계산 함수 정의
compute_sdr <- function(var) {
  group_stats <- df[, .(sd = sd(Quality), n = .N), by = var]  # 변수별 그룹 나누기 후 표준편차 및 개수 계산
  weighted_sd <- sum((group_stats$n / sum(group_stats$n)) * group_stats$sd, na.rm = TRUE)  # 가중 표준편차
  sdr_value <- sd_root - weighted_sd  # SDR 계산
  return(sdr_value)
}

# 각 독립변수에 대해 SDR 계산
sdr_values <- sapply(c("Alcohol", "Volatile", "Free_Sulfur"), compute_sdr)

# SDR이 작은 순서대로 정렬
sdr_sorted <- sort(sdr_values)

# 결과 출력
print("SDR이 작은 순서대로 정렬된 변수:")
print(sdr_sorted)

```



[회귀트리 설명 ppt ](https://github.com/oracleyu01/statistics/blob/main/yys/RegressionTree.pdf) 



### 🎯 R을 이용한 회귀트리 모델 생성 (p339)
#### ✅ 목표: 와인의 품질(수치형 데이터)을 예측하는 회귀트리 모델 생성

#### 📌 데이터 로드   
```r  



```

#### ✅ 종속변수 정규분포 확인   
```r  


```

#### ✅ 결측치 확인
```r  


```

#### ✅ 훈련 데이터와 테스트 데이터 분리  
```r  



```

#### ✅ 회귀트리 모델 생성   
```r  



```   

#### ✅ 생성된 모델 시각화   
```r  



```

#### ✅ 테스트 데이터 예측   
```r  


```   

#### ✅ 모델 성능 평가 (상관계수 확인)   
```r  



```

#### ✅ 모델 성능 향상 (모델트리 적용)   
```r  




```

#### ✅ 랜덤 포레스트 적용  
```r  



```

#### ✅ 성능 비교
#### 회귀트리 -> 모델트리 -> 랜덤포레스트 순으로 성능 향상
#### cor 값: 0.51 -> 0.59 -> 0.74

#### ✅ MAE (Mean Absolute Error) 계산   
```r  



```   

#### ✅ 결론: 랜덤포레스트가 가장 높은 예측 성능을 보임
