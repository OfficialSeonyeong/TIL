# 집합(Set)
# 순서X, 중복X
# set()
# {value, value, ~~~}

temp = set()
print(type(temp))  # set
temp = {'jslim', 'teacher'}
print(type(temp))   # set

b = set([1,2,3,4,5,5,5,5])
print(type(b), b)  # 'set' {1,2,3,4,5}

c = set([1, 3.14, 'Pen',False])
print(c)   # {False, 1, 3.14, 'Pen'}
t= tuple(c)
print('casting: ', t, t[1:3])

s1 = set([1,2,3,4,5,6])
s2 = set([4,5,6,7,8,9])

# 교집합 &, intersection()
print(s1 & s2)
print(s1.intersection(s2))

# 합집합 |, union()
print(s1 | s2)
print(s1.union(s2))

# 차집합 -, difference()
print(s1 - s2)
print(s1.difference(s2))
print(s2 - s1)
print(s2.difference(s1))

s1.add(7)
print(s1)  # {1, 2, 3, 4, 5, 6, 7}
s1.remove(7)
s1.discard(9) #포함되지 않은 것을 작성해도 오류 발생하지 않음
print(s1)


# set의 특징 활용 : 중복제거
gender = ['남','여','남','여','남','여']
print(gender)
sgender = set(gender)
print(sgender)
lgender = list(sgender)
print(lgender[0])
print(lgender[1])

s1 = set([1,2,3,4,5,6])
print(dir(s1))

for idx in s1:
    print(idx, end=' ')  # 1 2 3 4 5 6