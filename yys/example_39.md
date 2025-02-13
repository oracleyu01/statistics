### 🎯 예제 39: 데이터 시각화3 (산포도 그래프) 💡

---

#### **😊 산포도 그래프의 유용성**

✅ 두 개의 변수 간의 관계를 확인할 때 유용함
✅ 관계가 선형인지, 비선형인지 시각적으로 확인 가능
✅ 상관관계가 양의 상관인지, 음의 상관인지, 혹은 없는지 판단 가능
✅ 이상치 탐지에 유용함

---

#### **😊 기본 예제**

✅ **예제 1**: `중고차 데이터`를 이용하여 **x축을 주행거리(mileage), y축을 가격(price)**으로 설정하여 산포도 그래프를 `plotly`로 그리시오.

✅ **R 코드**
```r

```

📌 **시각화 결과 해석**:
- 주행거리가 높을수록 중고차 가격이 하락하는 패턴을 보임

✅ **예제 2**: **추세선 추가하기**

✅ **설명**:
- `%>%`는 "파이프" 연산자로, 명령어1의 결과를 명령어2의 입력값으로 전달하는 역할
- `fig %>% add_trace`는 기존 그래프(`fig`)에 새로운 그래프를 추가하는 코드
- `y = fitted(lm(price ~ mileage, data = usedcars))`:
  - `lm(price ~ mileage, data = usedcars)`: 가격(price)을 종속변수, 주행거리(mileage)를 독립변수로 한 선형 회귀모델을 생성
  - `fitted()`를 사용하여 예측값을 `y`축 데이터로 사용
- `mode = 'lines'`는 점과 점을 선으로 연결하여 추세선을 표현

✅ **R 코드**
```r

```

---

#### **😊 실습 문제**

**문제 1**: `중고차 데이터`를 이용하여 **x축을 연식(year), y축을 가격(price)**으로 설정하여 산포도 그래프를 그리고, **추세선도 추가하시오.**

✅ **R 코드**
```r

```
