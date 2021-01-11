# 변수

'''
Python Built-in Types
-Numeric
-Sequence
-Text Sequence
-Set
-Mapping(dict, tuple)
-Bool

변수 지정 방법
-Camel Case: numberOfCollege -> method, function
-Pascal Case: NumberOfCollege -> class
-Snake Case: number_of_college -> method, function
'''

import keyword
print(keyword.kwlist) # 파이썬의 예약어

# 변수는 숫자로 시작할 수 없고, 특수문자는 _,$만 허용
# 예약어는 변수명으로 사용 불가

year = 2020
month = 8
day = 10
print('{}년 {}월 {}일'.format(year, month, day))
print(type(year), type(month), type(day))  # 모두 int형

intValue=123
floatValue=3.14159
boolValue=True
strValue='jslim'

print(type(intValue), type(floatValue), type(boolValue), type(strValue))  # int, float, bool, str

#형변환 type casting
num_str = '720'
num_num=100
print(int(num_str) + num_num)  # 820
print(num_str + str(num_num))  # 720100

year = '2020'
print(int(year)-1)


# 데이터타입
#str01 = 'python'
#bool = True
#str02 = 'Anaconda'
#float = 10.0
#int = 20

list = [str01, str02]
dict ={
    "name" : "machine learning",
    "version": 2.0
}
tuple = (3,5,7)
set={3,5,7}
print(type(set))

# 키보드 입력
# input()
# inputNumber = int(input('숫자를 입력하세요:'))
# print(inputNumber)

# ***** 파이썬 문자형
str01 = 'I am Python'
str02 = 'Python'
str03 = '''this is a  
multiline
sample text'''
print(str01, str02, str03)  # multiline('''   ''')은 줄 띄움 그대로 출력

query = '''select * from emp
where deptno = {no}
order by eno desc'''

print(query)

seqText= 'Talk is cheap. Show me the code'
print(seqText)

# dir() : 어떤 객체를 인자로 넣어주면 해당 객체가 어떤 변수와 메소드(method)를 가지고 있는지 나열
print(dir(seqText))

# slicing
print(seqText[3])
print(seqText[-1])
print(seqText[0:4])

str_slicing = 'Nice Python'
print(str_slicing[1:3])
print(str_slicing[0:6:2])
print(str_slicing[0:len(str_slicing):2])
print()
print(str_slicing[-6:])
print(str_slicing[::-1]) #반대로

# 아래의 문자열에서 '홀'만 출력하세요.
string='홀짝홀짝홀짝홀짝'
print(string[::2])

#아래의 문자열을 거꾸로 뒤집어 출력하세요
string = "PYTHON"
print(string[::-1])


# 다양한 함수
string = 'python'
#첫 문자를 대문자로 만들고 싶다면
print('Capitalize:', string.capitalize()) # x.function : x의 해당되는 것을 함수에 적용

phone_number='010-8699-6248'
print(phone_number.replace('-',' '))

string = 'abcdefe2a345a345a'
print(string.replace('a','A'))

url='http://naver.com'
url_split = url.split('.')
print(url_split[-1])

data = '    삼성전자   '
print(data.strip(), data.rstrip(), data.lstrip())

ticker='btc_krw'
upper_ticker = ticker.upper()
print(upper_ticker)
print(upper_ticker.lower())

#endswith()
file_name='report.xls'
isExits = file_name.endswith(('xls','xlsx'))
print(isExits)  #True

#split() : 리스트 형태로 리턴
string = '삼성전자/LG전자/Naver/Google'
interest=string.split('/')
print(interest)


myStr = 'This is a sample Text'
# in, not in -> True| False
print("sample" in myStr) # True
print("text" not in myStr) # True
print("this" in myStr) # False
print('this' in myStr.lower()) # True

brand_name = 'cocacola'
result = len(brand_name)
print(result)  # 8
result = brand_name.count('c')
print(result)  # 3

result = brand_name.find('o')
print(result)

result = brand_name.find('f')
print(result)

result= brand_name.index('a')
print(result)  # 3 첫번째 인자의 인덱스 리턴

result= brand_name.index('f')
print(result) # 오류 리턴



a='a'
print(ord(a))  # 97

print(chr(65))  # A