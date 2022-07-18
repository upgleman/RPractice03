m <- 29 #불량품
n <- 148-29 #양품의 수
#print(n)

#표본크기
k1 <- 12 #추출 수
x1 <- c(3) # 백분위수 데이터
# 지시사항 1 번을 수행하세요.
ans1 <- dhyper(x1,m,n,k1)
print(ans1)
# 지시사항 2 번을 수행하세요.
#표본크기
k2 <-15
#3대 이하 들어있을 확률을 뺀다

ans2 <- 1- phyper(x1,m,n,k2, lower.tail = TRUE)
print(ans2)
# 정답을 출력하는 코드입니다.
sprintf("ans1: %.2f, ans2: %.2f", ans1, ans2)

