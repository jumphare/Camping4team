<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<s:authentication property="principal" var="user"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style> 
h2 {font-size:15px;}
.star-rating {width:143px; }
.star-rating,.star-rating span {display:inline-block; height:21px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
 html { font-size:8px; } 
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
  font-size:2.3rem;
  }
 

a{
color: #000;
}
a:hover{
text-decoration:none;
}

/* .container {
  position: absolute;
  height: 400px;
  margin-left: -200px;
  margin-top: -200px;
  left: 30%;
  top: 45%;
};  */
</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" >
<div class="title">내 리뷰 목록</div>
		<table class="table" align=center width=900>
			<thead><tr class="cent" >
				<th>대표이미지</th>
				<th>제목</th>
				<th>별점</th>
				<th>장소</th>
				<th width=100>좋아요</th>
				<th width=100>작성자</th>
				<th width=100>조회수</th>
			</tr></thead>
		<c:forEach var = "r" items="${mylist}" varStatus="status">


		<tr>
			<td>
				<img src="<%=request.getContextPath() %>/reviewupload/${r.re_file}" height="300" width="300" />
			</td>
			<td>
				<a href="reviewdetail.do?re_no=${r.re_no}&page=${page}&ch=1">
				${r.subject}
				</a>
			</td>
			<td>
				<div class="wrap-star">
								<div class='star-rating'>
									<span style="width: <fmt:formatNumber value="${r.score/5}" type="percent"/>"></span>
								</div>
							</div>
			</td>
			<td>
				${r.sp_name}
			</td>
			<td>${r.rev_like}</td>
			<td>${r.id}</td>	
			<td>${r.readcount}</td>
		</tr>
		</c:forEach>
		</table>
<!-- 페이지처리 -->
<center>
<c:if test="${listcount>0}">
	
<!-- 1페이지로 이동              //   text-decoration은 밑줄 없애기-->
<a href="reviewlist.do?page=1" style="text-decoration:none"> << </a>
<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="reviewlist.do?page=${startPage-10}">[이전]</a>
</c:if>
<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">				<!-- 현재 페이지 -->
		[${i}]	
	</c:if>
	<c:if test="${i != page}">				<!-- 현재 페이지가 아닌 경우 -->
		<a href="reviewlist.do?page=${i}">[${i}]</a>	
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동 -->	
<c:if test="${endPage < pageCount}">
	<a href="reviewlist.do?page=${startPage+10}">[다음]</a>
</c:if>
<!-- 마지막 페이지로 이동 -->
<a href="reviewlist.do?page=${pageCount}" style="text-decoration:none"> >> </a>
</c:if>	
</center>
</div>
</body>
</html>