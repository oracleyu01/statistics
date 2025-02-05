### 🎯 예제66. 회귀트리와 모델트리 (p335)

#### 📌 회귀트리란?
#### 수치를 예측하는 트리(tree)
#### 회귀트리 = 회귀 모델 + 의사결정트리 모델

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree1.png" alt="회귀트리1" width="100%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree2.png" alt="회귀트리2" width="80%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree3.png" alt="회귀트리3" width="80%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree4.png" alt="회귀트리4" width="80%">   
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree5.png" alt="회귀트리5" width="80%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree6.png" alt="회귀트리6" width="120%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree7.png" alt="회귀트리7" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree8.png" alt="회귀트리8" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regtree9.png" alt="회귀트리9" width="70%">  

[회귀트리 설명 ppt ](https://github.com/oracleyu01/statistics/blob/main/yys/RegressionTree.pdf) 

#### 🎯 R을 이용한 회귀트리 모델 생성 (p339)
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
