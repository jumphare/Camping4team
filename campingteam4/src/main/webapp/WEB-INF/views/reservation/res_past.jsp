<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>지난 예약</title>
</head>
<body>
<div> <select id="sort" name="sort" onchange="sort(this.value)">
			<option value="res_date">예약일</option>
			<option value="start_date">시작일</option>
			<option value="end_date">종료일</option>
			<option value="state">반납보류</option>
		</select>
</div>
<form name="rtform" action="./eq_return.do" method="post">

<input type="button" id="allrt" onclick="allrt()" value="일괄반납"><br>
</form>
<table>
<tr>
	<th>예약일</th><th>ID</th><th>장소</th><th>자리</th><th>시작</th><th>종료</th><th>인원</th><th>금액</th><th>상태</th>
</tr>

</table>
</body>
</html>