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
<title>Insert title here</title>
<style> 
h2 {font-size:15px;}
.star-rating {width:304px; }
.star-rating,.star-rating span {display:inline-block; height:55px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>
		 
		<table border="1" align=center width=700>
			<caption>후기 게시판</caption>
			<tr> 
				<th>대표이미지</th>
				<th>제목</th>
				<th>별점</th>
				<th>장소</th>
				<th>좋아요</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
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
								<h2>평점 : ${r.score}</h2>
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
</body>
</html>