# 문제 1)
# 사용자로부터 하나의 값을 입력받아(input)
# 해당 값에 20을 뺀 값을 출력하라
# 단) 출력 값의 범위는 0 ~255이다
# 예를 들어 결과값이 0보다 작은 값이되는 경우 0을 출력하고
# 255보다 큰 값이 되는 경우 255을 출력해야한다.

num = int(input('숫자입력: '))

if num <0 :
    print('0')
elif 0<num<226:
    print(num-20)
else:
    print('255')

# 문제 2)
# 사용자로부터 입력 받은 시간이 정각인지 판별하라.
# 현재시간 : 02:00
# 현재시간 : 03:10
time = input('time: ')
time_A = time.split(':')
if time_A[1]=='00':
    print('정각입니다.')
else :
    print('정각이 아닙니다.')

# 문제 3)
# 사용자로 입력받은 단어가 아래 fruit 리스트에 포함되어
# 있는지를 확인하라.
# 포함되었다면 "정답입니다"를 아닐 경우 "오답입니다" 출력하라.
fruit_list = ["사과", "포도", "홍시"]
fruit = input('과일을 입력하시오: ')

if fruit in fruit_list :
    print('정답입니다.')
else :
    print('오답입니다.')

# 문제 4)
# 투자 경고 종목 리스트가 있을 때
# 사용자로부터 종목명을 입력 받은 후
# 해당 종목이 투자 경고 종목이라면 '투자 경고 종목입니다'를
# 아니면 "투자 경고 종목이 아닙니다."를 출력하는 프로그램을 작성하라.

warn_investment_list = ["Microsoft", "Google", "Naver", "Kakao", "SAMSUNG", "LG"]
종목명 = input('종목명을 입력하시오: ')
if 종목명 in warn_investment_list:
    print('투자 경고 종목입니다')
else:
    print('투자 경고 종목이 아닙니다.')

# 문제 5)
# 아래와 같이 fruit 딕셔너리가 정의되어 있다.
# 사용자가 입력한 값이 딕셔너리 키 (key) 값에 포함되었다면 "정답입니다"를
# 아닐 경우 "오답입니다" 출력하라.
fruit = {"봄" : "딸기", "여름" : "토마토", "가을" : "사과"}
ind_fruit = input('계절 입력: ')
if ind_fruit in fruit:
    print("정답입니다")
else:
    print("오답입니다")

# 문제 6)
# 사용자로부터 문자 한 개를 입력 받고,
# 소문자일 경우 대문자로,
# 대문자 일 경우, 소문자로 변경해서 출력하라.
# hint -  islower() 함수는 문자의 소문자 여부를 판별합니다.

letter = input('영어 알파벳 입력: ')

if letter.islower() == True :
    print(letter.upper())
else :
    print(letter.lower())

# 문제 7)
# 점수 구간에 해당하는 학점이 아래와 같이 정의되어 있다.
# 81~100 A
# 61~80	 B
# 41~60	 C
# 21~40	 D
# 0~20	 E
# 사용자로부터 score를 입력받아 학점을 출력하라.
score = int(input('점수 입력: '))
if 81<= score <= 100:
    print('A')
elif 61<= score <=80:
    print('B')
elif 41<= score <= 60:
    print('C')
elif 21<= score <= 40:
    print('D')
else :
    print('E')


# 문제 8)
# 사용자로부터 세 개의 숫자를 입력 받은 후
# 가장 큰 숫자를 출력하라.
input number1: 10
input number2: 9
input number3: 20
number1 = int(input('숫자입력: '))
number2 = int(input('숫자입력: '))
number3 = int(input('숫자입력: '))

print(max(number1, number2, number3))



# 문제 9)
# 휴대폰 번호 앞자리에 따라 통신사는 아래와 같이 구분된다. 사용자로부터 휴대전화 번호를 입력 받고, 통신사를 출력하는 프로그램을 작성하라.
# 번호	통신사
# 011	SKT
# 016	KT
# 019	LGU
# 010	알수없음
# 휴대전화 번호 입력: 011-345-1922
phonenumber = input('폰번호: ')
if phonenumber.split('-')[0] == '011':
    print('SKT')
elif phonenumber.split('-')[0] == '016':
    print('KT')
elif phonenumber.split('-')[0] == '019':
    print('LGU')
else:
    print('알수없음')

# 문제 10)
# 주민등록번호 뒷 자리 7자리 중 첫째 자리는 성별을 나타내는데
# 1, 3은 남자 2, 4는 여자를 의미한다.
# 사용자로부터 13자리의 주민등록번호를 입력 받은 후 성별 (남자, 여자)를 출력하는 프로그램을 작성하라.
# >> 주민등록번호: 821010-1635210
birth_no = input('주민등록번호: ')
if birth_no[7] in ('1','3'):
    print('male')
else :
    print('female')

# 문제 11)
# 주민등록번호의 뒷 자리 7자리 중 두번째와 세번째는 지역코드를 의미한다.
# 주민 등록 번호를 입력 받은 후 출생지가 서울인지 아닌지 판단하는 코드를 작성하라
# 지역코드	출생지
# 00 ~ 08	서울
# 09 ~ 12	부산
no = input('주민등록번호: ')
areacode = int(no[7:9])
if 0<= areacode <= 8:
    print('출생지가 서울입니다.')
elif 9<= areacode <= 12:
    print('출생지가 부산입니다.')
else :
    pass


# 문제 12)
# 어떤 대학교를 졸업하려면 적어도 140학점을 이수해야
# 하고 평점이 2.0은 되어야 한 다고 하자.
# 이것을 파이썬 프로그램으로 검사해보자.
# 사용자에게 이수학점수와 평점을 물어보고 졸업 가능 여부를 출력하는 프로그램을 작성해보자.
credits = float( input("이수한 학점을 입력하세요 : "))
avg = float(input("평점을 입력하세요 : "))
if credits >=140 and avg >=2.0:
    print('졸업 가능합니다.')

# 문제 13)
# 1부터 10사이의 난수를 생성하고 숫자를 맞춰보자
from random import randint
answer = randint(1,10)
if 1<=answer<5:
    if answer <=3:
        if answer ==1:
            print(answer, '1입니다')
        elif answer ==2:
            print(answer, '2입니다')
        else:
            print(answer, '3입니다')
    else:
        print(answer, '4입니다.')
elif 5<= answer<8:
    if answer ==5:
        print(answer, '5입니다')
    elif answer==6:
        print(answer, '6입니다')
    else:
        print(answer, '7입니다')
elif answer ==8:
    print(answer, '8입니다')
elif answer==9:
    print(answer, '9입니다')
else:
    print(answer, '10입니다')

# 문제 14)
# input()함수를 이용하여 입력받은 숫자가 홀수인지 짝수인지를 판단하는 프로그램을 작성하라.
# 홀수면 '홀수'라고 출력하고 짝수면 '짝수'라고 출력하시오
# +, - , / , * , %(나머지 연산자)
numberss = int(input('숫자입력: '))
if numberss % 2 ==0:
    print('짝수')
else:
    print('홀수')

