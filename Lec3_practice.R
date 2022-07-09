#[실습1 해설] R과 통계 분석

library(tidyverse)
data = read_csv("worldbank2020.csv")

# 1.

# 참고: 한 단어 이상의 column name을 지정할 떄는 ``를 사용합니다.
# 예시: `Freedom to make life choices`

df = data %>% select(Score, 'GDP per capita')

#head(df)
# 2.

# 힌트: lm 함수를 이용합니다.
# 선형 회귀 모형
# lm(종속변수~독립변수, 함수 적용 데이터) 
lmfit = lm(Score~., data=df)
lmfit

# 3.

# 힌트: summary 함수를 이용합니다.
# 내용 요약
summary_lmfit = summary(lmfit)
summary_lmfit
# 4. 

# 힌트: prcomp 함수를 이용합니다. (center=TRUE, scale=TRUE)
#주성분 분석
pca_data = prcomp(data[3:9],center=TRUE, scale=TRUE)
pca_data
# 5.
summary(pca_data)
# 힌트 summary 함수의 결과창을 확인합니다.
# 두 번째 주성분의 누적기여율
# cum = 0.7517

#[실습2 해설] 다중 선형 회귀 분석 2개이상의 설명변수(독립변수)
# library(tidyverse)
df = read_csv("diamonds.csv")

#1. 단순 선형 회귀 모형
lm.fit = lm(price~carat, data=df)
lm.fit
#2. 다중 선형 회귀 모형
lm.fit2 =  lm(price~x+y+z, data=df)
lm.fit2
#3. 다중 선형 회귀 모형
lm.fit3 = lm(carat~x+y+z, data=df)
lm.fit3
