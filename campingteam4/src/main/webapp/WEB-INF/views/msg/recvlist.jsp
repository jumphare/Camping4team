<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="UTF-8">
<title>받은 메시지</title>
<style>
p{
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
width:350px;
height:18px;
padding: 0;
margin: 0px 5px 0 5px;
position: relative;
}
a {
text-decoration:none;
}
</style>
</head>
<body>
<span><a href="javascript:;" onclick="table(1)">받은 메시지</a></span>
<span><a href="javascript:;" onclick="table(2)">보낸 메시지</a></span> <br>
총 메시지 : ${cnt } <br>
<form name="rdform" id="rdform" method="post">
<input type="button" id="mchk" onclick="msgchk()" value="안읽은 쪽지 읽음처리"> 
<input type="button" id="mdel"  value="삭제"> <br>
<input type="hidden" name="page" value="${page }">
<table>
	<tr>
		<th><input type="checkbox" id="allchk" name="allchk" ></th> <td><i class="fa-solid fa-inbox"></i></td> <th>ID</th> <th>내용</th> <th>날짜</th>
	</tr>
	
	<c:if test="${empty msg }"><tr><td colspan=5>받은 쪽지가 없습니다</td></tr></c:if>
	<c:if test="${not empty msg }">
		<c:forEach var="rcv" items="${msg }">
			<tr><td><input type="checkbox" name="chk" value="${rcv.msg_no }"></td> 
			<td><c:if test="${rcv.msg_check==0 }"><i class="fa-regular fa-envelope"></i></c:if>
				 <c:if test="${rcv.msg_check==1 }"><i class="fa-regular fa-envelope-open"></i></c:if></td>
			<td>${rcv.id }</td> 
			<td><p><a href="./readmsg.do?msg_no=${rcv.msg_no }&page=${page}">${rcv.content }</a><p></td> 
			<td><fmt:formatDate value="${rcv.msg_date }" pattern="yy.MM.dd"/></td></tr>
		</c:forEach>
	</c:if>
</table>
</form>

<!-- 페이지 블록 -->
<div>
	<a href="javascript:;" onclick="pagin(1)"><i class="fa-solid fa-angles-left"></i></a>
	<c:if test="${spage !=1 }">
		<a href="javascript:;" onclick="pagin(${spage-1 })" ><i class="fa-solid fa-angle-left"></i></a>
	</c:if>
	<c:forEach var="i" begin="${spage }" end="${epage }">
			<a href="javascript:;" onclick="pagin(${i})"  ><i class="fa-solid fa-${i}"></i></a>
	</c:forEach>
	<c:if test="${epage !=pcnt}">
		<a href="javascript:;" onclick="pagin(${epage+1 })" ><i class="fa-solid fa-angle-right"></i></a>	
	</c:if>
	<a href="javascript:;" onclick="pagin(${epage })"><i class="fa-solid fa-angles-right"></i></a>
</div>



<script>
function msgchk(){
	console.log("msgchk");
	$("input[name=chk]").prop("checked", true);
	$("#rdform").attr("action", "./msgchk.do").submit();
	return false;
}
function muldel(){
	console.log("muldel");
	$("#rdform").attr("action", "./muldel.do?num=1").submit();
	return false;
}
function pagin(value){
	var url = "./recvlist.do?recv_id=${id}&page=";
	console.log(value);
	location.href=url+value;
}
function table(value){
	if(value==1)
		location.href='./recvlist.do?recv_id=${id}';
	else
		location.href='./sendlist.do?id=${id}';
}

 $(function() {
	$("#allchk").click(function(){
		if($("#allchk").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	$("#mdel").click(function(){
		if($("input:checkbox[name=chk]:checked").length < 1){
			alert("쪽지를 체크해주세요");
			return false;
		}
		if($("input:checkbox[name=chk]:checked").length >=1){
			var del=confirm("삭제하시겠습니까?");
			if(del) muldel();
			else return false;
		}
	});
}); 

</script>
</body>
</html>