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
    path('bbs_registerForm/', views.bbsRegisterForm, name = 'bbs_registerForm'),
    path('bbs_register/', views.bbsRegister, name='bbs_register'),
    path('bbs_read/<int:id>', views.bbsRead, name='bbs_read'),
    path('bbs_remove/', views.bbsRemove, name='bbs_remove'),
    path('bbs_modifyForm/', views.bbsModifyForm, name='bbs_modifyForm'),
    path('bbs_modify/', views.bbsmodify, name='bbs_modify'),
    path('bbs_search/', views.bbsSearch, name='bbs_search'),
    path('csvToModel/', views.csvToModel, name='csvToModel'),
    path('attachCsv/', views.csvUpload, name='attachCsv'),
]
```



##### BbsApp 의 views.py

```python
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import *

# Create your views here.

def loginForm(request) :
        if request.session.get('user_id'):
        context = {'id':request.session['user_id'],
                   'name':request.session['user_name'] }
        return render(request, 'home.html', context)
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

def bbsRegisterForm(request):
    context = {'name': request.session['user_name'],
               'id': request.session['user_id'] }
    return render(request, 'bbsRegisterForm.html', context)

def bbsRegister(request):
    if request.method == 'GET':
        return redirect('bbs_registerForm')
    elif request.method == 'POST':
        title = request.POST['title']
        content = request.POST['content']
        writer = request.POST['writer']

        board = Bbs(title = title, content = content, writer = writer)
        board.save()

        return redirect('bbs_list')
    
def bbsRead(request, id) :
    print('param - ', id)

    read = Bbs.objects.get(id=id)

    # viewcnt update
    read.viewcnt = read.viewcnt + 1
    read.save()

    print('read result - ', read)
    context = {'read': read,
               'name': request.session['user_name'],
               'id': request.session['user_id']}

    return render(request, 'read.html', context)


def bbsRemove(request):
    id= request.POST['id']
    Bbs.objects.get(id = id).delete()

    return redirect('bbs_list')

def bbsModifyForm(request):
   id= request.POST['id']
   board = Bbs.objects.get(id=id)

   content ={ 'board' : board,
    'name': request.session['user_name'],
    'id': request.session['user_id']
   }

   return render(request, 'modify.html', content)

def bbsmodify(request):
    id = request.POST['id']
    print(id)
    board = Bbs.objects.get(id=id)

    board.title = request.POST['title']
    board.content = request.POST['content']
    board.save()

    return redirect('bbs_list')

def bbsSearch(request):
    print('--------------- ajax json bbsSearch')
    type = request.POST['type']
    keyword = request.POST['keyword']
    print('type: ',type, '/ keyword : ',keyword)

    if type =='title':
        boards = Bbs.objects.filter(title__startswith=keyword)
        boards = Bbs.objects.filter(title__endswith=keyword)
        boards = Bbs.objects.filter(title__icontains=keyword)
    if type == 'writer':
        boards = Bbs.objects.filter(writer__startswith=keyword)
        boards = Bbs.objects.filter(writer__endswith=keyword)
        boards = Bbs.objects.filter(writer__icontains=keyword)
    print("ajax -- result : ", boards)

    data =[]
    for board in boards :
        data.append({'id':board.id,
                     'title': board.title,
                     'writer': board.writer,
                     'regdate': board.regdate,
                     'viewcnt': board.viewcnt})

    return JsonResponse(data, safe=False)
    # return HttpResponse(json.dumps(dict), content_type='application/json')
    
def csvToModel(request):
    path = 'c:/csv_multicam/seops.csv'
    file = open(path)
    reader = csv.reader(file)
    print('----',reader)
    list=[]
    for row in reader:
        print(row)
        list.append(Seops(name=row[0], img=row[1], status=row[2]))

    Seops.objects.bulk_create(list)
    Seops.objects.values()
    return HttpResponse('create model~~')

def csvUpload(request):
    file = request.FILES['csv_file']
    print('------', file)
    if not file.name.endswith('.csv'):
        return redirect('loginForm')
    result_file = file.read().decode('utf-8').splitlines()
    print('result file', result_file)

    reader = csv.reader(result_file)
    list=[]
    for row in reader:
        print('-------', row)
        list.append(Seops(name=row[0], img=row[1], status=row[2]))
    file.close()
    Seops.objects.bulk_create(list)
    return redirect('loginForm')
```

> ajax 와 json 사용 시, render(), redirect() 사용 불가



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

class Seops(models.Model):
    name = models.CharField(max_length=50)
    img = models.CharField(max_length=50)
    status = models.CharField(max_length=50)

    def __str__(self):
        return self.name+" & "+self.img+" & "+self.status
```

> 이후, admin.py에 class명 등록과 DB테이블 형태로 바꾸는 명령어 수행



##### BbsApp 의 list.html

```html

...

<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>
				<div class='box-body'>
					<select id="searchType">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" id="searchKeyword">
					<button id='searchBtn'>search Board</button>
					<button id='newBtn'>New Board</button>
				
				</div>
			</div>

...

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
		<td><a href="{% url 'bbs_read' id=board.id %}">{{board.title}}</a></td>
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

...

<script>
	$(document).ready(function() {
		$('#newBtn').click(function(){
			location.href = '../bbs_registerForm'
		})
        $('#searchBtn').click(function(){
			//alert($('#searchType').val())
			//alert($('#searchKeyword').val())
			$('#tbody').empty()
		// ajax 통신 - json
			$.ajax({
				url : "{% url 'bbs_search' %}",
				type : "post",
				dataType : "json",
				data : {'csrfmiddlewaretoken': '{{csrf_token}}',
						type : $('#searchType').val(),
						keyword : $('#searchKeyword').val()},
				success : function(data) {
					var txt = "";
				$.each(data , function(idx, obj) {
					txt +="<tr><td>"+obj.id+"</td>" ;
					txt +="<td><a href=../bbs_read/"+obj.id+">"+obj.title+"</a></td>";
					txt +="<td>"+obj.writer+"</td>";
					txt +="<td>"+obj.regdate+"</td>";
					txt +="<td><span class='badge bg-red'>"+obj.viewcnt+"</span></td></tr>" ;
				});
				$("#tbody").append(txt);

				}
            })
        })
	})

</script>

```



##### BbsApp 의 read.html

```html

...

<form role="form" method="post" id="removeFrm">
	{% csrf_token %}
	<input type='hidden' name='id' value="{{read.id}}">

</form>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label> <input type="text"
			name='title' class="form-control" value="{{ read.title }}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">{{ read.content }}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="writer" class="form-control" value="{{ read.writer }}"
			readonly="readonly">
	</div>
</div>
<!-- /.box-body -->

<div class="box-footer">
	{% if id == read.writer %}
	<button type="submit" class="btn btn-warning">Modify</button>
	<button type="submit" class="btn btn-danger">Remove</button>
	{% endif %}
	<button id= "listBtn" type="submit" class="btn btn-primary">LIST ALL</button>
</div>


<script>
				
$(document).ready(function(){
	$('#listBtn').click(function(){
		location.href = '../bbs_list' ;
	})
	$('.btn-danger').click(function(){
		$('#removeFrm').attr('action', '../bbs_remove/');
		$('#removeFrm').submit();
	})
    $('.btn-warning').click(function(){
		$('#removeFrm').attr('action', '../bbs_modifyForm/');
		$('#removeFrm').submit();
	})
});

</script>

...


```



##### BbsApp 의 modify.html

```html

...

<form id="modifyFrm" role="form" method="post" action="{% url 'bbs_modify' %}">
	<div class="box-body">
		{% csrf_token %}
		<div class="form-group">
			<label for="exampleInputEmail1">ID</label> <input type="text"
				name='id' class="form-control" value="{{ board.id }}"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> <input type="text"
				name='title' class="form-control" value="{{ board.title }}">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3">{{ board.content }}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> <input
				type="text" name="writer" class="form-control"
				value="{{ board.writer }}"
				readonly="readonly">
		</div>
	</div>
	<!-- /.box-body -->
</form>


<div class="box-footer">
	<button type="submit" class="btn btn-primary">MODIFY</button>
	<button type="submit" class="btn btn-warning">CANCEL</button>
</div>

<script>
	$(document).ready(function() {
		$('.btn-primary').click(function(){
			$('#modifyFrm').submit()
		})
		$('.btn-warning').click(function(){
			location.href='../bbs_list'
		})
	});
</script>

...

```



##### BbsApp 의 home.html

```html

...

			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Home Page</h3>
				</div>
				<div class=""box-body">
					<form method="post" action="{% url 'attachCsv' %}" enctype="multipart/form-data">
						{% csrf_token %}
						<div class="form-group">
							<label>.csv 파일 업로드해 주세요.</label>
							<input type="file" class="form-control" name="csv_file">
						</div>
						<button type="submit" class="btn btn-info">등록</button>
					</form>
			</div>
				<div class="'box-footer">
					* 파일 업로드 *
				</div>
				<!-- /.box-header -->
			</div>
			<!-- /.box -->
                      
...
                             
```





###### Views.py 의 응답 방식

> 1. **HttpResponse()** : 바로 client에게 Response
> 2. **render(request, templates, context)** 
>    * forword 방식 : templates 이동
>    * context에 데이터를 심으면 해당 url에서만 사용가능
>    * cf) session에 심으면 여러 페이지에서 공유 가능
> 3. **redirect()** : 새로운 request url 요청

