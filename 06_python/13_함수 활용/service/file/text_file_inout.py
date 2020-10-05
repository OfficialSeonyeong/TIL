'''
텍스트 파일 입출력
open(file ='절대경로/상대경로', mode ='')
mode = r/w/a/wb
'''

def fileWrite(fileName, mode) :
    file = None
    try:
        if mode == 'w':
            file = open(fileName, mode)
            file.write('Hello~, Seop')
        elif mode =='r':
             file=open(fileName, mode)
             line = file.read()
             print(line)
        else :
            file = open(fileName, mode)
            file.write('\nSeop append')
    except ValueError as error:
        print(str(error))
    finally:
        if file != None:
            file.close()

    print('close function')


def withFile(fileName, mode) :
    with open(fileName, mode) as file :
        line = file.read()
        print(line)

def withMultiWriteFile(fileName, mode) :
    with open(fileName, mode, encoding='utf-8') as file: #with 쓰면 close()생략가능
        for text in range(3) :
            inputMsg = input('문자열을 입력하세요: ')
            file.write('{}\n'.format(inputMsg))
            # 텍스트 파일 내용 새로 작성

def withListFile(fileName, mode, list):
    with open(fileName, mode, encoding='utf-8') as file :
        #file.writelines(list)
        for text in list:
            file.write(text)

def withListReadFile(fileName, mode):
    with open(fileName, mode, encoding='utf-8') as file:
        # line = None
        # while line !='' :
        #     line = file.readline()
        #     print(line.strip('\n'))

        for line in file :
           print(line.strip('\n'))

# 단어가 줄 단위로 저장된 cnt_words.txt 파일로부터 10자 이하인 단어의 개수를 카운팅
def cntFunction() :
    with open('cnt_words.txt','r') as file :
        count = 0
        for text in file :
            if len(text.strip('\n')) <= 10 :
                count += 1
        print(count)


# 문자열이 저장된 special_words 파일에서 문자 'c'가 포함된 단어를 각 줄에 출력하는 프로그램
# 단어를 출력할 때는 등장한 순서대로 출력하며, .은 출력하지않는다.
def Special():
    with open('special_words.txt','r') as file :
        words =file.read().split()
        print(words)
        print(type(words))
        for word in words:
            if 'c' in word:
                print(type(word))
                print(word.strip(',.'))




#zipcode.txt.
# input함수를 이용하여 동 이름을 입력받아 해당되는 동의 주소를 출력
# 한줄씩 읽어서 tab키로 분리하고 startswith()함수로 이용하여 처리
def Usingzipcode():
    try :
        dong = input('동을 입력하세요: ')
        f =open(file = 'zipcode.txt', mode='r', encoding='utf-8')
        line = f.readline()
        while line:
            addr= line.split(sep = '\t')
            if addr[3].startswith(dong) :
                print('['+addr[0]+']',addr[1], addr[2], addr[3], addr[4])
            line = f.readline()
    except Exception as e:
        print(e)
    finally:
        f.close()