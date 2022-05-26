<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/date.css" />
<script src="<%=request.getContextPath() %>/js/date.js"></script>

</head>
<body>
<form method="get" action="<%=request.getContextPath()%>/camp_sel.do">
      <p>체크인 : <input type="text" id='startDate' name='startDate'>
		체크아웃 : <input type="text" id='endDate' name='endDate'></p>
      인원 :  <input type=text name="memcount" id="memcount">
      <p><input type="submit" value="Submit"></p>
    </form>
</body>
</html>