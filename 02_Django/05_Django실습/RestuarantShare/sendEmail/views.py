from django.core.mail import EmailMessage, send_mail
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.template.loader import render_to_string
from django.urls import reverse
from shareRes.models import *
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
# Create your views here.


def sendEmail(request):
    try:
        checked_list = request.POST.getlist('checks')
        inputReceiver = request.POST['inputReceiver']
        inputTitle = request.POST['inputTitle']
        inputContent = request.POST['inputContent']
        # print(checked_list,"-",inputReceiver,"-",inputTitle,"-",inputContent)

        # 사용자가 선택한 맛집과 인사말을 이용해 이메일 본문 작성
        restaurants =[]
        for id in checked_list:
            restaurants.append(Restaurant.objects.get(id=id))

        content = {'inputContent':inputContent, 'restaurants':restaurants}
        msg_html=render_to_string('sendEmail/email_format.html', content)

        msg = EmailMessage(subject=inputTitle, body=msg_html, from_email="tjdcnsgid96@khu.ac.kr", bcc=inputReceiver.split(','))
        msg.content_subtype='html'
        msg.send()
        return render(request, 'sendSuccess.html')
    except:
        return redirect('index')

