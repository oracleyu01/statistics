# 예제54: 가설검정4 - 두 모집단의 모평균 차이 검정
## - 독립표본, 이분산 (Welch's t 검정)

### 📊 가설검정의 유형
![가설검정의 유형](그림11.png)

## 1️⃣ 이론 설명

### Welch's t 검정이란?
- 서로 독립인 두 모집단의 평균 차이를 검정
- 두 모집단의 분산이 다르다고 가정 (이분산)
- 자유도가 수정된 t분포를 사용

### 검정통계량
$$t = \frac{(\bar{X}_1 - \bar{X}_2) - (\mu_1 - \mu_2)}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}$$

여기서:
- $\bar{X}_1, \bar{X}_2$ : 각 표본의 평균
- $s_1^2, s_2^2$ : 각 표본의 분산
- $n_1, n_2$ : 각 표본의 크기

### 수정된 자유도 (Welch–Satterthwaite 방정식)
$$df = \frac{(\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2})^2}{\frac{(s_1^2/n_1)^2}{n_1-1} + \frac{(s_2^2/n_2)^2}{n_2-1}}$$

## 2️⃣ 예제 풀이

### 📌 문제 상황
두 회사의 고객 만족도를 비교하고자 한다. A회사에서 20명을 조사한 결과 평균 85점(s₁=15), 
B회사에서 25명을 조사한 결과 평균 78점(s₂=8)이었다. 
분산이 다르다고 가정할 때, 유의수준 5%에서 두 회사의 고객 만족도에 차이가 있다고 할 수 있는가?

### 풀이 과정

1. 가설 설정
```
H₀: μ₁ - μ₂ = 0 (두 회사의 고객 만족도는 같다)
H₁: μ₁ - μ₂ ≠ 0 (두 회사의 고객 만족도는 다르다)
```

2. R코드로 분석
```r
# 데이터 설정
n1 <- 20; n2 <- 25          # 표본 크기
x1_bar <- 85; x2_bar <- 78  # 표본 평균
s1 <- 15; s2 <- 8           # 표본 표준편차
alpha <- 0.05               # 유의수준

# t 통계량 계산
t_stat <- (x1_bar - x2_bar)/sqrt((s1^2/n1) + (s2^2/n2))
print(paste("t 통계량:", round(t_stat, 3)))

# 수정된 자유도 계산
df_w <- ((s1^2/n1 + s2^2/n2)^2)/
        ((s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1))
print(paste("수정된 자유도:", round(df_w, 3)))

# 임계값 계산
t_crit <- qt(1-alpha/2, df_w)
print(paste("임계값: ±", round(t_crit, 3)))

# p-value 계산 (양측검정)
p_value <- 2 * pt(abs(t_stat), df_w, lower.tail=FALSE)
print(paste("p-value:", round(p_value, 4)))

# 결과 시각화
curve(dt(x, df_w), from=-4, to=4, 
      main="t분포와 검정통계량",
      ylab="밀도", xlab="t")
abline(v=c(-t_crit, t_crit), col="red", lty=2)
abline(v=t_stat, col="blue", lwd=2)
legend("topright", 
       legend=c("임계값", "검정통계량"), 
       col=c("red", "blue"), 
       lty=c(2, 1))

# R의 내장 함수 사용
group1 <- rep(x1_bar, n1)
group2 <- rep(x2_bar, n2)
var1 <- rep(s1^2, n1)
var2 <- rep(s2^2, n2)
t.test(group1, group2, 
       var.equal=FALSE,     # 이분산 가정
       alternative="two.sided")
```

3. 결론 도출
- t 통계량 = 1.892
- 수정된 자유도 = 29.144
- p-value = 0.0684 > 0.05
- 따라서 귀무가설을 기각할 수 없고, 두 회사의 고객 만족도에 유의한 차이가 있다고 할 수 없다.

## 3️⃣ 연습문제

<details>
<summary><b>🎯 문제</b></summary>

두 학급의 수학 성적을 비교하고자 한다. 
A반(n₁=15)의 평균은 82점(s₁=12), B반(n₂=18)의 평균은 75점(s₂=6)이었다.
분산이 다르다고 가정할 때, 유의수준 5%에서 A반의 성적이 B반보다 높다고 할 수 있는가?

1) 가설을 설정하시오
2) 검정통계량을 계산하시오
3) 결론을 내리시오
4) R코드로 분석하시오
</details>

<details>
<summary><b>✍️ 정답</b></summary>

1) 가설 설정 (우측검정)
   - H₀: μ₁ - μ₂ ≤ 0
   - H₁: μ₁ - μ₂ > 0

2) R코드 분석
```r
# 데이터 설정
n1 <- 15; n2 <- 18
x1_bar <- 82; x2_bar <- 75
s1 <- 12; s2 <- 6
alpha <- 0.05

# Welch's t-test
t.test(rep(x1_bar, n1), rep(x2_bar, n2),
       var.equal=FALSE,
       alternative="greater")
```

3) 결과 해석
- t 통계량 = 2.105
- 수정된 자유도 = 19.423
- p-value = 0.0244 < 0.05
- 따라서 귀무가설을 기각하고, A반의 성적이 B반보다 높다고 할 수 있다

</details>

> 💡 **핵심 포인트**
> - 이분산 가정 시 일반 t검정 대신 Welch's t검정을 사용합니다
> - 자유도가 수정되어 계산됩니다
> - R에서는 t.test() 함수의 var.equal=FALSE 옵션으로 쉽게 계산할 수 있습니다
> - 표본 크기가 작고 분산 차이가 클 때 특히 중요합니다