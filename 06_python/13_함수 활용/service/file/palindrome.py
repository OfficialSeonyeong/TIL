# 회문(palindrome)

# 단어를 거꾸로 읽어도 제대로 읽는 것과 같은 단어 또는 문장
# level, sos, rotator, 'nurses run'
# 기준점이 필요하다. 첫 글자와 마지막 글자를 비교
# 반복문
# //

# str = 'jslim9413'
# idx = len(str)// 2
# print(str[idx])

# 특정 단어가 들어 왔을 때 이 단어가 회문인지 아닌지 검사하는 함수
def isPalindrome() :
    word = input('단어를 입력하세요: ')
    isFlag = True
    for i in range(len(word)//2) :
        if word[i] != word[-i-1] :
            isFlag = False
            break
    return isFlag

def reversedPalindrome() :
    word = input('단어를 입력하세요: ')
    print(word == word[ : : -1])
    print(reversed(word))
    print(list(reversed(word)))
    if list(word) == list(reversed(word)):
        print(True)

# def palindrome() :
#     with open('./word/palindrome_words.txt', 'r', encoding='utf-8') as file:
#         # lines = file.readlines()
#         for word in file:
#             for i in range(len(word)//2):
#                 if word[i] == word[-1-i]:
#                     print(word.strip('\n'))

def palindrome() :
    with open('./word/palindrome_words.txt', 'r', encoding='utf-8') as file:
        # lines = file.readlines()
        print(type(file))
        for word in file:
            word = word.strip('\n')
            if word == word[::-1] :
                print(word)

# N-gram
# Hello 2개 문자 단위로 추출한다면
# he/ el/ ll/ lo

# 2-gram
# text = 'hello'
# for i in range(len(text)-1) :
#     print(text[i], text[i+1], sep=' ')

# 공백을 기준으로 문자열을 분리한다면 타입은 리스트가 됩니다.
# 리스트 2-gram 현재 문자와 다음 문자를 출력하고 싶다면
text = 'this is python script'
text = text.split(' ')
for i in range(len(text)-1):
    print(text[i],text[i+1])

# zip()
number = [1,2,3,4]
name = ['a', 'b', 'c', 'd']
number_name = dict(zip(number, name))
print(number_name)

dic ={}
for number, name in zip(number, name) :
    dic[number] = name

a = 'lim'
b = [1,2,3]
c = ('one','two','three')
print(list(zip(a,b,c)))
print(dict(zip(a,b)))
print(set(zip(a,b,c)))

# input 함수를 이용해서 문자열이 입력되면
#예시) 'Python is a programming language that helps you work quickly'
# gram 할 숫자도 input 함수를 이용하여 입력받아
# 예시) 3
# 입력된 숫자에 해당하는 단어 단어 n-gram 을 튜플로 출력
# 단) 입력된 문자열의 단어 개수가 입력된 정수 미만이라면 예외를 발생시키고 처리한다.

def makingngram() :
    text = input('문자열 입력: ')
    num = int(input('숫자 입력: '))
    text = text.split(' ')
    try :
        if (len(text) < num):
            raise Exception('문장의 길이가 더 길어야합니다')
        else :
            for i in range(len(text) - num +1):
                print(text[i:i+num])
    except Exception as e:
        print(e)






