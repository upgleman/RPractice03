#[실습2 해설] 벡터와 데이터 프레임

# 1.한 자리 홀수들을 원소로 하는 myvector를 생성합니다.

myvector = seq(1,9,by=2)

print(myvector)

# 2. 영어 이름을 붙여줍니다.

names(myvector) = c("one","three","five","seven","nine")

print(myvector)

# 3.첫 번째, 세 번째 열을 따로 저장합니다.

install.packages("tidyverse")
library(tidyverse)
diamonds = read_csv("diamonds.csv")

col_carat = diamonds[1]
col_color = diamonds[3]

print(col_carat)
print(col_color)

# 4. carat이 0.7 이상인 값만 뽑아서 따로 저장합니다.

# 힌트: tidyverse의 filter 함수를 이용합니다.

big_diamonds = diamonds %>% filter( carat >= 0.7 )

print(big_diamonds)

# 5.x, y, z의 산술평균을 구해서 새로운 컬럼으로 저장합니다.

# 힌트: tidyverse의 mutate 함수를 이용합니다.

big_diamonds =  big_diamonds %>% mutate(mean_xyz = 1/3*(x+y+z))

print(big_diamonds)

#[실습3 해설] R의 함수

# 1.1부터 397까지 100개의 숫자를 생성합니다.

arr = seq(1,397,by=4)

# 2.이들의 평균과 표준편차를 구합니다.

mean_arr = mean(arr)
sd_arr = sd(arr)

# 3. 벡터가 주어졌을 때 원소들을 정규화해주는 함수를 작성합니다.

normalize = function(data) {
  data_mean = mean(data)
  data_sd = sd(data)
  output = (data-data_mean)/data_sd
  
  return(output)
}

# 잘 작동하는지 확인
arr_norm = normalize(arr)
print("Normalized Mean and Standard Deviation")
print(mean(arr_norm))
print(sd(arr_norm))
