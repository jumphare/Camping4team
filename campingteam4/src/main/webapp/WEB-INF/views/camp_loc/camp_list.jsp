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

<h5 align="center">인원( ${memcount} )에 맞는  ${loc} 지역의  ${type} 의 목록입니다.</h5><br>
<a href = "spotwriteform.do">글작성</a><br>
	<table border=1 align=center width=700>
		<caption>목록</caption>
		
		<tr>
			<th>이미지</th>
			<th>이름</th>
			<th>기준인원</th>
			<th>최대인원</th>
			<th>기본금액</th>
			<th>예약가능여부</th>
			
		</tr>
		<!-- 화면출력 번호 -->
		<c:forEach var = "s" items="${spotlist}">
		<tr>
			<td>${s.image}</td>
			<td>
				<a href="spotview.do?sp_no=${s.sp_no}">
				${s.sp_name}</a>
			</td>
			<td>${s.standard_num}</td>
			<td>${s.max_num}</td>
			<td>${s.price}</td>
			<td>
			<c:if test="${s.reservecheck == 1}">
				<span style="color:red">!해당일 마감!</span>
			</c:if>
			<c:if test="${s.reservecheck == 0}">
				<span style="color:blue">!예약가능!</span>
			</c:if>
			</td>
			
		</tr>
		</c:forEach>
	</table>
</body>
</html>