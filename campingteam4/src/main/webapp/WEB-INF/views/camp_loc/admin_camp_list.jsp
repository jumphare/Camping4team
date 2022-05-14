<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 리스트</title>
</head>
<body>


<a href = "spotwriteform.do">글작성</a><br>
	<table border=1 align=center width=1000>
		<caption>목록</caption>
		
		<tr>
			<th>이미지</th>
			<th>이름</th>
			<th>지역</th>
			<th>종류</th>	
		</tr>
		<!-- 화면출력 번호 -->
		<c:forEach var = "s" items="${spotlist}">
		<tr>
			<td>
			<img src="<%=request.getContextPath() %>/campupload/${s.image}" height="300" width="300" />
			</td>
			<td>
				<a href="spotview.do?&sp_no=${s.sp_no}">
				${s.sp_name}</a>
			</td>
			<td>
			<c:if test="${s.camp_no == 1}">
				서울
			</c:if>
			<c:if test="${s.camp_no == 2}">
				천안
			</c:if>
			<c:if test="${s.camp_no == 3}">
				대전
			</c:if>
			</td>
			<td>${s.type}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>