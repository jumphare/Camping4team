<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>

</head>
<body>

<form method=post action="pbresult.do">
<table border=1 width=400 align=center>
	<caption>글작성</caption>
	<tr><th>제목</th>
		<td><input type=text id = "subject" name="subject" required="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols = 40 rows = 5 id = "content" name = "content" required = "required"></textarea>
	</tr> 
	<tr><th>작성자</th>
		<td><input name="id" id = "id" value = "${id}" readonly></td>
	</tr>

	<tr><th>시작일</th>
		<td><input type="text" name = "start_date" id="start_date" required = "required">
       	</td>
	</tr>
	<tr><th>종료일</th>
		<td><input type="text" name="end_date" id = "end_date" min = "start_date" required="required"></td>
	</tr>
	<tr><th>캠핑지역</th>
		<td><select name="camp_area" id = "camp_area" required="required">
		<option value="">캠핑 지역</option>
		<option value=서울>서울</option>
		<option value=천안>천안</option>
		<option value=대전>대전</option>
			
	</tr>
	<tr><th>캠핑종류</th>
		<td><select name="camp_type" id = "camp_type" required="required">
		<option value="">캠핑 종류</option>
		<option value="차박">차박</option>
		<option value="글램핑">글램핑</option>
		<option value="캠핑">캠핑</option>
		<option value="오토캠핑">오토캠핑</option>
		<option value="카라반">카라반</option>
		</select>
		</td>
	</tr>
	<tr><th>신청인원</th>
		<td><input type=text name="want_num" id = "want_num" required="required"></td>
	</tr>

	<tr><td colspan=8 align=center>
			<input type=submit value="글작성">
			<input type=reset value="취소">
			
			
			
		</td>
	</tr>
	
</table>
</form>

</body>
</html>