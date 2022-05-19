<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
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
		<td>작성자</td>
		<td>${partner.id}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${partner.p_date}"
				pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${partner.readcount}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${partner.subject}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<pre>${partner.content}</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" 
				onClick="location.href='pbList.do?page=${page}' ">
					
			<input type="button" value="수정" 
				onClick="location.href='pbUpdate.do?par_no=${partner.par_no}&page=${page}' ">
					
			<input type="button" value="삭제" 
				onClick="location.href='pbDelete.do?par_no=${partner.par_no}&page=${page}' ">		
		</td>
	</tr>
</table>


</body>
</html>