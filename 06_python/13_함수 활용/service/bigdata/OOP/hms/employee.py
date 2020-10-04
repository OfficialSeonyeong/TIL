
class Employee(object) :

    # class variable
    raise_rate = 1.1

    def __init__(self, name, pay):
        # instance variable,  데이터 일관성 유지 못함
        self.name = name
        self.pay = pay

    def appy_raise(self):
        self.pay = int(self.pay * Employee.raise_rate)

    def getEmp(self):
        return '{}님의 인상 급여는 {} 입니다'.format(self.name, self.pay)

    @classmethod
    def change_raise_rate(cls, rate):
        cls.raise_rate = rate
        print('인상률 {}가 적용'.format(rate))

class Car(object) :
    # class variable
    name = None
    door = cc = 0

    # constructor
    def __init__(self, name, door, cc):
        self.name = name
        self.door = door
        self.cc = cc

    # function, method
    def info(self):
        if self.cc >= 3000 :
            self.type = '대형'
        elif self.cc >= 2000 :
            self.type = '중형'
        else :
            self.type = '소형'

        self.display()

    def display(self):
        print('%s는 %d cc이고(%s), 문짝은 %d개입니다.'% (self.name, self.cc, self.type, self.door))


class TV(object) :
    # 1. class variable
    channel = 10
    volume = 5
    power = False    # (True :on, False:off)

    # 전원관리를 위한 함수
    def changePower(self):
        self.power = not(self.power)

    # 채널변경을 위한 함수
    def channelUp(self):
        self.channel += 1

    def volumeUp(self):
        self.volume += 1

    def volumeDown(self):
        self.volume -= 1

    def display(self):
        print('전원상태 {}, 채널번호 {}, 볼륨 {}'.format(self.power, self.channel, self.volume))

# Qestion
# 1. 전원을 on 시킨다.
# 2. 채널 18번으로 변경
# 3. 볼륨 9 변경
# 4. 상태 출력

