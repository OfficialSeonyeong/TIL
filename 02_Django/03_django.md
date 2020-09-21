# django



### 주어진 html과 resources('static') 를 활용하여 홈페이지 만들기



###### 기본 설정 01

> * static 파일 djangoWEB 아래로 이동
> * djangoWEB , url.py 에 url 기재
> * html파일 상단에 {% load static %} : static 파일 사용 선언 의미
> * header.html 과 footer.html을 공용으로 사용하고 싶다면, 사용 시에 해당 html 파일에 상단과 하단에 아래 내용 입력
>
> ```html
> {% include 'header.html' %}
> {% block content %}
> 
> <section></section>
> 
> {% endblock %}
> {% include 'footer.html' %}
> ```
>
> 



###### 기본 설정 02 (djangoWEB_settings.py)

> * INSTALLED_APP 에 추가
>
> * TEMPLATES 의 'DIRS': [os.path.join(BASE_DIR, 'djangoWEB/templates')],
>
> * ```python
>   STATIC_URL = '/static/'
>   STATICFILES_DIRS = [
>       os.path.join(BASE_DIR, 'BbsApp','static')
>   ]
>   
>   STATIC_ROOT = os.path.join(BASE_DIR, 'static')
>   ```







##### BbsApp 의 urls.py

```python
from django.contrib import admin
from django.urls import path, include
from BbsApp import views

urlpatterns = [
    path('index/', views.loginForm, name = 'loginForm'),
    path('registerForm/', views.registerForm, name = 'registerForm'),
    path('register/', views.register, name = 'register'),
    path('login/', views.login, name = 'login'),
    path('logout/', views.logout, name = 'logout'),
    path('bbs_list/', views.list, name = 'bbs_list'),
]
```



##### BbsApp 의 urls.py

```python
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import *

# Create your views here.

def loginForm(request) :
    return render(request, 'login.html')

def registerForm(request) :
    return render(request, 'join.html')

def register(request) :
    if request.method == 'POST' :
        id = request.POST['id']
        pwd = request.POST['pwd']
        name = request.POST['name']

        register = BbsUserRegister(user_id=id, user_pwd=pwd, user_name=name)
        register.save()
    return redirect('loginForm')

def login(request):
    if request.method == 'GET' :
        return redirect('login')
    elif request.method == 'POST':
        id = request.POST['id']
        pwd = request.POST['pwd']
        user = BbsUserRegister.objects.get(user_id=id, user_pwd=pwd) # 해당되는 정보의 행을 다 가져옴.
        print('user result : ', user)
        context={}
        if user is not None:
            request.session['user_name'] = user.user_name
            context['userSession'] = request.session['user_name']


    return render(request, 'home.html', context)

def logout(request) :
    request.session['user_name'] = {}
    request.session.modified =True

    return redirect('loginForm')

def list(request) :
    boards = Bbs.objects.all()
    print('boards result - ', type(boards), boards)
    context = {'boards': boards}
    return render(request, 'list.html', context)
```



##### BbsApp 의 models.py

```python
from django.db import models
from django.utils import timezone

# Create your models here.
class BbsUserRegister(models.Model) :
    user_id = models.CharField(max_length=50)
    user_pwd = models.CharField(max_length=50)
    user_name = models.CharField(max_length=50)

    def __str__(self): # 디버그용 함수
        return self.user_id +" , "+self.user_pwd+" , "+self.user_name

class Bbs(models.Model):
    # id = models.AutoField(primary key = True) 자동으로 처리
    title = models.CharField(max_length=100)
    writer = models.CharField(max_length=100)
    content = models.TextField()
    regdate = models.DateField(default= timezone.now)
    viewcnt = models.IntegerField(default=0)

    def __str__(self):
        return self.title
```

> 이후, admin.py에 class명 등록과 DB테이블 형태로 바꾸는 명령어 수행



##### BbsApp 의 list.html, table 파트

```html
{% if boards %}
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>

	<tbody id="tbody">
	{% for board in boards %}
	<tr>
		<td>{{board.id}}</td>
		<td><a href="OOO">{{board.title}}</a></td>
		<td>{{board.writer}}</td>
		<td>{{board.regdate}}</td>
		<td><span class="badge bg-red">{{board.viewcnt}}</span></td>
	</tr>
	{% endfor %}
	</tbody>

</table>
{% else %}
	<p>데이터가 존재하지 않습니다.</p>
{% endif %}

```





###### Views.py 의 응답 방식

> 1. **HttpResponse()** : 바로 client에게 Response
> 2. **render(request, templates, context)** 
>    * forward 방식 : templates 이동
>    * context에 데이터를 심으면 해당 url에서만 사용가능
>    * cf) session에 심으면 여러 페이지에서 공유 가능
> 3. **redirect()** : 새로운 request url 요청

