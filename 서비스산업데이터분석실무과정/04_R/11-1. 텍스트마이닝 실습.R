# ---[실습]
# ---service_data_president_text_mining.txt
president <- readLines(file.choose())
View(president)

p_nouns2 <- extractNoun(president)

corpus2 <- VCorpus(VectorSource(p_nouns2))

corpus2 <- tm_map(corpus2, removeNumbers)
corpus2 <- tm_map(corpus2, removePunctuation)

nounsWord <- function(doc){
  d <- as.charactor(doc)
  extractNoun(d)
}

TDM <- TermDocumentMatrix(corpus2, control = list(tokensize = nounsWord))
matrix <- as.matrix(TDM)
rownames(matrix)
stopword <-  c('만들겟습니다','날아가겟습니다','해결하겟습니다')
TDM <- TermDocumentMatrix(corpus2, control = list(tokensize = nounsWord, wordLengths = c(2,3),
                                                  stopwords=stopword))
class(TDM)
matrix <- as.matrix(TDM)
rownames(matrix)
wFreq <- sort(rowSums(matrix), decreasing = T)
wordcloud(names(wFreq), freq = wFreq, min.freq = 1, random.order = F, colors = pal)



p_nouns <- extractNoun(president)
p_nouns <- unlist(p_nouns)
p_nouns <- p_nouns[nchar(p_nouns)>=2]
corpus3 <- VCorpus(VectorSource(p_nouns))
TDM <- TermDocumentMatrix(corpus3, control = list(tokenisize=extractNoun))
matrix <- as.matrix(TDM)
p_nouns <- gsub('대통령.*','대통령', p_nouns)
corpus2 <- VCorpus(VectorSource(p_nouns))

p_stopwords <- c('대통령', '도', '은','과','에서는','서', '하겟습니다','문재','해서','에도')


p_Freq <- table(p_nouns)



pal <- brewer.pal(6, 'Accent')
wordcloud(names(p_Freq), freq = p_Freq, min.freq = 1, random.order = F, colors = pal)
class(p_nouns)

p_map <- tm_map(p_nouns, removeWords, stopwords3)
TDM <- TermDocumentMatrix(corpus_map)


--------------------------------------------------------------------------------------------------------

movie <- read.csv(file.choose())
str(movie)
cor <- VCorpus(VectorSource(movie$Description))


corpus_map <- tm_map(cor, stripWhitespace)  #공백 지우기
corpus_map <- tm_map(corpus_map, removeNumbers) #숫자 지우기
corpus_map <- tm_map(corpus_map, removePunctuation)
corpus_map <- tm_map(corpus_map, content_transformer(tolower))
corpus_map <- tm_map(corpus_map, removeWords, stopwords('en'))

movie_tdm <- TermDocumentMatrix(corpus_map)


movie_new <- as.matrix(movie_tdm)

rownames(movie_new)
rowSums(movie_new)

mFreq <- sort(rowSums(movie_new), decreasing = TRUE)

wordcloud(names(mFreq), freq = mFreq, min.freq = 5, random.order = F, colors = pal)

movieDF <- data.frame(word= names(mFreq), freq=mFreq)

wordcloud2(movieDF, size=1)
# 워드클라우드 , 단어빈도 그래프
barplot(mFreq)
