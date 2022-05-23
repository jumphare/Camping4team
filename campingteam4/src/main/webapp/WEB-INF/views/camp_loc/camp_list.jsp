<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 리스트</title>
<style>
div {
	width: 60%;
	height: 300px;
}

div.left {
	width: 50%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 50%;
	float: right;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div>
		<div class="left">
			<br>
			<br>
			<br>
			<form method="get"
				action="<%=request.getContextPath()%>/type_list.do">
				<h1>현재 검색 내용</h1>
				<p>
					체크인 : <input type="date" id='startDate' name='startDate'
						value="${camsel.startDate}"> 체크아웃 : <input type="date"
						id='endDate' name='endDate' value="${camsel.endDate}">
				</p>
				인원 : <input type=text name="memcount" id="memcount"
					value="${camsel.memcount}">
				<p>
					지역 : <select id="loc" name="loc">
			<option value="0">선택하세요.</option>
			<option value="서울" <c:if test="${camsel.loc=='서울'}">selected</c:if>>서울</option>
			<option value="천안" <c:if test="${camsel.loc=='천안'}">selected</c:if>>천안</option>
			<option value="대전" <c:if test="${camsel.loc=='대전'}">selected</c:if>>대전</option>
		</select>
				<p>
					여행 종류 : <select id="type" name="type">
						<option value="">선택하세요.</option>
						<option value="캠핑" <c:if test="${camsel.type=='캠핑'}">selected</c:if>>캠핑</option>
						<option value="차박" <c:if test="${camsel.type=='차박'}">selected</c:if>>차박</option>
						<option value="글램핑"
							<c:if test="${camsel.type=='글램핑'}">selected</c:if>>글램핑</option>
						<option value="카라반"
							<c:if test="${camsel.type=='카라반'}">selected</c:if>>카라반</option>
					</select>
				<p>
					<input type="submit" value="검색">
				</p>
			</form>
		</div>
		<div class="right">
			<h5 align="center">인원( ${memcount} )에 맞는 ${loc} 지역의 ${type} 의
				목록입니다.</h5>
			<br>
			<table border=1 align=center width=1000>
				<caption>목록</caption>

				<tr>
					<th>이미지</th>
					<th>이름</th>
					<th>기준인원</th>
					<th>최대인원</th>
					<th>기본금액</th>
					<th>예약가능여부</th>

				</tr>
				<!-- 화면출력 번호 -->
				<c:forEach var="s" items="${spotlist}">
					<tr>
						<td><img
							src="<%=request.getContextPath() %>/campupload/${s.image}"
							height="300" width="300" /></td>
						<td><a
							href="spotview.do?&loc=${loc}&startDate=${camsel.startDate}&endDate=${camsel.endDate}&memcount=${camsel.memcount}&type=${type}&sp_no=${s.sp_no}">
								${s.sp_name}</a></td>
						<td>${s.standard_num}</td>
						<td>${s.max_num}</td>
						<td>${s.price}</td>
						<td><c:if test="${s.reservecheck == 1}">
								<span style="color: red">!해당일 마감!</span>
							</c:if> <c:if test="${s.reservecheck == 0}">
								<span style="color: blue">!예약가능!</span>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>