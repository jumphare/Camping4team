<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {text-decoration:none;}
</style>
<script>
$("form[name='delform']").submit(function(){			
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
</script>
</head>
<body>
<script>
$(function() {
	if('${eqm.type}'!=null)	$("#camp").val("${eqm.type}").prop("selected", true);
});
function tp(value){
	console.log('option: '+value);
	$('#eqlist1').load('./eq_table.do?camp_no=${eqm.camp_no}&type='+value);
	};
function pagin(){
	var id  = $(this).attr('id');
	console.log(id);
	if('${eqm.type}'==null)
		$('#eqlist1').load('./eq_table.do?camp_no=${eqm.camp_no}&pnum='+id);
	if('${eqm.type}'!=null)
		$('#eqlist1').load('./eq_table.do?camp_no=${eqm.camp_no}&type=${eqm.type }&pnum='+id);
};
</script>
<div> <select id="camp" name="type" onchange="tp(this.value)">
			<option value="all">전체</option>
			<option value="글램핑">글램핑</option>
			<option value="차박">차박</option>
			<option value="카라반">카라반</option>
			<option value="캠핑">캠핑</option>
		</select>
</div>
<form name="delform" action="./eq_delete.do" method="post">
<table>
<tr> 
	<td>${cnt }</td> <td></td> <td></td> <td></td> <td></td>
	<td><input type="button" id="btn1" value="추가" onclick="location.href='./eq_insertform.do'"></td> 
	<td><input type="submit" name="btn2" value="삭제" ></td>
</tr>
<tr>
	<th>타입</th> <th>장비명</th> <th>가격</th> <th>수량</th> <th>잔여수량</th> <th>수정</th>
	<th><input type="checkbox" id="allchk" name="allchk" ></th>
</tr>

	<c:if test="${empty list }">	<tr><td colspan=7>장비가 없습니다.</td></tr>	</c:if>
	<c:if test="${not empty list }">
	<c:forEach var="eqm" items="${list }">
<tr>
	<td>${eqm.type }</td> <td>${eqm.name }</td> <td>${eqm.price }</td> <td>${eqm.num }</td> <td>${eqm.rm_num }</td>
	<td><a href="./eq_updateform.do?eq_no=${eqm.eq_no }">수정</a></td>
	<td align=center> <input type="checkbox" name="chk" value="${eqm.eq_no }"> </td>
</tr>
	</c:forEach>
	</c:if>
</table>
</form>
<!-- 페이지 블럭 -->
<div>
	<a href="javascript:;" onclick="pagin()" id="1" }><i class="fa-solid fa-angles-left"></i></a>
	<c:if test="${spage !=1 }">
		<a href="javascript:;" onclick="pagin()" id="${spage-1 }" ><i class="fa-solid fa-angle-left"></i></a>
	</c:if>
	<c:forEach var="i" begin="${spage}" end="${epage}">
		<c:if test="${page==i}">
			<i class="fa-solid fa-${i}"></i>
		</c:if>
		<c:if test="${page!=i}">
			<a href="javascript:;" onclick="pagin()"  id="${i}" ><i class="fa-solid fa-${i}"></i></a>
		</c:if>
	</c:forEach>
	<c:if test="${epage !=pcnt}">
		<a href="javascript:;" onclick="pagin()" id="${epage+1 }"><i class="fa-solid fa-angle-right"></i></a>	
	</c:if>
	<a href="javascript:;" onclick="pagin()" id="${epage }"><i class="fa-solid fa-angles-right"></i></a>
</div>
</body>
</html>