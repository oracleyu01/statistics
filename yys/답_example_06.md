### 🎯 예제 6: R 연산자 3가지 💡

#### **😊 연산자 종류**

1. **산술 연산자**
  - `*`, `/`, `+`, `-`

2. **비교 연산자**
  - `>`, `<`, `>=`, `<=`, `==`, `!=`

3. **논리 연산자**
  - `&`: and (벡터화된 연산)
  - `&&`: and (벡터화되지 않은 연산)
  - `|`: or (벡터화된 연산)
  - `||`: or (벡터화되지 않은 연산)
  - `!`: not

---
#### **😊 실습 예제**

**예제 1**: 직업이 SALESMAN이고 월급이 1200 이상인 사원들의 이름, 월급, 직업을 출력하시오!
```r
emp[(emp$job == 'SALESMAN') & (emp$sal >= 1200), c("ename", "sal", "job")]
```
> 💡 **설명**: emp$job의 데이터 유형이 vector입니다. vector를 가지고 and를 사용할 때는 `&`를 사용합니다.

**예제 2**: 벡터화되지 않은 연산으로 and를 사용해보시오!
```r
# 벡터 생성
x <- c(1,2,3)
x
x > c(1,1,1) & x < c(3,3,3)

# 벡터화되지 않은 and 연산
x <- 1
str(x)   # 요소가 1개밖에 없어 배열이 아님
x > -2 && x < 2
```
> 💡 **설명**: 벡터는 같은 데이터 타입을 가진 1차원 배열 구조입니다. x 변수는 값이 1개이므로 벡터가 아닌 숫자형 변수입니다.

**문제 2**: 부서번호가 10번이거나 직업이 SALESMAN인 사원들의 이름, 월급, 직업, 부서번호를 출력하시오!
```r
emp[(emp$deptno == 10) | (emp$job == 'SALESMAN'), c("ename", "sal", "job", "deptno")]
```

**문제 3**: (빅분기 실기 기출유형1) 직업이 SALESMAN이고 부서번호가 30번인 사원들이 전부 몇 명이 있는지 출력하시오!
```r
a <- emp[(emp$job == 'SALESMAN') & (emp$deptno == 30), c("empno")]
print(length(a))
```
> 💡 **설명**: length는 건수를 세는 함수입니다. 빅분기 실기 시험에서는 print를 꼭 써야 합니다.
