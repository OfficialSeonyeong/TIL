# import function as f
# f.Function()

# from service.bigdata import package_function as pf
# 현재 파일 위치에서 경로 시작
from bigdata.package_function import *
# from bigdata.package_function import print_coins

print_coins()

# from service.bigdata.package_function import first_func
# first_func('세진')

thanks = return_func('선림')
print(thanks)

sumsum = sum_func(3,2,1)
print(sumsum)

print(return_func('선림'))

t = (1,2,3,4,5,6,7,8)
result = tuple_func(1,2,3,4,5,6,7,8)
print(result)

dic_func(name = 'jslim', name1 = 'park', name2 = 'kim')

print(multi_func(1,3))

mull = multi_func(6,3)
print(mull)

(sum, mul)= multi_func(6,3)
print('합 {}, 곱 {}'.format(sum, mul))

test(40)

result = default_func(10, 20)
print(result)
result = default_func(10, 20, False)
print(result)

oddSum, evenSum = countSum(100,500)
print('홀수 합', oddSum)
print('짝수 합', evenSum)

a = calculator(1, '-', 3)
print(a)

# www.naver.com
url = make_url('naver')
print(url)

# 세 개의 숫자를 입력받아 가장 큰 수를 출력할 예정이다.
max = print_max2(10, 20, 30)
print(max)

# year = int(input('년도를 입력하세요: '))
# leapMsg = leap_year(year)
# print(leapMsg)

year_list = leap_year_loop(1900, 2020)
cnt = 0
for idx in range(len(year_list)):
    print(year_list[idx], end = '\t')
    idx += 1
    if idx % 5 == 0:
        print()

b = return_dict(4)
print(b)

print(b.values(), b.keys())
print(b, type(b))

for value in b.values():
    print(value)


