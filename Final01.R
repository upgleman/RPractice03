library(dplyr)
library(gtools)

# 지시사항 1 번을 수행하세요.
df <- read.csv("beads.csv",stringsAsFactors = FALSE, header=TRUE)
#summary(df)
# dim(df)
#head(df)
# 지시사항 2 번을 수행하세요.
good_df <- df %>% filter( size >=4 & size <=12)
# dim(good_df)
#head(df)

# 지시사항 3 번을 수행하세요.
#전체에 구슬에 대한 경우의 수
com_ans1 <- combinations(length(df$machine_num), 5, df$machine_num, set=TRUE, repeats.allowed=FALSE)
#2번 지시사항에 해당하는 구슬에 대한 경우의 수
com_ans2 <- combinations(length(good_df$machine_num), 5, good_df$machine_num, set=TRUE, repeats.allowed=FALSE)

ans <- nrow(com_ans2)/nrow(com_ans1)

# ans를 소수점 셋째자리에서 반올림하여 출력합니다.
round(ans, 2)
