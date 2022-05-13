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
<link defer rel='stylesheet' media='screen' href='/css/comm/review_list.css'>
</head>
<body>
	<div class="">
		<table id="" class="">
			<h2>후기 게시판</h2>
			&nbsp;
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</thead>
			<tbody>
				<c:set var="no" value="${re_no}"></c:set>
				<c:forEach var="n" items="${list}">
					<tr>
						<td>${n.re_no}</td>
							<td><a href="${path}/reviewview/re_no/${n.re_no}/pageNum/${pp.currentPage}">
								${n.subject}
								</a></td>
							<td>${n.id}</td>
							<td><fmt:formatDate value="${n.date}" 
						pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${n.readcount}</td>
							<td>${n.like}</td>
					</tr>
					<c:set var="no1" value="${no-1}"></c:set>
				</c:forEach>
				</tbody>
		</table>
		
		<div class="c_r_write_btn">
		<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
			<a href="${path}/" class="btn btn-dark">글작성</a>
		</s:authorize>
	</div>
	<!-- 페이징 -->
<!-- 		<div class="c_r_paging">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/reviewlist/pageNum/${pp.startPage - 1}?search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/reviewlist/pageNum/${i}?search=${search}&keyword=${keyword}">&nbsp;${i}&nbsp;</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/reviewlist/pageNum/${pp.endPage + 1}?search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/reviewlist/pageNum/${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/reviewlist/pageNum/${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/reviewlist/pageNum/${pp.endPage + 1}">다음</a></li>
				</c:if>
		  </c:if>
		  </div> 
		  <!-- 검색기능 --> 
<!--  	<div class="c_r_search" >
		<form align="center" action="${path}/reviewlist/pageNum/1">
			<select name="search">
				<option value="review_title"
					<c:if test="${search=='review_title'}">selected="selected" </c:if>>제목</option>
				<option value="review_content"
					<c:if test="${search=='review_content'}">selected="selected" </c:if>>내용</option>
				<option value="member_id"
					<c:if test="${search=='member_id'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"
					<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input class="btn btn-dark" type="submit" value="검색">
		</form>
		</div>-->
</div>
</body>
</html>