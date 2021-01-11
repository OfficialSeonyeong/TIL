from bigdata.OOP.hms.student import *

# 객체생성
stu01 = Student()
print(stu01)

stuList =[]

stu02 = Student('섭섭님', 49, 'Instructor','male')
print(stu02.age)
stu02.stuInfo()
stuList.append(stu02)

stu03 = Student('김한준',30, 'student','male')
stu03.stuInfo()
stuList.append(stu03)

for stu in stuList:
    stu.stuInfo()

a = Stu.scholarship_rate
print(a)

b = Stu('선영',4.5)
print(b.stuInfo())
print(b.isScholarship())

tea = Teacher('선영','연봉사천', 'best')
print(tea.name, tea.salary)
Teacher.classFunction()

