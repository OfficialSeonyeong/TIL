coffee <- read_excel(file.choose()) 
library(readxl)
str(coffee)
View(coffee)

# 1. 데이터 전처리
# 주소지가 서울특별시인 데이터만 추출하자, 번호, 사업장명, 소재지전체주소, 업태구분명, 시설총규모, 인허가일자, 페업일자,
#소재지면적, 상세영업상태명, 영업상태구분코드

coffee_new <- coffee %>% filter(substr(소재지전체주소, 1, 2) =='서울') %>%
  select(번호, 사업장명, 소재지전체주소, 업태구분명, 시설총규모, 인허가일자, 폐업일자,
       소재지면적, 상세영업상태명, 영업상태구분코드)

head(coffee_new)
library(stringr)
library(base)

coffee_new$업태구분명 %>% table()

fVector <- c('tomato','pear','apple','banana','mato')

#str_detect(vector,'문자') :문자가 포함된 것
library(stringr)
str_detect(fVector, 't')  # TRUE FALSE FALSE FALSE  TRUE
str_detect(fVector, '^t')  # TRUE FALSE FALSE FALSE FALSE
str_detect(fVector, 'o$')  # TRUE FALSE FALSE FALSE  TRUE
str_detect(fVector, '[pe]') # FALSE  TRUE  TRUE FALSE FALSE
letters
str_detect(letters, '[acd]') # 괄호 안에 하나라도 포함되면 TRUE

str(coffee_new)
coffee_new2<- coffee_new %>% filter(업태구분명 =='커피숍')
View(coffee_new_shop)

opened_coffeeshop <- coffee_new_shop %>% filter(상세영업상태명=='영업')
summary(opened_coffeeshop)

opened_coffeeshop2 <- opened_coffeeshop %>% filter(substr(소재지전체주소, 7, 9)=='서대문'|
                               substr(소재지전체주소, 7, 9)=='영등포'|substr(소재지전체주소, 7, 9)=='동대문')
View(opened_coffeeshop2)

str(opened_coffeeshop2)

opened_coffeeshop2$지역구 <- ifelse(substr(opened_coffeeshop2$소재지전체주소, 7, 9)=='서대문', '서대문구',
                                 ifelse(substr(opened_coffeeshop2$소재지전체주소, 7, 9)=='영등포','영등포구',
                                        '동대문구'))

mutate(opened_coffeeshop2, 지역구 = ifelse(substr(opened_coffeeshop2$소재지전체주소, 7, 9)=='서대문', '서대문구',
                                  ifelse(substr(opened_coffeeshop2$소재지전체주소, 7, 9)=='영등포','영등포구',
                                         '동대문구')))

coffee_new2$지역구 <- substr(coffee_new2$소재지전체주소, 7, 10)
coffee_new2$지역구 <- ifelse(substr(coffee_new2$지역구, 1, 2)=='중구','중구',coffee_new2$지역구)
View(coffee_new2)

library(doBy)
install.packages("lubridate")
library(lubridate)

#ymd함수 : Date로 데이터 형식 변환

coffee_new2$인허가일자 <- ymd(coffee_new2$인허가일자)

coffee_new_shop$인허가일자 <- ymd(coffee_new_shop$인허가일자)

coffee_new2$폐업일자 <- ymd(coffee_new2$폐업일자)

opened_coffeeshop2 <- mutate(opened_coffeeshop2, sprintf('%d%s',년도= year(인허가일자),'년')) #끝에 년, 월, 일 글자 추가해보기!
opened_coffeeshop2 <- mutate(opened_coffeeshop2, 월= month(인허가일자))
opened_coffeeshop2 <- mutate(opened_coffeeshop2, 일= day(인허가일자))
opened_coffeeshop2 <- opened_coffeeshop2 %>% dplyr::select(-17)
nrow(opened_coffeeshop2)
str(opened_coffeeshop2$시설총규모)
View(opened_coffeeshop2)


coffee_new2$시설총규모 <- as.numeric(coffee_new2$시설총규모)
coffee_new2$규모구분 <- ifelse(coffee_new2$시설총규모<=3, '초소형',
                                   ifelse(coffee_new2$시설총규모<=30, '소형',
                                          ifelse(coffee_new2$시설총규모<=70,'중형',
                                                 ifelse(coffee_new2$시설총규모<=300,'대형','초대형'))))

#영업 중이면서 인허가일자가 2000년 이후인 커피숍 수를 규모별로 확인
op_coff <- opened_coffeeshop2 %>% subset(인허가일자>2000-01-01)%>%group_by(규모구분)%>% summarise(n=n()) %>% arrange(desc(n))
op_coff_table <- table(op_coff$규모구분)
op_coff_table1 <- as.data.frame(op_coff_table)
ggplot(op_coff_table1, aes(x=Var1, y=Freq)) + geom_bar(stat='identity')
library(ggplot2)
library(dplyr)

가장큰카페 <-0
# 가장 큰 규모의 카페
for (i in 1:nrow(opened_coffeeshop2)){
  if (opened_coffeeshop2$시설총규모[i]>가장큰카페) {
    가장큰카페 <- opened_coffeeshop2$사업장명[i]
  }
}

cafe2000 <- opened_coffeeshop2 %>% subset(인허가일자>2000-01-01)
which.max(cafe2000$시설총규모)
which.min(cafe2000$시설총규모)
cafe2000[which.max(cafe2000$시설총규모),]
cafe2000[which.min(cafe2000$시설총규모),]

#시각화
table(cafe2000$시설총규모)
ggplot(cafe2000, aes(x=시설총규모)) +
  geom_histogram(binwidth=30, position = 'dodge') +
  scale_x_continuous(breaks = c(100,200,300,400,500,600))

#영업 중인 카페의 인허가연도 히스토그램
ggplot(cafe2000, aes(x=year(인허가일자),fill=규모구분))+geom_histogram(color='blue')

#영업과 페업한 카페의 연도를 히스토그램으로 시각화
ggplot(new_table, aes(x=Var1, y=Freq, fill=Var2)) +geom_bar(stat='identity')+
  labs(x='년도',y='갯수', fill='영업여부')

ggplot(coffee_new_shop, aes(x=year(인허가일자), fill=상세영업상태명))+geom_histogram()

new_table=as.data.frame(table(coffee_new_shop$인허가일자, coffee_new_shop$상세영업상태명))
coffee_new_shop<- filter(coffee_new_shop, 인허가일자 >= '2000-01-01')
#서울 소재 커피숍의 인허가 년도별 숫자
d1 <- coffee_new_shop %>% filter(year(인허가일자)>'2000-01-01')%>% group_by(year(인허가일자))%>%summarise(n=n())

#서울 소재 커피숍의 인허가 년도별 숫자와 현재 영업중인 정보확인
d2 <- coffee_new_shop %>% filter(상세영업상태명 =='영업' & year(인허가일자)>'2000-01-01') %>% group_by(year(인허가일자))%>%summarise(n=n())

 coffee_new_shop %>% group_by(year(인허가일자), 상세영업상태명)%>%summarise(n=n())

d3 <- merge(d1, d2, by='year(인허가일자)')
d3 <- d3 %>% mutate(prob = (n.y)/(n.x))

#생존율 시각화 geom_line, geom_point

ggplot(d3, aes(x=year(인허가일자),y=prob))

opened_coffeeshop2 %>% filter(year(인허가일자)==2001)%>% group_by(지역구)
View(opened_coffeeshop2) %>% 
  filter(year(인허가일자)=='2001')%>% 
  group_by(지역구)

# 2001년도 시설 총 규모에 따른 영업 구분을 히스토그램으로 시각화
coffee_new2<- filter(coffee_new, year(year)==2001)
View(coffee_new)
str(coffee_new2)
coffee_new$인허가일자 <- ymd(coffee_new$인허가일자 )
coffee_new2$시설총규모 <- as.numeric(coffee_new2$시설총규모)
year <- coffee_new$인허가일자

ggplot(coffee_new2, aes(x=시설총규모, fill=상세영업상태명)) + geom_histogram()
library(ggplot2)
coffee_new2 <- coffee_new2 %>% filter(업태구분명 =='커피숍')

#지역구에 따른 년도별 커피숍 인허가 정보를 요약해보자
x <- coffee_new_shop %>% filter(인허가일자>'2000-01-01') %>% group_by(year(인허가일자),지역구) %>% summarise(n=n())
View(x)


dustdata <- read_excel(file.choose())
library(readxl)

head(dustdata)
str(dustdata)
View(dustdata)


#로드한 데이터로부터 성북구와 중구의 미세먼지를 비교하고 시각화
#비교할 지역 데이터만 추출하여 미세먼지 농도차이가 있는지 확인해보자
library(dplyr)
dust_district <- dustdata %>% filter(area=='성북구'| area=='중구')
dustdata %>% filter(area %in% c('성북구','중구'))
View(dust_district)

library(ggplot2)
ggplot(dust_district, aes(x=yyyymmdd, y=finedust, group=area, col= area))+ geom_line() +geom_point()

# 현황 파악하기
#yyyymmdd에 따른 데이터 수 파악(내림차순) -> count()함수 이용
count(dust_district, yyyymmdd) 

#area에 따른 데이터 수 파악(내림차순)
count(dust_district, area)

#지역에 따른 데이터를 변수에 각각 할당
dust_seongbok <- dust_district %>% subset(area=='성북구')
dust_jooggu <- dust_district %>% subset(area=='중구')

summary(dust_seongbok$finedust)
summary(dust_jooggu)

ggplot(dust_district, aes(x=yyyymmdd, y=finedust, fill = area)) + geom_bar(stat='identity', position='dodge')
boxplot(dust_seongbok$finedust, dust_jooggu$finedust, main='finedust_compare',xlab='AREA', names=c('성북구', '중구'), ylab='FINEDUST', col=c('blue','green'))

#가설에 대한 검정
t.test(data = dust_district, finedust ~ area, var.equal=T)
