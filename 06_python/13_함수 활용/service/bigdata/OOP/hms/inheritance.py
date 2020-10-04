# encapsulation(은닉화)
# information - hiding (정보은닉)

class MyDate(object):

    def setYear(self, year):
        if (year < 0) :
            self.__year = 2020
        else :
            self.__year = year
    def getYear(self):
        return self.__year

# inheritance
class Sup(object) :
    def __init__(self, name):
        self.name = name
    def getState(self):
        print('Super', self.name)

class Sub(Sup) :
    pass
    def getState(self):
        print('Sub', self.name) #같은 이름의 함수인데 하는일이 다를때 - 다형성


class Person(object) :
    def __init__(self, name, age, address):
        self.name = name
        self.age = age
        self.address = address

    def perInfo(self):
        return self.name + str(self.age) + self.address

class StudentVO(Person) :
    def __init__(self, name, age, address, stuId):
        super().__init__(name, age, address)
        self.stuId = stuId
    def perInfo(self):
        return super().perInfo() + ',' + self.stuId

class TeacherVO(Person) :
    def __init__(self, name, age, address, subject):
        super().__init__(name, age, address)
        self.subject = subject
    def perInfo(self):
        return super().perInfo() + ',' + self.subject


class Car(object) :
    def __init__(self, speed):
        self.speed = speed
    def getSpeed(self):
        return self.speed
    def carDesc(self):
        return '차량 : {}'.format(self.speed)

class SportsCar(Car) :
    def __init__(self, speed, turbo):
        super().__init__(speed)
        self.turbo = turbo
    def getTurbo(self):
        return self.turbo
    def carDesc(self):
        return super().carDesc() + '\t터보 여부 ='+self.turbo

class Truck(Car) :
    def __init__(self, speed, capacity):
        super().__init__(speed)
        self.capacity=capacity
    def getCapacity(self):
        return self.capacity
    def carDesc(self):
        return super().carDesc() + '\t적재 공간 = ' + str(self.capacity)


# [실습]
# 1.  Account class 작성 - account, balance, interestRate
# 2. accountInfo() - 계좌의 정보를 출력한다(account, balance, interestRate)
# 3. deposit(amount) - 계좌 잔액에 매계변수로 들어온 amount를 더한다.
# 4. printInterestRate() - 현재 잔액에 이자율을 계산하여 소수점 자리 2자리까지 출력한다.
# 5. withDraw(amount) - 매개변수로 들어온 금액만큼을 출금하여 잔액을 변경한다.
# 단, 잔고가 부족할 경우 '잔액이 부족하여 출금할 수 없습니다.'출력한다.

class Account01(object) :
    def __init__(self, account, balance, interestRate):
        self.account = account
        self.balance = balance
        self.interestRate = interestRate

    def accountInfo(self):
        return self.account, self.balance, self.interestRate

    def deposit(self, amount):
        self.balance += amount

    def printInterestRate(self):
        self.interestRate = self.balance * self.interestRate
        return '%1.2f'% (self.interestRate)

    def withDraw(self, amount):
        if self.balance < amount:
            print('잔액이 부족하여 출금할 수 없습니다.')
        else:
            self.balance -= amount

# [실습]
# 1.  Account class 작성 - account, balance, interestRate, type(계좌 종류 S/F)
# 1-1. SavingAccount, FundAccount 추가
# 1-2. expireRate
# 1-3. printInterestRate() - overriding
# 1-4. Saving Account - printInterestRate() 기본 이자율에 만기시 이자율(0.1)을 복리로 계산
# 1-5. FundAccount - printInterestRate()
# 만기시 이자율 잔액 10만원 이상이면 10%, 20만원이상 15%, 100만원 이상 20%
# 2. accountInfo() - 계좌의 정보를 출력한다(account, balance, interestRate)
# 3. deposit(amount) - 계좌 잔액에 매계변수로 들어온 amount를 더한다.
# 4. printInterestRate() - 현재 잔액에 이자율을 계산하여 소수점 자리 2자리까지 출력한다.
# 5. withDraw(amount) - 매개변수로 들어온 금액만큼을 출금하여 잔액을 변경한다.
# 단, 잔고가 부족할 경우 '잔액이 부족하여 출금할 수 없습니다.'출력한다.

class Account(object) :
    def __init__(self, account, balance, interestRate, type):
        self.account = account
        self.balance = balance
        self.interestRate = interestRate
        self.type = type

    def printInterestRate(self):
        self.interestRate = self.balance * self.interestRate
        return self.interestRate

class SavingAccount(Account) :
    def __init__(self, account, balance, interestRate, type):
        super().__init__(account, balance, interestRate, type)

    def printInterestRate(self):
        self.interest = super().printInterestRate() * 0.1
        return self.interest

class FundAccount(Account) :
    def __init__(self, account, balance, interestRate, type):
        super().__init__(account, balance, interestRate, type)

    def printInterestRate(self):
        if self.balance > 10000000:
            self.interestRate = '20%'
        elif self.balance > 200000:
            self.interestRate = '15%'
        else :
            self.balance = '10%'
        return self.interestRate
