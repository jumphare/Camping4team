<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임의 로그인 상태</title>
</head>
<body>
아이디: ${id } <br> 
<a href="./reservePage.do?camp_no=0&sp_no=0">장소0, 자리0 가지고 예약페이지 가기</a><br>
<a href="./reserveList.do">예약내역</a><br>
</body>
</html>