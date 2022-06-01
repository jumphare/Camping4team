<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>숙소 리스트</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <style>

div.help {
border-radius: 2em;
	  width : 280px;
  border: 1px solid orange;
	height: 330px;
	float: right;
	font-size: 1.5rem;
	margin-right: 90px;
	padding: 18px 8px 2px 8px
}
div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.help {position:absolute;width:90px;top:30%;margin-top:-50px;right:10px;background:#fff;}
.help ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.help ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.help ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;text-align:center;color:#999;font-size:9.5pt;}
.help ul li a:hover {color:#000;}
.help ul li:last-child {border-bottom:0;}

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
  html { font-size:10px; } 
  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  .title{
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  .hplink{
    font-family: 'GilbeotRainbow';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/GilbeotRainbow.woff') format('woff');
    font-weight: normal;
    font-style: normal;

  }
  
  table{
  font-size:1.6rem;
  top-margin:100px;
  }
  
   th, td{

    text-align: center;
    vertical-align : middle;
    } 

a{
color: #000;
}
a:hover{
text-decoration:none;
}
.title2 {
	margin-top: 0rem;
	font-family: 'GmarketSansBold';
	font-size: 2.6rem;
	color: #E35E0A;
	width:150px;
	hight: 9px;
}

  </style> 
<script>
$(document).ready(function(){
	  var currentPosition = parseInt($(".help").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".help").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});

</script>
</head>

<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>
<div class="container" >
<div class="title">캠핑장 관리</div>

<input type="button" class="myButton" style="font-size:2em;" value="캠핑장 등록" onclick="location.href='spotwriteform.do' ">
	<table class="table" border=1 align=center>
		<caption>목록</caption>
		
		<tr>
			<th>이미지 </th>
			<th>이름</th>
			<th>지역</th>
			<th>종류</th>	
		</tr>
		<!-- 화면출력 번호 -->
		<c:forEach var = "s" items="${spotlist}">
		<tr>
			<td>
			<img src="<%=request.getContextPath() %>/campupload/${s.image}" height="200" width="200" />
			</td>
			<td>
				<input type="button" class="myButton" value="${s.sp_name}"
					style="font-size:1em;" onclick="location.href='spotview.do?&sp_no=${s.sp_no}' ">
			</td>
			<td>
			<c:if test="${s.camp_no == 1}">
				서울
			</c:if>
			<c:if test="${s.camp_no == 2}">
				천안
			</c:if>
			<c:if test="${s.camp_no == 3}">
				대전
			</c:if>
			</td>
			<td>${s.type}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>