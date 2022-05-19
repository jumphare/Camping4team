<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${mem.name }님 예약완료되었습니다<br>
예약번호 ${res.res_no } <br>
<br>
<input type=button id="mainbck" value="메인으로">
<input type=button id="resList" value="예약내역" onclick="location.href='./reserveList.do'">
</body>
</html>