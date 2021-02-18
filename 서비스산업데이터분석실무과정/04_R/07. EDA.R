#EDA(Exploratory Data Analysis)
# 1. 데이터 탐색
# 2. 결측지(NA) 처리
# 3. 이상치(outlier) 발견 처리
# 4. 리코딩(코딩 변경)
# 5. 파생변수, 가변수
# 6. 시각화
# 7. 의사결정

# service_data_dataset_edu.csv
edu <- read.csv(file.choose())
str(edu)
head(edu)

dim(edu) #행의 개수하고 열의 개수 반환
nrow(edu) # 행의 개수
ncol(edu) # 열의 개수
length(edu) # 열의 개수

names(edu) # 컬럼 이름
summary(edu$price) # 기초 통계량
is.na(edu$price)
table(is.na(edu$price)) # NA값 여부 개수
sum(is.na(edu$price)) # NA값 개수

#결측치 처리하는 방법
#caret :: na.omit(), na.fail(), na.pass()
dataset_new <- na.omit(edu)
table(is.na(dataset_new))
str(dataset_new)

# 평균으로 대체
price <- edu$price

avgna <- ifelse(is.na(price), mean(price, na.rm = T), price)

# 0으로 대체
zerona <- ifelse(is.na(price), 0, price)

#통계적 방법: 분석가의 기준에 따른 가변수로 대체하는 법
priceAvg <- mean(price, na.rm = T)
edu$type <- rep(1:3, 100)
head(edu) str(edu)

#type: 1(평균보다 15%인상),2(10%),3(5%)
#300명에 대한 고객유형을 판단하여 새로운 가변수 priceSta 만들기
priceSta <- ifelse(edu$type==1, priceAvg*(1+0.15),
                   ifelse(edu$type==2, priceAvg*(1+0.1),
                          priceAvg*(1+0.05)))

edu$priceSta <- round(priceSta,1)

temp =0
for (i in 1:nrow(edu)) {
  if (edu$type[i] ==1){
    temp[i]=priceAvg *1.5
  } else if (edu$type[i]==2){
    temp[i]=priceAvg*1.0
  } else{
    temp[i]=priceAvg*0.5
  }
}

str(edu)
gender <- edu$gender
range(gender)
table(gender)


#subset을 활용하여 이상치를 제거한 후 gender 를 범주형으로 변환해보자
edu_gender <- subset(edu, gender==1 | gender==2)
edu_gender$gender <- as.factor(edu_gender$gender)
range(edu_gender$gender) # factor에 사용할 수 없음
levels(edu_gender$gender)
str(edu_gender)
table(edu_gender$gender)
pie(table(edu_gender$gender))
dim(edu_gender)

zz <- subset(edu, gender==c(1,2))
zz$gender <- as.factor(zz$gender)
range(zz$gender)
table(zz$gender)
pie(table(zz$gender))
dim(zz)


#변수의 유형이 연속변수라면 어떻게 제거하나
seqPrice <- edu$price
length(seqPrice)
summary(seqPrice)

#IQR(Q3-Q1) 
outlier <- boxplot(seqPrice)
edu <- subset(edu, seqPrice>=2.1 & seqPrice<=7.9)
nrow(edu)
boxplot(edu$price)

#age 체크
summary(edu$age)

#결측지 제거 후 시각화
edu$age <- ifelse(is.na(edu$age), '', edu$age)
sum(is.na(edu$age))
na.omit(edu$age)
edu


#리코딩 - 데이터의 가독성을 위해서 연속형 -> 범주형
#형식 ) dataset$컬럼[조건식] <- 추가할 값
# 1. 서울 2. 부산 3. 광주 4. 대전 5. 대구
edu$resident_new[edu$resident==1] <- '서울'
edu$resident_new[edu$resident==2] <- '부산'
edu$resident_new[edu$resident==3] <- '광주'
edu$resident_new[edu$resident==4] <- '대전'
edu$resident_new[edu$resident==5] <- '대구'

head(edu)
edu$resident_new <- ifelse(is.na(edu$resident_new),'대전',edu$resident_new)
edu$resident_new <- as.factor(edu$resident_new)
str(edu)


#job
#1: 분석가 2:데이터과학자 3:개발자
edu$job_new[edu$job==1] <- '분석가'
edu$job_new[edu$job==2] <- '데이터과학자'
edu$job_new[edu$job==3] <- '개발자'
edu$job_new <- ifelse(is.na(edu$job_new),'취준생',edu$job_new)

edu$job_new <- as.factor(edu$job_new)


#간단 분석
url <- "https://www.dropbox.com/s/0djexymb42zd1e2/example_salary.csv?dl=1"
salary_data_edu <- read.csv(url, stringsAsFactors = F, na='-')
str(salary_data_edu)
head(salary_data_edu)

#1. 컬럼명을 영문으로 변경
names(salary_data_edu) <- c('age','month_salary','salary_bonus','work_hour','worker_number','working_ex','gender')

#2.각 피쳐별 결측값 확인
summary(salary_data_edu)

#3. 임금 평균 확인
mean(salary_data_edu$month_salary, na.rm =T)

#4. 임금 중앙값 확인
median(salary_data_edu$month_salary+salary_data_edu$salary_bonus, na.rm =T)

#5. 임금 범위 구해보기(최저 최고)
salary.range <- range(salary_data_edu$month_salary, na.rm =T)
salary.lowest <- which(salary_data_edu$month_salary==1117605) #which: 인덱스로 반환
salary_data_edu[salary.lowest,]

salary.highest <- which(salary_data_edu$month_salary==4064286)
salary_data_edu[salary.highest,]

# 6. 임금에 대한 사분위수(quantile())구하기
quantile(salary_data_edu$month_salary+salary_data_edu$salary_bonus, na.rm = T)

year_salary <- salary_data_edu$month_salary+salary_data_edu$salary_bonus



#7. 성별에 따른 임금 격차 확인
salary.gender_sal <- tapply(salary_data_edu$month_salary, 
                            salary_data_edu$gender, 
                            mean, 
                            na.rm = T)
class(salary.gender_sal)

ggplot(salary_data_edu, aes(x=age, y=month_salary, fill=factor(gender))) + geom_bar(stat='identity', position=position_dodge(width =.9))+
  labs(title = '성별에 따른 임금 격차')


library(reshape2)
salary.melt <-  melt(salary.gender_sal)
class(salary.melt)
ggplot(salary.melt, aes(x = Var1 , y = value , fill = Var1))+
  geom_bar(stat = "identity")

#8. 분석된 데이터를 가지고 원하는 시각화 진행

#9. 성별에 따른 표준편차 구하기
a <- aggregate(month_salary~gender+age,data=salary_data_edu, sd)

ggplot(a, aes(x=age, y=month_salary, fill=gender)) + geom_bar(stat='identity')+
  labs(title = '성별에 따른 표준편차', x='나이', y='표준편차')

#10. 경력별 임금 평균치
year_salary <- salary_data_edu$month_salary+salary_data_edu$salary_bonus

경력별급여<- aggregate(year_salary ~ working_ex, data=salary_data_edu, mean)
class(경력별급여)

#11. 경력별 임금 평균치 시각화
ggplot(경력별급여, aes(x=working_ex, y=year_salary)) + geom_bar(stat='identity')


salary.career <- tapply(salary_data_edu$month_salary, 
                        salary_data_edu$working_ex, 
                        mean, 
                        na.rm = T)
salary.career


career.melt <- melt(salary.career)
career.melt

ggplot(career.melt, aes(x = Var1, y = value, group = 1)) + 
  geom_line(color = "skyblue2",
            size = 2) +
  coord_polar() +
  ylim(0 , max(career.melt$value))



# 통닭집이 가장 많은 지역 찾기
# 서대문구에 통닭집이 많은 동을 시각화 해보자
library(readxl)
# data load : service_data_chicken_store_eda_visualization
ck <- read_xlsx(file.choose())
head(ck)


# substr() 함수를 이용하여 소재지전체주소에 동만 가져오기
pattern <- regexpr("[[:alpha:]]{1,}동", ck$소재지전체주소)
dong <- regmatches(ck$소재지전체주소, pattern)
dong %>% head

install.packages("dplyr")
library(dplyr)

sub <- substr(ck$소재지전체주소, 12,15)

# 실행결과 동 이름이 3글자인 경우와 4글자인 경우가 있으므로 지정한 자리만큼
# 글자를 추출하면 3글자인 동은 숫자가 포함된다.
# 공백과 숫자를 제거하자
sub1 <- gsub('[[:digit:]]','', sub)
sub2 <- gsub(' ','', sub1)
ck$소재지전체주소 <- sub2

# 동별 도수분포표 만들어보기
# table() 함수를 이용해서 개수 세기, 도수분표표를 만들어줌
# 도수분포표란 항목별 개수를 나타낸 것이다
str(ck)
table(sub2)
as.data.frame(table(sub2))


library(sqldf)
makingtable <- sqldf('select 소재지전체주소, count(사업장명) as 개수
                     from ck
                     group by 소재지전체주소')
str(makingtable)
names(makingtable)
class(makingtable) # Data.Frame



ggplot(makingtable, aes(x=소재지전체주소, y=개수)) +
  geom_bar(stat='identity')
hist(makingtable$개수)

install.packages("treemap")
library(treemap)

# 트리맵은 옵션으로 데이터 프레임을 입력 받는다.
# treemap(데이터, index="구분 열" , vSize="분포 열" , vColor=컬러, title=제목)
treemap(makingtable, index= "소재지전체주소", vSize="개수")