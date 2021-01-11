# Python Dictionary

# 범용적으로 가장 많이 사용되는 타입
# key와 value의 대응관계 type
# 순서 X, 키 중복 X, 수정 O, 삭제 O
# {}

temp = {}
print(type(temp))

dic01 ={'name': 'seop', 'age': 48, 'address':'Seoul', 'birth':'730910', 'gender': True}

dic02 = dict([('name', 'seop'), ('age', 48),('address','Seoul'),('birth', '730910'),('gender', True)])
print('dic02: ',dic02)

dic03 = dict(name='seop',age= 48, address='Seoul', birth='730910',
gender= True)
print('dict3 is ', dic03)

print(type(dic01), type(dic02), type(dic03)) # 모두 dictionary
print(dir(dic01))

print('name' in dic01)    # True

# 요소 추가하는 방법
# dic01['marriage'] = False
# print(dic01)

dic01['marriage'] = True
print(dic01)

# 데이터 확인
print(dic01['birth'])

# 출력
print('dic03: ', dic03['name'])
print('dic03: ', dic03.get('name'))

print(len(dic03)) # 5

# dict_keys, dict_values, dict_items
print('keys :', list(dic03.keys()))

print(list( dic03.values()))
print('dic03_items=',list( dic03.items()))

for key in dic03.keys() :
print("{0},{1}".format(key, dic03[key]))

for value in dic03.values() :
     print(value)

for (key, value) in dic03.items():
    print("{0},{1}".format(key, value))

# 튜플 패킹 & 언패킹
t = ('foo', 'bar', 'baz', 'qux')
print(type(t))

# unpacking
(x1, x2, x3, x4 ) = t
print(x1, x2, x3, x4)
(x1, x2, x3, x4 ) = ('foo', 'bar', 'baz', 'qux')

a, b, *c = (0,1,2,3,4,5)  # * 없는 곳에 하나만, * 있는 곳에 나머지 다
print(a)   # 0
print(b)   # 1
print(c)   # [2, 3, 4, 5]


# 삭제 pop(), del
del dic03['gender']
print(dic03)

print('pop: ', dic03.pop('birth'))  # 해당 값 리턴 후 해당 값 삭제
print(dic03)

dic03.clear()  # 전체 다 삭제
print(dic03)