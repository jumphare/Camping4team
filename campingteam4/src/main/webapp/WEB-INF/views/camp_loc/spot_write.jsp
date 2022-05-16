<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/js/campspot.js"></script>
</head>
<body>

<form method=post action="<%=request.getContextPath()%>/spotwrite.do" onSubmit="return spot_check()" enctype="multipart/form-data">
<table border=1 width=400 align=center>
	<caption>글작성</caption>
	<tr><th>장소이름</th>
		<td><input type=text name="sp_name" id="sp_name" ></td>
	</tr>
	<tr><th>지역</th>
		<td>
		<select id="camp_no" name="camp_no">
			<option value="0">선택하세요.</option>
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
	</tr>
	<tr><th>캠핑타입</th>
	<td>
		<select id="type" name="type">
			<option value="">선택하세요.</option>
			<option value="캠핑">캠핑</option>
			<option value="차박">차박</option>
			<option value="글램핑">글램핑</option>
			<option value="카라반">카라반</option>
		</select>
	</td>
	</tr>
	<tr><th>기준인원</th>
		<td><input type=text name="standard_num" id="standard_num"></td>
	</tr>
	<tr><th>최대인원</th>
		<td><input type=text name="max_num" id="max_num" ></td>
	</tr>
	<tr><th>가격</th>
		<td><input type=text name="price" id="price" ></td>
	</tr>
	<tr><th>성수기가격</th>
		<td><input type=text name="hightprice" id="hightprice"></td>
	</tr>
	<tr><th>성수기 날짜 및 주요사항</th>
		<td><input type=text name="memo" id="memo"></td>
	</tr>
	<tr><th>대표이미지</th>
		<td><input type=file name="image1" id="image" ></td>
	</tr>
	<tr><th>상세이미지 등록(다중등록)</th>
		<td><input type=file name="imagelist" id="imagelist" multiple="multiple"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="장소 등록" class="input_button" />
			<input type=reset value="취소" />
		</td>
	</tr>
</table>
</form>

</body>
</html>