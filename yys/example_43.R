# 🎯 예제43. 데이터 시각화7 (워드 클라우드 그래프)
# 
# 텍스트 데이터 탐색 및 요약 그리고 주요 단어 강조등을 시각화 하고 싶을때
# 사용하는 그래프로 트랜드를 분석하거나 쇼셜 미디어와 뉴스에서 언급하는
# 주요 내용들을 분석할 때 유용한 그래프 입니다. 
# 마케팅에서 고객 만족도 등을 조사할 때 많이 사용됩니다.  
# 문서나 문학 작품을 분석하고자 할 때 유용한 그래프입니다. 
# 
# ➡️ 문법1.  R java 를 설치하시오 !
# 
# 1. 아래에서 java 64비트를 다운로드 받는다 
# 
# https://www.java.com/en/download/manual.jsp
# 
# 2. Windows Offline (64-bit) 으로 설치
# 
# 3. 아래와 같이 환경설정을 한다.

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_202')

# ※ 설명 : R 에서 지금 자바홈 위치가 어디있다는 것을 알려주는 것 
# 
# 4. 설치를 한다. 

install.packages("rJava")

library(rJava)

# ➡️ 문법2. 한글을 R이 인식할 수 있도록 KoNLP 패키지를 설치합니다.

# 필요한 라이브러리 로드(개인 깃허브에서 다운로드 받습니다.)
install.packages("remotes")
library(remotes)
remotes::install_github("haven-jeon/KoNLP")

library(KoNLP)
library(dplyr)

# 사전 설정

# 1213109 words dictionary was built.

# 텍스트 데이터 로드


#불필요한 텍스트 제거 


# UTF-8 은 한글이나 중국어등을 지원하는 문자셋이고
# ASCII 는 영어를 지원하는 문자셋입니다.
# UTF-8을 ASCII 로 변환하면서 변환되지 않는 문자를 제거하겠다.

# 특수문자 제거( gsub(변경전문자, 변경후문자, 컬럼) )



# 명사 추출


# 추출된 명사 확인



# 
# ➡️ 문법3. 영화 겨울왕국 대본을 워드 클라우드로 그리시오 
# 
# 데이터 게시판에서 겨울왕국 대본(winter.txt) 를 data 폴더에 가져다 둡니다. 

# 필요한 라이브러리 로드
install.packages("KoNLP", dependencies = TRUE)
install.packages("wordcloud")
install.packages("RColorBrewer")

library(KoNLP)
library(wordcloud)
library(RColorBrewer)

# 사전 설정


# 텍스트 데이터 로드


#iconv 함수는 텍스트 데이터의 인코딩을 변환하는 데 사용됩니다. 
#이 함수는 특정 인코딩 형식에서 다른 인코딩 형식으로 문자열을 변환할 수 있습니다. 
#이를 통해 텍스트 데이터에서 비정상적인 문자나 인코딩 문제를 해결할 수 있습니다.



# 특수문자 제거


# 명사 추출


# 명사 벡터를 하나의 벡터로 변환


# 명사 빈도 계산



# 데이터 프레임으로 변환



# 워드 클라우드 생성


# 
# ➡️ 문법4.  EBS 방송국의 인기 만화인 레이디 버그 게시판의 게시글을 워드 클라우드로
# 그리시오 ! (  한글 데이터 )
# 
# 파이썬 웹스크롤링으로 스크롤함.
# 
# 데이터 있는곳 : https://cafe.daum.net/oracleoracle/Soei/41

install.packages("wordcloud2")

# 라이브러리 로드
library(wordcloud2)
library(RColorBrewer)
library(plyr)     #  데이터 조작을 위한 패키지를 로드 합니다. 
library(data.table)   #  데이터를 테이블로 다루기 위한 패키지를 로드합니다.

# 작업 디렉토리 설정


# 텍스트 데이터 로드


# 특수문자 제거 및 공백 처리
# 불필요한 텍스트를 제거합니다. 


# 한글과 숫자, 공백을 제외한 모든 특수문자를 공백으로 대체합니다.


# 연속된 공백을 하나의 공백으로 변환합니다.


# 명사 추출 함수
extract_nouns_simple <- function(doc) {
doc <- as.character(doc)     # 문자로 변환
words <- unlist(strsplit(doc, "\\s+"))  # 공백을 기준으로 단어 분리
nouns <- Filter(function(x) {grepl("^[가-힣]+$", x) && nchar(x) >= 2}, words)  # 한글로만 구성된 단어 추출 및 길이 2 이상 필터링
return(nouns)
}

# 명사 추출


# 추출된 명사 확인


# 단어 빈도수 계산


# 상위 10개 단어 확인


# 유효하지 않은 값 확인 및 제거
# 빈문자열을 포함하는 행을 제거합니다. 


# 특정 단어 제외하기



# 단어 빈도수 데이터프레임 확인


# 워드클라우드 생성 (하트 모양)


# 
# 😊문제1.  유튜브 뎃글 분석을 위해 할매 떡볶이 로 검색한 모든 뎃글을 워드 클라우드로
# 시각화 하시오 !
# 
# 데이터 있는곳:  https://cafe.daum.net/oracleoracle/Soei/42
# 
# 기본 제공 모양
# 
# circle: 원형 (기본값)
# cardioid: 심장 모양
# diamond: 다이아몬드 모양
# triangle-forward: 정삼각형 (앞쪽)
# triangle: 정삼각형 (뒤쪽)
# pentagon: 오각형
# star: 별 모양
# 
# 답:

install.packages("wordcloud2")

# 라이브러리 로드
library(wordcloud2)
library(RColorBrewer)
library(plyr)     #  데이터 조작을 위한 패키지를 로드 합니다. 
library(data.table)   #  데이터를 테이블로 다루기 위한 패키지를 로드합니다.

# 작업 디렉토리 설정


# 텍스트 데이터 로드


# 특수문자 제거 및 공백 처리
# 불필요한 텍스트를 제거합니다. 


# 한글과 숫자, 공백을 제외한 모든 특수문자를 공백으로 대체합니다.


# 연속된 공백을 하나의 공백으로 변환합니다.


# 명사 추출 함수



# 명사 추출



# 추출된 명사 확인


# 단어 빈도수 계산


# 상위 10개 단어 확인


# 유효하지 않은 값 확인 및 제거



# 단어 빈도수 데이터프레임 확인


# 워드클라우드 생성 (하트 모양)


# 
# ➡️ 문법5.  영문 데이터를 wordcloud2  패키지로 워드클라우드 그래프를 그리시오

install.packages("wordcloud2")
install.packages("tm")                #  텍스트 데이터 전처리 전문 패키지 
install.packages("RColorBrewer")
install.packages("plyr")               #  데이터 조작을 위한 패키지 
install.packages("data.table")

# 라이브러리 로드
library(wordcloud2)
library(tm)
library(RColorBrewer)
library(plyr)
library(data.table)

# 텍스트 데이터 로드
file_path <- "winter.txt"
txt <- readLines(file_path, encoding = "UTF-8")

# 특수문자 제거 및 공백 처리
# 불필요한 텍스트 제거
cleaned_txt <- iconv(txt, "UTF-8", "UTF-8", sub="")

# 특수문자 제거
cleaned_txt <- gsub("[^[:alnum:][:space:]]", " ", cleaned_txt)

# 연속된 공백문자를 하나의 공백으로
cleaned_txt <- gsub("\\s+", " ", cleaned_txt)  # 연속된 공백 제거

# 텍스트를 Corpus로 변환 ( 텍스트 마이닝 패키지의 corpus 객체로 변환 )
corpus <- Corpus(VectorSource(cleaned_txt))

# 데이터 전처리
corpus <- tm_map(corpus, content_transformer(tolower))  # 소문자로 변환
corpus <- tm_map(corpus, removePunctuation)  # 구두점 제거 (마침표, 쉼표, 물음표,..)
corpus <- tm_map(corpus, removeNumbers)  # 숫자 제거
corpus <- tm_map(corpus, removeWords, stopwords("en"))  # 영어 불용어 제거
# am, i, she, the ....
corpus <- tm_map(corpus, stripWhitespace)  # 여백 제거

# 단어 행렬 생성
dtm <- TermDocumentMatrix(corpus)
m <- as.matrix(dtm)  
word_freqs <- sort(rowSums(m), decreasing = TRUE)   # 단어의 빈도수가 높은순으로 정렬
word_freq_df <- data.frame(word = names(word_freqs), freq = word_freqs)

# 워드 클라우드 생성 (하트 모양)
wordcloud2(data = word_freq_df, shape = "heart", color = brewer.pal(8, "Dark2"))
# 
# 😊 문제1. 위의 워드 클라우드에서 anna 는 제외시키시오 ! 
# 
# 답: 
