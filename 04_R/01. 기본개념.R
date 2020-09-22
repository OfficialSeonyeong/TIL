letters    # a-z 소문자 알파벳
month.abb  # Jan-Dec 
month.name  # January-December
?print   # Help 이용하여 쓰임새 확인

#package란? 함수 + 데이터셋
install.packages("stringr")
library(stringr)

.libPaths()
library()
#디버깅, print(), paste(), sprintf(), cat()
print("섭이와 함께하는 기초 R 실습")

#sprintf()
# %d 정수값  %f 실수값  %s 문자값 

sprintf("%d", 123)   # "123"
sprintf("Number : %d", 100)  # "Number : 100"
sprintf("Number : %d, String : %s", 100,"jslim")  # "Number : 100, String : jslim"

sprintf("%.2f", 123.456)  # "123.46" : 소수점 두자리 반올림
sprintf("%5d", 123)    # "  123" : 5자리 만들어 출력
sprintf("%5d", 12345)  # "12345"
sprintf("%5d", 123456)  # "123456" : 5자리 넘으면 그대로 출력

# cat() = print()

print('섭섭이')
print('네 이놈')
name <- 'jslim' ;
name

myFunc2 <-function(){
  total <-0
  for (i in 1:10){
    total <-total +i
    print(i)
  }
  return(total)
}


myFunc2()


#변수(알파벳, 숫자, _, .(단, 첫 글자는 반드시 문자 또는 .))
#단일형 : vector, matrix, array
#복수형 : list, data.frame

#Vector == python에서는 Vector를 list 타입으로 취급한다.
#c()
#1:10

sample_vec <- c(1,2,3,4,5)

sum(sample_vec)/length(sample_vec)
mean(sample_vec)

class(sample_vec)  # "numeric"
typeof(sample_vec)  # "double"
mode(sample_vec)  # "numeric"

x <- 1:10
y <- x^2

plot(x,y)


boolean_vec <- c(T,F,T,F)
str(boolean_vec)  # logi [1:4] TRUE FALSE TRUE FALSE
class(boolean_vec)  # "logical"
typeof(boolean_vec)  # "logical"

#변수의 타입을 체크할 때 str(), class(), typeof(), mode()

string_vec <-c('임정섭','박수진','임은결','임재원')

sample_na <-NA #NULL은 값으로 생각한다.
is.na(sample_na) #TRUE

sample_null <- NULL
is.null(sample_null) #TRUE

over_vec <- c(1,2,3, c(4,5,6)) # 1 2 3 4 5 6

#start:end
seq_vec <- 1:10

#rep(),seq()
rep(1:10, 5)  # 1-10을 5번 반복
rep(1:10, each=5) # 1-10 각자 5번 반복(1,1,1,1,1,2,2...)

#seq(from, to, by)
seq(2, 10, 2) #  2  4  6  8 10
seq(1, 10, length.out = 5) # 1.00  3.25  5.50  7.75 10.00

seq_vec02 <- seq(1,100,by=3)
length(seq_vec02) # 34

#indexing []
seq_vec02[30] # 30번째 값
seq_vec02[1:10] #1-10번째까지 값
seq_vec02[length(seq_vec02)-4] 

#인덱싱에서 조건식을 활용할 수 있다.
# AND = &, OR = |

#30이하인 데이터만 출력하려면?
seq_vec02[seq_vec02<=30]

#10이상 30이하인 데이터만 출력하려면?
seq_vec02[seq_vec02<=30 & seq_vec02 >=10]

#0이상이거나 30이하인 데이터만 출력하려면?
seq_vec02[seq_vec02>=10 | seq_vec02 <=30]

#인덱스가 홀수인 데이터만 출력하려면?
seq_vec02_odd <- seq_vec02[seq(1,length(seq_vec02),2)]
seq_vec02_odd

#round() 반올림
round_vc<- c(10.234,11.3456)
round(round_vc,-1) # 10 10 : 소수점 첫째자리에서 반올림 

data_x <- c(1,2,3)
cols <- c('lim','park','cho')

# names() 
names(data_x) <- cols
data_x

names(data_x)  # "lim"  "park" "cho" 
names(data_x)[1:2] # "lim"  "park"

data_x[c("lim","park")]
data_x[c('lim')]

#Vector Indexing(인덱스는 1)
# 벡터 내의 데이터 접근 방법
index_vec <-c(1,3,5,7,9)
index_vec[2]
index_vec[length(index_vec):3]
index_vec[c(1,3)]

# 특정요소만을 제외한다면
index_vec[-1]
index_vec[c(-1,-5)]

#길이
length(index_vec)
nrow(index_vec) #프레임 형식에서 로우 개수
NROW(index_vec) #2차원에서의 로우 개수

# %in% :  연산자 벡터안에 내가 원하는 연산자가 있냐 없냐

bool <- 'a' %in% c("A",'b','c')
#setdiff(),union(), intersect()
setdiff(c('a','b','c'),c('a','b')) # "c"
union(c('a','b','c'),c('a','b'))
intersect(c('a','b','c'),c('a','b'))

#집합간의 비교 setequal()
setequal(c('a','b','c'),c('a','b'))  # FALSE
setequal(c('a','b','c'),c('a','b','c'))  # TRUE

#100에서 200으로 구성된 벡터 sampleVec를 생성한 후 각 문제를 수행하는 코드 작성
SampleVec <- c(100:200)

#1번)10번째 값
SampleVec[10]

#2.끝에서 10개
tail(SampleVec,10)

#3. 홀수
SampleVec[SampleVec%%2==1]

#4. 앞에서 20개 잘라내고  samplevec.head변수에 저장 출력
Samplevec.head <- SampleVec[1:20]
head(SampleVec,20)

#5.3의배수
SampleVec[SampleVec%%3==0]

#6.samplevec.head변수에서 5번째 값을 제외하고 출력
Samplevec.head[-5]

#7. 변수에서 5,7,9 값 제외  출력
Samplevec.head[c(-5,-7,-9)]

#월별 결석생 수 통계가 다음과 같을때 이 자료를 absent 벡터에 저장
absent<-c(10,8,14,15,9,10,15,12,9,7,8,7)

names(absent) <- month.name
absent

absent['May']

absent[c(7,9)]

sum(absent[1:6])
 
mean(absent[7:12])

#논리형벡터, 문자형벡터
c(T,F) | c(TRUE,TRUE) # TRUE TRUE
!c(T,F) # FALSE  TRUE
xor(c(T,F) , c(TRUE,TRUE)) #FALSE  TRUE : 같으면 F 틀리면 T
(randomNum <-runif(3)) #0~1사이의 난수 랜덤으로
(0.25 <= randomNum) & (randomNum<=0.75) # TRUE, FALSE로 출력

any(randomNum>0.8) #요소 중에 하나라도 크면 T
all(randomNum<0.8) #요소 모두 크면 T

c("a","b","c","d","e")
strVec<-c("H","S","T","N","o")

strVec[3]>strVec[5] # TRUE : 알파벳 순서대로

#paste()
paste("May I","help you ?")  # "May I help you ?"
print("May I","help you ?")  # 오류 발생
?month.abb
month.abb
paste(month.abb, 1:12)  # "Jan 1"  "Feb 2"  "Mar 3" ...
paste(month.abb, 1:12,c("st","nd","rd",rep("th",9)))
paste("/usr","local","bin",sep="..")  # "/usr..local..bin"

(seqVec <- paste(1:4))
typeof(seqVec)  # "character"

paste(seqVec, collapse = "jslim") # "1jslim2jslim3jslim4"
paste(seqVec, collapse = "")  # "1234"


# 정규표현식 함수()
#grep(pattern, data, ignore.case, value) : 원래는 인덱스, value=T이면 값
grepValue <- c("gender","name","age","hEIght","wEIght","tall","EIght")

#문1) 'ei'로 시작되는 요소가 있는지
grep('^ei', grepValue, ignore.case = T, value=T) # "EIght"
grep('^ei', grepValue, ignore.case = T) # 7

#문2) 'ei'문자열을 포함하는 요소가 있는지
grep('ei',grepValue,value = T) # character(0) : ignore.case가 대소문자 구별

grepTxt <- c("Bigdata","Bigdata","bigdata","Data","dataMining","textMining","campus6","campus5")
grepTxt

# 문) b로 시작하는 하나이상의 문자 패턴을 확인하고 싶다면?
grep('^b+',grepTxt,value=T, ignore.case = T)


#gsub(pattern, replacement, data, ignore.case)
#sub()
# 문자열에서 문자를 바꾸는 기능
grepTxt
gsub("big","bigger",grepTxt)
gsub("big","bigger",grepTxt, ignore.case = T)

gsub("[[:digit:]]",'',grepTxt)
sub("[[:digit:]]",'',grepTxt)

nchar(grepTxt) # 집합 내 각각의 길이
str_length(grepTxt) # 집합 내 각각의 길이

# strsplit(data, split) : 문자열을 쪼개는 함수
# substr(data, start, stop)
greetingMsg <-"Hi, Big data is very important"
strsplit(greetingMsg, " ")
substr(greetingMsg, 5, 12)
class(strsplit(greetingMsg, " "))

str_extract("abc123def456","[a-z]{3}")   # "abc"
str_extract_all("abc123def456","[a-zA-Z]{3}")  # "abc" "def"

stringDumy <-"임정섭jslim46섭섭해seop34유관순임꺽정홍길동"
str_extract_all(stringDumy,"[a-z]{3}")  # "jsl" "seo"
str_extract_all(stringDumy,"[a-z]{3,}") # "jslim" "seop" 
str_extract_all(stringDumy,"[a-z]{3,4}")  # "jsli" "seop"

str_extract_all(stringDumy,"[가-힣]{3,}") 
# "임정섭"  "섭섭해" "유관순임꺽정홍길동"
str_extract_all(stringDumy,"[[:digit:]]{2}")  
# "46" "34"
str_extract_all(stringDumy,"[^[:digit:]]") 
# "임" "정" "섭" "j"  "s"  "l" ...
str_extract_all(stringDumy,"[가-힣]{3}")

escapeNum<- str_extract_all(stringDumy,"[^[:digit:]]{3,}")  
# "임정섭jslim"        "섭섭해seop"       "유관순임꺽정홍길동"
names<-str_extract_all(escapeNum[[1]], "[^a-z]{3,}")


#단어와 숫자에 관련된 메타문자
#단어(word) :\\w
#숫자(digit) :\\d
#엔터키,탭키 ; \n,\t
ssn <-"730910-1234567"
ssn


str_extract_all(ssn,"[0-9]{6}-[1-4][0-9]{6}")
str_extract_all(ssn,"\\d{6}-[1-4]\\d{6}")

email <-"jslim9413@naver.com"

str_extract_all(email,"\\w{4,}@[a-z]\\w{3,}.[a-z]\\w{2,}")

stringLength <-"우리는 달려간다~이상한 나라로~섭섭이가 잡혀있는 마왕의 소굴로"
length(stringLength) # 1
str_length(stringLength) # 34

#문자열 위치
str_locate_all(stringLength, '섭섭')
class(str_locate_all(stringLength, '섭섭')) # "list"

#특수문자 제외
num <-"$123,466"
tmp <-str_replace_all(num,"\\$|\\,",'')
class(tmp) # "character"

#형변환
#as.numeric()
as.numeric(tmp)
str(as.numeric(tmp)) # num
