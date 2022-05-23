<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>	
		<title>Chat</title>
	</head>

	<body>
		<form method="post" action="<%=request.getContextPath()%>/chat.do">
		<input type ="submit" id="loc" name ="loc" value="서울"><br>
 		<input type ="submit" id="loc" name ="loc" value="대전"><br>
 		<input type ="submit" id="loc" name ="loc" value="천안"><br>
		</form>
	
	</body>
	

</html>
