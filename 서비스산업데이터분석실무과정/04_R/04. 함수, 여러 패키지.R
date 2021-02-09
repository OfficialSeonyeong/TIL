# 파생변수 : 기존변수를 이용하여 새로운 변수를 추가하는 것

stock <- read.csv(file.choose())
str(stock)  # stock.info()

head(stock)
stock$diff <- stock$High - stock$Low

mean(stock$diff)

#diff 변수를 이용해서 diff_result 파생변수 생성
#for ~ diff_result에 stock$diff의 평균보다 크면 "mean over" 작으면 "mean under"
x <- nrow(stock)
diff_result <- ''

for (i in 1:x) {
  if (stock$diff[i] > mean(stock$diff)) {
    diff_result[i] <- 'mean over'
  } else if (stock$diff[i] < mean(stock$diff)) {
    diff_result[i] <- 'mean under'
  }
}

stock$diff_result <- diff_result

head(stock)



# while(논리값) {
# 조건을 이용해서 탈출 필요
# }

idx <- 1
while(idx <=10) {
  print(idx)
  idx <- idx + 1
}


# 1~100 사이의 5의 배수만 출력
idx <- 1
while (idx<=100){
  if (idx %% 5 == 0){
    print(idx)
  }
  idx <- idx + 1
}


#next(continus) 이후의 행 실행 안하고 바로 while로 다시 돌아감/ break
idx <- 0

while (idx <= 10){
  idx <- idx+1
  if (idx %% 2 != 0){
    #print(idx)
    next
  }
  print(idx)
}


# NA 확인
# is.na()
is.na(c(1,2,3,4,NA))  # FALSE FALSE FALSE FALSE  TRUE

# NA 개수를 확인 sum(is.na())
# data.frame

naDF <- data.frame(x=c(NA,2,3), y=c(NA,4,5))
sum(is.na(naDF))

#NA 처리
NA & T  # NA

#문제 해결을 위해서 NA값 무시
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm=T)
mean(c(1,2,3,NA), na.rm=T)


# package :: caret
#na.omit(), na.pass(), na.fail()

na.omit(c(1,2,6,NA))
na.pass(c(1,2,3,NA))
na.fail(c(1,2,3,NA))


data(iris)
irisDF <- iris
irisDF
#임의로 결측값을 넣어보자
irisDF[4:10,3] <- NA
irisDF[1:5,4] <- NA
irisDF[60:70,5] <- NA
irisDF[133:145,2] <- NA

irisDF

heatmap(1* is.na(irisDF),Rowv =NA, Colv = NA, scale='none', cexCol=.8)


# 함수 정의: return 정의가 꼭 필요
newSumFunc <-function(x, y){
  cat("x=",x, "\n")
  result <- x+y
  return (result)
}
resultSum <- newSumFunc(y=5,x=4)

 
#가변함수
varFunc <- function(...){
  args <- list(...)
  result <- 0
  for(idx in args){
    result <- result+idx
  }
  return(result)
} 

varFunc(1) # 1
varFunc(1,2,3)  # 6



#결측치 비율을 계산하는 함수를 만들어보자/ 행과 열별로 비율계산
irisDF 

naMissFunc <- function(x){
  sum(is.na(x))/length(x) *100
}

# 행별 결측치 비율
apply(irisDF, 1, naMissFunc)

# 열별 결측치 비율
colss <- apply(irisDF, 2, naMissFunc)
barplot(colss)



# 조작함수
iris
mtcars
# merge(): join 조건(키)를 가지고 바인드
# rbind(), cbind(): 조건없이 바인드
x <- data.frame(name = c("임정섭","임은결","임재원"),
                math = c(100, 60, 95))
y <- data.frame(name = c("임재원","임은결","임정섭"),
                eng = c(100, 70, 90))

cbind(x,y)
merge(x,y)




#doBy packages
#summaryBy(), orderBy(), splitBy(), sampleBy()
summary(iris) # 기초통계량

# 자료의 분포 quantile()
quantile(iris$Sepal.Length) # 0%, 25%, 50%, 75%, 100%
quantile(iris$Sepal.Length, seq(0,1,by =0.1)) # 0%, 10%, 20%, ...


install.packages("doBy")
library(doBy)

#summaryBy() 원하는 컬럼의 값을 특정 조건에 따라 요약하는 목적(평균)
summaryBy(. ~ Species, iris)

# orderBy() 정렬을 위한 목적
orderBy( ~ Species, iris)
orderBy( ~ Species +Sepal.Width, iris)


# package:: base
# base order()
install.packages("base")
library(base)

#order(): 주어진 값 기준으로 정렬하여 인덱스 반환
iris[order(iris$Sepal.Width),]

# sample(): 모집단으로부터 샘플을 추출할때, 복원추출/ 비복원추출
sample(1:10,5) #비복원추출
sample(1:10,5, replace = T) #복원추출
iris[sample(nrow(iris),nrow(iris)),]

train <- sampleBy( ~ Species ,frac = 0.8 ,data = iris)
test <- sampleBy( ~ Species ,frac = 0.2 ,data = iris)



str(iris)

# split() 반환값 : list
x <- split(iris, iris$Species)

#iris 종별 Sepal.Length평균
x1 <- tapply(iris$Sepal.Length ,iris$Species, mean)
x2 <- lapply(split(iris$Sepal.Length, iris$Species), mean)
class(x2) # list
class(x1) # array

y2 <- unlist(x2)
class(y2) # numeric
z2 <- matrix(y2, ncol=3, byrow=T)
frame2 <- as.data.frame(z2)
names(frame2) <- c('s_mean', 'color_mean','nica_mean')
class(frame2)



# 조작
#package : dplyr
#filter:  ,select: , mutate: 열 추가, arrange: 정렬, summarise: 집계
# %>>% 

install.packages(c("plyr", "hflights"))
library(dplyr)             
library(hflights)
head(hflights)
str(hflights)

install.packages("dplyr")
as_tibble(hflights)
library(stats)
library(dplyr)


#filter() : 조건에 따라 행을 추출
filter(hflights, Month ==1, DayofMonth ==1)
filter(hflights, Month==1 | Month==2)


#arrange() 기본 오름차순 정렬
#데이터를 ArrDelay, Month, Year 순으로 정렬
head(arrange(hflights,ArrDelay, Month, Year))
arrange(hflights,ArrDelay, desc(Month))


# select(), mutate() : 열 추출
#select()  ,: 여러 열 구분, -: 지정 열 제외
select(hflights, Year : DayofMonth)

#Year부터 DayofWeek를 제외한 열
head(select(hflights, -(Year:DayOfWeek)))

#ArrDelay -DepDelay -> gain
#gain/ (AirTime/60) -> gain_per_hour
hlightDF <- hflights

transform(hlightDF, gain = ArrDelay -DepDelay)


#summarise() 기초 통계량(mean, sd, var, median)을 구할 수 있다. 결과값은 데이터프레임으로 반환
summarise(hlightDF,
          mean = mean(hlightDF$DepDelay, na.rm = T),
          sum = sum(hlightDF$DepDelay, na.rm = T))


#hflights 데이터셋에서 비행편수 20편 이상,
 # 평균 비행거리 2,000마일 이상인 항공사별 평균 연착시간
#TailNum : 항공기 일련번호
head(hflights)

planes <- group_by(hflights, TailNum) 
head(planes)


delay <- dplyr::summarise(planes, count = n(), dist=mean(Distance, na.rm=T),
                   delay = mean(ArrDelay, na.rm=T))

delay <- filter(delay, count > 20, dist>=2000)

library(ggplot2)
ggplot(delay,aes(dist, delay))+ geom_point(aes(size=count),alpha =1/2)+
  geom_smooth()


#chain()함수 : %>%
chain01 <- group_by(hflights, Year, Month, DayofMonth)
chain02 <- select(chain01, Year:DayofMonth, ArrDelay, DepDelay)
chain03<-dplyr::summarise(chain02, arrival = mean(ArrDelay, na.rm=T),
                   depart=mean(DepDelay, na.rm=T))
result <- filter(chain03, arrival >=30 | depart>=30)

hflights %>% group_by(Year, Month, DayofMonth) %>%
  select(Year:DayofMonth, ArrDelay, DepDelay)%>%
  summarise(arrival = mean(ArrDelay, na.rm=T),
            depart=mean(DepDelay, na.rm=T)) %>%
  filter(arrival >=30 | depart>=30)



#adply() 데이터 분할(split)된 데이터를 apply에 적용해 combine하는 함수
#데이터프레임을 반환

#Sepal.Length가 5.0 이상이고, Species가 setosa인지 여부 확인 후, 그 결과 TRUE, FALSE를 새로운 컬럼 V1로 기록
group_by(iris, Sepal.Length>=5.0)

library(plyr)

adply(iris, 1, function(row){
 data.frame(divSetosa = c(row$Sepal.Length>=5.0 & row$Species=='setosa'))
})