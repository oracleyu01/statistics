## 🎯 예제66. 회귀트리와 모델트리 (p335)

### 📌 회귀트리란?
#### 수치를 예측하는 트리(tree)
#### 회귀트리 = 회귀 모델 + 의사결정트리 모델
### 📌 1. 표준편차 축소가 왜 필요한지?  


<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte1.png" alt="회귀트리1" width="30%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte2.png" alt="회귀트리2" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte3.png" alt="회귀트리3" width="70%">  
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte4.png" alt="회귀트리4" width="70%"> 
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte5.png" alt="회귀트리5" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte6.png" alt="회귀트리6" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte7.png" alt="회귀트리7" width="70%">

---

### 📌 2. 점수를 예측하는데 있어서  중요한 변수가 무엇인가?   

<img src="https://github.com/oracleyu01/statistics/blob/main/yys/regte8.png" alt="회귀트리8" width="70%">   

#### 2-1. 오라클 테이블 생성 및 데이터 삽입   

```r

-- 1. 테이블 생성
CREATE TABLE STUDY_SCORES (
    번호 NUMBER PRIMARY KEY,
    공부시간 NUMBER NOT NULL,
    공부방법 VARCHAR2(10) NOT NULL,
    점수 NUMBER NOT NULL
);

-- 2. 데이터 삽입
INSERT INTO STUDY_SCORES VALUES (1, 5, '독학', 52);
INSERT INTO STUDY_SCORES VALUES (2, 3, '학원', 57);
INSERT INTO STUDY_SCORES VALUES (3, 8, '독학', 55);
INSERT INTO STUDY_SCORES VALUES (4, 1, '학원', 59);
INSERT INTO STUDY_SCORES VALUES (5, 10, '독학', 50);
INSERT INTO STUDY_SCORES VALUES (6, 92, '학원', 94);
INSERT INTO STUDY_SCORES VALUES (7, 95, '독학', 98);
INSERT INTO STUDY_SCORES VALUES (8, 90, '학원', 96);
INSERT INTO STUDY_SCORES VALUES (9, 100, '독학', 92);
INSERT INTO STUDY_SCORES VALUES (10, 98, '학원', 99);

-- 변경사항 저장 (커밋)
COMMIT;

```
#### 2-2.전체 점수의 표준편차 계산  
#### 2-3.공부시간을 기준으로 그룹 나누기  
#### 2-4.공부방법을 기준으로 그룹 나누기   
#### 2-5.가중 평균 표준편차 계산 (공부시간 vs. 공부방법)   
#### 2-6.표준편차 축소(SDR) 계산   
#### 2-7.결론    

---


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

[모델트리 설명 ppt ](https://github.com/oracleyu01/statistics/blob/main/yys/RegressionTree.pdf) 


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


**문제 1**: `콘크리트 강도`를 예측하기 위해 수치 예측 모델을 생성하시오 ! 

📌 **데이터 다운로드**: [콘크리트 데이터](https://github.com/oracleyu01/statistics/blob/main/yys/concrete.csv)

✅ **R 코드**
```r

```

#### 📌 **콘크리트 데이터 설명**:
-`cement` :  시멘트  
-`slag` : 슬래그(철광석에서 철을 분리하고 남은 물질)  
-`ash` : 분(시멘트)  
-`water` : 물  
-`superplastic` : 고성능 감수제(콘크리트의 강도를 높이는 첨가제)  
-`coarseagg` : 굵은 자갈  
-`fineagg`  : 잔자갈  
-`age`  :  숙성시간  




    
✅ **문제 2**: `중고차 가격` 을 예측하는 머신러닝 모델을 생성하세요. 

📌 **데이터 다운로드**: [중고차 데이터](https://github.com/oracleyu01/statistics/blob/main/yys/usedcars.csv)

✅ **R 코드**
```r

```
