from django.shortcuts import render

# Create your views here.
def intro(request):
    return render(request, 'chart_index.html')

def line(request) :
    seoul = [7.0, 6.9, 9.5, 14.5, 7.0, 6.9, 9.5, 14.5, 7.0, 6.9, 9.5, 14.5]
    london = [6.0, 3.9, 6.5, 11.5, 12.0, 12.9, 8.5, 7.5, 8.0, 9.9, 6.5, 12.5]

    context = {'seoul' : seoul, 'london' : london}
    return render(request, 'chart_line.html',context)

def bar(request):
    y1800 = [107, 31, 635, 203, 2]
    y1900 = [133, 156, 947, 408, 6]
    y2000 = [814, 841, 3714, 727, 31]
    y2016 = [1216, 1001, 4436, 738, 40]
    content = {'y1800': y1800, 'y1900' : y1900, 'y2000' : y2000, 'y2016' : y2016}
    return render(request, 'chart_bar.html', content)


def wordcloud(request):
    txt = '나는 선영 입니다. 선영 이는 현재 장고 공부하고 있습니다. 옆에 장고 책도 있습니다.'
    content = {'txt' : txt}
    return render(request, 'chart_wordcloud.html', content)

def ajax(request):
    return render(request, 'chart_ajax.html')

