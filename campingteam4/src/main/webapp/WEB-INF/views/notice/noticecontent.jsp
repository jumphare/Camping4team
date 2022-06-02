<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
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
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>
<h2 class="title" >상세 페이지</h2>
	<div class = "div1"> 
	<table class = "table eqtable" align=center style="width:100%">
		<tr>
			<td class = "headb">날짜</td>
			<td><fmt:formatDate value="${board.no_date}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td class = "headb">제목</td>
			<td>${board.subject}</td>
		</tr>
	
		<tr>
			<td class = "headb">옵션</td>
			<td>
			<c:if test="${board.noti_flag == 1}">공지</c:if>
			</td>
		</tr>
	
		<tr>
			<td class = "headb">내용</td>
			<td><pre>${board.content}
			</pre></td>
		</tr>
	
	
			<tr>
			<td class = "headb">첨부</td>
			<td><pre>${board.not_file}
			</pre></td>
		</tr>
	
	
		<tr>
			<td colspan=2 align=center>
				<input type="button" value="목록" 
				onClick="location.href='noticelist.do?page=${page}' ">
					
				<input type="button" value="수정" 
				onClick="location.href='noticeupdateform.do?not_no=${board.not_no}&page=${page}' ">
					
				<input type="button" value="삭제" 
				onClick="location.href='noticedeleteform.do?not_no=${board.not_no}&page=${page}' ">		
			</td>
		</tr>
	</table>
</body>
</html>