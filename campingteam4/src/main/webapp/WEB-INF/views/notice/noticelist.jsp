<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>공지 게시판</title>
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
	right : 60px;
}

.div1{
	margin : 10px 50px;

}

.date{
	font-size: 80%;
}
</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>

<h1 style="margin-bottom:30px;">--</h1>
		<h2 class="title">공지 게시판</h2>

<c:if test="${sessionScope.id == 'admin'}">
   <a href="noticeform.do" class = "wrb">글작성</a>  <br>
</c:if>
		<div class = "div1">
		<table class="table eqtable" align = center text-align = center style="width:100%">
			<tr class = "headb" align = center font-weight = bold>	
				<th>번호</th>
				<th font-weight = bold>제목</th>
				<th>날짜</th>
			</tr>
		
			<!-- 화면 출력 번호 -->
			<c:set var="num" value="${listcount-(page-1)*10}"/>
			<c:forEach var="b" items="${noticelist}">
			<tr>
				<td><c:out value="${num}"/>
					<c:set var="num" value="${num-1}" />
				</td>
				<td>
					<a href="noticecontent.do?not_no=${b.not_no}&page=${page}">
						${b.subject}
					</a>
				</td>
				<td>
					<fmt:formatDate value="${b.no_date}"
						 pattern="yyyy-MM-dd "/>
				</td>
			</tr>
			</c:forEach>
		
	</table>
	
	
<!-- 페이지로 처리 -->	
<center>
<c:if test="${listcount > 0}">
	
<!-- 1페이지로 이동 -->	
<a href="noticelist.do?page=1" style="text-decoration:none"> << </a>
	
<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="noticelist.do?page=${startPage-10 }">[이전]</a>	
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->	
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">		<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">		<!-- 현재 페이지가 아닌 경우 -->
		<a href="noticelist.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>	
	
<!-- 다음 블럭으로 이동 -->	
<c:if test="${endPage < pageCount}">
	<a href="noticelist.do?page=${startPage+10}">[다음]</a>
</c:if>
	
<!-- 마지막 페이지로 이동 -->	
<a href="noticelist.do?page=${pageCount}" style="text-decoration:none"> >> </a>

</c:if>
</center>	
</div>
</body>
</html>

