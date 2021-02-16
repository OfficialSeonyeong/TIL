# ddply(데이터, 그룹 지을 변수명/처리조건(.()), 처리함수)
library(plyr)

#iris 데이터에서 종별 Sepal.Length의 평균을 계산
#처리조건으로 Sepal.Length >=4.0 추가
ddply(iris, .(Species, Sepal.Length >=5.0), function(x){
  data.frame(Sepal.length.mean = mean(x$Sepal.Length))
})

baseball
data(baseball)
head(baseball)
str(baseball)

names(baseball)

#id가 ansonca01 인 선수의 데이터만 확인하고 싶다면
subset(baseball, id == 'ansonca01')
library(dplyr)
filter(baseball, id == 'ansonca01') 

#각 선수별 출전한 게임수의 평균
ddply(baseball, .(id), function(x){
  data.frame(g.mean = mean(x$g))
})

#각 선수별 최대 게임을 플레이한 해의 기록
ddply(baseball, .(id),subset, g == max(g))



#reshape 패키지
#변환 melt(세로로 변경), cast(dcast, acast)(가로로 변경)
#melt(데이터를 구분하는 식별자, 측정대상 변수, 측정치)
install.packages("reshape2")
library(reshape2)
data(french_fries)

head(french_fries)
str(french_fries)
melt(french_fries)

fries_melt <- melt(id = 1:4,french_fries)
head(fries_melt, 20)
tail(fries_melt, 20)

fries_d <- dcast(fries_melt, time + treatment + subject+rep ~ variable)


#data.table 패키지
install.packages("data.table")
library(data.table)

iris_table <- data.table(iris)
iris_table[,1]
iris_table[iris_table$Species=='setosa',]

iris_table[1, c(Sepal.Length, Species)]
iris_table[1, list(Sepal.Length, Species)]
str(iris)
levels(iris$Species)


#iris 데이터에서 Sepal.Length의 평균값을 종별로 (세번째는 분류 기준 입력)
iris_table[,mean(Sepal.Length),Species]



# **데이터 가공
# 외부파일을 읽어들이는 패키지 readxl
install.packages("readxl")
library(readxl)
# read_excel(), read.table(), read.csv()
# header 칼럼이름/skip 몇개를 생략하고 불러오는 것  /nrows 몇개만 가져오겠다. /sep 구분자 입력
# col.names = c(컬럼이름, 컬럼이름, ...)

excel_data_sample <- read_excel(file.choose())
View(excel_data_sample)
txt_data_sample <- read.table(file.choose(),header = T)

colNames <- c('ID', 'SEX', 'AGE', 'AREA')
txt_data_sample02 <- read.table(file.choose(),header = T, sep = ',')
txt_data_sample03 <- read.table(file.choose(), sep = ',', col.names = colNames)

#service_data_excel_sample.xlsx
excel_sample <- read_excel(file.choose())
View(excel_sample)
class(excel_sample)                           
str(excel_sample)

excel_sample$SEX <- as.factor(excel_sample$SEX)
excel_sample$AREA <- as.factor(excel_sample$AREA)
levels(excel_sample$AREA)


#성별에 따른 17_AMT 평균 이용금액을 확인
a <- tapply(excel_sample$AMT17, excel_sample$SEX, mean)
class(a) # array
b <- ddply(excel_sample, .(SEX),function(x){mean_x= mean(x$AMT17)} )
class(b) # data.frame
c <- excel_sample %>% group_by(SEX) %>% summarise(use=mean(AMT17))
class(c) # data.frame
d <- sapply(split(excel_sample$AMT17,excel_sample$SEX),mean,na.rm=T)
class(d) # numeric

#지역에 따른 Y17_CNT 이용건수의 합을 확인
tapply(excel_sample$Y17_CNT, excel_sample$AREA, sum)
ddply(excel_sample, .(AREA),function(x){sumx= sum(x$Y17_CNT)} )
excel_sample %>% group_by(AREA)%>% summarise(ssum = sum(Y17_CNT))

names(excel_sample) # 컬럼 이름
ls(excel_sample)  # 컬럼 이름


#변수명 변경하기
# dplyr :: rename()
library(dplyr)
str(excel_sample)
colRename <- rename(excel_sample, Y17_AMT=AMT17, Y16_AMT=AMT16)

#파생변수
colRename$AMT <- colRename$Y16_AMT + colRename$Y17_AMT
colRename$CNT <- colRename$Y16_CNT + colRename$Y17_CNT

str(colRename)
# 1. colRename 데이터 세트에서 ID 변수만 추출
select(colRename, ID)

# 2. colRename 데이터 세트에서 ID, AREA, Y17_CNT 변수 추출
select(colRename, ID, AREA, Y17_CNT)

# 3. colRename 데이터 세트에서 AREA 변수만 제외하고 추출
colRename[-4]
select(colRename, -4)

# 4. colRename 데이터 세트에서 AREA, Y17_CNT 변수를 제외하고 추출
colRename[-4,-6]

# 5. colRename 데이터 세트에 AREA(지역)가 서울인 경우만 추출
filter(colRename, AREA=='서울')
subset(colRename, AREA=='서울')

# 6. colRename 데이터 세트에서 AREA(지역)가 서울이면서 Y17_CNT(17년 이용 건수)가 10건 이상인 경우만 추출 
filter(colRename, AREA=='서울' & Y17_CNT>=10)

# 8. colRename 데이터 세트의 AGE 변수를 오름차순 정렬
arrange(colRename, AGE)

# 9. colRename 데이터 세트의 Y17_AMT 변수를 내림차순 정렬
arrange(colRename,desc(Y17_AMT))



# 정렬 중첩 
# 10. colRename 데이터 세트의 AGE 변수는 오름차순, Y17_AMT 변수는 내림차순 정렬
# 데이터 요약하기
arrange(colRename, AGE, desc(Y17_AMT))

# 11. colRename 데이터 세트의 Y17_AMT(17년 이용 금액) 변수 값 합계를
# TOT_Y17_AMT 변수로 도출
TOT_Y17_AMT <- sum(colRename$Y17_AMT)
summarise(colRename, TOT_Y17_AMT = sum(colRename$Y17_AMT)) #데이터프레임

# 12. colRename 데이터 세트의 AREA(지역) 변수 값별로 
# Y17_AMT(17년 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
SUM_Y17_AMT <- tapply(colRename$Y17_AMT, colRename$AREA, sum)
aggregate(Y17_AMT~AREA, data=colRename, sum)

# 13. colRename 데이터 세트의 AMT를 CNT로 나눈 값을 
# colRename 데이터 세트의 AVG_AMT로 생성
colRename$AVG_AMT <- colRename$AMT/colRename$CNT

# 14. colRename 데이터 세트에서 AGE 변수 값이 50 이상이면 “Y” ,50 미만이면 “N” 값으로 colRename 데이터 세트에 AGE50_YN 변수 생성 
colRename$AGE50_YN <- ifelse(colRename$AGE>=50, 'Y','N')


# ::나이분류
# 15. colRename 데이터 세트의 AGE 값이 50 이상이면 “50++”, 40 이상이면 “4049” 30 이상이면 “3039”, 20 이상이면 "2029”, 
# 나머지는 “0019”를 값으로 하는 AGE_GR10 변수 생성 
AGE_GR10 <-''

colRename$AGE_GR10 <- AGE_GR10
for (i in 1:length(colRename)){ if (colRename$AGE[i] >=50) {AGE_GR10[i] <- '50++'
} else if  (colRename$AGE[i]>=40){AGE_GR10[i] <-'4049'
} else if (colRename$AGE[i]>=30){AGE_GR10[i] <-'3039'
} else if (colRename$AGE[i]>=20) {AGE_GR10[i] <-'2029'
} else {AGE_GR10[i] <-'0019'}}

colRename$AGE_GR10 <- ifelse(colRename$AGE>=50, '50++',
                             ifelse(colRename$AGE>=40, '4049',
                                    ifelse(colRename$AGE>=30, '3039',
                                           ifelse(colRename$AGE>=20,'2029','0019'))))


#데이터 결합
library(readxl)
female_hist <- read_excel(file.choose())
male_hist <- read_excel(file.choose())

#세로결합 : 변수명 기준으로 결합
#bind_rows()
m_f_bind_join  <- bind_rows(male_hist,female_hist)

#가로결합 left_join(): 지정한 변수와 데이터 세트1을 기준으로 데이터 세트2에 있는 나머지 변수 결함 
#inner_join(): 데이터 세트1과 데이터 세트2에서 기준으로 지정한 변수값이 동일할때만 결합
#full_join(): 전체를 결합

jeju17 <- read_excel(file.choose())
jeju16 <- read_excel(file.choose())
str(jeju17)
str(jeju16)


# ID를 기준으로 17제주 데이터 세트 기준으로 결합
bind_left<- left_join(jeju17,jeju16, by='ID')
bind_inner<- inner_join(jeju17,jeju16, by='ID')
bind_full<- full_join(jeju17,jeju16, by='ID')

#service_data_excel_sample.xlsx
sample_excel <- read_excel(file.choose())

#특정값이 얼마나 반복되는지 분석
# descr::freq()
install.packages("descr")
library(descr)
freqArea <- freq(sample_excel$AREA, plot=T, main = '지역별 빈도')
freqArea <- freq(sample_excel$AREA, plot=F)

#성별에 따른 빈도 분석
freqSex <- freq(sample_excel$SEX, plot = T, main= '성별 빈도')
barplot(freqSex)


# 시각화
# 변수 구분(이산 vs 연속)
# 이산형 변수: 변수가 가질 수 있는 값이 끊어진 변수
# -명목변수     -순위변수      막대, 점, 파이 
char_data <- c(380,520, 330, 390, 320, 300, 405,340)
names(char_data) <- c('20181Q','20191Q','20182Q','20183Q','20192Q','20193Q','20194Q','20184Q')
range(char_data) #최소값과 최댓값
max(char_data)
length(char_data)

#막대차트 ::barplot()
barplot(char_data)
barplot(char_data, ylim = c(0,600), col=rainbow(2), main = '2018과 2019 분기매출')
barplot(char_data, xlim = c(0,600), col=rainbow(2), main = '2018과 2019 분기매출',
        horiz=T, ylab='년도별 분기', xlab='매출 현황')

#dot chart
dotchart(char_data)
dotchart(char_data, color=c('green','red'), xlab = '매출액', ylab ='년도별 분기', 
         main = '2018과 2019 분기매출',pch=1:2, cex =1.3,lcolor = 'blue')

#pie chart
par("mar")
par(mar=c(1,1,1,1))  # Error in plot.new() : figure margins too large

pie(char_data)
pie(char_data, border='blue', col = rainbow(8))
pie(table(iris$Species))
class(table(iris$Species))


# 연속변수       
# 상자그래프, 히스토그램, 산점도
# =변수가 연속된 구간을 갖는다
# 간격변수, 비율변수    boxplot():이상치를 확인, 정규화   hist(), plot()
# 시각화
data("VADeaths")
str(VADeaths)
summary(VADeaths)
boxplot(VADeaths)

#히스토그램
data(iris)
iris
#attach(), detach()
attach(iris)  # 모든 코드에서 컬럼들을 직접 접근 가능
mean(Sepal.Length)
detach(iris) # attach 후 취소 

summary(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab='꽃받침 길이', col='green', main='iris SL', xlim=c(4.0,8.0))
hist(iris$Sepal.Width, xlab='꽃받침 넓이',  col='green', main='iris SW', xlim=c(2.0,4.5), freq=F)
lines(density(iris$Sepal.Width), col = 'red')
hist(iris$Sepal.Width, xlab='꽃받침 넓이',  col='green', main='iris SW', xlim=c(2.0,4.5))
head(iris)

#산점도(plot)
x <- runif(5, min=0, max=1)
y <- x^2
plot(x,y)
plot(x,y,type ='l')

price <- runif(10, min=2, max=8)
plot(price, type='l')
plot(price, type ='o')
plot(price, type ='h')
plot(price, type ='s')

# 1 ~ 25
plot(price, type ='o', pch = 16)


#iris -scatter matrix(산점도 매트릭스)
#pairs()
pairs(iris[1:4])


#3차원 산점도
install.packages("scatterplot3d")
library(scatterplot3d)

#종별로 분류해서 변수에 담기
x <- filter(iris, iris$Species==levels(iris$Species)[1])
y <- filter(iris, iris$Species==levels(iris$Species)[2])
z <- filter(iris, iris$Species==levels(iris$Species)[3])

iris3D <- scatterplot3d(iris$Petal.Length, iris$Petal.Length, iris$Sepal.Width, type = 'n')
iris3D$points3d(x$Petal.Length, x$Petal.Length, x$Sepal.Width, bg='green', pch=21)
iris3D$points3d(y$Petal.Length, y$Petal.Length, y$Sepal.Width, bg='red', pch=25)
iris3D$points3d(z$Petal.Length, z$Petal.Length, z$Sepal.Width, bg='yellow', pch=24)