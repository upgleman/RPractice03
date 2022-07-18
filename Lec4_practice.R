#04 정형 데이터 마이닝
#[실습1 해설] 정형 데이터 마이닝
# package_version(R.version)

library(tidyverse)
install.packages("randomForest")
library(randomForest)
df = read_csv("Breast_cancer_data.csv")

# 1.
# glm 함수를 사용하고 family를 지정해주는 것을 기억합니다.

glm.fit = glm(diagnosis~mean_area, data=df, family=binomial)
glm.fit
# 2.
# 힌트: summary 함수를 이용하여 변수 별 유의확률을 확인합니다.
summary(glm.fit)

is_significant = TRUE

# 3.
# 힌트: 종속 변수를 제외한 모든 변수를 예측 변수로 하고 싶을 땐 Y ~ X 형태의 formula를 Y ~ . 으로 바꿔주면 됩니다.

rf.fit = randomForest(diagnosis~.,data=df)
rf.fit
summary(rf.fit)
# 4.
# center 갯수를 특정해줘야 합니다.
set.seed(3) # 재생산성을 위해 seed 값을 고정해줍니다.
km.fit = kmeans(df[,1:5], center=2) 
km.fit
# 5.
a = km.fit$cluster-1
b= df$diagnosis
# mean_a = mean(a==b)
# mean_b = mean(1-a==b)
max(mean(a==b),mean(1-a==b))

#[실습2 해설] 데이터 마이닝 결과 평가
library(tidyverse)
df = read_csv("Breast_cancer_data.csv")

#1. 다중 로지스틱 회귀모형 적합
glm.fit = glm(diagnosis~.,data=df, family=binomial)


#2. 0.5를 기준으로 나눔
pos = glm.fit$fitted.values >=  0.5
## 경계값 입력
neg = glm.fit$fitted.values <   0.5
## 경계값 입력

#3. table()함수를 이용하여 행렬 형태로 표현하고 정확도 계산
table(df$diagnosis, pos)
acc = (189+341) / (189+341+23+16)
acc

