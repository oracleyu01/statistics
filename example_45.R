# 
# 🎯 예제45. 데이터 시각화8 (지도 그래프 )
# 
# ➡️  지도 그래프를 시각화를 해야하는 이유 ?
#   
# 1. 공공 정책 및 행정
# 
# 예: 범죄 지도, 선거 결과 분석, 교통 관리, 도시 계획등에서 
# 지리적 데이터를 이용해서 정책결정을 지원
# 
# 범죄 발생지도를 통해 경찰 순찰 경로를 최적화 하거나, 교통 혼잡 직역을
# 분석하여 교통 신호 체계를 개선할 수있다.
# 
# 2. 건강 과 질병
# 
# 질병 발생 지도, 전염병확상 경로 분석을 통해 공중 보건 전략을 수립합니다.
# 
# 3. 마케팅 및 소매업
# 
# 고객분포 분석, 상권 분석, 지점 위치등을 최적화 할때 활용
# 
# 예:  sk telecom 에서 기지국 세울 때 적절곳에 기지국을 만들어야 
# 할때 활용 ( 지도 그래프, 비지도 학습의 k-means 머신러닝 )
# 
# 4. 물류 및 공급망 관리
# 
# 쿠팡의 경우에 최적의 물류 경로 최적화, 창고 위치선정, 배송 경로 
# 조회등을 통해 운영의 효율성을 높입니다. 
# 
# 
# ➡️  문법1.  R 의 내장된 지도 함수를 이용하기 
# 
# 관련 영상: ‘빅 데이터(Big Data), 세상을 바꾸다’  26분부터 앞뒤로 10분씩
# 
# 실습1. 세계지도를 출력하시오 !
#   
install.packages("maps")
install.packages("mapproj")

library(maps)
library(mapproj)

map("world")
# 
# 실습2. 중국지도만 확대해서 출력하시오 !
#   
  map("world", "china")
# 
# 실습3. 중국지도에서 특정 영영만 확대해서 보기(경도, 위도 범위 설정)
# 
map("world", "china", xlim=c(80, 135), ylim=c(15,55) )

# 주요 도시 표시
points(116.4074, 39.9042, col="red", pch=19) # 베이징 위치
text(116.4074, 39.9042, "Beijing", pos=4, col="red")

points(121.4737, 31.2304, col="blue", pch=19) # 상하이 위치
text(121.4737, 31.2304, "Shanghai", pos=4, col="blue")

# 중국 지도에 사용자 정의 색상 및 테마 적용
map("world", "china", fill=TRUE, col="lightblue", bg="lightgray")

# 실습4. 한국지도를 시각화 하시오 !

# 한국 지도만 확대해서 출력
map("world", "south korea")

# 한국 지도에서 특정 영역만 확대해서 보기 (경도, 위도 범위 설정)
map("world", "south korea", xlim=c(125, 131), ylim=c(33, 39))

# 기본 한국 지도
map("world", "south korea")

# 주요 도시 표시
points(126.9780, 37.5665, col="red", pch=19) # 서울 위치
text(126.9780, 37.5665, "Seoul", pos=4, col="red")

points(129.0756, 35.1796, col="blue", pch=19) # 부산 위치
text(129.0756, 35.1796, "Busan", pos=4, col="blue")

points(127.3845, 36.3504, col="green", pch=19) # 대전 위치
text(127.3845, 36.3504, "Daejeon", pos=4, col="green")

points(126.7052, 37.4563, col="purple", pch=19) # 인천 위치
text(126.7052, 37.4563, "Incheon", pos=4, col="purple")

points(128.6014, 35.8714, col="orange", pch=19) # 대구 위치
text(128.6014, 35.8714, "Daegu", pos=4, col="orange")

# 한국 지도에 사용자 정의 색상 및 테마 적용
map("world", "south korea", fill=TRUE, col="lightblue", bg="lightgray")

#(영상) 지도 데이터와 (위도, 경도) 머신러닝 (k-means) 로 성공한 빅데이터 분석 사례

# 
# ➡️  문법2. 구글 지도의 우리나라 서울 지도를 시각화 하시오 
# 
# 
# ■  Google Maps API 키를 얻는 방법을 참고해서 api 를 생성하시오 !
#   
#   https://cafe.daum.net/oracleoracle/Soei/34
# 
# Google Maps API 키를 얻는 방법
# 
# 
■ 그래프를 그립니다.

# 필요한 패키지 설치
install.packages("ggplot2")
install.packages("ggmap")   # 구글 지도 데이터를 시각화 하기 위한 패키지

# 패키지 로드
library(ggplot2)
library(ggmap)

# 구글 API 키 등록
register_google(key = "구글 지도 API 키")

# 데이터 로드 (서울 지하철 2호선 위경도 정보 파일 경로를 정확히 지정)
# 2호선 역의 위도와 경도 정보를 가지고 동그라미 표시를 위해

loc <- read.csv("서울지하철2호선위경도정보.csv", header = TRUE,  fileEncoding ="euc-kr" )

# 중심점 계산
center <- c(mean(loc$LON), mean(loc$LAT))

# 구글 지도 가져오기
kor <- get_map(location = center, zoom = 11, maptype = "roadmap")
ggmap(kor)

# 지도 시각화
kor.map <- ggmap(kor) +
  geom_point(data = loc, aes(x = LON, y = LAT), size = 3, alpha = 0.7) +
  geom_text(data = loc, aes(x = LON, y = LAT + 0.005, label = 역명), size = 3)

# 지도 출력
print(kor.map)

# 
# ➡️  구글 API 에러 안나는 성공 사례들 정리
# 
# 1. 제일 처음 만들었던 구글 API 프로젝트의 API 로 시도
# 2. map static API  하나 추가하기 
# 
# ➡️ 문법3. 구글 서울 지도에 지하철 2호선 라인을 시각화 하시오 !
#   
# 필요한 패키지 설치
install.packages("ggplot2")
install.packages("ggmap")

# 패키지 로드
library(ggplot2)
library(ggmap)

# 구글 API 키 등록
register_google(key = "구글 지도 API 키")

# 데이터 로드 (서울 지하철 2호선 위경도 정보 파일 경로를 정확히 지정)

loc <- read.csv("서울지하철2호선위경도정보.csv", header = TRUE,  fileEncoding ="euc-kr" )

# 중심점 계산
center <- c(mean(loc$LON), mean(loc$LAT))

# 구글 지도 가져오기
kor <- get_map(location = center, zoom = 11, maptype = "roadmap")
ggmap(kor)

# 지도 시각화
kor.map <- ggmap(kor) +
  geom_point(data = loc, aes(x = LON, y = LAT), size = 3, alpha = 0.7) +
  geom_text(data = loc, aes(x = LON, y = LAT + 0.005, label = 역명), size = 3)

# 지도 출력
print(kor.map)
# 
# 😊 문제1.  역의 점의 색깔은 변경하세요 !
#   
 


# 😊 문제2. 역이름 텍스트를 좀 기울여서 출력하시오 !
#   



# 😊 문제3.  지하철 3호선 라인을 시각화 하시오 !
#   
#   데이터 있는곳:  https://cafe.daum.net/oracleoracle/Soei/38
# 
# 😊 문제4. 서울시 초등학교 통폐합 관련해서 서울시 초등학교으
#    위치를 빨간색 점으로 표시하시오 !
#   
#   관련 데이터와 코드 있는곳: https://cafe.daum.net/oracleoracle/Sotv/263
# 
# 
# 
# 😊 문제5. 여러분들이 사는 동네에 지도를 구글 지도로 시각화 하시오 !
#   
#   여러분들의 사는 동네에 위도과 경도를 쉽게 알아내는 사이트
# 
# https://cafe.daum.net/oracleoracle/Sotv/265
# 
# 37.520932472538405, 경도는 127.11430895982605
# 
# 답글로 올려주세요 ~
#   
#   답:
#   
#   
#   
#   
# * 미국에서 성공한 빅데이터 분석 사례처럼
# 
# 도시에 구역별로 어떤 범죄가 발생하는지 원으로 시각화 해서 보여주는 
# 데이터 분석을 하면  우리나라 범죄 예방에도 많은 도움이 될것 같습니다. 
