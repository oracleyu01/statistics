### 🎯 예제 36: R에서 `loop 문 작성법` 사용법 💡

---

#### **😊 loop 문의 필요성**

✅ 특정 실행문을 수작업하지 않고 반복해서 수행할 때 유용한 문법입니다.

---

#### **😊 for loop 기본 문법**

✅ **기본 문법**
```r
for (루프변수 in 리스트) {
  반복할 문장 
}
```

✅ **예제 1**: 1부터 10까지 출력하시오.

✅ **R 코드**
```r

```

---

#### **😊 실습 문제**

**문제 1**: 숫자를 입력하면 해당 숫자까지 1부터 출력되는 함수를 생성하시오.

✅ **R 코드**
```r

```

**문제 2**: `for loop` 문을 이용하여 구구단 2단을 출력하시오.

✅ **R 코드**
```r

```

**문제 3**: 문제 2번 코드를 함수로 변환하여, 숫자를 입력하면 해당 숫자의 구구단이 출력되게 하시오.

✅ **예제 실행**:
```r
gugu_dan(3)
# 3 x 1 = 3
# 3 x 2 = 6
# ...
# 3 x 9 = 27
```

✅ **R 코드**
```r

```

**문제 4**: 1부터 20까지의 숫자를 출력하는데 홀수만 출력하시오.

✅ **힌트**:
- `10 %% 2 -> 0` (짝수)
- `11 %% 2 -> 1` (홀수)

✅ **R 코드**
```r

```

**문제 5**: 숫자를 입력하면 짝수인지 홀수인지 출력하는 `what_num()` 함수를 생성하시오.

✅ **예제 실행**:
```r
what_num(2)  # "짝수입니다."
what_num(3)  # "홀수입니다."
```

✅ **R 코드**
```r

```
