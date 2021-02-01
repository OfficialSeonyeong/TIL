# lapply() sapply() 리스트
iris

class(sapply(iris[,1:4], mean))
irisVec <- sapply(iris[,1:4], mean)

as.data.frame(irisVec)
class(as.data.frame(irisVec))


iris[1,1] = NA
head(iris)


# split(feature ,분류기준)
t <- sapply(split(iris$Sepal.Length, iris$Species),
       median,
       na.rm=T)
t
iris<- within(iris, {Sepal.Length<- ifelse(is.na(Sepal.Length),
                                           t[iris$Species],Sepal.Length)})
head(iris)



# subset()

x <- 1:5
y <- 6:10

letters # a,b,c,d, ......,z
z<- letters[1:5]
df <- data.frame(x,y,z)
str(df)


#x의 값이 3이상인 결과를 데이터 프레임으로 만들어보자
subset(df,x >=3)


#y의 값이 8이하인 결과
subset(df, y<=8)
subset(df, x>=2 & y<=8)


# subset() 컬럼선택가능
subDF2 <- subset(df, select = c(x,y))
subDF2 <- subset(df, x>=3, select = c(x,y))

iris
str(iris) # Infomation of 'iris'
names(iris) # Name of coulmns

mean(iris$Petal.Length)


# subset(데이터프레임, 조건, 선택 열)
s2 <- subset(iris, mean(iris$Petal.Length)<= Petal.Length, 
             select = c(Sepal.Length, Petal.Length,Species))
str(s2)


#Factor 범주형 변수 
gender <- factor(c("m","f"))
nlevels(gender)  # 2
levels(gender)   # "f" "m"
levels(gender)[1] # "f"

blood.type <- factor(c('A','B','AB','O'))
is.factor(blood.type)  # True

lettersVec <- c('a','b','c','b','c','a')
str(lettersVec)
letterVec.fac <- factor(lettersVec,levels= c('a','b','c'), labels=c('best','middle','low'))
levels(letterVec.fac) # "best"   "middle" "low" 


id <- c(1,2,3,4,5)
gender <-c('F','M','F','M','F')
data <- data.frame(id, gender)
data <- data.frame(idx=id, gender=gender)
str(data)
data$gender <- as.factor(data$gender)
levels(data$gender) <- c('female','male') # factor값 변경

x<- c(15,18,2,36,12,78,5,6,6)
mean(x)


# group by 통해서 산술평균을 구하기
height <-c(180,185,165,172,161,155, 190,170)
gender <-c('M','M','F','F','F','F','M','M')

group_frm <- data.frame(height, gender)

#성별로 키의 평균을 구한다면?
?aggregate
aggregate(group_frm$height, list(group_frm$gender), mean) # by부분은 반드리 리스트


mtcars
str(mtcars)
head(mtcars)

#cyl컬럼을 기준으로 나머지 컬럼의 평균값 구하기
aggregate(mtcars,list(cylStandard = mtcars$cyl), mean)

#disp 컬럼이 120이상인지 아닌지 판별 컬럼 추가
aggregate(mtcars,list(cylStandard = mtcars$cyl,
                      djspHigh = mtcars$disp>=120), mean)

#cyl 컬럼을 기준으로 wt 컬럼의 평균만 구하기
aggregate(mtcars$wt,list(mtcars$cyl), mean)
aggregate(mtcars[,6],list(mtcars$cyl), mean)
aggregate(wt ~ cyl, data=mtcars, mean)
aggregate(. ~ cyl, data=mtcars, mean)
aggregate(. ~ cyl+am, data=mtcars, mean)

# carb, gear컬럼 두가지를 기준으로  wt 구하기
aggregate(wt ~ carb + gear, data=mtcars, mean)

# gear 기준으로 disp, wt 평균
aggregate(cbind(disp,wt) ~ gear,data=mtcars, mean)

# carb, gear 컬럼 기준으로 disp, wt 평균
aggregate(cbind(disp,wt) ~ gear+carb,data=mtcars, mean)

#cyl 제외한 다른 모든 컬럼을 기준으로 cyl의 평균을 구하기
aggregate(cyl~., data=mtcars, mean)


#tapply(데이터, 색인-어느그룹에 속하는가 범주형만사용가능, 함수)  
tapply(1:10, rep(1,10), sum)
class (tapply(1:10, 1:10 %% 2 == 0, sum))  # array


#iris에서 종별로 Sepal.Length 평균
tapply(iris$Sepal.Length, iris$Species, mean)

m <- matrix(1:8, ncol = 2, dimnames = list(c('spring','summer','fall','winter'),
                                           c('male','female')))


#   반기별 남성 셀의 값의 합과 여성셀의 합을 구해보자
tapply(m, list(c(1,1,2,2,1,1,2,2), c(1,1,1,1,2,2,2,2)),sum)

library(MASS)
Cars93
head(Cars93)
str(Cars93)
levels(Cars93$Type)

#타입별 고속도로 연비 평균
tapply(Cars93$MPG.highway, Cars93$Type, mean)

install.packages("ggplot2")
library(ggplot2)
# remove.packages("ggplot2")

qplot(MPG.highway, data=Cars93, facets = Type ~., binwidth=2) # 타입별 MPG 바 그래프


#프로그램의 흐름을 제어하는 제어문, 연산자, 함수
# +, -, *, /    %%, %    ^
#관계연산자 =, !=, <=, >=, <,> 
#논리연산자 &, |, TRUE, FALSE 


#제어문 
#if, switch
if(F) {print("true")} else {print('else')}

score <- 55
if(score >=60) {
  print('pass')
  } else {print('fail')}

score <- scan() #입력함수

#scan()함수를 이용하여 키보드로부터 점수를 입력받고 학점등급을 출력하라
#cat()함수를 이용하여 한줄로 출력


grade <- ''
if (score>=90) {
  grade <- 'A'
} else if (score>=80){
  grade <-'B'
}else if (score>=70) {
  grade <-'C'
}else {
  grade <- 'F'}
cat("당신의 점수는",score, "점이고, 당신의 학점은 ", grade)


#주민번호 14자리를 scan()함수를 통해 입력받아 남자, 여자를 구분
ssn <- '961121-2000000'
length(ssn)

library(stringr)
gender <- str_sub(ssn, 8, 8)

if (gender==1 |gender==3) {print('male')} else if(gender==2 | gender==4){ print('female')} else {"잘못입력"}


# if ~ else 한번에 적용 ifelse(조건식, true일 때 값, false일 때 값)
x <- c(1,2,3,4,5,6,7,8,9)
ifelse(x%%2==0, "even","odd")

nana <- c(80,43,NA,75,67,NA)
mean(nana, na.rm =T)
is.na(nana)

ifelse(is.na(nana), mean(nana, na.rm=T),nana)


testCsv <- read.csv(file.choose()) # 파일 불러오기기
str(testCsv)

num5 <-testCsv$q5

num6<-ifelse(num5>=3,"bigger","smaller")
testCsv$q6 <- num6
head(testCsv)

table(testCsv$q6)
str(testCsv)
testCsv$q6 <- as.factor(testCsv$q6)
levels(testCsv$q6)

tapply(testCsv$q5,testCsv$q6,sum)
with(testCsv,tapply(q5,q6,sum))

html <- read.csv((file.choose()))
str(html)
head(html)

Hawaii
html$State
html[13,]
html[which(html$State=='Hawaii'),]


#which() : 조건에 만족하는 index 반환
x<- c(2,3,4,5,6,7)
which(x==6)


# for, if
#for(루핑을 위한 값){
#  if(){}
#}

i <- 1:10
length(i)
for(idx in i){
  cat("idx ->", idx, "\n")
  print(idx *2)
}

for(idx in i){
  if(idx %% 2 !=0)
  {cat("idx ->", idx, "\n")}
}


# 1~100 까지 홀수/짝수의 합
even <- 0
odd <- 0

i <-1:100
for (x in i){
  if(x %% 2 == 0){even <- even + x}
  else{ odd <- odd + x}
}
cat('짝수의 합: ',even,'홀수의 합: ', odd)


#다음 데이터를 이용하여 프레임을 만들어 serviceStu에 저장
subject.kor <- c(81,95,70)
subject.eng <- c(75,88,78)
subject.mat <- c(78,99,66)
name <- c('임정섭','김정수','최호진')

serviceStu <- data.frame(name, subject.kor, subject.eng, subject.mat)
str(serviceStu)

# 총점과 평균을 구해서 subject.sum, subject.avg에 저장
subject.sum <- apply(serviceStu[,-1], 1, sum)
subject.avg <- apply(serviceStu[,-1], 1, mean)

serviceStu$suject.sum <- subject.sum
serviceStu$subject.avg <- subject.avg
head(serviceStu)


serviceStu <- data.frame(name, subject.kor, subject.eng, subject.mat)
serviceStuSum <- cbind(serviceStu, subject.sum = apply(serviceStu[,-1], 1, sum))
serviceStuAvg <- cbind(serviceStu, subject.avg = apply(serviceStu[,-1], 1, mean))

#subject.grade 컬럼 추가
subject.grade =''
size <- nrow(serviceStu)
for (idx in 1:size) {
  if (serviceStuAvg$subject.avg[idx]  >= 90) {
    subject.grade[idx] <- 'A'
  }else if (serviceStuAvg$subject.avg[idx]  >= 80) {
    subject.grade[idx] <- 'B'
  }else {
    subject.grade[idx] <- 'F'
  }
}
serviceStu$subject.grade <- subject.grade
