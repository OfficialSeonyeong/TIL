
# 멤버변수 - 자료 저장
# 생성(Constructor) - 객체생성시 호출되는 일급(__init__)함수
# def function() - 자료처리를 위한 함수
class Student(object) :
    msg = '나는 전역변수이지만 인스턴스 소유가 아닌 클래스 소유야'
    def __init__(self, name):
        self.name = name

    def hardStudy(self):
        return '오늘도 열공했다'

