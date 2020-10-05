from file.text_file_inout import *

fileName = 'hello.txt'
mode = 'r'
fileWrite(fileName, mode)

withFile('hello.txt', 'r')
withMultiWriteFile('hello.txt','w')

lines = ['안녕하세요\n','혹시 졸리면 \n','집중집중\n','강사님의 말을 흘려듣지말자\n']
withListFile('hello.txt','w',lines)

withListReadFile('hello.txt','r')

cntFunction()

Special()

import pickle

name='jslim'
age = 48
address = '서울시 서초구 서초동'
scores = {'kor':100, 'eng':80, 'math': 70, 'sci': 98}

with open('pickle.dat', 'wb') as file:
    print(file)
    pickle.dump(name, file)
    pickle.dump(age, file)
    pickle.dump(address, file)
    pickle.dump(scores, file)
print('바이너리 파일에 저장하였습니다.')

with open('pickle.dat', 'rb') as file :
    name = pickle.load(file)
    age = pickle.load(file)
    address = pickle.load(file)
    scores = pickle.load(file)
    print(name)
    print(age)
    print(address)
    print(scores)



Usingzipcode()
