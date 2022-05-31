<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/date.css" />
<script src="<%=request.getContextPath()%>/js/date.js"></script>
<title>숙소 리스트</title>
<style>

div.help {
border-radius: 2em;
	  width : 280px;
  border: 1px solid orange;
	height: 330px;
	float: right;
	font-size: 1.5rem;
	margin-right: 150px;
	padding: 18px 8px 2px 8px
}

div.right {
	margin-top:100px;
	float: left;
	margin-left: 350px;
}

h2 {
	font-size: 15px;
}

.star-rating {
	width: 140px;

}

.star-rating, .star-rating span {
	display: inline-block;
	height: 24px;
	overflow: hidden;
	background: url(img/star.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 5;
	vertical-align: top;
}

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

.title1 {
	margin-top: 0rem;
	font-family: 'GmarketSansBold';
	font-size: 3.6rem;
	color: #E35E0A;
	
	hight: 9px;
}
.title2 {
	margin-left: 5rem;
	font-family: 'GmarketSansBold';
	font-size: 2.6rem;
	color: #E35E0A;
	width:150px;
	hight: 9px;
}

.hplink {
	font-family: 'GilbeotRainbow';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/GilbeotRainbow.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

table {
	font-size: 1.6rem;
	width: 1000px;

}
th{
font-family: 'GmarketSansBold';
   font-size:2rem;
   color:#E8894F;
   text-align:center;
}

th, td {
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

div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.help {position:absolute;width:90px;top:30%;margin-top:-50px;right:10px;background:#fff;}
.help ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.help ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.help ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;text-align:center;color:#999;font-size:9.5pt;}
.help ul li a:hover {color:#000;}
.help ul li:last-child {border-bottom:0;}
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
	<div class="all">
		<div class="help">
			<form align=center method="get"
				action="<%=request.getContextPath()%>/type_list.do">
				<div class="title2">검색 도우미</div>
				<p>
					체크인 : <input type="text" id='startDate' name='startDate'
						value="${camsel.startDate}">
						</p>
					<p>
					 체크아웃 : <input type="text"
						id='endDate' name='endDate' value="${camsel.endDate}">
				</p>
				<p>
					인원 : <input type=text name="memcount" id="memcount"
						value="${camsel.memcount}">
				</p>
				<p>
					지역 : <select id="loc" name="loc">
						<option value="0">선택하세요.</option>
						<option value="서울"
							<c:if test="${camsel.loc=='서울'}">selected</c:if>>서울</option>
						<option value="천안"
							<c:if test="${camsel.loc=='천안'}">selected</c:if>>천안</option>
						<option value="대전"
							<c:if test="${camsel.loc=='대전'}">selected</c:if>>대전</option>
					</select>
				<p>
				<p>
					여행 종류 : <select id="type" name="type">
						<option value="">선택하세요.</option>
						<option value="캠핑"
							<c:if test="${camsel.type=='캠핑'}">selected</c:if>>캠핑</option>
						<option value="차박"
							<c:if test="${camsel.type=='차박'}">selected</c:if>>차박</option>
						<option value="글램핑"
							<c:if test="${camsel.type=='글램핑'}">selected</c:if>>글램핑</option>
						<option value="카라반"
							<c:if test="${camsel.type=='카라반'}">selected</c:if>>카라반</option>
					</select>
				<p>
					<input type="submit" class="myButton" value="검색">
				</p>
			</form>
		</div>
		<div class="right" align=center>
			<div class="container" style="width: 1100px;" align=center>
				<div class="title1">(검색 내용) | 인원 : ${memcount} | 지역 : ${loc} |
					캠핑타입 : ${type}</div>
				<table border=1 class="table" width=700 align=center>
					<thead>
						<tr class="cent">
							<th>이미지</th>
							<th>이름</th>
							<th>별점평균</th>
							<th>기준인원</th>
							<th>최대인원</th>
							<th>기본금액</th>
							<th>예약가능여부</th>
						</tr>
					</thead>
					<!-- 화면출력 번호 -->
					<c:forEach var="s" items="${spotlist}">
						<tr>
							<td><img
								src="<%=request.getContextPath() %>/campupload/${s.image}"
								height="300" width="300" /></td>
							<td style =' vertical-align : middle '>
								<input type="button" class="myButton" value="${s.sp_name}"
					style="font-size:1em;" onclick="location.href='spotview.do?loc=${loc}&type=${type}&startDate=${camsel.startDate}&endDate=${camsel.endDate}&memcount=${memcount}&sp_no=${s.sp_no}' ">
									
									</td>

							<td style =' vertical-align : middle '>
								<h2>평점 : ${s.sp_staravg}</h2>
								<div class='star-rating'>
									<span
										style="width: <fmt:formatNumber value="${s.sp_staravg/5}" type="percent"/>"></span>
								</div>

							</td>
							<td style =' vertical-align : middle '>${s.standard_num}</td>
							<td style =' vertical-align : middle '>${s.max_num}</td>
							<td style =' vertical-align : middle '>${s.price}</td>
							<td style =' vertical-align : middle '><c:if test="${s.reservecheck == 1}">
									<span style="color: red">!해당일 마감!</span>
								</c:if> <c:if test="${s.reservecheck == 0}">
									<span style="color: blue">!예약가능!</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>