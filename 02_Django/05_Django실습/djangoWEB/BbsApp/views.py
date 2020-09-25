from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from .models import *
import json
import csv

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
            request.session['user_id'] = user.user_id
            context['name'] = request.session['user_name']
            context['id'] = request.session['user_id']

    return render(request, 'home.html', context)

def logout(request) :
    request.session['user_name'] = {}
    request.session['user_id'] = {}
    request.session.modified =True

    return redirect('loginForm')

def list(request) :
    boards = Bbs.objects.all()
    print('boards result - ', type(boards), boards)
    context = {'boards': boards,
               'name': request.session['user_name'],
               'id': request.session['user_id']}
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

# ajax - json : render(), redirect() 사용 불가
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