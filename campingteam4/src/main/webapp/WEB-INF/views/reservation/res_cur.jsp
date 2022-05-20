<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>현재 예약</title>
</head>
<body>
<div> <select id="sort" name="sort" onchange="sort(this.value)">
			<option value="res_date">예약일</option>
			<option value="start_date">시작일</option>
			<option value="end_date">종료일</option>
			<option value="state">상태</option>
		</select>
</div>
<table>
<tr>
	<th>예약일</th><th>ID</th><th>장소</th><th>자리</th><th>시작</th><th>종료</th><th>인원</th><th>금액</th><th>상태</th>
</tr>
</table>
</body>
</html>