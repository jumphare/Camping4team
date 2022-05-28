<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>장비 관리</title>
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

<script>
/* $("form[name='delform']").submit(function(){			
	if($("input:checkbox[name=chk]:checked").length < 1){
		alert("삭제할 장비를 체크해주세요");
		return false;
	}
	if($("input:checkbox[name=chk]:checked").length >=1){
		var del=confirm("삭제하시겠습니까?");
		if(del) document.form.submit();
		else return false;
	}
});	
$("#allchk").click(function(){
	if($("#allchk").is(":checked")) $("input[name=chk]").prop("checked", true);
	else $("input[name=chk]").prop("checked", false);
});
 */
$(function() {
	<c:forEach var="eqmm" items="${list }">
	var no = "${eqmm.eq_no }";
	var num=${eqmm.num};
	var rm=${eqmm.rm_num};
	
	if(num!=rm)
		$("input:checkbox[name='chk'][value='"+no+"']").prop("disabled", true);
	</c:forEach>
	
	$("#allchk").click(function(){
		if($("#allchk").is(":checked")) 	$("input[name=chk]:not(:disabled)").prop("checked",true);
		else $("input[name=chk]").prop("checked", false);
	});
	$("#mdel").click(function(){
		if($("input:checkbox[name=chk]:checked").length < 1){
			alert("삭제할 장비를 체크해주세요");
			return false;
		}
		if($("input:checkbox[name=chk]:checked").length >=1){
			var del=confirm("삭제하시겠습니까?");
			if(del) muldel();
			else return false;
		}
	});
}); 
 function muldel(){
		console.log("muldel");
		$("#delform").attr("action", "./eq_delete.do").submit();
		return false;
	}
 
 
</script>
</head>
<body>
<script>
$(function() {
	$("#camp").val("${eqm.type}").prop("selected", true);
	var cp=${eqm.camp_no};
	$("#cp_"+cp).attr("checked",true);
	
	$("#isrt").click(function(){
		window.open("./eq_insertform.do", "장비 등록", "width=500, height=300, left=100, top=50");
	});
	
});

function table(value){
	console.log("camp_no: "+value);
	location.href='./eq_table.do?camp_no='+value;
};
function tp(value){
	console.log('option: '+value);
	var formData = "camp_no=${eqm.camp_no}&type="+value;
	location.href='./eq_table.do?'+formData;
//	location.href='./eq_table.do?camp_no=${eqm.camp_no}&type='+value;
};
function pagin(value){
	console.log(value);
	var type='${eqm.type}';
	if(type=='all')		location.href='./eq_table.do?camp_no=${eqm.camp_no}&pnum='+value;		
	if(type!='all')		location.href='./eq_table.do?camp_no=${eqm.camp_no}&type='+type+'&pnum='+value;
};

function udt(value){
	var url="./eq_updateform.do?eq_no="+value;
	window.open(url, "장비 수정", "width=500, height=300, left=100, top=50");
}
</script>
<h1>상단바</h1><br><br>
<div class="container">
<div class=mg">&nbsp;</div>
<div class="title">장비옵션 관리</div>

<div class="form-check-inline" style="margin-bottom:1rem;  margin-left:2rem;">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio"  id="cp_1" value="1" onclick="table(1)">서울
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio" id="cp_2" value="2" onclick="table(2)">천안
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="optradio" id="cp_3" value="3" onclick="table(3)">대전
  </label>
</div>
<div class="form-group" style="width:10%;  margin-left:2rem;">
 <select class="form-control"  id="camp" name="type" onchange="tp(this.value)" style="font-size:1.4rem;">
			<option value="all">전체</option>
			<option value="글램핑">글램핑</option>
			<option value="차박">차박</option>
			<option value="카라반">카라반</option>
			<option value="캠핑">캠핑</option>
		</select>
</div> 

<form name="delform" id="delform" method="post">
<input type="hidden" name="camp_no" value="${eqm.camp_no }">
<div>   
	<div style="float:left; font-size:1.4rem; margin-top:2rem; margin-left:2rem; font-weight:bolder;">현재 등록 장비 ${cnt } </div>  
	<div style="float:right; font-size:1.4rem; margin-right:2rem; margin-top:1rem; margin-bottom:1rem;"><input type="button" id="mdel"  class="btn btn-danger btn-sm" value="삭제" style=" font-size:1.6rem;"> </div>
	<div style="float:right; font-size:1.4rem; margin-right:1rem; margin-top:1rem; margin-bottom:1rem;"><input type="button" id="isrt" class="btn btn-success btn-sm"  value="추가" style=" font-size:1.6rem;" > </div>
</div>
<div class="container">
<table class="table eqtable" style="width:100%">  
<tr>
	<th width="10%">지역</th>
	<th width="20%">타입</th><th width="20%">장비명</th><th width="15%">가격</th><th width="10%">수량</th><th width="10%">잔여수량</th><th width="10%">수정</th>
	<th width="5%"><input type="checkbox" id="allchk" name="allchk" ></th>
</tr>   
	<c:if test="${empty list }">	<tr><td colspan=7>장비가 없습니다.</td></tr>	</c:if>
	<c:if test="${not empty list }">
	<c:forEach var="eqmm" items="${list }">
<tr>
	<td width="10%">
	<c:if test="${eqmm.camp_no==1 }">서울</c:if>
	<c:if test="${eqmm.camp_no==2 }">천안</c:if>
	<c:if test="${eqmm.camp_no==3 }">대전</c:if></td>
	<td width="20%">${eqmm.type }</td> <td width="20%">${eqmm.name }</td> <td width="15%">${eqmm.price }</td> <td width="10%">${eqmm.num }</td> <td width="10%">${eqmm.rm_num }</td>
	<td width="10%"><input type="button" onclick="udt(${eqmm.eq_no })" value="수정" class="btn btn-info btn-sm" style=" font-size:1.6rem;"></td>
	<td width="5%"> <input type="checkbox" name="chk" value="${eqmm.eq_no }"> </td>
</tr>
	</c:forEach>
	</c:if>
</table>
</div>
</form>
 <form id="form1" name="form1">
 <input type="button" id="srch" name="srch" onclick="location.reload(); ">
 </form>
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