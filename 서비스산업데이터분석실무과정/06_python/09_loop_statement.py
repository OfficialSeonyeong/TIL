# 파이썬 반복문

# for, while
# for idx in <collection> :
# for idx in range(start, stop, step)

for idx in range(2, 12, 2) :   # 12는 포함하지 않음
    print('idx - ', idx)


scores = []
for idx in range(5) :
    scores.append(int(input('성적을 입력하세요: ')))
print(scores)

for idx in scores :
    print(idx)

for idx in range(len(scores)) :
    print(scores[idx], '\t', end='!')   # 1 	!2 	!3 	!4 	!5 	!


# 입력받은 성적의 총합과 평균을 구하세요.
sum_scores = 0
for idx in range(len(scores)) :
    sum_scores = sum_scores + scores[idx]
print(sum_scores/len(scores))
print(sum_scores)

# 정답
for i in scores:
    sum_scores += i
print(' 총합은 {}, 평균은 {}'.format(sum_scores, sum_scores/len(scores)))

# 리스트 자료형에 들어있는 개수를 세어보자
cnt_list = [1,2,3,3,3,2,2,4,5,6,6,5,4,3,3,4,2,"",""]
repeat = {}
for i in cnt_list:
    if i in repeat.keys():
        repeat[i] += 1

    else:
        repeat[i]=0
        repeat[i] += 1
print(repeat)

for i in cnt_list:
    if i in repeat:
        repeat[i] += 1

    else:
        repeat[i] = 1
print(repeat)


import random
cnt_list = [random.randint(1,5) for _ in range(100)]
print(cnt_list)


word_vec = ['Corona','Corona','Corona','love', 'word','big','bigdata', 'bigdata','bigdata','bigdata','love']
wordcloud ={}

for i in word_vec:
    if i in wordcloud:
        wordcloud[i] += 1
    else :
        wordcloud[i] = 1
print(wordcloud)


# 구구단의 3단만 출력
# 홀수 번째만 출력
dan = 3
for idx in range(1,10,2):
    print(dan, '*', idx, '=', 3*idx)


mySum=0
myList = [(1,2),(3,4),(5,6)]
for (key, value) in myList:
    mySum +=key+value
print(mySum)

temp_list = [1,2,3,4,5,6,7,8,9]
score01 = [idx *3 for idx in temp_list if idx %2 ==0]
score02 = [idx *3 for idx in temp_list]
print(score01, score02)

# 올림픽은 4년 개최된다.
# 2000 ~ 2050년까지 올림픽이 개최되는 년도를 출력
for i in range(2000, 2051,4):
    print(i)

# 아래 리스트에서 20보다 작은 3의 배수를 출력하라
list = [12,21,12,14,30,38, 34,18]
list_11 = [i for i in list if i < 20 and i % 3 == 0 ]
print(list_11)

for i in list:
    if (i < 20) and (i % 3 == 0) :
        print(i)


# 아래 리스트에서 세글자 이상의 문자를 출력
list = ['I','am','study','python','language','!']
for i in list:
    if len(i) >= 3:
        print(i)
list22 = [i for i in list if len(i)>=3]
print('list22', list22)


# 아래 리스트에서 대문자만 화면에 출력하라
list = ['I','A','study','PYTHON','JSLIM','!']
for i in list:
    if i.isupper() :
        print(i)


# 아래 리스트에서 첫 글자를 대문자로 변경하여 출력
list = ['dog','cat','pig','parrot','house']
for i in list:
    print(i.capitalize())


# 아래 리스트에서 확장자를 제거하고 파일 이름만 출력
list = ['greeting.py', 'ex01.py','intro.hwp','bigdata.doc']
for i in list:
    print(i.split('.')[0])


word ='Handsome'
for idx in word:
    print('word -', idx, end=',')   # word - H,word - a,word - n,word - d,word - s,word - o,word - m,word - e,



my_dict = {'name':'jslim', 'age':48, 'city':'Seoul'}
cnt = 1
for key in my_dict.keys():
    if (cnt == len(my_dict.keys())):
        print(key)
    else:
        print(key, end=',')
    cnt += 1      # name,age,city


fruit_name = 'FineApplE'
# upper()
print(fruit_name.upper())

for name in fruit_name:
    if name.isupper():
        print(name, end='')
    else:
        print(name.upper(), end = '')    # FINEAPPLE


# break, continue
numbers = [14, 3, 6, 17, 34, 25]
for num in numbers :
    if num == 3:
        continue
        print(num)
    else :
        print('Not Found')   # Not Found 만 5번 출력


# 구구단
for i in range(2, 10):
    for x in range(1, 10):
        print(i ,'*',x,'=',i*x)

for i in range(2, 10):
    for x in range(1, 10):
        print(i ,'*',x,'=',i*x)
    if i == 5:
        break   # 5단까지만 출력

string = """저는 파이썬 강의중인 임섭순 입니다.
주소는 광주광역시 입니다.
나이는 숫자에 불과하지만 성인병이 있네요"""

sentences = []
words =[]
# append(), insert(index, value)
for s in string.split('\n'):
    sentences.append(s)
    for w in s.split(' '):
        words.append(w)
print(sentences)
print(words)


# [실습] 분류 정확도
answer = [1, 0, 2, 1, 0]
predict =[1, 0, 2, 0, 0]

cnt=1
level =0

for i in answer:
    if i==predict[cnt-1]:
        level += 1
        cnt += 1
print(level/len(answer)*100, '%')

acc=0
for i in range(len(answer)):
    fit = answer[i] == predict[i]  # True or False
    acc += int(fit) *20
print(acc)


# enumerate: 반복문 사용 시 몇 번째 반복문인지 확인이 필요하다면 인덱스 번호와 컬렉션 요소를 확인할 수 있다.

list = ['SQL','R','TEXT-MINING', 'DATA-MINING', 'PYTHON']
for idx, value in enumerate(list):
    print("{}번째 인덱스이고 값은 {}".format(idx,value))


word_vec = ['Corona','Corona','Corona','love', 'word','big','bigdata', 'bigdata','bigdata','bigdata','love']

freq = {}
for i in word_vec:
    freq[i] = word_vec.count(i)
print(freq)



# While <expression> :
# statement
# 증감식

n=5
while n>0:
    print(n)
    n -= 1

a = ['foo','bar','baz']
while a :
    print(a.pop())


# while 이용하여 1~100까지의 합, 5의 배수의 합, 3의 배수이면서 5의 배수가 아닌 합
sum01 = 0
sum02 = 0
sum03 = 0

while 0<=n<=100:
    n += 1
    sum01 += n
    if n % 5 == 0:
        sum02 += n
    if n % 5 != 0 and n % 3 == 0:
        sum03 += n

print(sum01, sum02, sum03)

cnt = 10
while cnt > 0 :
    if cnt == 11:
        break
    cnt -= 1
else :
    print('while ~ else')