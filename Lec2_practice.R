#02 데이터 마트와 통계

#[실습1 해설] 상관관계 분석

#1. seq 함수를 이용하여 odd와 even을 생성합니다.

odd = seq(-99,99,by=2)
even = seq(-98,100,by=2)

#2.두 벡터의 상관계수를 구해봅니다.

cor1 = cor(odd, even)

#3. squared라는 이름의 벡터를 적절히 생성합니다.

squared = odd^2
print(squared)
#4. odd와 squared의 피어슨 상관계수를 구해봅니다.

cor2 = cor(odd, squared)

#아무 상관 관계가 없음
print(cor2)

#[실습2 해설] 여러가지 확률분포

#1. 균등분포에서 난수 생성
ex_unif = runif(10, 0, 1) # 예시 U(0,1)
unif = runif(10, -5,5)
print(unif)


#2. 정규분포에서 난수 생성
ex_norm = rnorm(10, 0, 1) # 예시 N(0,1)
norm = rnorm(10, 4, 0.1) # 평균 4 표준편차 0.1
print(norm)
#3. 포아송분포에서 난수 생성
ex_pois = rpois(10, 3) # 예시 Pois(3)
pois = rpois(10, 0.5)
print(pois)
