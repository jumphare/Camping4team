<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/date.css" />
<script src="<%=request.getContextPath() %>/js/date.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
  html { font-size:10px; } 

  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-size:1.6rem;
}
  .title{
  margin-top:1rem;
  margin-left:4rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }

.eqtable th{
text-align:center;
}
.eqtable td{
text-align:center;

}
.mg{
margin:1rem;
}
 
.pmt{
width:40%; 
border:dotted #a0a0a0; 
border-radius:5px;
padding: 2rem;
}

 a {
 text-decoration:none;
 color:#E35E0A;
 }
 a:hover{text-decoration:none;}
 
 .pgn a{
color:#000;
}

.headb {
	font-weight: bold;
}

.wrb{
	position : absolute;
	font-weight : bold;
	right : 10px;
}

.div1{
	margin : 50px 250px;

}
</style>
</head>
<body>
 
<form method=post action="pbresult.do">
<h2 class="title">글작성</h2>
<div class = "div1">
	<table class = "table eqtable" width=400 align=center>
	
	
	<tr><th>제목</th>
		<td><input type=text id = "subject" name="subject" required="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols = 23 rows = 5 id = "content" name = "content" required = "required"></textarea>
	</tr> 
	<tr><th>작성자</th>
		<td><input name="id" id = "id" value = "${id}" readonly></td>
	</tr>

	<tr><th>시작일</th>
		<td><input type="text" name = "start_date" id="startDate" required = "required">
       	</td>
	</tr>
	<tr><th>종료일</th>
		<td><input type="text" name="end_date" id = "endDate"  required="required"></td>
	</tr>
	<tr><th>캠핑지역</th>
		<td><select name="camp_area" id = "camp_area" required="required">
		<option value="">캠핑 지역</option>
		<option value=서울>서울</option>
		<option value=천안>천안</option>
		<option value=대전>대전</option>
			
	</tr>
	<tr><th>캠핑종류</th>
		<td><select name="camp_type" id = "camp_type" required="required">
		<option value="">캠핑 종류</option>
		<option value="차박">차박</option>
		<option value="글램핑">글램핑</option>
		<option value="캠핑">캠핑</option>
		<option value="오토캠핑">오토캠핑</option>
		<option value="카라반">카라반</option>
		</select>
		</td>
	</tr>
	<tr><th>신청인원</th>
		<td><input type=text name="want_num" id = "want_num" required="required"></td>
	</tr>
	
	<tr><td colspan=8 align=center>
			<input type=submit value="글작성">
			<input type=reset value="취소">
			
			
		</td>
	</tr>
	
</table>
</div>	
</form>

</body>
</html>