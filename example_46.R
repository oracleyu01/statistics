

# 
# 🎯예제46. 데이터 시각화10 (사회 연결망 그래프)
# 
# 쇼셜 네트워크 그래프라고도 불리는 사회 연경망 그래프가 필요한 이유
# 
# 1. 관계 및 연결 분석
# 
# 네트워크에서 중요한 역활을 하는 중심인물이나 허브를 식별할 수 있습니다.
# 
# 2. 정보 및 영향력 전파 
# 
# 특정 주제나 분야에서 영향력이 큰 사람을 찾아낼 수 있습니다.
# 
# 3. 사회적 행동 및 패턴 분석 
# 
# 사람들의 행동 패턴과 상호작용방식을 분석 할 수 있습니다.
# 
# 4. 문제 탐지 및 해결
# 
# 네트워크 내에서 문제가 갈등이 발생할 가능성이 높은 영역을 식별 할 수 있습니다.
# 
# 
# ➡️ 문법1.  아이티 회사들의 소송관계를 사회 연결망으로 시각화 해서 확인하시오!

#1. 데이터 로드
node_df <- read.csv("d:\\data\\node2.csv")
link_df <- read.csv("d:\\data\\link2.csv")
node_df
link_df

#2. 시각화  
install.packages("networkD3")
install.packages("dplyr")
library(networkD3)
library(dplyr)

network1 <- forceNetwork( Links=link_df,       # 소송 관계도 데이터 프레임명
                        Nodes=node_df,   # 회사이름, 회사번호가 있는 데이터 프레임명
                        Source='source_idx',  # 소송하는 회사번호
                        Target='target_idx',   # 소송당하는회사번호
                        NodeID='node',       # 회사명
                        Group='idx',            # 회사번호
                        opacityNoHover=TRUE,  # 정적일때 불투명 정도
                        zoom=TRUE,       # FALSE 로 하면 해당 노드의 동그라미만 보이고 TRUE 로 하면
                        # 연관된 회사들이 선명하게 보입니다.
                        bounded=TRUE, # 그래프가 화면 밖으로 빠져나가지 않게 한다. 
                        fontSize=15,   # 글씨크기
                        linkDistance=75,  # 연결선의 길이
                        opacity=0.9 )    # 불투명 정도

network1

# ➡️ 문법2. 소설 레미제라블의 인물 관계도를 사회 연결망으로 시각화 하시오 !


# 1. 데이터를 로드

node_df <- read.csv("mis_node.csv")
link_df <- read.csv("mis_link.csv")

node_df2 <- node_df[ , c("name","group") ]
link_df2 <- link_df[ , c("source","target") ]

# 2. 시각화

# install.packages("networkD3")
# install.packages("dplyr")
library(networkD3)
library(dplyr)

network5 <- forceNetwork( Links = link_df2,          
                        Nodes = node_df2,         
                        Source = 'source',         
                        Target = 'target',        
                        NodeID = 'name',               
                        Group = 'group',                   
                        opacityNoHover = TRUE,                 # 정적일 때 불투명 정도
                        zoom = TRUE,                 # FALSE 로 하면 해당 노드의 동그라미만 보이고
                        # TRUE로 하면 연관된 화사들이 선명하게 보임
                        bounded = TRUE,                 # 그래프가 화면 밖으로 빠져나가지 않게
                        fontSize = 15,                  # 글자크기
                        linkDistance = 200,             # 연결선길이
                        opacity = 0.9 )                   # 불투명 정도

network5        # 인물들끼리 연결망

# 
# 😊 문제1.   영화 기생충의 인물 관계도를 시각화 하시오 !
# 
# 
# 
# 
# 
# 😊 문제2.  영화 기생충의 인물 관계도를 igraph 로 시각화 하시오 !



