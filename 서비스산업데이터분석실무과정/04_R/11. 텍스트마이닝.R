#텍스트 마이닝
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_121')
library(rJava)
library(KoNLP)
install.packages('KoNLP')
library(tm)
library(RColorBrewer)
library(wordcloud)


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

# 명사, 형용사 등을 추출한 사전
useSejongDic()

text <- "최근 이슈가 되고 있는 빅데이터에 대한 이해와 활용을 위해 데이터 과학(Data Science)의 측면에서 접근한다.
빅데이터는 통계학을 비롯한 경영, IT 등의 다양한 분야들이 서로 결합되어 있고 그 정의가 다양하지만, 본 강의는 데이터 분석을
기반으로 하는 과학적 의사결정의 관점에서 바라보고자 한다. 빅데이터에 대한 이해를 위해 실제 사례들을 살펴보고,
데이터를 통해 의사결정에 유용한 정보 및 지식을 찾는 과정을 이해한다. 나아가 빅데이터 분석에서 필수적으로 언급되고 있는
R 통계프로그램을 소개하고 이를 분석에 활용할 수 있게 한다."

nouns <- extractNoun(text)

#nchar()
nouns <- nouns[nchar(nouns)>=2]

#빈도표
wFreq <- table(nouns)
wFreq

nouns <- gsub('빅데이터.*','빅데이터', nouns) # '빅데이터'로 시작하는 것 통합
wFreq <- table(nouns)
names(wFreq)
pal <- brewer.pal(6, 'Accent')
wordcloud(names(wFreq), freq = wFreq, min.freq = 1, random.order = F, colors = pal)



#텍스트 마이닝 단계
#text -> corpus(말뭉치) -> TDM -> TM 분석 -> Matrix or DataFrame으로 변환 -> wordcloud
#service_data_i_love_mom.txt
lovemom <- readLines(file.choose(), encoding = 'UTF-8')

corpus <- VCorpus(VectorSource(lovemom))

#TermDocumentMatrix : 행이 단어, 열이 문서가 되는 행렬
TDM <- TermDocumentMatrix(corpus)  #단어의 분포를 보는 것

#tm_map(TDM, function) : 공백, 숫자, 특수 문자 등을 제거하는 함수를 불러오면 적용
corpus_map <- tm_map(corpus, stripWhitespace)  #공백 지우기
corpus_map[[1]]$content
corpus_map <- tm_map(corpus_map, removeNumbers) #숫자 지우기
corpus_map <- tm_map(corpus_map, removePunctuation)
corpus_map[[9]]$content

# corpus_tm2 <- TermDocumentMatrix(corpus, control = list(stripWhitespace = T, removeNumbers = T, removePunctuation = T))

#stopword 처리 방법
stopwords('en')
stopwords2 <- stopwords('en')
stopwords2 <- c(stopwords('en'), 'and', 'not', 'but')
lovemom

#불용어 제거 Document TermMatrix -> 다시 행렬도 변환
corpus_map <- tm_map(corpus_map, removeWords, stopwords2)

TDM <- TermDocumentMatrix(corpus_map)


#빈도수:  이상, 이하
findFreqTerms(TDM, 2, 4)

#빈도표
matrix <- as.matrix(TDM)
rownames(TDM)
rowSums(matrix)
wFreq <- sort(rowSums(matrix), decreasing = TRUE)
pal <- brewer.pal(6, 'Accent')
wordcloud(names(wFreq), freq = wFreq, min.freq = 1, random.order = F, colors = pal)
