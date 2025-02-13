## 유의수준과 유의확률

가설검정에서 중요한 개념인 **유의수준**과 **유의확률**을 배워보겠습니다.

어떤 사람이 모집단의 평균이 \(\mu\) 라고 주장하고 있습니다. 하지만 우리는 그 주장이 틀렸을 가능성이 있다고 생각합니다.

이를 검증하기 위해 두 가지 가설을 설정합니다.

- **귀무가설** : 모집단의 평균이 $\mu$ 이다. (기존의 주장)
- **대립가설** : 모집단의 평균은 $\mu$ 가 아니다. (기존의 주장에 반대하는 우리의 주장)


&nbsp;

### 유의확률 ($p$-value)란?

유의확률은 **귀무가설이 참일 때 우리가 얻은 표본평균보다 극단적인 값이 나올 확률**을 의미합니다. 즉, **귀무가설이 맞다는 가정하에서 우리가 관측한 값이 얼마나 드문지**를 나타내는 값입니다.


### 유의수준 ($\alpha$)란?

유의수준은 **귀무가설을 기각할 기준이 되는 확률**입니다. 연구자가 직접 설정할 수 있으며, 일반적으로 **5%(0.05) 또는 1%(0.01)** 를 많이 사용합니다.

- **유의수준 5%(0.05)**: 표본에서 얻어질 확률이 5%보다 낮으면 귀무가설을 기각한다.
- **유의수준 1%(0.01)**: 더 엄격한 기준으로, 표본에서 얻어질 확률이 1%보다 낮아야 귀무가설을 기각한다.

### 유의확률과 유의수준 비교

| 개념 | 설명 |
|------|------|
| **유의확률 ($p$-value)** | 우리가 관측한 값보다 극단적인 값이 나올 확률 |
| **유의수준 ($\alpha$)** | 귀무가설을 기각할 기준이 되는 확률 |

쉽게 설명하면 **유의확률은 우리가 받은 점수이고, 유의수준은 합격 기준(커트라인)** 입니다.

✔ **유의확률이 유의수준보다 작으면 귀무가설을 기각**합니다. (즉, 대립가설을 채택)  
✔   **유의확률이 유의수준보다 크면 귀무가설을 기각하지 않음** (즉, 기존 주장을 유지)

이를 확률분포 그래프로 나타내면 다음과 같습니다.

![확률분포도](그림9.png)

**추가 정보:** 일반적으로 연구에서는 **유의수준 5%** 를 가장 많이 사용합니다.

---

## 📌 확인 문제

다음 중 **유의확률($p$-value)** 에 대한 올바른 설명은 무엇인가?

1. 유의확률이 높을수록 귀무가설을 기각할 가능성이 높아진다.
2. 유의확률이 낮을수록 귀무가설을 기각할 가능성이 높아진다.
3. 유의확률이 유의수준보다 높으면 귀무가설을 기각한다.
4. 유의확률은 항상 5% 이하로 설정된다.

<details>
<summary><b>정답 보기</b></summary>

**정답: 2. 유의확률이 낮을수록 귀무가설을 기각할 가능성이 높아진다.**

</details>

---

그림 출처:  `https://blog.naver.com/richscskia/222006678420`
