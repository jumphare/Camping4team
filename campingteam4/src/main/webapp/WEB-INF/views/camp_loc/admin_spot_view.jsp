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

<table border=1 align=center>
	<caption>상세</caption>
		<tr>
			<td>대표이미지</td>
			<td>
			<img src="<%=request.getContextPath() %>/campupload/${spot.image}" height="400" width="400" />
			</td>
		</tr>	
		<tr>
			<td>장소 이름</td>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>
			<c:if test="${spot.camp_no == 1}">
				서울
			</c:if>
			<c:if test="${spot.camp_no == 2}">
				천안
			</c:if>
			<c:if test="${spot.camp_no == 3}">
				대전
			</c:if>
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
			<td>상세 이미지</td>
			<td>
			<c:forEach items="${i}" var="num">
			${num} <br>
			<img src="<%=request.getContextPath() %>/campupload/${num}" height="500" width="800" />
			<br>
			</c:forEach>
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
					onClick="location.href='admin_camp_list.do'">
				<input type="button" value="수정"
				onclick="location.href=''">
				<input type="button" value="삭제"
				onclick="location.href=''">				
			</td>
		</tr>			
</table>

</body>
</html>