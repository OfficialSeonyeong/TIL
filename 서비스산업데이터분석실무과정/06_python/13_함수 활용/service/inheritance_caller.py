from bigdata.OOP.hms.inheritance import *

date = MyDate()
date.setYear(-2020)
print(date.getYear())

date.year = 3000
print(date.getYear())

# sub = Sub('상속관계 아들 생성자 호출')
sub = Sub('윤선영')
sub.getState()

stu01 = StudentVO('임정섭', 48,'서울', '01')
tea01 = TeacherVO('임섭순',55,'전주','파이썬')

print(stu01.perInfo())
print(tea01.perInfo())

tea01 = TeacherVO('입선문', 30, '광주', '파이썬')

perList = []
perList.append(stu01)
perList.append(tea01)

for obj in perList :
    if isinstance(obj, StudentVO) :
        print(obj.stuInfo())
    else :
        print(obj.teaInfo())

ScCar = SportsCar(300, '터보기능')
print(ScCar.getSpeed())
print(ScCar.carDesc())

Tcar = Truck(300, 5)
print(Tcar.carDesc())

# caller 쪽에서 객체생성 후
account = Account01('441-2919-1234', 500000, 0.073)
account.accountInfo()
account.withDraw(600000)
account.deposit(200000)
account.accountInfo()
account.withDraw(600000)
account.accountInfo()
print('현재 잔액의 이자를 포함한 금액')
account.printInterestRate()

account = SavingAccount('441-2919-1234', 500000, 0.073, 'S')
print(account.printInterestRate())

account = FundAccount('441-2919-1234', 500000, 0.073, 'F')
print(account.printInterestRate())