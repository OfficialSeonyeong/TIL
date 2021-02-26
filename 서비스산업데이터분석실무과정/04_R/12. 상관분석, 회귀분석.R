# 데이터 마이닝

#지도 학습
#분류모델 classification (범주형)
# --알고리즘(KNN, SVM, D-TREE, RandomForest, logistic regression etc...)

#예측모델 pridiction, estimation (연속형)
#--알고리즘(regresstion): 회귀


#비지도 학습
#--결정값이 없음
#--군집분석(clustering), 연관규칙(Association rule), 연속규칙(Sequence rule)


# 1. 단순회귀분석
#상관분석 vs 회귀분석

#상관분석 : 하나의 변수와 다른 변수와의 밀접한 관련성을 분석하는 기법
#cor() : corelation
#회귀분석 : 두 변수 간의 인과 관계가 있는지 분석하는 기법 , x와 y의 평균점을 지나는 선이어야
#lm()

height <- c(100,120,130,140,150,160,170, 180,190)
foot <-   c(200,205,210,220,230,240,250,270,290)

plot(height, foot, xlab='키',ylab='발크기')
cor(height, foot)
abline(h=mean(foot),lty=2)
abline(v=mean(height),lty=2)

airquality
str(airquality)

air01 <- airquality[,c(1:4)]
install.packages("psych")
library(psych)
pairs.panels(air01) # 각 변수의 상관 관계를 나타낸다.

plot(air01$Ozone, air01$Temp)
cor(air01)

summary(air01)

#NA 가 있는 행 찾기
air01[! complete.cases(air01), ]
air02 <- air01[complete.cases(air01),]  #NA 없애기
air02[! complete.cases(air02), ] # 0행

str(air02)
# -1 <= cor <= 1
cor(air02)

install.packages("corrplot")
library(corrplot)
air.cor <- cor(air02)

#상관계수를 시각화를 통해서 표현해 본다면 method = circle, square, ellipse, shade, color, pie
corrplot(air.cor, method= 'number')
corrplot(air.cor, method= 'ellipse')


#--[실습]
df <- read.csv('http://goo.gl/HKnl74')
str(df)
colSums(is.na(df))

#놀이기구 만족도가 높으면 전체 만족도가 높아진다고 예상
plot(df$overall~df$rides)
cor(df$overall, df$rides)
cor.test(df$overall, df$rides)

iris
colSums(is.na(iris))

#가설: 꽃받침의 길이가 길수록 꽃잎의 넓이도 크다. Sepal., Petal
iris01 <- iris[,1:4]
cor(iris01$Sepal.Length, iris01$Petal.Width)
cor(iris01)
cor.test(iris01$Sepal.Length, iris01$Petal.Width)


symnum(cor(iris[,1:4]))

install.packages('corrgram')
library(corrgram)

corrgram(cor(iris[,1:4]), type='corr', upper.panel = panel.conf)


# 선형 회귀 분석 : 예측 모델에서 사용하는 알고리즘
# 인과 관계를 분석하는 방법

# 1. 조건 : x가 변할 때 y도 변한다.
# 2. 조건 : 시각적으로 선행되어야 한다.
# 3. 조건 : 외생변수를 통제(다른 요인을 통제하고 인과관계를 분석)

# 종속변수(목표변수): 영향을 받는 변수
# 독립변수(설명변수) : 영향을 주는 변수

#model <-lm()    plot(model)    summary()    abline()    abline(intercept, slope)
#y= b0 + b1x + e   b1: slope, b0:y, intercept e:오차

women
str(women)
cor(women)

# weight = b0 + height*b1
fit_model <- lm(weight ~ height, data= women)
head(women)

-87.52 + 3.45 * 58
plot(weight ~ height, data= women)
abline( h = mean(women$weight), lty=2)
abline( v = mean(women$height), lty=2)
abline( fit_model, lty=2, col='red')

fitted(fit_model)[1]

#모델 예측치
y_pred <- -87.52 + 3.45 * 58
y_pred

error <- 115 - 112.58

residuals(fit_model)[1] # 오차
summary(fit_model)
cor.test(women$height, women$weight)

predict(fit_model, newdata = data.frame(height=78))


# 예측모델 평가지표
#ME(Mean of Errors)
#MSE(Mean of Squared Error)
#RMSE(Root Mean of Squared Error) : 작을수록 신뢰도가 높음, 예측력 높음
#MAE(Mean of Absolute Error)
#MPE(Mean of Percentage Error)

install.packages('forecast')
library(forecast)

swiss
str(swiss)
model01 <- lm(Fertility ~., data=swiss)
model02 <- lm(Fertility~Agriculture, data= swiss)
plot(swiss$Fertility)
lines(model01$fitted.values, col ='red')
lines(model02$fitted.values, col ='blue')
accuracy(model01)
accuracy(model02)

accuracy(fit_model)



#선형회귀분석 part2

product <- read.csv(file.choose())
str(product)
cor(product$제품_만족도, product$제품_친밀도)
cor(product$제품_만족도, product$제품_적절성)
corrplot(product, method='number')

friendly <- lm(제품_만족도~제품_친밀도, data= product)
properly <- lm(제품_만족도~제품_적절성, data= product)
cor.test(product$제품_만족도, product$제품_친밀도)
cor.test(product$제품_만족도, product$제품_적절성)

plot(product$제품_만족도 ~ product$제품_친밀도, data=product)
plot(product$제품_만족도 ~ product$제품_적절성, data=product)
abline(h=mean(product$제품_만족도), lty=2)
abline(v=mean(product$제품_친밀도),lty=2, col='pink')
abline(v=mean(product$제품_적절성),lty=2, col='yellow')
abline(friendly, lty=2, col='red')
abline(properly, lty=2, col='green')

plot(product$제품_만족도)
lines(friendly$fitted.values, col ='red')
lines(properly$fitted.values, col ='blue')

summary(friendly)
summary(properly)
accuracy(friendly)
accuracy(properly)


# [실습] PART03
# Linear Regression
train <- read.csv(file.choose())
str(train)

# 1. 결측치 확인 및 NA 제거
colSums(is.na(train))
train[!complete.cases(train),]
train <- na.omit(train)

# 2. 상관분석
cor(train)
cor.test(train$x, train$y)
plot(train)
abline(h=mean(train$y), lty=2, col='blue')
abline(v=mean(train$x), lty=2, col= 'red')
abline(train_line, lty=2, col='pink')

# 3. 이상치 확인
boxplot(train$y, main='y')
boxplot(train$x, main='x')

# 4. 분석

train_line <- lm(y~x, data=train)
head(train, 1)
y_pred <- -0.1073+(1.0007*24)
fitted(train_line)[1]
error <- 21.54945-23.90849 
residuals(train_line)[1]
summary(train_line)


#분석결과 시각화
library(ggplot2)

ggplot(data=train, aes(x=x, y=y)) + geom_line(aes(x=train$x, y=predict(train_line, newdata=train))) +
  geom_point(col='red')




#test
train_test <- read.csv(file.choose())
str(train_test)

#정확도를 계산
y_predict <- predict(train_line, newdata = train_test)
head(train_test,1)
y_predict[1]


ggplot(data=train_test, aes(x=x, y=y)) + geom_line(aes(x=train_test$x, y=predict(train_line, newdata=train_test))) +
  geom_point(col='red') + ggtitle('X vs Y') +xlab('X')+ ylab('Y')

compare <- cbind(actual=train_test$y, y_predict)
accuracy(train_line)



# 다중(다항) 선형회귀
iris

#Sepal.Length 예측 <- 종속변수, 나머지는 독립변수

iris_model <- lm(iris$Sepal.Length~.-Species, data=iris)
summary(iris_model)

#회귀직선(abline)
#abline() 첫번째 인자는 절편, 두번쨰 인자는 기울기, 선스타일

#
insu_train <- read.csv(file.choose())
str(insu_train)

# 종속변수 :charges 독립변수: age, bmi, children

#상관계수 확인해보자
yy <- cor(insu_train[c(1,3,4,7)])
cor(insu_train$charges, insu_train$bmi)
cor(insu_train$charges, insu_train$children)

corrplot(yy, method = 'number')
insu_model <- lm(charges ~ age + bmi + children, data=insu_train)
age <- insu_model$coefficients[2]
bmi <- insu_model$coefficients[3]
children <- insu_model$coefficients[4]

# y=(a1 * x1) + (a2 * x2) + (a3 * x3) + intercept
y=(a1 * age) + (a2 * bmi) + (a3 * children)

lm(charges ~ age + bmi + children + smoker + region, data=insu_train)

install.packages("car")
library(car)

str(Prestige)
#종속변수 :income, 독립변수 : education, women, prestige
cor(Prestige[1:4])
corrplot(cor(Prestige[1:4]), method='pie')

#회귀모델 만들기
prestige_model <- lm(income ~ education+ women+ prestige, data=Prestige)
# y= (a1 * x1) + (a2 * x2) +(a3 * x3)
predict_y= ( 177.2  * 13.11  ) + (-50.9  * 11.16) +(141.4  * 68.8)-253.8
head(Prestige)
summary(prestige_model) #education은 부적합!

cor(Prestige[c(2:4)])
new_model <- lm(income ~ women+prestige, data=Prestige)
summary(new_model)