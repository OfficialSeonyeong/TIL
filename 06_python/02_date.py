# Python date type

from datetime import date, datetime
today = date.today()
print(today, type(today))  #datetime.date
print('년도: {}, 월: {}, 일: {}'. format(today.year, today.month, today.day))

# 날짜 및 시간
my_datetime = datetime.today()
print(my_datetime)
print('현재 {}시, {}분, {}초, {}...'.format(my_datetime.hour, my_datetime.minute, my_datetime.second, my_datetime.microsecond))

from datetime import date, datetime, timedelta
from dateutil. relativedelta import relativedelta
today = date.today()
yesterday = timedelta(days=-1)
print('yesterday: {}'.format(today+yesterday))

# timedelta()
# weeks, days, hours, minutes, seconds -> possible
# years, months -> impossible

days= relativedelta(months=-2)
print('two months before: {}'.format(today+days))

# 특정 날짜 객체를 생성
from dateutil.parser import parse
myDay = parse('2020-08-11')
print(myDay)   # 2020-08-11 00:00:00

myDay = datetime(2020,8,11)
print(myDay)  # 2020-08-11 00:00:00


#strftime (날짜를 문자열형태로 포맷 지정)
#strptime (문자열을 날짜형태로)
today=datetime.today()
print('{}'.format(today.strftime("%m-%d-%y")))  # 09-25-20
print('{}'.format(today.strftime("%m-%d-%Y")))  # 09-25-2020

str='2020, 08, 11 - 13:14:20'
my_str = datetime.strptime(str,'%Y, %m, %d - %H:%M:%S')
print(type(my_str))
print(my_str)