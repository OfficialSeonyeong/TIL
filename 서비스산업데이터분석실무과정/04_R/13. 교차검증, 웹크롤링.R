# 교차검증을 위한 데이터셋 분리 방법
# 1. sample()
# 2. K-Fold 방식
# 3. Hold_Out 방식

# 1. 단순임의 추출
# sample()

sample(1:10)  # 랜덤 순서로 1부터 10까지 비복원 추출
sample(1:10, 5)  #5개 비복원추출
sample(1:10, replace = TRUE)  #복원추출

# 2.  K-Fold 방식
install.packages('cvTools')
library(cvTools)

set.seed(100) # 동일한 값의 샘플을 고정시키는 방법

fold <- cvFolds(n=6, K=3, R=1)

str(fold)
fold$subsets
fold$which

fold$subsets[fold$which==1,1]
fold$subsets[fold$which==2,1]
fold$subsets[fold$which==3,1]


set.seed(200)
irisfold <- cvFolds(nrow(iris), K=3, R=1)
nrow(iris)
irisfold$subsets[irisfold$which==1,1]
irisfold$subsets[irisfold$which==2,1]
irisfold$subsets[irisfold$which==1,1]


# classification - naiveBayes 알고리즘
# 목표범주가 범주형
install.packages('e1071')
library(e1071)

acc <- numeric()
cnt <- 1
r <- 1
k <- 1:3
k[-1]  # 1번째만 제외


for(i in k) {
  idx <- irisfold$subsets[irisfold$which==i,r]
  cat('test:', i, 'Cross Validation\n')
  print(iris[idx,])
  test <- iris[idx,]
  
  for(j in k[-i]){
    idx <- irisfold$subsets[irisfold$which==j,r]
    cat('train :', j, 'Training Data \n')
    train <- iris[idx,]
    cat('rows:', nrow(train), '\n')
    model <- naiveBayes(Species~., data=train)
    pred <- predict(model, test)
    t <- table(pred, test$Species)
    print(t)
    acc[cnt] <- ((t[1,1]+t[2,2]+t[3,3])/sum(t))
    print(acc[cnt])
    cnt = cnt +1
  }
  
}

acc
mean(acc)


# Hold-Out 교차검증
library(caret)

#createDataPartition()

set.seed(300)
hold_out_train <- createDataPartition(iris$Species, p=.8)
names(hold_out_train)
table(iris[hold_out_train$Resample1,'Species']) #트레이닝 데이터
table(iris[-hold_out_train$Resample1,'Species']) #검증 데이터

train_iris <- iris[hold_out_train$Resample1,]
test_iris <- iris[-hold_out_train$Resample1,]


model <- naiveBayes(Species~., data=train_iris)
pred <- predict(model, test_iris)
t <- table(pred, test_iris$Species)
print(t)
acc <- ((t[1,1]+t[2,2]+t[3,3])/sum(t))




# 분류 실습(Naive Bayes Classifier)
#텍스트 분류
#문서를 여러 범주 나누어 판단하는 알고리즘
#조건부 확률
#10개의 메일 중 3개는 스팸메일, 그리고 그와 상관없이 free라는 단어를 포함하는 메일이 4개
#문제는 free(A)라는 메일이 와 있을때, 그것이 스팸메일(B)인지 아닌지 구분해야한다면
# 공식 : P(B/A) = P(B)*P(A/B) /P(A)
# 1. 스팸메일일 확률 : 3/10
# 2. FREE를 포함하는 메일의 확률 : 4/10
# 3. 스팸메일 중에 포함된 FREE포함 메일: 2/3

iris
install.packages("klaR")
library(klaR)

train <- sample(nrow(iris), 100)
naive_model <- NaiveBayes(Species ~ ., data=iris, subset = train)
pred <- predict(naive_model, iris[-train,])

tt <- table(iris$Species[-train], predict(naive_model,iris[-train,])$class)

sum(tt[row(tt)==col(tt)]) /sum(tt) 
1- sum(tt[row(tt)==col(tt)]) /sum(tt) #오답인 확률

library(ggplot2)
test <- iris[-train,]
test$pred <- predict(naive_model, iris[-train,])$class

ggplot(test, aes(x=Species, y=pred, col=Species)) + geom_jitter(width=0.2, hegiht=0.1, size=2)+
  labs(y='Predict',x='Species')



---------------------------------------------------------

# 웹 크롤링

install.packages('rvest')
library(rvest)

url <- 'https://dhlottery.co.kr/store.do?method=topStoreRank&rank=1&pageGubun=L645'
link <- read_html(url)

library(dplyr)
link %>% html_nodes('body') %>% html_nodes('.containerWrap') %>% html_nodes('.contentSection') %>% html_nodes('#article')

link %>% html_nodes('td') %>% html_text()

lotto15 <- link %>% html_nodes('tbody tr td') %>%  html_text()
library(stringr)
lotto15 <- str_replace_all(lotto15, '\t|\n|\r','')
lotto15 <- str_replace_all(lotto15, '[[:space:]]','')

storename <- NULL
cnt <- NULL
address<-NULL

for (idx in 1:length(lotto15)){ 
  if (idx%%5==2){
    storename <- c(storename, lotto15[idx])
  } else if (idx %%5==3){
    cnt <- c(cnt,lotto15[idx]) 
  } else if (idx %% 5==4){
      address <-c( address,lotto15[idx])
    }
  }


lottoDF <-data.frame(storename, cnt, address)


last <- link %>% html_nodes('.paginate_common') %>% html_nodes('a') %>% html_attr('onclick') %>% 
  tail(1)
end <- regmatches(last, gregexpr('[0-9]',last))
end <- as.numeric(end[[1]])
end <- as.numeric(paste(end[1],end[2],end[3], sep=''))


-----------------------------------------------------------------------------------------------------------------
install.packages('RSelenium')
library(RSelenium)
  
remDr <- remoteDriver(remoteServerAddr='localhost', port=4445L, browserName='chrome')
remDr$open()
remDr$navigate('https://dhlottery.co.kr/store.do?method=topStoreRank&rank=1&pageGubun=L645')



lottoStore= c()
for(idx in 1:end){
  front <- 'selfSubmit('
  back <- ')'
  script <- paste(front, idx, back, sep='')
  pagemove <- remDr$executeScript(script, args=1:2)
  
  #소스 받아오기
  source <- remDr$getPageSource()[[1]]
  js_html <- read_html(source)
  
  js_link <- html_nodes(js_html, 'tbody')
  
  stores <- js_link %>% html_nodes('tr') %>% html_nodes('td') %>% html_text()
  lottoStore =c(lottoStore, stores)
}


lottoStore <- str_replace_all(lottoStore, '\t|\n|\r','')
lottoStore <- str_replace_all(lottoStore, '[[:space:]]','')


storename <- NULL
cnt <- NULL
address<-NULL

for (idx in 1:length(lottoStore)){ 
  if (idx%%5==2){
    storename <- c(storename, lottoStore[idx])
  } else if (idx %%5==3){
    cnt <- c(cnt,lottoStore[idx]) 
  } else if (idx %% 5==4){
    address <-c( address,lottoStore[idx])
  }
}

lottoStoreDF <- data.frame(storename, cnt, address)
write.csv(lottoStoreDF, 'lotto_store_update.csv', row.names = F)
data <- lottoStoreDF %>% filter(substr(address, 1, 2) == '서울')


data <- lottoStoreDF %>% filter(str_extract(address, '^서울+') == '서울')

?str_extract
