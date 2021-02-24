#R과 DBMS 연동을 통한 정형 데이터 처리방법
install.packages("rJava")
library(rJava)

#인터페이스
install.packages("DBI")
library(DBI)

#jdbc함수 제공
install.packages("RJDBC")
library(RJDBC)

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_121')

#DB 연동을 위한 순서는 Driver loading, Connection(hr, hr),  Query 수행, 결과 집합 확인하는 과정으로

#Driver loading
driver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver', 
               classPath = 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar')

conn <- dbConnect(driver, 'jdbc:oracle:thin:@localhost:1521:xe', 'hr','hr')

selectEmpQuery <- 'select * from employee'

#dbGetQuery() : select
empTable <- dbGetQuery(conn, selectEmpQuery)
str(empTable)
dim(empTable)
dumyTbl <- dbGetQuery(conn, selectDummySQL)

#table 생성
createTempTable <- 'create table r_tbl(id varchar2(20) primary key,
                                       pwd varchar2(20),
                                       username varchar2(50),
                                       upoint number default 1000)'

# dbSendUpdate() : DML(insert, update, delete), DDL(create, drop, alter)
dbSendUpdate(conn, createTempTable)

#insert(dummy data)
insertSQL <- "insert into r_tbl values ('jslim','200','선영',2000)"
dbSendUpdate(conn, insertSQL)

selectDummySQL <- 'select * from r_tbl'
dumyTbl <- dbGetQuery(conn, selectDummySQL)

#update
updateSQL <- "update r_tbl
              set USERNAME = '관리자'
              where id = 'jslim'"
updateDummySQL <- dbSendUpdate(conn, updateSQL)
dumyTbl <- dbGetQuery(conn, selectDummySQL)


deleteSQL <- "delete from r_tbl where id='jslim'"
deleteDummySQL <- dbSendUpdate(conn, deleteSQL)

dumyTbl <- dbGetQuery(conn, selectDummySQL)

dbSendUpdate(conn, "drop table r_tbl")
dumyTbl <- dbGetQuery(conn, selectDummySQL)

selectDummySQL <- 'select * 
                   from employee '
dumyTbl <- dbGetQuery(conn, selectDummySQL)
str(dumyTbl)

library(reshape2)
dumyTbl$gender <- ifelse(substr(dumyTbl$EMP_NO, 8, 8)=='1','M', ifelse(substr(dumyTbl$EMP_NO, 8, 8)=='2', 'F','NA'))
dumyTblmean <- tapply(dumyTbl$SALARY, dumyTbl$gender, mean, na.rm = T)
dumyTblmean3 <- melt(dumyTblmean)
ggplot(dumyTblmean3, aes(x=Var1, y=value, fill=Var1)) + geom_bar(stat='identity') + labs(x='gender', y='salary_mean', fill='gender')

#DB 종료
dbDisconnect(conn)


#비정형 데이터 처리(텍스트 마이닝)
#단어 빈도를 나타내는 시각화(wordcloud, koNLP, tm)

install.packages(c("hash", "tau", "Sejong", 
                   "RSQLite", "devtools", "bit", 
                   "rex", "lazyeval", "htmlwidgets", 
                   "crosstalk", "promises", "later", 
                   "sessioninfo", "xopen", "bit64", 
                   "blob", "DBI", "memoise", "plogr", 
                   "covr", "DT", "rcmdcheck", "rversions"), 
                 type = "binary")  

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', 
                        upgrade = "never", 
                        INSTALL_opts=c("--no-multiarch"))

#감성분석
#service_data_facebook_bigdata.txt
facebook <- file(file.choose(), encoding='UTF-8')
facebook_read <- readLines(facebook)
head(facebook_read)
str(facebook_read)

# 2. 전처리(정규표현식을 필요로 한다.)
# 문장부호 제거[[:punct:]]하는 정규표현식을 활용한다면?
# 특수문자 제거 [[:cntrl:]],  숫자 제거[0-9], \\d+
#\\w+, \\s+, \n, \t 
#gsub함수를 이용해서 
s <- gsub('[[:punct:]]','',facebook_read)
s[1]
w <-gsub('[[:cntrl:]]', '',s)
w[3]
q <- gsub('\\d+','',w)
q[1]
q <- tolower(q)

head(facebook_read, 1)
wordList <- str_split(q, '\\s+') # 뛰어쓰기 기준 단어로 쪼개기
library(stringr)
wordVec <- unlist(wordList)

#제공되는 단어사전으로부터 파일을 읽어오자
positive_dic <- file(file.choose(), encoding = 'UTF-8')
pDIc <- readLines(positive_dic)
head(pDIc)
str(pDIc)
negative_dic <- file(file.choose(), encoding="UTF-8")
nDIc <- readLines(negative_dic)
head(nDIc)
str(pDIc)

pDic <- c(pDIc, '긍정의 씨앗')
nDic <- c(nDic, '부정의 씨앗')

#분석을 위한 함수 정의
#분석된 단어(Wordvec) VS 사전 단어에 매치가 되는지를 검사
# match()

#사전에 등록된 단어 추출을 한다면?
pMatch <- match(wordVec, pDic)
nMatch <- match(wordVec, nDic)

pMatch <- !is.na(pMatch)
nMatch <- !is.na(nMatch)

scores <- sum(pMatch)-sum(nMatch)
scoresDF <- data.frame(score=scores, text=wordVec)

# 이 함수를 정의하세요

library(stringr)
library(plyr)
?laply

resultS <- function(words , positive , negative) {
  scores = laply(words, function(words, positive, negative) {
    pMatch = match(words, positive) 
    nMatch = match(words, negative)
    
    pMatch = !is.na(pMatch) 
    nMatch = !is.na(nMatch)
    
    score = sum(pMatch) - sum(nMatch) 
    return(score)
  }, positive, negative)
  
  scores.df = data.frame(score=scores , text=words)
  return(scores.df)
}


resultTbl <- resultS(wordVec, pDic, nDic)
head(resultTbl)

resultTbl$text
resultTbl$score
resultTbl$remark[resultTbl$score>=1] <- '긍정'
resultTbl$remark[resultTbl$score==0] <- '중립'
resultTbl$remark[resultTbl$score<0] <- '부정'

pieResult <- table(resultTbl$remark)
pie(pieResult, labels=names(pieResult), col = rainbow(3), radius = 1.0)

