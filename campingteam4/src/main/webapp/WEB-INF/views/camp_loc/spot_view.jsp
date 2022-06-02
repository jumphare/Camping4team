<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
h2 {font-size:15px;}
.star-rating {width:140px; }
.star-rating,.star-rating span {display:inline-block;margin-right:39px; height:20px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
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
 .title2{
  
   font-family: 'GmarketSansBold';
   font-size:2rem;
   color:#E8894F;
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
  margin-top:3rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  
  table{
  font-size:1.6rem;
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
</style>
</head>
<body>
<br>
<div class=container>

<div class="title">${spot.sp_name}</div>
<form align=center method=post id="selectdata"
					action="<%=request.getContextPath()%>/reservePage.do">
					<input type="hidden" id="start_date" name="start_date"
						value="${camsel.startDate}"> <input type="hidden"
						id="end_date" name="end_date" value="${camsel.endDate}"> <input
						type="hidden" id="num" name="num" value="${camsel.memcount}">
					<input type="hidden" id="camp_no" name="camp_no"
						value="${spot.camp_no}"> <input type="hidden" id="sp_no"
						name="sp_no" value="${spot.sp_no}"> <input type="submit" class=myButton
						value="예약하러가기"></form>
	<table class=table align=center>
		<caption>상세</caption>
		<tr>
			<td><div class=title2>대표이미지</div></td>
			<td><img
				src="<%=request.getContextPath() %>/campupload/${spot.image}"
				height="300" width="300" /></td>
		</tr>
		<tr>
			<td><div class=title2>장소 이름</div></td>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td><div class=title2>별점</div></td>
			<td>
				<div class="wrap-star">
					<h2>별점 : ${spot.sp_staravg}</h2>
					<div class='star-rating'>
						<span
							style="width: <fmt:formatNumber value="${spot.sp_staravg/5}" type="percent"/>"></span>
					
					
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td><div class=title2>지역</div></td>
			<td>${camsel.loc}</td>
		</tr>
		<tr>
			<td><div class=title2>캠핑 타입</div></td>
			<td>${spot.type}</td>
		</tr>
		<tr>
			<td><div class=title2>기준인원</div></td>
			<td>${spot.standard_num}</td>
		</tr>
		<tr>
			<td><div class=title2>최대인원</div></td>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td><div class=title2>가격</div></td>
			<td>${spot.price}</td>
		</tr>
		<tr>
			<td><div class=title2>성수기 가격 (성수기에만 적용되는 가격입니다.)</div></td>
			<td>${spot.hightprice}</td>
		</tr>
		<tr>
			<td><div class=title2>성수기 날짜 및 주요사항</div></td>
			<td>${spot.memo}</td>
		</tr>
		<tr>
			<td><div class=title2>상세 이미지</div> </td>
			<td><c:forEach items="${i}" var="num">
					<img src="<%=request.getContextPath() %>/campupload/${num}"
						height="500" width="800" />
					<br>
				</c:forEach></td>
		</tr>
		
		<tr>
			<td colspan=2 align=center><input class=myButton type="button" value="목록"
				onClick="location.href='type_list.do?loc=${camsel.loc}&startDate=${camsel.startDate}&endDate=${camsel.endDate}&memcount=${memcount}&type=${camsel.type}'">
</td>
		</tr>


	</table>
</div>
</body>
</html>