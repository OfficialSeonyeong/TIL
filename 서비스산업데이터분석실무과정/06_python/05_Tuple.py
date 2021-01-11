# 파이썬 튜플
# ***리스트와 비교
# 튜플 자료형( 순서 O, 중복 O, 수정 X, 삭제 X)
# 불변(immutable)
# 읽기 전용
# ()

my_tuple = ()
movie_rank = ('반도', '강철비2', '아이언맨')

test_tuple=(1, )
print(type(test_tuple))  # tuple

# 사용자의 편의를 위해서 괄호없이 만들 수 있다.
test_tuple = 1,2,3,4,5
print(test_tuple, type(test_tuple))  # tuple

multi_tuple = (100,1000,'Ace','Base','Captine')
print(multi_tuple)

# Indexing
print('>>>>>튜플 인덱싱')
print('index 1:', multi_tuple[1])
print('index sum:', multi_tuple[1] + multi_tuple[0])
print('slicing:', multi_tuple[2:])  # slicing: ('Ace', 'Base', 'Captine')

print(type(multi_tuple[2:]))  # tuple

list = list(multi_tuple[2:])
print(list, type(list))  # ['Ace', 'Base', 'Captine'] <class 'list'>

casting_tuple = tuple(list)
print(type(casting_tuple))  # tuple

# 1~99까지의 정수 중 짝수만 저장된 튜플을 생성한다면
even = tuple(range(2,100,2))
print(even)  # (2, 4, 6, ....)

