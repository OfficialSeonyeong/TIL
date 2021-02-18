new_data_eda <- read.csv((file.choose()))
dataset <- new_data_eda

str(dataset)
View(new_data_eda)

#범주형 vs 범주형을 가지고 데이터의 분포를 확인한다면?

# 1. resident2와 age2를 범주형으로 변환
dataset$resident2 <- as.factor(dataset$resident2)
dataset$gender2 <- as.factor(dataset$gender2)

# 2. 두 변수를 table()함수를 이용하여 분포를 확인해보자
resident_gender <- table(dataset$resident2,dataset$gender2 )

barplot(resident_gender, horiz = T, beside = T, legend =row.names(resident_gender), col=rainbow(5))
#beside=T 멀티바로 변경

dfresident_gender <- as.data.frame(resident_gender)
library(ggplot2)

ggplot(dfresident_gender, aes(x=Var2, y=Freq, fill=Var1))+geom_bar(stat='identity',position = position_dodge(width = .9))+
  labs(x='성별', y= '명수', fill='지역', title = '지역별 성비') + coord_flip()

mosaicplot(resident_gender, col=rainbow(2))

#직업의 유형(job2) vs 나이(age2)
dataset$job2 <- as.factor(dataset$job2)
levels(dataset$job2)
job_age <- table(dataset$job2, dataset$age2)
barplot(job_age, beside = T, legend = row.names(job_age), col = rainbow(3))

dfjob_age <- as.data.frame(job_age)
ggplot(dfjob_age, aes(x= Var2, y= Freq, fill = Var1)) + geom_bar(stat='identity', position='dodge')+
  labs(x= '나이', y= '명 수', fill = '직업')


#숫자형 vs 범주형
#직업유형에 따른 나이 비율

#카테고리 유형별 시각화
str(dataset)
install.packages('lattice')
library(lattice)
densityplot(dataset$age, dataset, group = dataset$job2, auto.key = T)
#auto.key 는 범례

ggplot(dataset, aes(x=age, fill=job2)) + geom_bar(position='dodge')



# [문제]
# poptotal(전체인구) 변수를 total로, 
# popasian(아시안 인구) 변수를 asian으로 수정하세요.
midwest_raw <- as.data.frame(midwest)
midwest_new <- midwest_raw
str(midwest_new)
library(dplyr)
midwest_new <- rename(midwest_new,'total'='poptotal', 'asian'='popasian')
names(midwest_new)
head(midwest_new)


# [문제]
# total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' percasian 파생변수를 만들고,
# 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.
state_table <- table(midwest_new$state)
state_table <- as.data.frame(state_table)
ggplot(state_table, aes(x=Var1, y=Freq)) + geom_bar(stat='identity')
hist(midwest_new$percasian)


# [문제]
# 아시아 인구 백분율 전체 평균을 구하고, 
# 평균을 초과하면 "large", 
# 그 외에는 "small"을 부여하는 mean 파생변수를 만들어 보세요.
Asian_mean <- mean(midwest_new$percasian)
midwest_new$Asian_mean <- ifelse(midwest_new$percasian > Asian_mean, 'large', 'small')


# [문제]
# "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 
# 빈도 막대 그래프를 만들어 확인해 보세요.
str(midwest_new)
midwest_new$Asian_mean <- as.factor(midwest_new$Asian_mean)
table(midwest_new$Asian_mean, midwest_new$county)
Asian_mean <- as.data.frame(table(midwest_new$Asian_mean, midwest_new$county))
library(reshape2)
dcast(Asian_mean, Var1~Var2)
ggplot(Asian_mean, aes(x=Var2, y=Freq, fill=Var1))+geom_bar(stat='identity')+coord_flip()


--------------------------------------------
# ggplot2의 midwest 데이터를 사용하여 데이터 분석을 실습하는 문제 입니다.

# popadults는 해당 지역의 성인 인구, 
# poptotal은 전체 인구를 나타냅니다. 

# 1번 문제
# midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
midwest_raw$전체_인구_대비_미성년_인구_백분율 <- percyoung/midwest_raw$poptotal*100
percyoung <- midwest_raw$poptotal -midwest_raw$popadults

# 2번 문제
# 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 
# 미성년 인구 백분율을 출력하시오.
rownames(midwest_raw)

rownames(midwest_order) <- as.numeric(rownames(midwest_order))
ab <- rownames(midwest_order)
class(ab)

midwest_order$order <- rownames(midwest_order)

midwest_order <- arrange(midwest_raw, desc(midwest_raw$전체_인구_대비_미성년_인구_백분율))

midwest_order$order <- as.numeric(midwest_order$order)
class(midwest_order$order)



midwest_order %>%
  filter(midwest_order$order <= 5)


# 3번 문제
# 다음과 같은 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 
# 각 등급에 몇 개의 지역이 있는지 알아보세요.

# 분류     기준
# large    40%이상
# middle   30 ~ 40미만
# small    30미만
midwest_raw$미성년비율등급 <- ifelse(midwest_raw$전체_인구_대비_미성년_인구_백분율 >=40, 'large',
                              ifelse(midwest_raw$전체_인구_대비_미성년_인구_백분율 <30, 'small', 'middle'))

table(midwest_raw$미성년비율등급)

# 4번 문제
# popasian은 해당 지역의 아시아인 인구를 나타냅니다. 
# '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고 
# 하위 10개 지역의 state(주), county(지역), 아시아인 인구 백분율을 출력하세요.
midwest_raw$아시아인백분율 <- midwest_raw$popasian/midwest_raw$poptotal


#시계열(time series) : 변수 간의 상관성
#iris 시계열 데이터 만들기
iris
rownames(iris) 
seq <- as.integer(rownames(iris) )
class(seq)
iris_new <- cbind(seq, iris)

#x축은 seq
#y축은 -Species

colsColor <- topo.colors(4, alpha =.4)
names(colsColor) <- names(iris_new)[2:5]

library(reshape2)
#melt함수를 이용해서 기준 seq, species
#나머지 칼럼을 variable해서 wide -> long
iris_melt <- melt(iris_new, id = c('seq', 'Species'))
iris_melt <- melt(iris_new, id.vars = c('seq', 'Species')) #다른버전에서 사용

library(ggplot2)
g <- ggplot(iris_melt, aes(x=seq, y=value,col=variable)) + geom_line(cex=0.8, show.legend = T)

#추가적으로 선의 색상 범례 라벨링
g <- g + scale_color_manual( name='iris',values=colsColor[iris_melt$variable], 
                             labels=c('꽃받침 길이','꽃받침 넓이','꽃잎 길이','꽃입 너비'))

#날짜: 문자변수를 날짜변수로 변환
#R의 날짜 데이터 타입 'POSIXct'   as.POSIXct()
str_date <- "200730 13:40"
as.POSIXct(str_date, format="%y%m%d %H:%M")
str_date <- '2020-07-30 13:40:01 PM'
as.POSIXct(str_date, format="%Y-%m-%d %H:%M:%S")
str_date <- '07/30/20 13:40:01'
as.POSIXct(str_date, format="%m/%d/%y %H:%M:%S")



dataset01 <- read.csv(file.choose())
head(dataset01)

dataset01$Date <- as.POSIXct(dataset01$Date, format='%Y-%m-%d')
class(dataset01$Date)

colsColor <- topo.colors(5, alpha =.4)
names(colsColor) <- names(dataset01)[2:6]
dataset01_melt <- melt(dataset01, id=c('Date','Volume'))
m <- ggplot(dataset01_melt, aes(x=Date, y=value, col=variable)) +geom_line(cex=0.8, show.legend = T)

library(MASS)
carDF <- Cars93
str(carDF)
rownames(carDF)




dataset02 <- read.csv(file.choose())
head(dataset02)

spanish <- dataset02

# 1.
# 데이터 내에 결측치 여부를 확인한다. 
# NA값이 310681개 있는 것을 확인할 수 있다.
is.na(dataset02)
class(dataset02)
install.packages("caret")
library(caret)
no_na_spanish <- na.omit(spanish)
nrow(no_na_spanish)
class(no_na_spanish)
head(no_na_spanish)
#결측치 확인방법
dataset02[!complete.cases(dataset02),]

#결측치 제거
dataset02_new <- dataset02[complete.cases(dataset02),]


# 2.
# filter와 !is.na함수를 통해 결측치를 모두 제거했다.


# 3.
# 마드리드 출발
# 마드리드에서 출발하는 열차 데이터만을 떼어내 madrid_origin이라는 변수로 저장하고 
# 우선, 마드리드에서 출발하는 열차 데이터만을 이용해 비교해보기로 한다.
no_na_spanish
madrid_origin <- subset(no_na_spanish, origin == 'MADRID')

# 4.
# summary함수를 통해 일반적 데이터 정보를 다시 확인한다.
summary(madrid_origin)

# 5.
# 마드리드 출발 열차의 빈도 수
# 마드리드를 출발하는 기차의 도착 도시별 운행빈도 수를 바형태로 나타내보자
ggplot(madrid_origin, aes(x=destination, fill=destination)) + geom_bar() + coord_flip()

# 6.
# 마드리발 도착지별 가격 박스플롯으로
# 티켓가격의 높은 순을 확인해보자
head(madrid_origin)
library(dplyr) library(reshape2)

head(madrid_origin)

madrid_origin_new <- arrange(madrid_origin, destination)
ggplot(madrid_origin, aes(x=price, y=destination))+geom_boxplot()

# 7.
# AVE의좌석 등급별 가격박스플롯이 시각화 
# 똑같은 열차와 똑같은 좌석등급, 똑같은 도착지라 하더라도 가격이 차이가 나는 것을 확인할 수 있다.
head(no_na_spanish)
ggplot(no_na_spanish, aes(x=price, y= train_class)) + geom_boxplot()

# 8. 
# 이 차이를 이해하고 싶어 시계열로 데이터를 만들어보았다.
no_na_spanish$insert_date <- as.POSIXct(no_na_spanish$insert_date, farmat= '%Y-%m-%d %H:%M:%S')
table(no_na_spanish$insert_date, no_na_spanish$train_class, no_na_spanish$price)

spanish_melt <- melt(no_na_spanish, id=c('insert_date', 'price'))
ggplot(no_na_spanish, aes(x=train_class, y= price)) + geom_line()

# 9.
#날짜 데이터 변환. as.POSIXct는 factor형식의 날짜 사용가능


# 10.
# 컬럼이름지정
colnames(a_b) <- c("preferente","Turista")


# 11.
# 도착지별, 트레인 클래스별로 가격을 박스플롯형태로 나타낼 수도 있다.