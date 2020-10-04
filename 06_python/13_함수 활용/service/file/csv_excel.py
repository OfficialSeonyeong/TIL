# csv, excel file input / output 함수 정의
import pandas as pd
# data = pd.read_csv('../../word/service_bmi.csv', encoding='utf-8')
# print(data.info())
# print(data.head())
# print(data.tail())



def load_csv() :
    data = pd.read_csv('./word/service_bmi.csv', encoding='utf-8')
    service_bmi(data)

def service_bmi(data) :
    # 컬럼의 정보를 확인하고 싶다면
    # height = data.height
    # height = data['height']
    # print(height)
    # print(type(height))

# 키와 몸무게의 평균
#키와 몸무게의 평균 - sum()
# print('height mean',sum(data.height) / len(data.height) )
# print('최대 신장: ', max(data.height))
# print('최소 신장: ', min(data.height))
# 라벨 컬럼 활용하여 빈도수를 출력하는 로직을 만들어본다면?
# 출력예시) {thin : 100, normal : 50, fat:200}



    dic = {}
    for key in data.label:
        dic[key] = dic.get(key,0) + 1
    print(dic)

from statistics import mean

def load_xls() :
    kospi = pd.ExcelFile('./word/sam_kospi.xlsx')
    kospi = kospi.parse('sam_kospi')
    # print(kospi.info())
    # print(kospi.head())
    print('hight - ', mean(kospi.High))
    print('low mean: ' , mean(kospi.Low))

'''Jason : 네트워크 상에서 표준으로 사용된 파일 형식
{key : value, key : value}
{key : value, key : value}
{key : value, key : value}
{key : value, key : value}
{key : value, key : value}
jason -> python(dict, list) : decoding
jason <- python(dict, list) : encoding
import json
'''

import json
def load_jason() :
    dic = {'id' : 'jslim', 'pwd' : 'jslim'}
    print(type(dic))
    # dic -> json
    jsonDic = json.dumps(dic)
    print(type(jsonDic))
    print(jsonDic) #Dictionary 아니고 Json 형식
    pyobj =json.loads(jsonDic)
    print(type(pyobj))
    print(pyobj['id'])

def json_load_file() :
    with open('./word/usagov_bitly.txt','r', encoding='utf-8') as file :
        lines = file.readlines()
        # print(type(lines))
        # print(type(lines[0]))

        rows=[json.loads(line) for line in lines]
        print(type(rows))
        print(rows[0]['a'])
        # list =[]
        # for dic in line :
        #     pyobj = json.loads(dic)
        #     list.append(pyobj)
        # print(list[0]['a'])

        jsonDF = pd.DataFrame(rows)
        print(jsonDF.head())


