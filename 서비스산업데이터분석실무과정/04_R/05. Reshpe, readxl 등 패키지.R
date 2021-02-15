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