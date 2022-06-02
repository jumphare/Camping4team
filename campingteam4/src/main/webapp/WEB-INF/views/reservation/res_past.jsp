<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>지난 예약</title>
<style>
  html { font-size:10px; } 

  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-size:1.6rem;
}
  .title{
  margin-top:1rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }

.eqtable th{
text-align:center;
}
.eqtable td{
text-align:center;

}
.mg{
margin:1rem;
}
 
.pmt{
width:40%; 
border:dotted #a0a0a0; 
border-radius:5px;
padding: 2rem;
}

 a {
 text-decoration:none;
 color:#E35E0A;
 }
 a:hover{text-decoration:none;}
 
 .pgn a{
color:#000;
}
</style>
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
<header>
<%@ include file="../include/top.jsp" %>
</header>
<div class="container" id="past" style="background-color:white;">
<h1 style="margin-bottom:50px;">--</h1>
<div class="title">지난예약관리</div>

<div style="text-align:center;">
<input type="button" value="현재예약"  class="btn btn-outline-light text-dark " onclick="table(1)" style=" font-size:1.6rem;">
<input type="button" value="지난예약"  class="btn btn-info" onclick="table(2)" style=" font-size:1.6rem;"></div>

<div class="form-check-inline" style="margin-bottom:1rem;  margin-left:2rem;">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio"  id="cp_0" value="0" onclick="campfilter(0)">전체
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio" id="cp_1" value="1" onclick="campfilter(1)">서울
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio" id="cp_2" value="2" onclick="campfilter(2)">천안
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio" id="cp_3" value="3" onclick="campfilter(3)">대전
  </label>
</div>

<div class="form-group" style="width:10%;  margin-left:2rem;">
	<select class="form-control"  id="sort" name="sort" onchange="st(this.value)" style="font-size:1.4rem;">
			<option value="res_date">예약일</option>
			<option value="start_date">시작일</option>
			<option value="end_date">종료일</option>
			<option value="state">반납보류</option>
	</select>
</div>
<div>
<div style="float:left; font-size:1.4rem; margin-top:2rem; margin-left:2rem; font-weight:bolder;">예약수 ${cnt } </div>  
	<div style="float:right; font-size:1.4rem; margin-right:2rem; margin-top:1rem; margin-bottom:1rem;">
	<input type="button" id="allrt" class="btn btn-success btn-sm"  onclick="allrt()" value="일괄반납" style=" font-size:1.6rem;" > </div>
</div>

<table class="table eqtable" style="width:100%">  
<tr>
	<th>번호</th><th>예약일</th><th>ID</th><th>상품명</th><th>시작</th><th>종료</th><th>인원</th><th>금액</th><th>상태</th><th>반납</th>
</tr>
<c:if test="${empty list }"><tr><td colspan=9>예약이 없습니다.</td></tr></c:if>
<c:if test="${not empty list }">
<c:set var="i" value="0"/>
<c:forEach var="res" items="${list }" >
<tr>
	<td>${res.res_no}</td>
	<td><fmt:formatDate value="${res.res_date}" pattern="yyyy.MM.dd"/></td> <td>${res.id }</td>
	<td><a href="./res_adminview.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">[${cname[i]}] ${sname[i]}</a></td>
	<td>${fn:substring(res.start_date,0,10)} <%-- ${res.start_date} --%></td>
	<td>${fn:substring(res.end_date,0,10)} <%-- ${res.end_date } --%></td> <td>${res.num }</td> <td>${res.price }</td>
	<td><c:if test="${res.state==1 }"><span style="color:#CD1039">반납보류</span></c:if>  <c:if test="${res.state==3 }"><span style="color:#006400">반납완료</span></c:if></td>
	<td><c:if test="${res.state==1 }"><a href="./eq_return.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">반납</a></c:if>
		 <c:if test="${res.state==3 }"><a href="./eq_return.do?sort=${sort}&camp_no=${camp_no}&page=${page }&res_no=${res.res_no}">취소</a></c:if> </td>
</tr>
<c:set var="i" value="${i+1 }"/>
</c:forEach>
</c:if>
</table>


<!-- 페이지 블럭 -->
<div class="pgn" style="text-align:center;">
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