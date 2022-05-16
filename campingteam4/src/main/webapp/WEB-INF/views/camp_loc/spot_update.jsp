<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 수정</title>

<script src="<%=request.getContextPath() %>/js/campspot.js"></script>
</head>
<body>

<form method=post action="<%=request.getContextPath()%>/spotupdate.do" onSubmit="return spot_check()">
<input type="hidden" name="sp_no" id="sp_no" value="${spot.sp_no}">
<table border=1 width=400 align=center>
	<caption>장소수정</caption>
	<tr><th>장소이름</th>
		<td><input type=text name="sp_name" id="sp_name" value="${spot.sp_name}"></td>
	</tr>
	<tr><th>지역</th>
		<td>
		<select id="camp_no" name="camp_no">
			<option value="0">선택하세요.</option>
			<option value="1" <c:if test="${spot.camp_no=='1'}">selected</c:if>>서울</option>
			<option value="2" <c:if test="${spot.camp_no=='2'}">selected</c:if>>천안</option>
			<option value="3" <c:if test="${spot.camp_no=='3'}">selected</c:if>>대전</option>
		</select>
	</tr>
	<tr><th>캠핑타입</th>
	<td>
		<select id="type" name="type">
			<option value="">선택하세요.</option>
			<option value="캠핑" <c:if test="${spot.type=='캠핑'}">selected</c:if>>캠핑</option>
			<option value="차박" <c:if test="${spot.type=='차박'}">selected</c:if>>차박</option>
			<option value="글램핑" <c:if test="${spot.type=='글램핑'}">selected</c:if>>글램핑</option>
			<option value="카라반" <c:if test="${spot.type=='카라반'}">selected</c:if>>카라반</option>
		</select>
	</td>
	</tr>
	<tr><th>기준인원</th>
		<td><input type=text name="standard_num" id="standard_num" value="${spot.standard_num}"></td>
	</tr>
	<tr><th>최대인원</th>
		<td><input type=text name="max_num" id="max_num" value="${spot.max_num}"></td>
	</tr>
	<tr><th>가격</th>
		<td><input type=text name="price" id="price" value="${spot.price}"></td>
	</tr>
	<tr><th>성수기가격</th>
		<td><input type=text name="hightprice" id="hightprice" value="${spot.hightprice}"></td>
	</tr>
	<tr><th>성수기 날짜 및 주요사항</th>
		<td><input type=text name="memo" id="memo" value="${spot.memo}"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="장소 수정" />
			<input type=reset value="취소" />
		</td>
	</tr>
</table>
</form>

</body>
</html>