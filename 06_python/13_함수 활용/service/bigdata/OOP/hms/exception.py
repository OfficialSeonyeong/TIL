# 다중상속, 추상화
class Animal(object) :
    def cry(self):
        pass

class Tiger(Animal) :
    def jump(self):
        print('호랑이가 점프를 한다.')
    def cry(self):
        print('어흥')

class Lion(Animal):
    def bite(self):
        print('한 입에 꿀꺽')
    def cry(self):
        print('그르렁')

class Liger(Tiger, Lion):
    def play(self):
        print('라이거가 사육사를 잡아먹었습니다.')

# 추상클래스
# 매서드의 목록만 가진 클래스
# 객체 생성이 불가
# 상속받는 클래스에서 매서드 구현을 강제하기 위해서 사용하는 문법

from abc import *
class Base(metaclass=ABCMeta) :
    @abstractmethod # 구현부가 없는 추상 메소드
    def study(self):
        pass

    @abstractmethod
    def goToAcademy(self):
        pass

class BaseSub(Base):
    def study(self):
        print('공부하자')
    def goToAcademy(self):
        print('학원 가자')


'''
예외처리 구문
try :에러가 발생할 가능성이 있는 코드
except : 발생된 에러를 잡기 위한 객체 정의 (필수)
except : 발생된 에러를 잡기 위한 객체 정의
else : 에러가 발생되지 않을 때 실행되는 블럭
finally : 무조건 실행
'''

def userInput() :
    try :
        age = int(input('본인의 나이를 입력하세요: '))
    except ValueError:
        userInput()
    else :
        print('Result is ', age)
    finally:
        print('항상 실행')

def exceptionFunc(list_data) :
    try :
        sum = 0
        sum = list_data[0]*list_data[1]*list_data[2]*list_data[3]
        if sum < 0:
            raise Exception('User Define Exception')
    except IndexError as err:
        print(str(err))
    except Exception as e :
        print(str(e))
    else:
        print(sum)

# 매개변수로 넘겨 받은 각 첨자번지의 값에 제곱(**)한 결과를 출력하려고 한다.
# 예외 발생을 확인하고 예외처리 구문을 추가하여 정상적인 흐름의 함수 호출이 되도록
def listExcepFunc(list) :
    for i in list :
        try :
            squared = i**2
            print(squared)
        except TypeError:
            print('숫자를 입력셔야죠~')
        finally:
            print('end function')


