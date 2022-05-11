<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  document.getElementById('startdate').value = new Date().toISOString().substring(0, 10);
</script>
</head>
<body>
<form method="get" action="<%=request.getContextPath()%>/camp_sel.do">
      <p>체크인 : <input type="date" id='startDate' name='startDate'>
		체크아웃 : <input type="date" id='endDate' name='endDate'></p>
      인원 :  <input type=text name="memcount" id="memcount">
      <p><input type="submit" value="Submit"></p>
    </form>
</body>
</html>