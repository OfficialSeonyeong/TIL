#파이썬 리스트
#자료 구조에서 중요
#파이썬에는 배열 존재하지 않는다
#1차원 자료 구조로서, R에서의 Vector로 볼 수 있음
#순서, 중복, 수정, 삭제 가능
#인덱스 사용 : 0~
#[] 이용하여 변수를 선언

#선언

a = list()
a =[]
a=[1,2,3]
a=[1,2,'hello',3,4]
a=[1,2,['show','me','the','money'], 3.14]

print(a[2][1], type(a))  # me <class 'list'>

# 슬라이싱 가능
print(a[-1])
inner_list=a[2]
print(inner_list[1])
print(a[2][1:3]) # ['me', 'the']
print(a[2][-1])

#list 연산가능
a = [1,2,3]
b = [4,5,6]
c = a + b
print(c, type(c))  # [1, 2, 3, 4, 5, 6] <class 'list'>

a=[1,2,3]
print(a)
print(a*3)   # [1, 2, 3, 1, 2, 3, 1, 2, 3]
a[0] = 5
print(a)   # [5, 2, 3]
a.append(4)   # 마지막에 더하기
print(a)   # [5, 2, 3, 4]
a.insert(0, 6) # 원하는 위치에 더하기(위치, 넣을 값)
print(a) # [6, 5, 2, 3, 4]
a.sort()  # 오름차순 정렬
print(a)  # [2, 3, 4, 5, 6]
a.reverse()  # 내림차순 정렬
print(a)    # [6, 5, 4, 3, 2]

#pop() : 기존 리스트의 마지막 위치(stack형식)에서 원소를 가져오고 삭제를 시킨다.
print('a-pop():', a.pop())    # a-pop(): 2
print('a-print:', a)  #  a-print: [6, 5, 4, 3]

ex = [4,3]
a.extend(ex)
print(a)   # [6, 5, 4, 3, 4, 3]

#실습
movie_rank =['강철비','반도','다만 악에서 구하소서','인셉션']

#1번. 해당리스트에 베트맨을 추가하세요.
movie_rank.append('베트맨')
print(movie_rank)

#2번. 강철비와 반도 사이에 슈퍼맨을 추가
movie_rank.insert(1, '슈퍼맨')
print(movie_rank)

#3번. 리스트에서 인셉션을 삭제
del movie_rank[-2]
print(movie_rank)

#4번. 리스트에서 다만악에서 구하소서와 베트맨 삭제
del movie_rank[-2:]
print(movie_rank)

movie_rank =['강철비','반도','다만 악에서 구하소서','인셉션']
idx = movie_rank.index('반도')

del movie_rank[idx]
print(movie_rank)

print(movie_rank.pop(idx))
print(movie_rank)


# 실습2
# 1번. 최댓값, 최솟값, 총합, 평균
nums = [1,2,3,4,5,6,7]
print('max: ', max(nums), 'min: ', min(nums), 'avg: ', sum(nums)/len(nums))

# 2번. 데이터의 개수
cook=['피자','김밥','만두','양념치킨','족발','피자','김치만두','쫄면','쏘세지','라면','팥빙수']
print(len(cook))

#3번. 날짜정보 제외하고 가격 정보만 출력
price = ['20180728',100,130,140,150,160,170]
print(price[1:])

# 4번. 홀수, 짝수 출력
nums = [1,2,3,4,5,6,7,8,9,10]
print(nums[::2])
print(nums[1::2])

# 5번. 리스트의 숫자를 역 방향으로 출력
nums = [1,2,3,4,5]
# print(nums[::-1])
nums.sort(reverse=True)
# nums.reverse()
print(nums)

# 6번. 삼성전자, 네이버만 출력
interest = ['삼성전자', 'LG전자', 'Naver']
n = interest.index('LG전자')
del interest[n]
print(interest)


# join()
interest=['삼성전자', 'LG전자', 'Naver', 'SK하이닉스', '미래에셋']
print(interest, type(interest))

# 공백으로 연결된 출력
print("\n".join(interest))
print(type('/'.join(interest)))  # str

# python sequence type range()
# range() : 숫자 sequence 주로 for~ 사용
range_01 = range(10)
print('range-', range_01)  # range- range(0, 10)

range_02 = range(1,11,2)
print('range-', range_02)

print(9 in range_02) # True

for idx in range(10):
    print(idx)