## 예제69. 신경망

🔗 [관련 링크](https://cafe.daum.net/oracleoracle/Sotv/746)

---

### 🧠 1. Sigmoid 함수 만들기

Sigmoid 함수는 그리스어 '시그마'에서 유래한 것으로, S 자 모양을 띄는 함수이므로 시그모이드(sigmoid)라는 이름이 붙었습니다.

✔️ 0~1 사이의 데이터를 출력하여 확률 값을 표현할 수 있어 유용합니다.  
✔️ 역전파 과정에서 미분이 용이하여 신경망 학습에 적합합니다.

```r




```

---

### 🔢 2. Softmax 함수 만들기

Softmax 함수는 단순한 최대값 출력이 아닌, 확률적 분포를 고려하여 부드럽게 값을 변환하는 함수입니다.

✅ 입력값 예시:
- (98, 73) → Softmax → (0.8, 0.2)  
- (98, 73) → Max → (1, 0)  

```r



```

---

### 🔗 3. 3층 신경망 R 구현하기

```r




```

✅ **순전파(Forward Propagation)**까지 완료하였습니다.
✅ 역전파(Backpropagation)는 Python과 딥러닝에서 학습할 예정입니다.

---

### 🍷 4. R을 이용한 와인 분류 신경망

```r





```

---

### 🌿 5. Iris 데이터 신경망 분류

```r
# 데이터 불러오기
iris <- read.csv("c:\\data\\iris2.csv", stringsAsFactors=TRUE)





```

---

### 🏗️ 6. 콘크리트 강도 예측 신경망

```r
# 데이터 로드
concrete <- read.csv("c:\\data\\concrete.csv")





```

---

### 📊 7. 실험 결과 시각화

```r
library(ggplot2)
data <- data.frame(
  Experiment = c('1번 실험', '2번 실험', '3번 실험', '4번 실험'),
  Correlation_Coefficient = c(0.82, 0.94, 0.96, 0.95)
)

# 막대 그래프 생성
ggplot(data, aes(x=Experiment, y=Correlation_Coefficient, fill=Experiment)) +
  geom_bar(stat='identity') +
  theme_minimal() +
  ggtitle("Correlation Coefficient by Experiment") +
  xlab("Experiment") +
  ylab("Correlation Coefficient")
```

---

✅ **완료!** 🎉
이제 신경망을 활용한 분류 및 회귀 모델을 잘 활용할 수 있습니다. 필요한 경우 추가 실험을 진행해보세요! 🚀

