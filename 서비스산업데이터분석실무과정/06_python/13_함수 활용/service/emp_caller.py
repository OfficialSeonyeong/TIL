from bigdata.OOP.hms.employee import *

emp01 = Employee('임정섭', 1000)
emp01.appy_raise()
print(emp01.getEmp())

emp02 = Employee('임정식', 2000)
emp02.appy_raise()
print(emp02.getEmp())
# print(dir(emp01))

print(id(emp01))  # 주소값 확인
print(id(emp02))

Employee.change_raise_rate(1.5)
emp01.appy_raise()
print(emp01.getEmp())
emp02.appy_raise()
print(emp02.getEmp())

print('Car 객체 생성 후 작업 진행')
Car.name = 'Jeep'
Car.door = 4
Car.cc = 2000
print('{}, {}, {}'.format(Car.name, Car.door, Car.cc))

car = Car('마세라티', 4, 2000)
car.info()

car = Car('벤틀리', 4, 3000)
car.info()

car = Car('미니쿠퍼', 3, 1000)
car.info()


channel = TV.channel
volume = TV.volume
power = TV.power

print(TV.channel, TV.volume, TV.power)

tv = TV()
print(tv.channel)
print(tv.volume)
tv.display()

# Answer
tv.changePower()
tv.display()
for i in range(8) :
    tv.channelUp()
tv.display()

for i in range(4) :
    tv.volumeUp()
tv.display()


