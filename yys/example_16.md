### 🎯 예제 16: SQL의 `REPLACE` 함수를 R에서 구현하는 방법 💡

---

#### **😊 기본 예제**

**예제**: 오라클 SQL의 `REPLACE` 함수와 같은 기능을 수행하는 R 코드 구현하기

✅ **SQL 코드**
```sql
SELECT ename, REPLACE(sal, 0, '*')
FROM emp;
```

✅ **R 코드**
```r

```

---

#### **😊 문자열 치환 함수 비교**

| 번호 | SQL                      | R                         |
|----|-----------------|-----------------|
| 1  | `REPLACE(컬럼, 변경전, 변경후)` | `gsub(변경전, 변경후, 컬럼)` |

---

#### **😊 실습 문제**

**문제 1**: 아래의 SQL을 R 코드로 변환하시오.

✅ **SQL 코드**
```sql
SELECT ename, REGEXP_REPLACE(sal, '[0-2]', '*')
FROM emp;
```

✅ **R 코드**
```r

```

---

### 설명
- 정규 표현식은 SQL, R, Python, Linux Shell, Java에서 공통으로 사용됩니다.
