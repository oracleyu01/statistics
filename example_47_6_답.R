# 저장된 파일 불러오기
health_data_loaded <- read.csv("c:\\data\\health01.csv", fileEncoding = "utf-8")

# 당뇨병 여부 파생변수 생성
# 한국인 당뇨병 기준에 따른 파생 변수 생성
# 공복혈당 >= 126 mg/dL: 당뇨병 (1), 그렇지 않으면 당뇨병 아님 (0)
health_data_loaded$당뇨병 <- ifelse(health_data_loaded$공복혈당 >= 126, 1, 0)

# 데이터 확인
print("불러온 데이터:")
print(head(health_data_loaded))

# 상관행렬 계산
cor_matrix <- cor(health_data_loaded[, -5])  # "당뇨병" 제외
print("상관행렬:")
print(round(cor_matrix, 3))

# 시각화 1: pairs.panels 사용
pairs.panels(health_data_loaded[, -5], 
             method = "pearson",
             hist.col = "lightblue",
             density = TRUE,
             ellipses = TRUE,
             main = "건강 데이터 상관행렬 및 산점도")

# 공복혈당과의 상관관계 분석
diabetes_cor <- cor(health_data_loaded[, -5])[, 4]  # "공복혈당" 기준
print("\n공복혈당과 각 변수의 상관계수:")
print(sort(diabetes_cor, decreasing = TRUE))

# 기술통계량 출력
print("\n기술통계량:")
print(summary(health_data_loaded))
