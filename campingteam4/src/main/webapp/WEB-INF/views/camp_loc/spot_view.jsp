<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border=1 width=400 align=center>
	<caption>상세</caption>
		<tr>
			<td>대표이미지</td>
			<td>
			${spot.image}
			</td>
		</tr>	
		<tr>
			<td>장소 이름</td>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>
				${camsel.loc}
			</td>
		</tr>
		<tr>
			<td>캠핑 타입</td>
			<td>${spot.type}</td>
		</tr>
		<tr>
			<td>기준인원</td>
			<td>${spot.standard_num}</td>
		</tr>
		<tr>
			<td>최대인원</td>
			<td>
			${spot.sp_name}
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
			${spot.price}
			</td>
		</tr>
		<tr>
			<td>성수기 가격			(성수기에만 적용되는 가격입니다.)</td>
			<td>
			${spot.hightprice}
			</td>
		</tr>
		<tr>
			<td>상세 이미지 1</td>
			<td>
			${spot.imagedetail}
			</td>
		</tr>		
		<tr>
			<td>상세 이미지 2</td>
			<td>
			${spot.imagedetail2}
			</td>
		</tr>
		<tr>
			<td>성수기 날짜 및 주요사항</td>
			<td>
			${spot.memo}
			</td>
		</tr>		
		<tr>
			<td colspan=2 align=center>
				<input type="button" value="목록"
					onClick="location.href='type_list.do?loc=${camsel.loc}&startDate=${camsel.startDate}&endDate=${camsel.endDate}&memcount=${memcount}&type=${camsel.type}'">
					
			<form method=post id="selectdata" action="<%=request.getContextPath()%>/reservePage.do">
			<input type="hidden" id="start_date" name="start_date" value="${camsel.startDate}">
			<input type="hidden" id="start_date" name="start_date" value="${camsel.endDate}">
			<input type="hidden" id="num" name="num" value="${camsel.memcount}">
			<input type="hidden" id="camp_no" name="camp_no" value="${spot.camp_no}">
			<input type="hidden" id="sp_no" name="sp_no" value="${spot.sp_no}">
			<input type="submit" value="예약하기!!">
			</form>
			</td>
		</tr>
	
				<!-- 관리자만 보임 -->	
		<tr>
			<td colspan=2 align=center>
				<input type="button" value="수정"
				onclick="location.href=''">
				<input type="button" value="삭제"
				onclick="location.href=''">				
			</td>
		<tr>						
</table>

</body>
</html>