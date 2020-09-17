# Django

#### MVT 흐름 파악하기



> 장고 package 설치 

### Terminal 명령어

1. 프로젝트(djangoWEB)  생성

``` django
django-admin startproject djangoWEB

dir/w

cd djangoWEB
```

2.  App 생성

```django
python manage.py startapp HelloApp
```

3. Server 실행하는 명령어

```django
python manage.py runserver
```

##### 사용자 입장에서 서버 형식 : http://localhost:8000/hello/index/



#### MVT 패턴

`웹 클라이언트`  -- Request --> url conf --> ```View``` -(CRUD)-> ```Model ```<-(ORM)- DB

​                                                                                  -----------> ```Templates```

​                          

###### templates

* html 파일 (tag + text)
* {{   }} : print
* {%     %} : 동적코드 작성



###### 모델 --> DB(테이블)

```django
python manage.py makemigrations
python manage.py migrate

python manage.py createsuperuser
```





### 로그인하는 과정 만들기



* djangoWEB 의 **urls.py**

  > helloApp으로 이동하기 위한 경로 기재

```django
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('hello/', include('helloApp.urls')),
]
```





* helloApp 의 **urls.py**

```django
from django.contrib import admin
from django.urls import path, include
from helloApp import views

urlpatterns = [
	path('index/', views.index),
    path('login/', views.login, name='login'),
]
```



* helloApp 의 **models.py**

  > 모델을 만들 땐 models.Model을 꼭 상속해야 함

```django
from django.db import models

# Create your models here.

class TestUser(models.Model) :
    user_id = models.CharField(max_length=50)
    user_pwd = models.CharField(max_length=50)
    user_name = models.CharField(max_length=50)
```



* helloApp의 **admin.py**

```django
from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(TestUser)
```



* http://127.0.0.1:8000/admin/ Django administration 에서 Test users 아이디, 비밀번호 생성

  > DB 생성



* helloApp 의 **views.py**

  > HttpResponse는 혼자 바로 응답, render는 템플릿 통해 응답

```django
from django.shortcuts import render, HttpResponse
from .models import *

# Create your views here.

def index(request) : 
    return render(request, 'hello/index.html')

def login(request) :

    if request.method == 'POST':
        id = request.POST['id']
        pwd = request.POST['pwd']

        user = TestUser.objects.get(user_id = id)
        context = {}
        if user is not None :
            context['user'] = user
        return render(request, 'hello/success.html', context)
```



* helloApp의 templates, **index.html**

```django
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <center>NAVER</center>

    <div align="right">
        <form method="post" action="{% url 'login' %}">

        {% csrf_token %}

            <label>아이디<input type="text" name="id" />
            <label>패스워드<input type="password" name="pwd" />
            <input type="submit" value="LOGIN">
        </form>
    </div>
</body>
</html>
```



* helloApp 의 templates, **success.html**

```django
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    {{user.user_id}}이고 {{user.user_pwd}} 이며 {{user.user_name}}입니다.
</body>
</html>
```



>  클라이언트 입장

* http://127.0.0.1:8000/hello/index/ 에서 Test user 아이디, 비밀번호 입력