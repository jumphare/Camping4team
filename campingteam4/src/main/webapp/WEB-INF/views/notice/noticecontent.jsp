<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>

<table border=1 width=400 align=center>
	<caption>상세 페이지</caption>
	<tr>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${board.no_date}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.subject}</td>
	</tr>
	
		<tr>
		<td>옵션</td>
		<td>
		<c:if test="${board.noti_flag == 1}">공지</c:if>

		</td>
	</tr>
	
	
	<tr>
		<td>내용</td>
		<td>
			<pre>${board.content}</pre>
			<!-- ${content} -->
		</td>
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