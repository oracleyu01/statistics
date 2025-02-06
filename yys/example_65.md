### 📌 예제65. 의사결정트리

수업자료: [바로가기](https://github.com/oracleyu01/statistics/blob/main/yys/의사결정트리.pdf)

### 🌳 의사결정트리란?
- 불순도를 줄이는 질문을 계속 던지면서 데이터를 분류하는 알고리즘
- **순도(Impurity)**
  - 순도가 높다: 같은 데이터들이 대부분이다.
  - 불순도가 높다: 여러 종류의 데이터들이 섞여있다.

---

### 📊 정보획득량 계산하는 3가지 방법 (빅데이터 분석기사 필기)
1. **지니계수** 
2. **엔트로피** 
3. **카이제곱**

---    
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information.png" alt="정보획득량" width="100%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information0.png" alt="정보획득량0" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information1.png" alt="정보획득량1" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information2.png" alt="정보획득량2" width="70%">
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information3.png" alt="정보획득량3" width="70%">   
<img src="https://github.com/oracleyu01/statistics/blob/main/yys/information4.png" alt="정보획득량4" width="70%">  

#### 문제1. **구매여부에 가장 영향이 큰 독립변수 찾기**
```r
# 데이터 생성
buy <- data.frame(
  cust_name = c('SCOTT', 'SMITH', 'ALLEN', 'JONES', 'WARD'),
  card_yn = c('Y', 'Y', 'N', 'Y', 'Y'),
  intro_yn = c('Y', 'Y', 'N', 'N', 'Y'),
  before_buy_yn = c('Y', 'Y', 'Y', 'N', 'Y'),
  buy_yn = c('Y', 'Y', 'N', 'Y', 'Y')
)





```

#### 문제2. **위 결과를 막대 그래프로 시각화**
```r




```

---

### 📌 R을 이용한 의사결정트리 모델 구축
**데이터:** 화장품 고객 데이터 (`skin.csv`)

#### 🔄 **의사결정트리 순서**
1. 데이터 불러오기
2. 데이터 탐색
3. 훈련 데이터와 테스트 데이터 분리
4. 의사결정트리 모델 생성
5. 테스트 데이터 예측
6. 모델 성능 확인
7. 모델 성능 평가 및 개선

---

### 🛠 **코드 구현**   

📌 **데이터 다운로드**: [skin.csv 데이터](https://github.com/oracleyu01/statistics/blob/main/yys/skin.csv)


#### 1️⃣ 데이터 불러오기
```r
setwd("c:\\data")
skin <- read.csv("skin.csv", stringsAsFactors=TRUE, fileEncoding = "euc-kr")



```

#### 2️⃣ 데이터 탐색
```r

```

#### 3️⃣ 훈련 데이터와 테스트 데이터 분리
```r




```

#### 4️⃣ 의사결정트리 모델 생성
```r



```

#### 5️⃣ 테스트 데이터 예측
```r



```

#### 6️⃣ 모델 성능 개선 (다수결 적용)
```r




```

🛑 **훈련 데이터 정확도는 100%인데 테스트 정확도는 60% → 오버피팅 발생**  
💡 **적절한 `trials` 값 조정 필요**

---

#### 🌼 **문제: `iris` 데이터셋을 이용한 의사결정트리 모델 생성**

📌 **데이터 다운로드**: [아이리스 데이터](https://github.com/oracleyu01/statistics/blob/main/yys/iris2.csv)   


### 🎯 (의사결정트리 실습예제: 은행 대출 불이행자 예측 모델)

[데이터](https://cafe.daum.net/oracleoracle/Sq3w/33)

#### 📌 1. 데이터 불러오기
```r




```

#### 🔍 2. 데이터 탐색
```r



```

##### 📑 데이터 설명
- `checking_balance`: 예금계좌
- `saving_balance`: 적금계좌
- `amount`: 대출금액
- `default`: 채무불이행 여부 (종속변수)

#### 📊 3. 대출금액 분포 확인 (히스토그램)
```r



```

#### 🔍 4. 정답 컬럼 확인
```r



```

#### 🔍 5. 결측치 확인
```r


```

#### ✂ 6. 훈련 데이터와 테스트 데이터 분리
```r




```

#### 🏗 7. 모델 생성
```r



```

#### 📊 8. 모델 확인
```r


```

#### 🎯 9. 모델 예측
```r



```

#### 📈 10. 모델 평가
```r



```

#### 🚀 11. 모델 개선 (trials 파라미터 적용)
```r





```

#### 🛠 12. 최적 모델 평가
```r



```

✅ **문제**: 와인 데이터 (wine2.csv)를 활용하여 와인의 종류를 분류하는 의사결정트리 모델을 만드세요

📌 **데이터 다운로드**: [와인 데이터](https://github.com/oracleyu01/statistics/blob/main/yys/wine2.csv)



