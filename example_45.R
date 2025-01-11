
🎯 예제45. 데이터 시각화9 (소리 데이터 시각화)
# 
# 현장에서는 어떻게 소리 데이터를 시각화해서 데이터 분석에 사용하고 
# 있는지 사례를 먼저 영상으로 보겠습니다. 
# 
# 소리 데이터 있는곳 : https://cafe.daum.net/oracleoracle/Soei/46
# 
# ➡️ 소리 데이터 분석이 활용되는 분야
# 
# 1. 건강 및 의료 
# 
# 심장소리, 폐소리드의 분석을 통해 심장병, 폐질환을 진단하는데 사용됩니다.
# 
# 2. 보안 및 감시
# 
# 보안 시스템에서 특정 소리(유리가 깨지는 소리)를 감지하여 침입을 탐지하는데
# 
# 3. 음성 및 음악처리
# 
# 음악 스트리밍 서비스에서 사용자의 취향을 분석하여 맞춤형 음악을 제작하거나
# 추천하는데 활용이됨
# 
# 반려견과 교감을 나눌 수 있는 디바이스를 만드는데 활용이 됨
# 
# https://www.petpuls.net/overview
# 
# 동물 소리 분석 포트폴리오:  https://cafe.daum.net/oracleoracle/Sotv/264
# 
# 
# ➡️ 문법1. R 로 음악소리를 플레이를 하고 시각화를 하시오 !
# 
# 
# 
# 
# ➡️ 문법2. 정상적인 심장박동 소리와 질환이 있는 심장 박동 소리를 각각 시각화
# 하시오 !
# 
# 
# 
# 
# ➡️문법3.  소리 데이터를 전처리하는 방법
# 
# 이미지 --->  cv2.imread  ----> 숫자       -------------> 머신러닝 알고리즘
# 소리    --->   librosa      -----> 숫자       -------------> 머신러닝 알고리즘
# 
# 소리를 단순히 숫자로 변환만 하면되는게 아니라 다음의 작업을 해줘야합니다.
# 
# 주파수 스팩트럼
# 
# https://cafe.daum.net/oracleoracle/Sotv/293
# 
# 햇빛을 프리즘에 통과시키면 일곱 색깔 무지개로 나누어지는 것처럼 
# 소리도 푸리에의 변환을 통해서 주파수 순으로 펼쳐 놓을 수 있습니다.
# 이른 주파수 스펙트럼이라고 합니다. 
# 
# ➡️ 문법4.  소리를 주파수 스펙트럼 프리즘에 넣어서 주파수 스펙트럼 만들기 
# 
# 소리 ------->  숫자 (소리 증폭) --> 주파수 스팩트럼 프리즘 --> 주파수 스팩트럼
# 
# 주제:  뉴진스와 아이브 노래 분류하는 기계 만들기

#1.  mp3 를 wav 로 변환
#2.  wav 파일을 크기를 작게 잘라냄
#3.  wav 를 주파수 스팩트럼로 변환
#4.  변환한 숫자를 기계학습 시킵니다.  <---  하이퍼 파라미터를 조정해서 
# 정확도 좋은 기계를 생성
#실습1.  mp3 파일을 wav 로 변환하기

# 공유폴더 \\192.168.19.14



#실습2.  wav 파일을 크기를 작게 잘라냄

# 1. 앞부분만 잘라내기

# 필요한 패키지 설치 및 로드
install.packages("tuneR")

library(tuneR)

# 음성 파일을 읽어옴
file_path <- "afterlike.wav"
sample_wave <- readWave(file_path)

# 음성 신호와 샘플링 속도 추출
audio_samples <- sample_wave@left
sample_rate <- sample_wave@samp.rate

# 1분(60초)에 해당하는 샘플 수 계산
duration_sec <- 60  # 1분 = 60초
num_samples <- duration_sec * sample_rate

# 앞부분 1분의 음원만 잘라내기
if (num_samples > length(audio_samples)) {
stop("The file is shorter than 1 minute.")
}
trimmed_samples <- audio_samples[1:num_samples]

# 새로운 Wave 객체 생성
trimmed_wave <- Wave(left = trimmed_samples, samp.rate = sample_rate, bit = sample_wave@bit)

# 새로운 파일로 저장
writeWave(trimmed_wave, "afterlike_trimmed.wav")

# 결과 확인
cat("The first 1 minute of the audio has been trimmed and saved as 'afterlike_trimmed.wav'\n")

#실습3. 주파수 스펙트럼으로 시각화 하기 

# 
# 그래프 설명:   
# 
# 1. 가로축 : 시간 0 ~ 60초
# 2. 세로축 : 주파수 ( 0 khz ~ 20khz)
# 3. 색상 :  신호의 진폭입니다. 오른쪽에 있는게 색상눈금입니다.
# 빨간색이 가장 높은 진폭, 파란색이 가장 낮은 진폭, 중간 색상이 중간 진폭 
# 
# 😊 문제1.  클래식 음악을 주파수 스팩트럼으로 그리시오 !
# 
# 이름을 그냥 쉽게 morning.mp3 로 변경합니다. 

#1. mp3 ---> wav
#2. 1분만 잘라냅니다.
#3. 주파수 스팩트럼을 그립니다. 

# 답:


#실습2.  wav 파일을 크기를 작게 잘라냄



#실습3. 주파수 스펙트럼으로 시각화 하기 


