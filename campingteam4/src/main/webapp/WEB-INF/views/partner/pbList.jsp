<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판</title>
</head>
<body>
		<h2 class="text-primary">동행 게시판</h2>
		<a href = "pbWrite.do">글작성</a><br>
	
		<table class="table table-striped" align = center text-align = center border = 1>
			<tr align = center>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>캠핑지역</td>
				<td>캠핑종류</td>
				<td>신청인원</td>
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
						<td>${boardpb.par_no }</td>
						<td><a href="pbView.do?par_no=${boardpb.par_no}&page=${page}">${boardpb.subject }</a>
							</td>
						<td>${boardpb.content }</td>
					  	<td>${boardpb.id}</td>
						<td>
						<fmt:formatDate value="${boardpb.p_date}" pattern="yyyy/MM/dd"/></td>
						<td>
						<fmt:formatDate value="${boardpb.start_date}" pattern="yyyy/MM/dd"/></td>
						<td>
						<fmt:formatDate value="${boardpb.end_date}" pattern="yyyy/MM/dd"/></td>
						<td>${boardpb.camp_area}</td>
						<td>${boardpb.camp_type}</td>
						<td>${boardpb.want_num }</td>
						<td>${boardpb.now_num }</td>
						<td>${boardpb.readcount}</td>
					</tr>
					
				</c:forEach>
			</c:if>
		</table>
		
		
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