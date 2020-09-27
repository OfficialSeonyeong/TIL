# 주석문

# print('Python Start')

# shift +F10은 전체 RUN

# 멀티라인 코멘트
"""우리는 시각화 기법 및 데이터 분석을 배우는 과정입니다.
그래서, 파이썬을 공부하고 있습니다."""

'''print("""우리는 시각화 기법 및 데이터 분석을 배우는 과정입니다. 
그래서, 파이썬을 공부하고 있습니다.""") 문장을 개행해서 사용할때 """"""'''

print("Seop's Python")
print('Speak Out. ~ "Student"')
print('오늘은','월요일','이고 파이썬 첫날')


# print option
# end
print('P','Y','T','H','O','N',sep='-')
print('jslim9413','naver.com', sep='@')
print('Welcome TO Seop',end='')
print('BigData News', end=' ') # end 옵션은 다 한 줄로 출력을 원할 때
print('Web House')   # Welcome TO SeopBigData News Web House


# format사용 (d,s,f) %,{}
print('%s %d' % ('one',100))
print('{} {}'.format('one','two'))
print('{1} {0}'.format('one','two'))

# 자리수 지정
print('%10s'% 'seop')  # 앞에 공백
print('%-10s'% 'seop')  # 뒤에 공백
print('%5s'% 'pythonGod')  # 숫자 개수 안맞으면 무시 다 출력

print('\%d'%100)  # \100

print('\%f'%3.14159)  # \3.141590
print('%1.2f' % 3.14159)  # 3.14

