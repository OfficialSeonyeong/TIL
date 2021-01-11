# Django



#### 투표 페이지 만들기

> * PollsApp 생성 후 djangoWEB의 settings.py에서 INSTALLED_APPS에 추가
>
> * djangoWEB의 urls.py에 path 추가
>
> ```python
> from django.contrib import admin
> from django.urls import path, include
> 
> urlpatterns = [
>     path('admin/', admin.site.urls),
>     path('polls/', include('PollsApp.urls')),
> ]
> ```



##### PollsApp 의 urls.py

```django
from django.contrib import admin
from django.urls import path, include
from PollsApp import views


urlpatterns = [
    path('index/', views.index, name='index'),
    path('<int:question_id>', views.choice, name='choice'),
    path('vote/', views.vote, name='vote'),
    path('result/', views.result, name='result'),
]
```



##### PollsApp 의 models.py

> * DB 테이블을 만드는 것
>
> * 테이블은 자동으로 primary key를 가짐

```python
from django.db import models

# Create your models here.

class Question(models.Model) :
    question_text = models.CharField(max_length=200)
    regdate = models.DateTimeField('date published')

    def __str__(self):
        return self.question_text+" , "+str(self.regdate)

class Choice(models.Model) :
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return str(self.question)+" , "+self.choice_text+" , "+str(self.votes)
```



##### PollsApp 의 admin.py

```python
from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Question)
admin.site.register(Choice)
```

> 모델 -> DB(테이블) 명령어 하기



##### PollsApp 의 views.py

```python
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from .models import *

# Create your views here.

def index(request) :
    lists = Question.objects.all()
    print("-"*50)
    print(lists)
    print("-" * 50)
    context = {'lists' : lists}
    return render(request, 'polls/index.html', context)
    # return HttpResponse('테스트 링크입니다.')

def choice(request, question_id) :
    print('param question_id', str(question_id))
    lists = get_object_or_404(Question, pk=question_id)
    print("-"*100)
    print(lists)
    print("-" * 100)

    context = {'clist': lists}
    return render(request, 'polls/choice.html', context)

def vote(request) :
    choice = request.POST['choice']  #선택지의 번호
    question_id = request.POST['question_id'] #질문지의 번호
    print('param value choice- ', str(choice))
    print('param value id - ', str(question_id))

    question = get_object_or_404(Question, pk = question_id)
    checked_choice = question.choice_set.get(pk = choice)
    checked_choice.votes += 1
    checked_choice.save()


    context = {}
    request.session['question_id'] = question_id
    return redirect('result') # 새로운 request가 뷰에서 처리
    # return HttpResponseRedirect(reverse('polls:result', args=(question.id,)))
    # return render(request, 'polls/result.html', context)

def result(request) :
    question_id = request.session['question_id']
    print('------              views.result', str(question_id))
    question = get_object_or_404(Question, pk=question_id)
    context = { 'question' : question}
    return render(request, 'polls/result.html', context)
```



##### PollsApp 의 templates, index.html

```html
</head>
<body>
    {% if lists %}
    <ul>
        {% for question in lists %}
        <li><a href="../{{question.id}}">{{ question.question_text }}</li>
        {% endfor %}
    </ul>
    {% else %}
        <p>데이터가 존재하지 않습니다~</p>
    {% endif %}
</body>
</html>
```



##### PollsApp 의 choice.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h1>{{ clist.question_text}}</h1><hr/>
    <form method="post" action="{% url 'vote' %}">

        {% csrf_token %} <!-- 장고에서 post 방법 사용시 사용해야 함 -->
    <input type="hidden" name="question_id" value="{{clist.id}}" />

    {% for choice in clist.choice_set.all %}
    <input type="radio"
           name="choice"
           value="{{choice.id}}">
    <label>{{ choice.choice_text}}</label><br/>
    {% endfor %}
     <p/>
     <input type="submit" value="VOTE">
    </form>
</body>
</html>
```



##### PollsApp 의 result.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h1>{{ question.question_text }}</h1>
    <hr/>
    <ul>
        {% for choice in question.choice_set.all %}
        <li>{{choice.choice_text}} - {{choice.votes}}</li>
        {% endfor %}
    </ul>
    <p/>
    <a href="{% url 'index' %}">첫 페이지로 이동</a>
</body>
</html>
```







>  views.py 에서 데이터를 가져오는 방법
>
> ```sql
> SQL) select * from table ;
> 	 	modelName.objects.all()
> 
> SQL) select * from table where id = 1 ;
> 		modelName.objects.filter( id= 1 )
> 
> SQL) select * from table where id = 1 and pwd = 1;
>     	modelName.objects.filter( id= 1, pwd = 1 )
> 
> SQL) select * from table where id = 1 or pwd = 1;
>     	modelName.objects.filter( Q(id= 1) | Q(pwd = 1) )
> 
> SQL) select * from table where subject like '%공지%' ;
>         modelName.objects.filter(subject__icontains='공지')
> 
> SQL) select * from table where subject like '공지%' ;
>     	modelName.objects.filter(subject__startswith='공지')
> 
> SQL) select * from table where subject like '%공지' ;
>     	modelName.objects.filter(subject__endswith='공지')
> 
> SQL) insert into table values ('') ;
> 		model(변수 = value, 변수 = value ....)
>     	model.save()
> 
> SQL) delete * from table where id = 1 ;
>     	modelName.objects.get(id=1).delete()
> 
> SQL) update table set attr = value where id = 1 ;
>     	obj = modelName.objects.get(id=1)
>     	obj.attr = value
> 		obj.save()
> ```
>
> 