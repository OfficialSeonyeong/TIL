# Django



### Chart 시각화

###### highchart 참고



##### ChartApp 의 urls.py

```python
from django.contrib import admin
from django.urls import path, include
from ChartApp import views

urlpatterns = [
    path('index/', views.intro, name='index'),
    path('line/', views.line, name='line'),
    path('bar/', views.bar, name='bar'),
    path('wordcloud/', views.wordcloud, name='wordcloud'),
    path('ajax/', views.ajax, name='ajax'),
]
```



##### ChartApp 의 views.py

> 실전에서는 데이터를 외부에서 가져와서 진행

```python
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
```



> html 파일에서 series에 데이터만 교체

##### ChartApp 의 chart_index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <ul>
        <a href="../line"><li>line chart</li></a>
        <a href="../bar"><li>bar chart</li></a>
        <a href="../wordcloud"><li>wordcloud chart</li></a>
        <a href="../ajax"><li>json chart</li></a>
    </ul>
</body>
</html>
```



##### ChartApp 의 chart_line.html

```html

...

<body>
    <figure class="highcharts-figure">
        <div id="container"></div>
        <p class="highcharts-description">
            <center>차트는 가독성과 이해도를 높일 수 있습니다.<b>-Written By Jslim...</b></center>
        </p>
    </figure>
    <script>
        Highcharts.chart('container', {
            chart : { type : 'line'},
            title : { text : '처음으로 그리는 웹 차트'},
            subtitle : { text : 'jslim'},
            xAxis : {
                categories : ['1월', '2월', '3월', '4월', '5월','6월','7월','8월','9월','10월','11월','12월']
            },
            yAxis : {
                title : { text : '온도'}
            },
            plotOptions : {
                line : { dataLabels : { enabled : true }},
                enableMouseTracking : true
            },
            series : [
            {name : 'seoul',
            data : {{ seoul }} },
            {name : 'london',
            data : {{ london }} }]
        })
    </script>
</body>

...

```



##### ChartApp 의 chart_bar.html

```html
...

<body>
    <figure class="highcharts-figure">
      <div id="container"></div>
      <p class="highcharts-description">
        <center>차트는 가독성과 이해도가 높아질 수 있습니다. <b>- Written By Jslim</b></center>
      </p>
    </figure>
    <script>
        var text = "{{ txt }}"    //문자열을 데려올때는 " " 필요
        var lines = text.split(/[,\. ]+/g),
          data = Highcharts.reduce(lines, function (arr, word) {
            var obj = Highcharts.find(arr, function (obj) {
              return obj.name === word;
            });
            if (obj) {
              obj.weight += 1;
            } else {
              obj = {
                name: word,
                weight: 1
              };
              arr.push(obj);
            }
            return arr;
          }, []);

        Highcharts.chart('container', {
          accessibility: {
            screenReaderSection: {
              beforeChartFormat: '<h5>{chartTitle}</h5>' +
                '<div>{chartSubtitle}</div>' +
                '<div>{chartLongdesc}</div>' +
                '<div>{viewTableButton}</div>'
            }
          },
          series: [{
            type: 'wordcloud',
            data: data,
            name: 'Occurrences'
          }],
          title: {
            text: 'Wordcloud of Lorem Ipsum'
          }
        });
    </script>
</body>
...

```



##### ChartApp 의 chart_wordcloud.html

```html
...

<body>
    <figure class="highcharts-figure">
        <div id="container"></div>
        <p class="highcharts-description">
            <center>차트는 가독성과 이해도를 높일 수 있습니다.<b>-Written By Jslim...</b></center>
        </p>
    </figure>
    <script>
        Highcharts.chart('container', {
            chart : { type : 'line'},
            title : { text : '처음으로 그리는 웹 차트'},
            subtitle : { text : 'jslim'},
            xAxis : {
                categories : ['1월', '2월', '3월', '4월', '5월','6월','7월','8월','9월','10월','11월','12월']
            },
            yAxis : {
                title : { text : '온도'}
            },
            plotOptions : {
                line : { dataLabels : { enabled : true }},
                enableMouseTracking : true
            },
            series : [
            {name : 'seoul',
            data : {{ seoul }} },
            {name : 'london',
            data : {{ london }} }]
        })
    </script>
</body>

...

```



##### ChartApp 의 chart_ajax.html

```html
...

<body>
    <figure class="highcharts-figure">
      <div id="container"></div>
      <p class="highcharts-description">
        <center>차트는 가독성과 이해도가 높아질 수 있습니다. <b>- Written By Jslim</b></center>
      </p>
    </figure>
    <script>
        Highcharts.getJSON(
          'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/usdeur.json',
          function (data) {

            Highcharts.chart('container', {
              chart: {
                zoomType: 'x'
              },
              title: {
                text: 'USD to EUR exchange rate over time'
              },
              subtitle: {
                text: document.ontouchstart === undefined ?
                  'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
              },
              xAxis: {
                type: 'datetime'
              },
              yAxis: {
                title: {
                  text: 'Exchange rate'
                }
              },
              legend: {
                enabled: false
              },
              plotOptions: {
                area: {
                  fillColor: {
                    linearGradient: {
                      x1: 0,
                      y1: 0,
                      x2: 0,
                      y2: 1
                    },
                    stops: [
                      [0, Highcharts.getOptions().colors[0]],
                      [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                  },
                  marker: {
                    radius: 2
                  },
                  lineWidth: 1,
                  states: {
                    hover: {
                      lineWidth: 1
                    }
                  },
                  threshold: null
                }
              },

              series: [{
                type: 'area',
                name: 'USD to EUR',
                data: data
              }]
            });
          }
        );

    </script>
</body>

...

```

