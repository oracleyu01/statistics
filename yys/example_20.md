### 🎯 예제 20: R에서의 데이터 변환 함수 💡

---

#### **😊 데이터 변환 함수 비교: SQL vs R**

| 번호 | SQL          | R                         |
|----|--------------|--------------------------|
| 1  | `TO_CHAR`    | `as.character`, `format` |
| 2  | `TO_NUMBER`  | `as.integer`             |
| 3  | `TO_DATE`    | `as.Date`                |

---

#### **😊 기본 예제**

✅ **예제**: 이름과 입사한 요일을 출력하시오.

✅ **SQL 코드**
```sql
SELECT ename, TO_CHAR(hiredate, 'day')
FROM emp;
```

✅ **R 코드**
```r

```

✅ **설명**: `format(특정날짜, 옵션)`을 사용하여 날짜 형식을 변환합니다.

📌 **옵션 종류:**
- `%A` : 요일
- `%Y` : 연도 (4자리)
- `%y` : 연도 (2자리)
- `%m` : 월
- `%d` : 일

---

#### **😊 실습 문제**

**문제 1**: 내가 태어난 요일을 출력하시오.

✅ **SQL 코드**
```sql
SELECT TO_CHAR(TO_DATE('1999/11/17', 'RRRR/MM/DD'), 'day')
FROM dual;
```

✅ **R 코드**
```r

```

**문제 2**: 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오.

✅ **SQL 코드**
```sql
SELECT ename, hiredate
FROM emp
WHERE TO_CHAR(hiredate,'RRRR') = '1981';
```

✅ **R 코드**
```r

```
