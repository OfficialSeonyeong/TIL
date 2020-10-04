
class Student(object) :
    def __init__(self, name, age, job, gender):
        self.name = name
        self.age = age
        self.job = job
        self.gender = gender

    def stuInfo(self):   # instance 소유를 의미하는 'self', 무시해도 가능 /self가 있어야 인스턴스의 소유가 됨
        print('이름: {}, 나이 : {}, 직업 : {}, 성별: {}'.format(self.name, self.age, self.job, self.gender))


class Stu(object) :
    scholarship_rate = 3.5

    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

    def stuInfo(self):
        return '이름 : {}, 학점 : {}'.format(self.name, self.grade)

    def isScholarship(self):
        if self.grade >= Stu.scholarship_rate :
            return True
        else :
            return False

class Teacher(object) :
    class_variable = '클래스 변수입니다.'
    def __init__(self, name, salary, survey): #instance생성 시 바로 실행되는 함수
        self.name = name
        self.salary = salary
        self.survey = survey

    def working(self):
        print('지금 열심히 객체지향 프로그램을 강의합니다.')

    def salaryInfo(self):
        print('{} 님의 급여는 {}입니다'.format(self.name, self.salary))

    def surveyInfo(self):
        print('Good Job~')

    def printClassVariable(self):
        print(Teacher.class_variable)

    @staticmethod
    def classFunction():
        print(Teacher.class_variable)
