def print_coins():
    for i in range(100) :
        print('bitcoin')

def first_func(name) :
    print('Welcome To ~ ', name)

def return_func(name) :
    return '커피 사줘요~' + str(name)

def sum_func(x, y, z) :
    return x + y + z

def tuple_func(*args) : #*arg는 튜플을 받는다는 것
    result = 0
    for idx in range(len(args)) :
        result += args[idx]
    return result

def dic_func(**args) :  #dic 받는 방법
    for key, value in args.items():
        print('{}:{}'.format(key, value))

def multi_func(x,y) :
    sum = x + y
    mul = x * y
    return(sum, mul)

def test(x):
    print('test')

def default_func(x, y, flag = True) :
    sum = x + y
    if sum > 10 and flag:
        return sum
    else :
        return 0

# 변수의 scope (유효범위)
x = 50
def local_func(y) :
    # x = 60
    global x
    x += y
    print('inner', x)

local_func(30)
print(x)

# 전역변수
data = [1,3,5,7,9]
tot = 0

for value in data :
    tot += value

print(tot)


def tot_calc(data): #data는 지역변수
    for value in data :
        global tot
        tot += value
    return tot

print(tot_calc(data))
print('tot', tot)

def countSum(start, end) :
    oddSum = 0
    evenSum = 0
    for i in range(start, end+1):
        if i % 2 == 0:
            oddSum += i
        else :
            evenSum += i
    return oddSum, evenSum

# operator 따라서 +,-,*,/ 연산을 수행하고 결과를 리턴하는 함수를 정의
def calculator(op01, operator, op02) :
    if operator == '+':
        return( op01 + op02)
    elif operator == '-' :
        return(op01 - op02)
    elif operator == '*' :
        return( op01 * op02)
    else:
        return (op01 / op02)


def make_url(name) :
    return 'www.'+ name +'.com'


def print_max(x, y, z):
    return max(x, y, z)

def print_max2(a, b, c) :
    list = [a, b, c]
    list = sorted(list, reverse=True)
    return list[0]

def print_max3(a, b, c) :
    max_value = 0
    if a > max_value:
        max_value = a
    if b > max_value:
        max_value = b
    if c > max_value:
        max_value = c
        return max_value


def leap_year(year) :
    if year % 100 !=0 and year % 4 ==0 :
        return ('윤년입니다.')
    elif year % 400 == 0 :
        return ('윤년입니다.')
    else :
        return ('윤년이 아닙니다.')

def leap_year_loop(x, y) :
    yearList = []
    for year in range(x, y+1) :
        if ((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0):
            yearList.append(year)
    return yearList

def return_dict(x) :
    y1 = x * 10
    y2 = x * 20
    y3 = x * 30
    return {'val01': y1, 'val02': y2, 'val03': y3}


