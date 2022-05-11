<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/type_list.do?loc=${loc}&startDate=${startDate}&endDate=${endDate}&memcount=${memcount}">
    <input type ="submit" name ="type" value="camping"><br>
 	<input type ="submit" name ="type" value="carbak"><br>
 	<input type ="submit" name ="type" value="gramping"><br>
 	<input type ="submit" name ="type" value="caraban"><br>
</form>
</body>
</html>