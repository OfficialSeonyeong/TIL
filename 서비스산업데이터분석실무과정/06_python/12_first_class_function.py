# first_class_function(일급함수)
# 람다식(lamda)

def add(x, y) :
    return x + y

print("caller ~ {}".format(add(10,20)))
print(add)    # <function add at 0x000001F6162ABE58>

other_func = add
print(other_func)
print(other_func(1,2))


def operation(func, arg_list) :
    result =[]
    for (tmp1, tmp2) in arg_list:
        result.append(func(tmp1, tmp2))
    return result

data = [(1,2), (3,4), (5,6)]
result = operation(add, data)
# print(result)

#람다식: 익명의 함수
def mul_func(x,y) :
    return x * y
result = mul_func(1,2)

#lambda x,y : x * y
lamda_func = lambda x,y : x * y
print(lamda_func(3,2))

# 함수 < 클래스 < 모듈 < 패키지

