from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse

from .models import *

# Create your views here.

def index(request) :
    # select * from table ; == modelName.objects.all()

    # select * from table where id = 1 ; == modelName.objects.filter( id= 1 )

    # select * from table where id = 1 and pwd = 1;
    # == modelName.objects.filter( id= 1, pwd = 1 )

    # select * from table where id = 1 or pwd = 1;
    # == modelName.objects.filter( Q(id= 1) | Q(pwd = 1) )

    # select * from table where subject like '%공지%' ;
    # == modelName.objects.filter(subject_icontains='공지')

    # select * from table where subject like '공지%' ;
    # == modelName.objects.filter(subject_startswith='공지')

    # select * from table where subject like '%공지' ;
    # == modelName.objects.filter(subject_endswith='공지')

    # insert into table values ('') == model(변수 = value, 변수 = value ....)
    # + model.save()

    # delete * from table where id = 1 ;
    # == modelName.objects.get(id=1).delete()

    # update table set attr = value where id = 1 ;
    # == obj = modelName.objects.get(id=1)
    # + obj.attr = value + obj.save()

    lists = Question.objects.all()
    print("-"*50)
    print(lists)
    print("-" * 50)
    context = {'lists' : lists}
    return render(request, 'polls/index.html', context)
    # return HttpResponse('테스트 링크 잘됩니다.')

def choice(request, question_id) :
    print('param question_id', str(question_id))
    lists = get_object_or_404(Question, pk=question_id)
    print("-"*100)
    print(lists)
    print("-" * 100)

    context = {'clist': lists}
    return render(request, 'polls/choice.html', context)

def vote(request) :
    choice = request.POST['choice']
    question_id = request.POST['question_id']
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

