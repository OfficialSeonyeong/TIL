# 1. 행렬 (matrix)
# matrix(), rbind(), cbind()

(x <- matrix(1:4, 2, 2)) # 1부터 4, 2*2 행렬
colSums(x) # 3 7
rowSums(x) # 4 6

#apply(data, margin, function) #margin은 1이면 row, 2이면 col
sumApply <- apply(x,2,sum) # colSums(x)와 동일
class(sumApply) #integer

apply(x,1,sum)
apply(x,1, max)
apply(x,2,mean)


x <- c(1,2,3,4,5,6,7,8,9)
mat <- matrix(x)
class(mat) # matrix, array
matrix(x, nrow = 3)
matrix(x, ncol = 3)
matrix(x, nrow=3, ncol = 3, byrow = T) #byrow 순서 오른쪽으로
matrix(0, nrow = 2, ncol = 3)
matD <- diag(1,3) # 정사각형으로 대각선에만 첫번째 인자 값 출력 
class(matD) # matrix, array

x <- matrix(c(1,2,3,4,5,6),2,3)
# 전치행렬 : 행과 열이 반대로 변경  t()
t(x)

# 데이터에 대한 접근 ([행 인덱스, 열 인덱스])
x <- matrix(x,3,3)

row(x) #행의 인덱스로 값 입력
col(x) #열의 인덱스로 값 입력

x

x[3,3]
tmp <- x[c(1,2),c(2)]
class(tmp) #벡터
y <- x[-3,]
class(y)
x[-1,c(1,3)]
x[c(FALSE,TRUE,TRUE), c(TRUE, FALSE, TRUE)]

tmp <- x[,c(-1,-3)]
class(tmp)
x1 <- c(1,2,3)
x2 <- c(4,5,6)

tmpmatrix <- cbind(x1, x2)
class(tmpmatrix) #matrix, array

tmpmatrix <- rbind(1:3, c(4,5,6), 7:9)

# matrix()함수에 dimnames 옵션을 활용하면 행이름, 열이름을 지정할 수 있고,이를 활용하여 인덱싱이 가능하다.

nameMatrix <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3, 
                     dimnames = list(c("idx1","idx2","idx3"),c("feature1","feature2","feature3")))
nameMatrix[-'idx2',]
nameMatrix['idx2',c('feature1','feature2')]
nameMatrix[,'feature2']
nameMatrix - 2

iris
str(iris)

head(iris)
tail(iris)

#apply()함수를 적용해서 컬럼의 요약정보를 확인해보세요
head(apply(iris[2], 1, sum))
apply(iris[, 1:4], 2, sum)
apply(iris[, 1:4], 2, mean)
apply(iris[, 1:4], 2, max)

colMeans(iris[, 1:4])
summary(iris)

#특정행 또는 열을 기준으로 정렬
(x <- matrix(runif(4),2,2))

#order()
order(x[,1]) # index 값으로 출력
x[order(x[,1]),] 
order(x[,1], decreasing = T)
x[order(x[,1],decreasing = T),] #내림차순


# 2. 배열(array)
#array(), dim()

m <- matrix(1:12, ncol = 4)
class(m)
arr <- array(1:12, dim = c(3,4,3)) 3*4*3 배열
class(arr) # array

#배열에 대한 접근
#행렬과 유사한 방식으로 각 요소에 접근할 수 있다.
arr[1,2,2]
arr[2,4,3]

arrD <- array(1:16, dim=c(2,4,2))

apply(arrD, c(1,2), mean) #행과 열 기준

iris3
apply(iris3, c(1,3), sum) 
apply(iris3, c(2,1), mean)


# 3. list 
# 파이썬에서는 dictionary
# (키, 값)형태의 데이터를 담는 연관 배열이다.
# list()
# apply -> lapply() :리스트로 리턴(키, 값), sapply() :리스트로 리턴(값)

list <- list()

exlist <- list(name="jslim", height =177)
exlist$name
exlist$height

exlist <- list(name="jslim", height =c(1,3,5))
simpleList <- list(1:4, rep(3:5), "cat")
exlist[[2]]

newList <-c(list(1,2,simpleList),c(3,4))

#list 안에 중첩
Mystery <- list(a=list(c(1,2,3)), b=list(c(1,2,3,4)))
Mystery$a[1]
Mystery$b[[1]][3]

member <- list(name = 'jslim', address = 'seoul', tel = '010-9643-3463', age=48, married= T)
class(member)
member$name
member[[1]][1]
member[1]
member <- list(name = c('섭섭해','임섭순'), address = c('seoul','gwangu'), age=c(48,29), gender=c('여자','남자'))
member$name
member$name[2]
member$age[1] <- 38
member$age
member$id <- c('jslim','admin')
member
member$id <- NULL
member
member$address[2] <- 'seoul'
member
member[[1]]

# 서로 다른 자료구조(vector, matrix, array)
multiList <- list(
  one = c('one','two','three'),
  second = matrix(1:9, nrow=3),
  third = array(1:12,dim=c(2,3,2))
)

multiList$one[1]
multiList[[2]][c(1,2),c(2,3)]
multiList$third[1,2,2]

x <- list(1:5)
x
class(x)
vec <- unlist(x)
class(vec)


matrixList <- list(
  row1 = list(1,2,3),
  row2 = list(10,20,30),
  row3 = list(100,200,300))


#do.call(func, data) #bind 할 수 있는 함수 만을 넣어서 매트릭스로 만드는것 
row_mat <- do.call(rbind, matrixList)
col_mat <- do.call(cbind, matrixList)
class(col_mat)

listLength <- list(1:5, list("This is My First time R",c(T,F,T)))
length(listLength) # 2
library(stringr)
str_length(listLength[[1]]) # 1 1 1 1 1
str_length(listLength[[2]][[2]]) # 4 5 4
length(listLength[[1]]) # 5
length(c(T,T,F)) # 3

#list 처리 함수
# lapply(): list처리 후 list 반환, key=value
# sapply() : list처리, value

x <- list(1:5)
y <- list(6:10)

w <- sapply(c(x,y), FUN = max)
class(w) # integer
w <- lapply(c(x,y), FUN = sum)
class(w) #list

data(iris)
iris
hi <- lapply(iris[,1:4],mean)

vec2 <-unlist(hi)
mat2 <- matrix(vec2, ncol=4, byrow = T)
df <- as.data.frame(mat2)
names(df) <-names(iris[,1:4])


# unlist() 리스트를 벡터로 변환
# matirx() 벡터를 행렬로 변환
# as.data.frame() 행렬을 데이터 프레임으로 변환
# names() 사용해서 리스트로부터 변수명을 얻어와 데이터 프레임의 각 열에 이름부여 

vec <- unlist(iris)
class(vec)
vec_back <- matrix(vec, ncol = 4)
iris_df <- as.data.frame(vec_back)
class(iris_df)
names(iris)

names(iris_df) <-names(iris[,1:4])
iris
data.frame(do.call(rbind,lapply(iris[,1:4], mean)))
class(iris)



# 4. data.frame
#행렬과 비슷, 다만 다양한 변수(관측값이 숫자, 문자, 범주 등)
#각 열에 대한 접근은 $ 이용하여 접근할 수 있다.
#인덱스를 활용하는 방법도 있다.

x <- c(1,3,5,7,9)
y <- c(2,4,6,8,10)
exampleDF <- data.frame(x,y)
str(exampleDF)

exampleDF[-1,]
exampleDF[,c('x')]
exampleDF

#colnames(), rownames()
colnames(exampleDF) <- c('value01','value02')

colist <-names(exampleDF)
str(colist)

# 문자열 벡터 + 숫자형 벡터 +문자열벡터 = data.frame 가능

stuName <- c('조동균','한소연','박수진','최가은')
subject.eng <- c(100, 100,100,70)
subject.math <- c(80, 75,100,100)
subject.kor <- c(100, 100,100,100)
score.grade <- c("A","B","A","C")


school_1 <- data.frame(stuName,subject.eng,subject.kor,subject.math,score.grade)

colnames(school_1) <- c('이름','영어','국어','수학','성적')

#행의 갯수
length(school_1) # 5
nrow(school_1) # 4
ncol(school_1) # 5

#열을 추가(학생의 학번의 열)
학번 <-c(1,2,3,4)
newschool <- cbind(school_1,학번)

#더미 데이터를 이용하여 행 추가
x <-c('윤선영',80,90,99,'A',5)
third <- rbind(newschool, x)

str(third)


apply(third[3],2, mean)
third$학번[3]
class(third)
apply(third[, 2:4], 2, mean)
str(third)
third$영어 <- as.numeric(third$영어)
lapply(third[1:2,3:4], mean)
apply(third[],2,max)



#with(data, expression) 값을 확인하는 용도
#within(data, expression) 값을 수정해서 반영하는 용도
data(iris)

mean(iris$Sepal.Length)
mean(iris$Sepal.Width)
with(iris, {print(mean(Sepal.Length)) 
            print(mean(Sepal.Width))})

x <-data.frame(val=c(1,2,3,4,NA,5,NA))
x<-within(x, { val <- ifelse(is.na(val), mean(val, na.rm=T),val)})

