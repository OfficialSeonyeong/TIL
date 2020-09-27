# 먼저 사용자 입력 필수
# input()

name = input('enter your name : ')
gray = input('enter your grade : ')
company = input('enter your company : ')

print(name, grade, company)

score = int(input('Enter your  score: '))
print(score)

print(type(score))  # int


# 파이썬 제어문
# if, if ~else, if ~ elif ~ else
# bool True : 0 이 아닌 수, 문자, 데이터가 있는 리스트, 튜플, 딕셔너리
if not False :
    print('Bad')  # Bad

if False :
    print("Bad")
else :
    print("good")  # good

# 아래의 값이 3의 배수인지 5의 배수인지 아닌지 검정하고 싶다면?
number = 3
if number % 3 == 0 or number % 5 == 0:
    print("{}은 3 또는 5의 배수입니다".format(number))

else :
    print('{}은 3과 5의 배수가 아닙니다'.format(number))


# 윤년의 조건
# 4의 배수이고 100의 배수가 아니거나 400의 배수일 때
# if 구문을 사용하여 연도와 월을 입력받아서 월의 마지막 일을 출력하라

from datetime import date, datetime,timedelta



year = int(input('년도를 입력하세요: '))
month = int(input('월을 입력하세요: '))
year_month = [31,28,31,30,31,30,31,31,30,31,30,31]
leap_year_month = [31,29,31,30,31,30,31,31,30,31,30,31]



if (year % 4 == 0 and year % 100 != 0) :
    print('해당 월의 마지막 날: {} '.format(leap_year_month[month-1]))
elif (year % 400 == 0):
    print('해당 월의 마지막 날:{} '.format(leap_year_month[month-1]))
else :
    print('윤년이 아닙니다.'.format(year_month[month-1]))



# 중첩 조건문
# A학점이면서 95 이상의 점수면 장학금 100%
# A학점이면서 90 이상의 점수면 장학금 90%
# A학점이 아니면 장학금 50%

grade=input('학점 입력: ')
total=int(input('점수 입력: '))

if grade == 'A':
    if total >= 95 :
        print("장학금 100%")
    else :
        print("장학금 95%")
else :
    print("장학금 50%")



area = ['서울','부산','제주']
region = '수원'

if region in area :
    pass
else :
    print('{} 지역은 포함되지 않습니다'.format(region))


mydict = {'서울':100, '광주':200}
region = '부산'
if region in mydict:
    print('키 값이 존재합니다')
else:
    print('키 값이 존재하지 않습니다')


num = 9
result = 0
if num >= 5 :
    result = num * 2
else:
    result = num + 2
print(result)

# 삼항 연산자
result = num*2 if (num>=5) else num +2
print(result)


# 참, 거짓 판별 종류
city =' '
if city :
    print(city)
else :
    print('Please')

money = ''
if money :
    print('맛점')
else :
    print('ㅠㅡㅠ')

# 사용자로부터 하나의 값을 입력받아 해당 값에 20을 뺀 값을 출력
# 단, 출력 값의 범위는 0~225이다
# 예를 들어 결과값이 0보다 작은 값이 되는 경우 0을 출력하고 255보다 큰 값이 되는 경우 255를 출력
num = int(input('숫자입력: '))

if num <0 :
    print('0')
elif 0<num<226:
    print(num-20)
else:
    print('255')

