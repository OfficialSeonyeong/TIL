from django.shortcuts import render, HttpResponse
from .models import *

# Create your views here.

def index(request) :   #HttpResponse는 혼자 바로 응답, render는 템플릿 통해 응답
    # return HttpResponse('<div align=center>섭이와 함께하는 장고</div>')
    return render(request, 'hello/index.html')

def hi(request) :
    context = {'ment' : '여기까지 잘되시나요?'}
    return render(request, 'hello/ok.html',context)

def login(request) :
    # if request.method == 'GET':
    #    id = request.GET['id']
    #    pwd = request.GET['pwd']

    #    context = {'id': id, 'pwd': pwd}
    #    return render(request, 'hello/success.html', context)

    if request.method == 'POST':
        id = request.POST['id']
        pwd = request.POST['pwd']

        user = TestUser.objects.get(user_id = id)
        context = {}
        if user is not None :
            context['user'] = user
        return render(request, 'hello/success.html', context)


        #context = {'id': id, 'pwd': pwd }
        #return render(request, 'hello/success.html', context)