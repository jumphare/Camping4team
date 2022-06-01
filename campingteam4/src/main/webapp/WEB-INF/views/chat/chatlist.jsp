<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>	
		<title>Chat</title>
		<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.contain{
	top-margin : 100px;
}
.title{
  margin-top:1rem;
   font-family: 'GmarketSansBold';
   font-size:2.5rem;
   color:#E35E0A;
   margin-bottom:1rem;
   margin-left:87px;
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
</style>
	</head>

	<body>
	<div class="title">${id}님의 채팅</div>
	<div class="contain" align=center>
		<form method="post" action="<%=request.getContextPath()%>/chat.do">
		<input type ="submit" class="myButton" id="loc" name ="loc" value="서울"><br><br>
 		<input type ="submit" class="myButton" id="loc" name ="loc" value="대전"><br><br>
 		<input type ="submit" class="myButton" id="loc" name ="loc" value="천안"><br><Br>
		</form>
	</div>
	</body>
	

</html>
