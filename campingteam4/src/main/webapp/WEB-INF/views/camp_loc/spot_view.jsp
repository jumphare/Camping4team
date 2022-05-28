<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {font-size:15px;}
.star-rating {width:143px; }
.star-rating,.star-rating span {display:inline-block; height:29px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>

	<table border=1 align=center>
		<caption>상세</caption>
		<tr>
			<td>대표이미지</td>
			<td><img
				src="<%=request.getContextPath() %>/campupload/${spot.image}"
				height="400" width="400" /></td>
		</tr>
		<tr>
			<td>장소 이름</td>
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td>별점</td>
			<td>
				<div class="wrap-star">
					<h2>별점 : ${spot.sp_staravg}</h2>
					<div class='star-rating'>
						<span
							style="width: <fmt:formatNumber value="${spot.sp_staravg/5}" type="percent"/>"></span>
					
					
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>${camsel.loc}</td>
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
			<td>${spot.sp_name}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${spot.price}</td>
		</tr>
		<tr>
			<td>성수기 가격 (성수기에만 적용되는 가격입니다.)</td>
			<td>${spot.hightprice}</td>
		</tr>
		<tr>
			<td>상세 이미지</td>
			<td><c:forEach items="${i}" var="num">
					<img src="<%=request.getContextPath() %>/campupload/${num}"
						height="500" width="800" />
					<br>
				</c:forEach></td>
		</tr>
		<tr>
			<td>성수기 날짜 및 주요사항</td>
			<td>${spot.memo}</td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="button" value="목록"
				onClick="location.href='type_list.do?loc=${camsel.loc}&startDate=${camsel.startDate}&endDate=${camsel.endDate}&memcount=${memcount}&type=${camsel.type}'">

				<form method=post id="selectdata"
					action="<%=request.getContextPath()%>/reservePage.do">
					<input type="hidden" id="start_date" name="start_date"
						value="${camsel.startDate}"> <input type="hidden"
						id="end_date" name="end_date" value="${camsel.endDate}"> <input
						type="hidden" id="num" name="num" value="${camsel.memcount}">
					<input type="hidden" id="camp_no" name="camp_no"
						value="${spot.camp_no}"> <input type="hidden" id="sp_no"
						name="sp_no" value="${spot.sp_no}"> <input type="submit"
						value="예약하기!!">
				</form></td>
		</tr>


	</table>

</body>
</html>