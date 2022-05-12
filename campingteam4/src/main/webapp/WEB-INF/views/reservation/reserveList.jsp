<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>예약목록</title>
</head>
<body>
예약정보
<c:set var="i" value="0"/>
<c:forEach var="r" items="${rlist }">
<table>
	<tr>
		<td><fmt:formatDate value="${r.res_date}" pattern="yyyy.MM.dd"/></td>
		<td>
		<fmt:formatDate value="${r.start_date }" pattern="MM월 dd일"/>  ~ 
		<fmt:formatDate value="${r.end_date }" pattern="MM월 dd일"/> <br> 
		<a href='./reserveView.do?res_no=${r.res_no}'>${cname[i]}</a> <br> ${sname[i]} <br>
		<c:if test="${r.state eq '0' }" >결제 대기</c:if>
		<c:if test="${r.state eq '1' }" >예약 완료</c:if>
		<c:if test="${r.state eq '2'}" >예약 취소</c:if></td>
		<td> <input type="button" value="상세내역" onclick="location.href='./reserveView.do?res_no=${r.res_no}';"><br>
		<input type="button" value="취소"></td>
	</tr>
	<c:set var="i" value="${i+1 }"/>
</table>
</c:forEach>
</body>
</html>