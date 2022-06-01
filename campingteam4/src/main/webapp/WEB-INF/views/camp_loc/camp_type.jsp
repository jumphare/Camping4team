<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
	font-size: 10px;
}

@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.title {
	margin-top: 3rem;
	font-family: 'GmarketSansBold';
	font-size: 3.2rem;
	color: #E35E0A;
	margin-bottom: 1rem;
}

table {
	font-size: 1.6rem;
}

th, td {
	text-align: center;
	vertical-align: middle;
}

a {
	color: #000;
}

a:hover {
	text-decoration: none;
}

.myButton {
	box-shadow: inset 0px 1px 0px 0px #fce2c1;
	background: linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
	background-color: #ffc477;
	border-radius: 6px;
	border: 1px solid #eeb44f;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 20px;
	font-weight: bold;
	padding: 6px 25px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #cc9f52;
}

.myButton:hover {
	background: linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
	background-color: #fb9e25;
	
}

.myButton:active {
	position: relative;
	top: 1px;
}
.image{
	border-radius:10%;
}

.carover{
	content:url("img/carbak.jpg")
}
.imageGallery{
	width:1350px;
	margin:auto;

	
}
.container{
width:200%;
}
</style>

</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>
	<div class="container" align="center">
		<div class="title">캠핑 타입을 선택해주세요</div>
		<form method="post"
			action="<%=request.getContextPath()%>/type_list.do?loc=${loc}&startDate=${startDate}&endDate=${endDate}&memcount=${memcount}">
			<input type="submit" class="myButton" id="cam" name="type" value="캠핑">
			<input type="submit" class="myButton" id="car" name="type" value="차박">
			<input type="submit" class="myButton" id="gram" name="type"
				value="글램핑"> <input type="submit" class="myButton" id="cara"
				name="type" value="카라반">
		</form>
			
	</div>
	<br>
	<div class="imageGallery" align="center">
				<img src="img/camping.jpg" class="image" width=650 height=500 border-radius=3>
				<img src="img/carbak.jpg" class="image" width=650 height=500> <img
					src="img/gramping.jpg" class="image" width=650 height=500> <img
					src="img/caraban.png" class="image" width=650 height=500>
			</div>
		
</body>
</html>