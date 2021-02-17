# 시각화

install.packages("mlbench")
library(mlbench)

data(Ozone)
str(Ozone)

#산점도 
head(Ozone)
#-> 숫자형 데이터인 경우
plot(Ozone$V8, Ozone$V9)
# 축 이름(xlab, ylab)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp')

# 제목(main)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp',
     main ='Region Ozone')

#점의 종류(pch)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp',
     main ='Region Ozone', pch =10)

#점의 크기(cex)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp',
     main ='Region Ozone', pch =21, cex = 1.2)

#색상(col)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp',
     main ='Region Ozone', pch =21, cex =1.2, col = 'hotpink')

#좌표축의 범위(xlim, ylim)
plot(Ozone$V8, Ozone$V9, xlab='Sandburg Temp', ylab = 'El Monte Temp',
     main ='Region Ozone', pch =21, cex =1.2, col = 'hotpink', xlim = c(20,100), ylim = c(26, 83))
     
range(Ozone$V8, na.rm = T)
range(Ozone$V9, na.rm = T)

plot(Ozone$V6, Ozone$V7)
plot(jitter(Ozone$V6), jitter(Ozone$V7))


data(cars)
str(cars)
head(cars)

    
#type
plot(cars$speed, cars$dist)
plot(cars, type='o')


# 직선(abline)
#a는 절편, b은 기울기
#y = a + bx + e

#dist = -5 +3.5* speed
abline(a=-5, b=3.5, col = 'red')
# 그래프에서 speed와 dist 평균까지 abline 표시
abline(h=mean(cars$dist), lty=2, col='blue')
abline(v=mean(cars$speed), lty = 2, col='green')



#선형회귀(lm) :독립변수가 2개이면 다항 선형회귀
#lm(종속변수~독립변수, data= )
car_model <- lm(dist ~ speed, data=cars)
#dist=-17.579+3.932*speed
head(cars)
abline(car_model)


# 점(points)
#iris, Sepal.Width, Sepal.Length
plot(iris$Sepal.Width, iris$Sepal.Length, xlab = '잎의 넓이', ylab = '잎의 길이',
     col ='green')
points(iris$Petal.Width, iris$Petal.Length, cex = .5, pch='+', col='#FF0000')

with(iris, {
  plot(Sepal.Width, Sepal.Length, xlab = '잎의 넓이', ylab = '잎의 길이',
       col ='green', pch=6)
  points(Petal.Width, Petal.Length, cex = .5, pch=7, col='pink')
  legend('topright', legend = c('Sepal', 'Petal'), pch=c(6,7),
          cex = .8, col =c('green','pink'), bg='gray')
  })


#boxplot
summary(iris$Sepal.Width)
boxplot(iris$Sepal.Width)


#IQR : 3사분위수 - 1사분위수
#whisker의 값을 계산: 중앙값 - 1.5 *IQR = lower whisker
                    # 중앙값 + 1.5 *IQR = upper whisker

boxplotStats <- boxplot(iris$Sepal.Width, horizontal = T)
boxplotStats
text(boxplotStats$out, rep(1, NROW(boxplotStats$out)), pos=1, cex=.5)


#iris의 setosa종과 versicolor종의 Sepal.Width에 대한 상자 그림
sw <- subset(iris, Species =='setosa' | Species=='versicolor')
str(sw)
sw$Species <- factor(sw$Species)
levels(sw$Species)
boxplot(Sepal.Width~Species, data = sw)


#hist(빈도수 기반, 밀도 기반)
iris
region_weather <- read.csv(file.choose())
str(region_weather)
avgTemp <- region_weather$평균기온
hist(avgTemp)
hist(avgTemp, breaks = 15) # 히스토그램 갯수 = breaks



#ggplot :: ggplot(), gemo_그래프 계열, gemo_도형 계열, coord_계열, labs

library(ggplot2)
library(dplyr)

#ggplot은 필수함수, 데이터와 축을 지정 -> 도화지 같은 역할
ggplot(data= iris, aes(x=Sepal.Length, y=Sepal.Width))

#geom_point() / geom_line()/ geom_boxplot()/ geom_histogram()/ geom_bar()
ggplot(data= iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(pch=2, size=.8, col='red')

#종에 따라 색상, 모양, 크기를 다르게 한다면?
ggplot(data= iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(pch=c(2,4,6)[iris$Species], size=c(.8,1,1.2)[iris$Species], col=c('red','green','pink')[iris$Species])


#도형계열
#Species 별 Sepal.Length, Sepal.Width 최대 최소값 구하라
irisG <- ggplot(data= iris, aes(x=Sepal.Length, y=Sepal.Width))+geom_point(pch=c(2,4,6)[iris$Species], size=c(.8,1,1.2)[iris$Species], col=c('red','green','pink')[iris$Species])

library(plyr)

aesXY <- ddply(iris,.(Species),function(x){
                                  data.frame(min1 =min(x$Sepal.Length), 
                                             min2=min(x$Sepal.Width),
                                             max1=max(x$Sepal.Length),
                                             max2=max(x$Sepal.Width))})

aesXY <- ddply(iris,.(Species), summarise, min1 =min(Sepal.Length), 
                                  min2=min(Sepal.Width),
                                  max1=max(Sepal.Length),
                                  max2=max(Sepal.Width))

aesX_start <- max(aesXY$min1)
aesX_end <- min(aesXY$max1)
aesY_start <- max(aesXY$min2)
aesY_end <- max(aesXY$max2)


#annotate
irisG + annotate(geom = 'rect', xmin =4.9, ymin=2.3 ,xmax = 5.8,ymax =3.4 , fill='red', alpha=.1, col='black',lty=2)


#외부옵션을 활용한 coord_계열, labs
#축 변환 coord_flip()
#축 범위 coord_cartesian()

irisG + coord_flip() # x,y축 바꾸기

#라벨링 labs
irisG + labs(title="제목", x="x 이름", y="y 이름")

#ggplot
sampleDF <- data.frame(
  years=2015:2020,
  gdp=c(300,350,400,450,500,550)
)

# 1. 틀생성
ggplot(data=sampleDF, aes(x=years, y=gdp)) +
  geom_point() + geom_line(linetype = 'dashed')

library(gcookbook)
install.packages("gcookbook")

data(uspopage)
str(uspopage)
head(uspopage)

# year, thousands 가지고 기본 ggplot()
ggplot(data = uspopage, aes(x=Year, y=Thousands, fill=AgeGroup))+
  geom_area(alpha=.8, col='black')

#geom_bar()
korMovies <- c('강철비2', '반도', '그놈이그놈이다','킹덤','살아있다')
cntMovies <- c(5,11,3,34,23)

moviesDF <- data.frame(moviesName = korMovies, moviesCnt = cntMovies)

ggplot(data=moviesDF, aes(x=moviesName, y=moviesCnt)) + geom_col(col='blue',width = .7)

library(MASS)
str(Cars93)
head(Cars93)

ggplot(data=Cars93, aes(x=Type)) + geom_bar(fill ='dark blue', col='black')+
  ggtitle('Bar Chart by Type')


# sql 형식 사용하는 방법
library(sqldf)
install.packages("sqldf")

#자동차의 유형별로 집계( count())해서 막대그래프를 표현
type_cnt <- sqldf('select type, count(*) as cnt
                  from Cars93
                  group by Type
                  order by Type')

ggplot(data=type_cnt, aes(x=Type, y= cnt)) +
  geom_bar(stat='identity', fill='dark green', col='black') + 
  ggtitle('Bar Chart by CarType')



MaleStu <- c(20,35,30,35,27,25)
FemaleStu <- c(25,30,32,29,32,29)
classNum <- c(1,2,3,4,5,6)

stuDF <- data.frame(MaleStu, FemaleStu, classNum)

library(reshape2)
stuMelt <- melt(stuDF, id='classNum')

ggplot(data=stuMelt, aes(x=classNum, y=value, fill=variable))+
  geom_bar(stat='identity', width = .4)


#multi bar
ggplot(data=stuMelt, aes(x=classNum, y=value, fill=variable))+
  geom_bar(stat='identity', width = .4, position = position_dodge(width=.5))

#Cars93 데이터를 이용하여 차종(Type)별 제조국(Origin)별 자동차 수의 막대그래프
ggplot(data= Cars93, aes(x=Type, fill=Origin))+geom_bar(width=.4, position =position_dodge(width=.5) )+
ggtitle('Bar Chart of Frequency by Car Type & Origin')



#워드클라우드(Word Cloud) 그리기
install.packages('wordcloud2')
library(wordcloud2)

head(demoFreq,10)
wordcloud2(demoFreq,
           color = 'random-light', backgroundColor = 'black')
install.packages('webshot')
install.packages('htmlwidgets')

library(webshot)
library(htmlwidgets)

wImg <- wordcloud2(demoFreq,
           color = 'random-light', backgroundColor = 'black')
saveWidget(wImg, 'wImg.html', selfcontained = F)
webshot('wImg.html','wImg.pdf',vwidth = 480,vheight = 480, delay = 5)

webshot::install_phantomjs()



#시각화 실습
#data - airquality
data("airquality")
str(airquality)
head(airquality)
library(dplyr)

#실습문제
airquality_name <- rename(airquality, 'ozone'='Ozone', 'solar.R'='Solar.R', 'wind'='Wind', 'temp'='Temp','month'='Month','day'='Day')

#x축은 day, y축은 temp 틀 만들기 + 산점도(크기 3, 색상 빨강) /꺽은선그래프(빨강), 산점도(크기 3) 겹쳐그리기
#day열을 그룹지어 날짜별 온도 상자그림(boxplot)
# temp 히스토그램 그리기
ggplot(airquality_name, aes(x=day, y=temp)) +
  geom_point(size = 3, color='red')

ggplot(airquality_name, aes(x=day, y=temp)) +
  geom_line(color='red')+
  geom_point(size = 3, color='red')

ggplot(airquality_name, aes(x=day, y=temp)) +
  boxplot(temp~day, data= airquality_name)

ggplot(airquality_name, aes(x=day, y=temp)) +
  hist(airquality_name$temp)


library(ggplot2)
str(mtcars) 
mtcars$cyl <- as.numeric(mtcars$cyl)
#mtcar로 cyl 종류별 빈도수 확인 geom_bar
ggplot(mtcars, aes(x=cyl)) + geom_bar(width=.4)
  
# cyl의 빈 범주(결측값) 제외하고 cyl 종류별 빈도수 확인
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=.4)

# 선버스트(coord_plor()) 차트 그리기
ggplot(mtcars, aes(x=factor(cyl)))+ geom_bar(aes(fill=factor(cyl))) + coord_polar()

#4.  원 그래프 그리기
ggplot(mtcars, aes(x=factor(cyl)))+ geom_bar(aes(fill=factor(cyl))) + coord_polar(theta = 'y')

#5. cyl 종류별 gear 빈도 누적 막대 그래프
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear)),width = .4)

#6. cyl열을 x축으로 지정하여 cyl별 gear 빈도 파악 선버스트 차트
ggplot(mtcars, aes(x=factor(cyl)))+ geom_bar(aes(fill=factor(gear))) + coord_polar()

#7. cyl열을 x축으로 지정하여 cyl별 gear 빈도 파악 원그래프
ggplot(mtcars, aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear)))+coord_polar(theta='y')