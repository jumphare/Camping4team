<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>받은 메시지</title>
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

p{
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
width:30rem;
height:2rem;
padding: 0;
margin: 0 5px -10px 5px;
position: relative;
}
a {
text-decoration:none;
color:#E8894F;
}
.pgn a{
color:#000;
}

</style>
</head>
<body> 
<div class="container" style="width:90%; margin:0 auto;" >
<div class="title">${id }님의 보관함</div>
<div style="text-align:center;"><input type="button" value="받은 메시지"  class="btn btn-info" onclick="table(1)" style=" font-size:1.6rem;">
<input type="button" value="보낸 메시지"  class="btn btn-outline-light text-dark " onclick="table(2)" style=" font-size:1.6rem;"></div>

<form name="rdform" id="rdform" method="post">
<div style="float:left; margin-bottom:0.5rem;"><input type="button" id="mchk" class="btn btn-secondary btn-sm" onclick="msgchk()" value="전체읽음" style=" font-size:1.2rem;"> 
<input type="button" id="mdel"  class="btn btn-danger btn-sm" value="삭제" style=" font-size:1.2rem;"> </div>
<div style="float:right; font-size:1.4rem;">총 메시지 : ${cnt } </div>
<input type="hidden" name="page" value="${page }">
<table class="table">
	<tr style="text-align:center;">
		<th width="5%"><input type="checkbox" id="allchk" name="allchk" ></th>
		<td width="5%"><i class="fa-solid fa-inbox"></i></td>
		<th width="10%">ID</th>
		<th width="70%">내용</th>
		<th width="10%">날짜</th>
	</tr>
	
	<c:if test="${empty msg }"><tr><td colspan=5>받은 쪽지가 없습니다</td></tr></c:if>
	<c:if test="${not empty msg }">
		<c:forEach var="rcv" items="${msg }">
			<tr style="text-align:center"><td><input type="checkbox" name="chk" value="${rcv.msg_no }"></td> 
			<td><c:if test="${rcv.msg_check==0 }"><i class="fa-regular fa-envelope"></i></c:if>
				 <c:if test="${rcv.msg_check==1 }"><i class="fa-regular fa-envelope-open"></i></c:if></td>
			<td>${rcv.id }</td> 
			<td style="text-align:left; padding-left:1.5rem;"><p><a href="./readmsg.do?msg_no=${rcv.msg_no }&page=${page}">${rcv.content }</a><p></td> 
			<td><fmt:formatDate value="${rcv.msg_date }" pattern="yy.MM.dd"/></td></tr>
		</c:forEach>
	</c:if>
</table>
</form>
<!-- 페이지 블록 -->
<div class="pgn" style="text-align:center;">
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

<div style="float:left;">
<c:if test="${id ne 'admin' }">
<input type="button" class="btn btn-success" id="qna" style=" font-size:1.6rem;" value="문의하기" onclick="qna()">
</c:if>
</div>
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
function qna(){
	window.open("./writemsg.do?recv_id=admin","쪽지보내기", "width=600, height=500, left=100, top=50");
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