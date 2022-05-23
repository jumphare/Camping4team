<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center"
		style="width: 60%; height: 100px; border: 1px solid orange; border-radius: 2em;">
		<div style="float: left; width: 25%;">
			<a href="type_list.do?type=캠핑"><img
				src="<%=request.getContextPath()%>/iconimg/campingicon.png"
				width="70px" height="70px" /></a>
		</div>
		<div style="float: left; width: 25%;">
			<a href="type_list.do?type=글램핑"><img
				src="<%=request.getContextPath()%>/iconimg/grampingicon.png"
				width="70px" height="70px" /></a>
		</div>
		<div style="float: left; width: 25%;">
			<a href="type_list.do?type=카라반"><img
				src="<%=request.getContextPath()%>/iconimg/carabanicon.png"
				width="70px" height="70px" /></a>
		</div>
		<div style="float: left; width: 25%;">
			<a href="type_list.do?type=차박"><img
				src="<%=request.getContextPath()%>/iconimg/carbakicon.png"
				width="70px" height="70px" /></a>
		</div>

	</div>
	<br>
	<a href="date_sel.do">예약하기</a>
	<br>
	<a href="admin_camp_list.do">관리자 캠핑장 관리</a>
	<br>
</body>
</html>