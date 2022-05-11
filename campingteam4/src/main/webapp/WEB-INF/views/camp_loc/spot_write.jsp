<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
</head>
<body>

<form method=post action="<%=request.getContextPath()%>/spotwrite.do">
<table border=1 width=400 align=center>
	<caption>글작성</caption>
	<tr><th>장소이름</th>
		<td><input type=text name="sp_name" id="sp_name" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>지역</th>
		<td>
		<select id="camp_no" name="camp_no">
			<option value="">선택하세요.</option>
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
	</tr>
	<tr><th>캠핑타입</th>
	<td>
		<select id="type" name="type">
			<option value="">선택하세요.</option>
			<option value="camping">캠핑</option>
			<option value="carbak">차박</option>
			<option value="gramping">글램핑</option>
			<option value="caraban">카라반</option>
		</select>
	</td>
	</tr>
	<tr><th>기준인원</th>
		<td><input type=text name="standard_num" id="standard_num" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>최대인원</th>
		<td><input type=text name="max_num" id="max_num" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>가격</th>
		<td><input type=text name="price" id="price" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>성수기가격</th>
		<td><input type=text name="hightprice" id="hightprice" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>대표이미지</th>
		<td><input type=file name="image" id="image" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>상세이미지1</th>
		<td><input type=file name="imagedetail" id="imagedetail" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>상세이미지2</th>
		<td><input type=file name="imagedetail2" id="imagedetail2" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><th>성수기 날짜 및 주요사항</th>
		<td><input type=text name="memo" id="memo" requrired="required" autofocus="autofocus"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="장소 등록">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>

</body>
</html>