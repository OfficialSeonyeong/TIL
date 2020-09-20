# html



###### 비정형 데이터 수집

* 크롤링(동적 페이지, 브라우저 제어- 셀런)
* 스크래핑(정적 페이지,브라우저 제어-BS)



##### Front-End(Client-side)

* browser(html)
* .jsp  .asp  .php
* bootstrap(반응형 웹)
* Presentation Layer(로직 X)



##### Back-End(Server-side)

* Web Server(정적인 페이지)
* Web Application Server(WAS) - 동적인 페이지
* jsp, servlet, applet, nodeJS
* C#, Django, Flask -> MVT, MCT Framework
* Business Layer(로직 O), Persistence Layer(DB)



> * method 는 "post" or "get"
> * 개행은 \<br/>, \<p/>
> * space는 \&nbsp;
> * 주석은 <!--   -->, //
> * submit 타입의 input을 실행했을 때, "naver.html"로 이동한다.
> * nginx웹 서버 이용 : file:///C:/nginx-1.18.0/html/(파일명).html  

```html
  <!-- script -->
  </script>

 </head>
 <body>
  <form action="naver.html" method="get">
		<input type="text" name="id" id="id"><br/>
		<input type="submit" value="SEND">
  </form>

  <hr/>    <!-- 구분선 의미 -->

  <a href="naver.html">네이버</a>

 </body>
</html>
```



> * script에 **jquery** 이용 (head부분에 src 링크로 jquery를 import)

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

 </head>

 <body>
  <ul id='list'></ul>

  <script>
		jsonAry = [{ url : 'www.google.com' , txt : '구글'} ,
				   { url : 'www.daum.com' , txt : '다음'} ,
				   { url : 'www.kakao.com' , txt : '카카오'} ,
				   { url : 'www.seonyeong.com' , txt : '선영'} ,
				   { url : 'www.tory.com' , txt : '토리'} ]


	$(document).ready(function() {
			$.each(jsonAry , function(idx, obj) {
				$('#list').append("<li><a href='"+obj.url+"'>"+obj.txt+"</a></li>")
			});

			$('li:even').css('background' , 'lightgray').css('font-weight' , 'bold')
			$('li:odd').css('background' , 'lightblue')


		})

	
  </script>

 </body>

</html>
```

![캡처](C:\Users\A\Desktop\캡처1.PNG)



##### 자동차 제조사, 차종 선택지 페이지 만들기

> * jquery 이용
> * 'navigation.css' 파일 이용

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>

    <link href="./css/navigation.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

 </head>
 <body>
   <ul>
      <li><a  id="python">Python</a></li>
	  <li><a href="#" id="r">RStudio</a></li>
	  <li><a href="#" id="django">Django</a></li>
	  <li><a href="#" id="jquery">jQuery</a></li>
   </ul>

	<hr/>
   <label>제조사</label>
   <select id='maker'>
   	<option>[선택하세요]</option>
	<option>BMW</option>
	<option>AUDI</option>
	<option>BENS</option>
   </select>
   <label>차종</label>
      <select id='model'>
   	<option>[선택하세요]</option>
   </select>
   <button id='searchBtn'>SEARCH</button>


  <script>
	bmwAry = ['320d','520d','740d','미니'] ;
	audiAry = ['R8','A3','A4','A5','A6','Q5'] ;
	bensAry = ['e450','s600','amg gt','B200'] ;

	function displayModel(ary) {
		$('#model').empty();
		$.each(ary, function(idx, obj){
			$('#model').append("<option>"+obj+"</option>")
		})
	}

	$(document).ready(function(){
		$("#python").click(function(){
			location.href='www.naver.com';
		})
		$('#maker').change(function() {
			// val(), text() : 텍스트
			//window.alert($('#maker').val());
			if ($('#maker').val() =='BMW') 
			{ displayModel(bmwAry)
			}
			if ($('#maker').val() == 'AUDI')
			{displayModel(audiAry)
			}
			if ($('#maker').val() == 'BENS')
			{displayModel(bensAry)
			}
		})
	}) ;

  </script>
 </body>
</html>

```

> css파일
>
> ```css
> a {
> text-decoration : none ;
> 
> }
> 
> ul{
>    list-style : none ;
>    overflow : hidden ;
> }
> 
> li {
> 	float : left ;
> }
> 
> ul >li > a {
> 	display : block ;
> 	background : red ;
> 	border : 1px solid black ;
> 	color : white ;
> 	padding : 10px 20px
> }
> ```

<img src="C:\Users\A\TIL\01_html.assets\캡처-1600589276117.PNG" alt="캡처" style="zoom:80%;" />





##### D3.js 라이브러리 이용하기01

> * D3 기능 : text(), append(), insert(), remove(), html(), attr(), property(), style(), classed()

```html
 </head>
 <body>

	<div>
		<p></p>
	</div>

	<p><label>D3 <input type='checkbox'/></p>
	<p><label>JQuery <input type='checkbox'/></p>

	<script>
		d3.select('div > p').text('this is sample text')
		d3.select('div').append('p').text('dynamic text append')
		d3.select('div').insert('p')
		//d3.select('div').remove()
		d3.select('body').append('div').append('p').html('<span>This is new inner html</span>')
		d3.select('div >p>span').attr('class','error')
		d3.select('input').property('checked', true)
	</script>

 </body>
</html>
```

<img src="C:\Users\A\TIL\01_html.assets\캡처.PNG" alt="캡처" style="zoom:50%;" />



##### D3.js 라이브러리 이용하기02

```html
</head>
 <body>
	<p></p>
	<p></p>
	<p></p>

	<div>
	<p> Error: This is Error</p>
	<p> Warning: This is Warning</p>
	</div>

	<script>
	data = [100,200,300]

	d3.select('body').selectAll('p').data(data).text(function(d, idx){
		console.log('index: '+idx)
		console.log('data: '+d)
		console.log('this: '+this)
		return d
	})

	d3.selectAll('div > p').style('color', function(d, idx) {
		txt = this.innerText;
		//window.alert(txt)
		if(txt.indexOf('Error') >= 0) {
			return 'red';
		}
		
		if(txt.indexOf('Warning') >= 0) {
			return 'blue';
		}

	})
	</script>
 </body>
</html>
```

<img src="C:\Users\A\Desktop\캡처02.PNG" alt="캡처" style="zoom:50%;" />





##### D3.js 라이브러리 이용하기03

> * event 만들기 : d3.select( ' ' ).on(eventName, function( ){ })

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>

  <style>
	div{
		height : 100px;
		width : 100px;
		background-color : blue;
		margin : 5px;

	}
  </style>
 </head>
 <body>
 	<div></div>
	<hr/>
	<div id='container'></div>
	<script>
	d3.select('div').on('mouseover',function(){
		d3.select(this).style('background-color', 'orange');
		console.log(d3.event)
		console.log(d3.mouse(this))
	})
	.on('mouseout', function(){
		d3.select(this).style('background-color', 'blue');
		console.log(d3.event)
		console.log(d3.mouse(this))
	})

	t=d3.transition().duration(5000)

	d3.select('#container')
	.transition(t)
	.style('background-color', 'red')
	</script>
 </body>
</html>

```





##### D3.js 라이브러리 이용하기04

> * Animation 만들기

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>
 </head>
 <body>

 	<script>
	//svg - 시각화를 위한 태그 영역
	svg = d3.select('body')
			.append('svg')
			.attr('width',500)
			.attr('height',500)

	bar1 = svg.append('rect')
				.attr('fill','red')
				.attr('x', 100)
				.attr('y',20)
				.attr('height', 20)
				.attr('width', 10)

	bar2 = svg.append('rect')
				.attr('fill','red')
				.attr('x', 120)
				.attr('y',20)
				.attr('height', 20)
				.attr('width', 10)

	update()

	function update() {
		bar1.transition()
			.ease(d3.easeLinear) // 도형이 길어진다.
			.duration(2000)
			.attr('height',100)
		bar2.transition()
			.ease(d3.easeLinear)
			.duration(2000)
			.delay(2000) // 해당 시간만큼 기다렸다가 실행
			.attr('height',100)

	}
	</script>
  
 </body>
</html>
```



##### D3.js 라이브러리 이용하기05

>* data(), enter(), exit(), datum()

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>

  <script src='https://d3js.org/d3.v4.min.js'></script>

 </head>
 <body>
	<p></p>
	<p></p>
	<p></p>

  	<script>
		myData = [100, 200, 300]
		d3.selectAll('p')
		.data(myData)
		.text(function(d, idx){
			return d ;
		})

		data = [1,2,3,4,5]
		d3.select('body')
		  .selectAll('span')
		  .data(data)
		  .enter()
		  .append('span')
		  //.text(function(d, idx){
			//console.log(idx)
			//return d ;
		 // })
		 .style('color', function(d){
			if(d%2==0){
				return 'green';
			} else{
				return 'red';
			}
		 })
		 .text(function(d, idx){
			return d ;
		  })
	</script>
 </body>
</html>
```

<img src="C:\Users\A\TIL\01_html.assets\캡처03.PNG" alt="캡처03" style="zoom:50%;" />



##### D3.js 라이브러리 이용하기06

> * Matrix(table) 만들기

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>
 </head>
 <body>
  
  <script>
	matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]];

	tr = d3.select('body')
	.append('table')
	.selectAll('tr')
	.data(matrix)
	.enter()
	.append('tr') ;

	td = tr.selectAll('td').data(function(d){
		console.log(d)
		return d ;
	}).enter().append('td').text(function(d){
		console.log(d)
		return d ;
	})

  </script>
 </body>
</html>
```





##### D3.js 라이브러리 이용하기07

> * 데이터 로드하기

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>

 </head>
 <body>
  
  <script>
	//csv(), json(), tsv(), xml()
	d3.csv('./data/info.csv', function(data){

		//console binding
		for(var i=0 ; i<data.length ; i++){
			console.log(data[i].name)
			console.log(data[i].age)
		}

		//view binding
		d3.select('body')
		  .selectAll('p')
		  .data(data)
		  .enter()
		  .append('p')
		  .text(function(d){
			return d.name + ","+d.age
		  })

		  //table binding
		columns = ['name','age']
		tabulate(data,columns)

	})
	tabulate = function (data,columns) {
    
	table = d3.select('body').append('table')
	thead = table.append('thead')
	tbody = table.append('tbody')

	thead.append('tr')
	     .selectAll('th')
	     .data(columns)
	     .enter()
	     .append('th')
	     .text(function (d) { return d })

	rows = tbody.selectAll('tr')
	            .data(data)
	            .enter()
	            .append('tr')

	cells = rows.selectAll('td')
	    .data(function(row) {
	    	return columns.map(function (column) {
	    		return { column: column, value: row[column] }
	      })
      })
      .enter()
      .append('td')
      .text(function (d) { return d.value })

		return table;
    }


  </script>
 </body>
</html>
```



> * 데이터 로드하기(Json파일)

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>
 </head>
 <body>
  
  <script>
	d3.json('./data/names.json', function(data){
		d3.select('body')
		  .selectAll('p')
		  .data(data)
		  .enter()
		  .append('p')
		  .text(function(d){
			return d.name +","+d.age+","+d.city;
		  })
	})
  </script>
 </body>
</html>
```





##### D3.js 라이브러리 이용하기08

> * Bar Chart 그리기

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <script src='https://d3js.org/d3.v4.min.js'></script>

  <title>Document</title>
 </head>
 <body>


  
  <script>
	//SVG 태그를 활용해서 시각화를 지원한다.
	//<rect>,<line>,<circle>,<text>
	width = 500;
	height = 500;

	svg = d3.select('body')
			.append('svg')
			.attr('width', width)
			.attr('height', height)
      
	/*svg.append('line')
		.attr('x1', 100)
		.attr('x2', 500)
		.attr('y1', 50)
		.attr('y2', 250)
		.attr('stroke', 'black') */

	/*svg.append('circle')
		.attr('cx', 250)
		.attr('cy', 50)
		.attr('r', 50) */

	/*svg.append('ellipse')
		.attr('cx',250)
		.attr('cy',50)
		.attr('rx', 150)
		.attr('ry',50) */

		g=svg.append('g')
			 .attr('transform', function(d, i){
				return 'translate(0,0)'
			 })
		ellipse = g.append('ellipse')
					.attr('cx',250)
					.attr('cy',50)
					.attr('rx', 150)
					.attr('ry',50)
		g.append('text')
		 .attr('x',150)
		 .attr('y', 50)
		 .attr('stroke', 'white')
		 .text('문자열 각인')

  </script>
 </body>
</html>
```

