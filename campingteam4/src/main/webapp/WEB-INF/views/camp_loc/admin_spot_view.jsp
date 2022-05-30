<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script>
function removeCheck() {

	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

		 location.href="spotdelete.do?sp_no=${spot.sp_no}";

	 }else{   //취소

	     return false;

	 }

	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

 <style>
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
<h1>상단바</h1><br><br>
<div class="container" >
<div class="title">${spot.sp_name}</div>
	<input type="button" value="목록" class="myButton"
					onClick="location.href='admin_camp_list.do'">
				<input type="button" value="수정" class="myButton"
				onclick="location.href='spotupdateform.do?sp_no=${spot.sp_no}'">
				<input type="button" value="삭제" class="myButton"
				onclick="removeCheck()"><br><br>
<table border=1 class="table">

		<tr>
			<th width=150>대표이미지</th>
			<td>
			<img src="<%=request.getContextPath() %>/campupload/${spot.image}" height="300" width="300" />
			</td>
		</tr>	
		<tr>
			<th>장소 이름</th>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>
			<c:if test="${spot.camp_no == 1}">
				서울
			</c:if>
			<c:if test="${spot.camp_no == 2}">
				천안
			</c:if>
			<c:if test="${spot.camp_no == 3}">
				대전
			</c:if>
			</td>
		</tr>
		<tr>
			<th>캠핑 타입</th>
			<td>${spot.type}</td>
		</tr>
		<tr>
			<th>기준인원</th>
			<td>${spot.standard_num}</td>
		</tr>
		<tr>
			<th>최대인원</th>
			<td>
			${spot.sp_name}
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
			${spot.price}
			</td>
		</tr>
		<tr>
			<th>성수기 가격			(성수기에만 적용되는 가격입니다.)</th>
			<td>
			${spot.hightprice}
			</td>
		</tr>
		<tr>
			<th>성수기 날짜 및 주요사항</th>
			<td>
			${spot.memo}
			</td>
		</tr>
		<tr>
			<th>상세 이미지</th>
			<td>
			<c:forEach items="${i}" var="num">
			 <br>
			<img src="<%=request.getContextPath() %>/campupload/${num}" height="500" width="800" />
			<br>
			</c:forEach>
			</td>
		</tr>			
</table>
</div>
</body>
</html>