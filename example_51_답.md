# 가설검정 1: 단일 모집단의 모평균 검정
## - 분산을 아는 경우(Z 검정)

### 📊 가설검정의 유형
![가설검정의 유형](그림11.png)
![가설검정의 유형](table1.png)  
[아래의 예제와 문제들을 수식으로 이해하기](https://chatgpt.com/share/678e5d35-a614-8009-85b7-a7e0e5e2862a)   

## 1️⃣ 이론 설명

### Z 검정이란?
- 모집단의 분산(σ²)을 알고 있는 경우에 사용하는 검정 방법
- 표본의 크기가 큰 경우(n≥30) 중심극한정리에 의해 표본평균이 정규분포를 따름
- 검정통계량은 표준정규분포 Z ~ N(0,1)를 따름

### 검정통계량
$$Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}$$

여기서:
- $\bar{X}$ : 표본평균
- $\mu_0$ : 귀무가설에서의 모평균
- $\sigma$ : 모표준편차
- $n$ : 표본의 크기

### 가설 설정
1. 양측검정
   - H₀: μ = μ₀
   - H₁: μ ≠ μ₀

2. 우측검정
   - H₀: μ ≤ μ₀
   - H₁: μ > μ₀

3. 좌측검정
   - H₀: μ ≥ μ₀
   - H₁: μ < μ₀

## 2️⃣ 양측검정

<details>
<summary><b>📝 예제: 제품 품질 관리</b></summary>

어떤 공장에서 생산되는 제품의 무게는 평균이 500g이고 표준편차가 10g인 정규분포를 따른다고 한다.
새로운 생산 방식을 도입한 후 임의로 36개의 제품을 추출하여 측정한 결과 평균이 503g이 나왔다.
새로운 생산 방식이 제품의 평균 무게를 변화시켰다고 할 수 있는가? (α = 0.05)  



```r
# 데이터 설정
mu0 <- 500      # 귀무가설의 평균
sigma <- 10     # 알려진 표준편차
xbar <- 503     # 표본평균
n <- 36         # 표본크기
alpha <- 0.05   # 유의수준

# 검정통계량 Z 계산
z_stat <- (xbar - mu0)/(sigma/sqrt(n))
print(paste("Z 통계량:", round(z_stat, 3)))

# 양측검정의 임계값
z_crit <- qnorm(1-alpha/2)
print(paste("임계값: ±", round(z_crit, 3)))

# p-value 계산 (양측검정)
p_value <- 2 * (1 - pnorm(abs(z_stat)))
print(paste("p-value:", round(p_value, 4)))

# 결과 해석
if(p_value < alpha) {
  print("귀무가설을 기각합니다.")
  print("새로운 생산 방식이 제품의 평균 무게를 변화시켰다고 할 수 있습니다.")
} else {
  print("귀무가설을 기각할 수 없습니다.")
}

# 시각화
curve(dnorm, from=-4, to=4, main="표준정규분포와 검정통계량",
      ylab="밀도", xlab="Z")
abline(v=c(-z_crit, z_crit), col="red", lty=2)
abline(v=z_stat, col="blue", lwd=2)
legend("topright", 
       legend=c("임계값", "검정통계량"), 
       col=c("red", "blue"), 
       lty=c(2, 1))
```
</details>

## 3️⃣ 단측검정

<details>
<summary><b>🎯 문제</b></summary>

한 제약회사에서 생산하는 진통제의 유효성분 함량은 평균이 50mg이고 표준편차가 2mg인 정규분포를 따른다.
품질 관리자가 무작위로 49개의 진통제를 선택하여 검사한 결과 평균 함량이 49.5mg으로 나타났다.
유의수준 1%에서 이 진통제의 유효성분 함량이 감소했다고 할 수 있는가?

1) 가설을 설정하시오
2) 검정통계량을 계산하시오
3) 결론을 내리시오
4) R코드로 분석하시오
</details>

<details>
<summary><b>✍️ 정답</b></summary>

1) 가설 설정 (좌측검정)
   - H₀: μ ≥ 50
   - H₁: μ < 50

2) 검정통계량
   $$Z = \frac{49.5 - 50}{2/\sqrt{49}} = -1.75$$

3) α = 0.01일 때 임계값 = -2.326
   |-1.75| < 2.326이므로 귀무가설 기각 실패

4) R코드
```r
# 데이터 설정
mu0 <- 50       # 귀무가설의 평균
sigma <- 2      # 알려진 표준편차
xbar <- 49.5    # 표본평균
n <- 49         # 표본크기
alpha <- 0.01   # 유의수준

# 검정통계량 Z 계산
z_stat <- (xbar - mu0)/(sigma/sqrt(n))

# 좌측검정의 임계값
z_crit <- qnorm(alpha)

# p-value 계산 (좌측검정)
p_value <- pnorm(z_stat)

# 결과 출력
print(paste("Z 통계량:", round(z_stat, 3)))
print(paste("임계값:", round(z_crit, 3)))
print(paste("p-value:", round(p_value, 4)))
```
</details>

> 💡 **학습 포인트**
> - Z 검정은 모분산을 알고 있을 때 사용합니다
> - 검정통계량 Z는 표준정규분포를 따릅니다
> - 양측/단측 검정에 따라 임계값과 p-value 계산이 달라집니다
> - R을 이용하여 실제 데이터 분석이 가능합니다
