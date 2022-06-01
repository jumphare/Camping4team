<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/js/campspot.js"></script>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
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
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>
<div class="container">
<div class="title">장소 등록</div>
<form method=post action="<%=request.getContextPath()%>/spotwrite.do" onSubmit="return spot_check()" enctype="multipart/form-data">
<table class="table">
	
	<tr><th>장소이름</th>
		<td><input type=text name="sp_name" id="sp_name" ></td>
	</tr>
	<tr><th>지역</th>
		<td>
		<select id="camp_no" name="camp_no">
			<option value="0">선택하세요.</option>
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
	</tr>
	<tr><th>캠핑타입</th>
	<td>
		<select id="type" name="type">
			<option value="">선택하세요.</option>
			<option value="캠핑">캠핑</option>
			<option value="차박">차박</option>
			<option value="글램핑">글램핑</option>
			<option value="카라반">카라반</option>
		</select>
	</td>
	</tr>
	<tr><th>기준인원</th>
		<td><input type=text name="standard_num" id="standard_num"></td>
	</tr>
	<tr><th>최대인원</th>
		<td><input type=text name="max_num" id="max_num" ></td>
	</tr>
	<tr><th>가격</th>
		<td><input type=text name="price" id="price" ></td>
	</tr>
	<tr><th>성수기가격</th>
		<td><input type=text name="hightprice" id="hightprice"></td>
	</tr>
	<tr><th>성수기 날짜 및 주요사항</th>
		<td><input type=text name="memo" id="memo"></td>
	</tr>
	<tr><th>대표이미지</th>
		<td><input type=file name="image1" id="image" ></td>
	</tr>
	<tr><th>상세이미지 등록(다중등록)</th>
		<td><input type=file name="imagelist" id="imagelist" multiple="multiple"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="장소 등록" class="input_button" />
			<input type=reset value="취소" onclick="location.href='admin_camp_list.do' " />
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>