<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>동행 게시판</title>
<style>
  html { font-size:10px; } 

  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-size:1.4rem;
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
	font-size : 90%;
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
		<h2 class="title">동행 게시판</h2>
		<a href = "pbWrite.do" class = "wrb">글작성</a><br>
		<div class = "div1">
		<table class="table eqtable" align = center text-align = center style="width:100%">
			<tr class = "headb" align = center font-weight = bold>
			
				<td font-weight = bold>제목</td>
				<td>내용</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>캠핑지역</td>
				<td>캠핑종류</td>
				<td>모집인원</td>
				<td>현재인원</td>
				<td>조회수</td>
			</tr>
			<c:if test="${empty pbList}">
				<tr>
					<td colspan="10">데이터가 없습니다</td>
				</tr>
			</c:if>
			
			<c:if test="${not empty pbList}">
				<c:set var="num" value="${listcount-(page-1)*10 }"></c:set>
				<c:forEach var="boardpb" items="${pbList}">
					<tr align = center>
					
						<td><a href="pbView.do?par_no=${boardpb.par_no}&page=${page}">${boardpb.subject }</a>
							</td>
						<td>${boardpb.content }</td>
					  	<td>${boardpb.id}</td>
						<td class= "date">
						<fmt:formatDate value="${boardpb.p_date}" pattern="yyyy-MM-dd"/></td>
						<td class= "date">
						<fmt:parseDate value="${boardpb.start_date}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
						</td>
						<td class= "date">
						<fmt:parseDate value="${boardpb.end_date}" var="dateValue2" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${dateValue2}" pattern="yyyy-MM-dd"/>
						</td>
						
						<td>${boardpb.camp_area}</td>
						<td>${boardpb.camp_type}</td>
						<td>${boardpb.want_num }</td>
						<td>${boardpb.now_num }</td>
						<td>${boardpb.readcount}</td>
						<c:if test = "${id eq 'admin' }">
							<td>
								<input type = "button" value = "삭제" onClick="location.href='pbDelete.do?par_no=${boardpb.par_no}&page=${page}' ">
							</td>
						</c:if>
					</tr>
					
				</c:forEach>
			</c:if>
		</table>
		</div>
		
<!-- 페이지로 처리 -->	
<center>
<c:if test="${listcount > 0}">
	
<!-- 1페이지로 이동 -->	
<a href="pbList.do?page=1" style="text-decoration:none"> << </a>
	
<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="pbList.do?page=${startPage-10 }">[이전]</a>	
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->	
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">		<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">		<!-- 현재 페이지가 아닌 경우 -->
		<a href="pbList.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>	
	
<!-- 다음 블럭으로 이동 -->	
<c:if test="${endPage < pageCount}">
	<a href="pbList?page=${startPage+10}">[다음]</a>
</c:if>
	
<!-- 마지막 페이지로 이동 -->	
<a href="pbList.do?page=${pageCount}" style="text-decoration:none"> >> </a>

</c:if>
</center>	
		
</body>
</html>