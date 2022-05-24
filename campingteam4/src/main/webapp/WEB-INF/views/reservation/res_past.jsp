<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>지난 예약</title>
</head>
<body>
<script>
$(function(){
	var cp=${camp_no};
	$("#cp_"+cp).attr("checked",true);
	$("#sort").val("${sort}").prop("selected", true);
});
function campfilter(value){
	var formData = "sort=res_date&page=${page}&camp_no="+value;
	$.post('./res_past.do',formData, function(data) {
		$('#past').html(data);
	});
}
function st(value){
	var cp=${camp_no};
	var formData = "page=${page}&sort="+value+"&camp_no="+cp;
	$.post('./res_past.do',formData, function(data) {
		$('#past').html(data);
	});
}
function table(value){
	if(value==1)
		location.href='./res_cur.do?sort=res_date&camp_no=0&page=1';
	else
		location.href='./res_past.do?sort=end_date&camp_no=0&page=1';
}
function allrt(){
	var con=confirm("반납처리하시겠습니까?");
	if(con)
		location.href="./eq_allrt.do?sort=${sort}&camp_no=${camp_no}&page=${page}";
	else
		return false;
}

function pagin(value){
	console.log(value);
	location.href="./res_past.do?sort=${sort}&camp_no=${camp_no}&page="+value;
};
</script>
<div id="past">
<span><a href="javascript:;" onclick="table(1)">현재 예약</a></span>
<span><a href="javascript:;" onclick="table(2)">지난 예약</a></span> <br>
<div> 
<input type="radio" id="cp_0" value="0" onclick="campfilter(0)">전체
<input type="radio" id="cp_1" value="1" onclick="campfilter(1)">서울
<input type="radio" id="cp_2" value="2" onclick="campfilter(2)">천안
<input type="radio" id="cp_3" value="3" onclick="campfilter(3)">대전
</div>
<div> <select id="sort" name="sort" onchange="st(this.value)">
			<option value="res_date">예약일</option>
			<option value="start_date">시작일</option>
			<option value="end_date">종료일</option>
			<option value="state">반납보류</option>
		</select>
</div>
<div>
<input type="button" id="allrt" onclick="allrt()" value="일괄반납"><br>
</div>

<br>${cnt }<br>
<table>
<tr>
	<th>번호</th><th>예약일</th><th>ID</th><th>장소</th><th>자리</th><th>시작</th><th>종료</th><th>인원</th><th>금액</th><th>상태</th><th>반납</th>
</tr>
<c:if test="${empty list }"><tr><td colspan=9>예약이 없습니다.</td></tr></c:if>
<c:if test="${not empty list }">
<c:forEach var="res" items="${list }" >
<tr>
	<td><a href="./res_adminview.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">${res.res_no}</a></td>
	<td><fmt:formatDate value="${res.res_date}" pattern="yyyy.MM.dd"/></td> <td>${res.id }</td> <td>${res.camp_no }</td> <td>${res.sp_no }</td>
	<td>${fn:substring(res.start_date,0,10)} <%-- ${res.start_date} --%></td>
	<td>${fn:substring(res.end_date,0,10)} <%-- ${res.end_date } --%></td> <td>${res.num }</td> <td>${res.price }</td>
	<td><c:if test="${res.state==1 }">반납보류</c:if>  <c:if test="${res.state==3 }">반납완료</c:if></td>
	<td><c:if test="${res.state==1 }"><a href="./eq_return.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">반납</a></c:if>
		 <c:if test="${res.state==3 }"><a href="./eq_return.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">취소</a></c:if> </td>
</tr>
</c:forEach>
</c:if>
</table>

<!-- 페이지 블럭 -->
<div>
	<a href="javascript:;" onclick="pagin(1)"><i class="fa-solid fa-angles-left"></i></a>
	<c:if test="${spage !=1 }">
		<a href="javascript:;" onclick="pagin(${spage-1 })" ><i class="fa-solid fa-angle-left"></i></a>
	</c:if>
	<c:forEach var="i" begin="${spage}" end="${epage}">
			<a href="javascript:;" onclick="pagin(${i})"  ><i class="fa-solid fa-${i}"></i></a>
	</c:forEach>
	<c:if test="${epage !=pcnt}">
		<a href="javascript:;" onclick="pagin(${epage+1 })"><i class="fa-solid fa-angle-right"></i></a>	
	</c:if>
	<a href="javascript:;" onclick="pagin(${epage })"><i class="fa-solid fa-angles-right"></i></a>
</div>
</div>
</body>
</html>