<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>내용</title>
<style>
 html { font-size:10px; } 

@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-size:1.6rem;
}
  .title{
  margin-top:1rem;
    font-family: 'InfinitySans-RegularA1';
   font-size:2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }

a {
text-decoration:none;
color:#E8894F;
}
.pgn a{
color:#000;
}

.form-group textarea{
font-family: 'InfinitySans-RegularA1';
font-size:1.6rem;
width:100%; 
height:100%;
padding:1.5rem;
}

</style>

<script>
$(function(){	
    $("#remsg").click(function(){
    	console.log("답장 클릭");
    	var id="${msg.id}";
    	console.log(id);
         $.ajax({
            type:"POST",
            url:"./mb_chk.do",
            data: {"id":id},        
            success: function (data) { 
          	  if(data==1){	//존재하는 회원
          		window.open("./writemsg.do?recv_id="+id,"쪽지보내기", "width=600, height=500, left=100, top=50");
          	  }else{	//탈퇴 회원
          		  alert("존재하지 않는 회원입니다.");
          		  return false;
          	  }  
            }
          });//$.ajax 			
    }); //click
    
    $("#delmsg").click(function(){
    	console.log("삭제 클릭");
    	var del=confirm("삭제하시겠습니까?");
		if(del){
			var msg_no=${msg.msg_no};
	    	$.ajax({
	            type:"POST",
	            url:"./delmsg.do",
	            data: {"msg_no":msg_no },        
	            success: function (data) { 
	          	  if(data==1){	//삭제 처리
	          		  alert("삭제되었습니다.");
	          		<c:if test="${msg.recv_id eq id}">location.href="./recvlist.do?recv_id=${id }&page=${page}";</c:if>
	          		<c:if test="${msg.id eq id}">location.href="./sendlist.do?id=${id }&page=${page}";</c:if>	          		
	          	  }else{
	          		  alert("다시 시도해주세요.");
	          		  return false;
	          	  }  
	            }

	          });//$.ajax 
		} else return false;
    });//click1
});
</script>
</head>
<body>
<div class="container" style="width:90%; margin:0 auto;" >
<div class="title">
<c:if test="${msg.id eq id}">받는이  ${msg.recv_id }</c:if>
<c:if test="${msg.recv_id eq id}">보낸이  ${msg.id }</c:if></div>

<div class="form-group" style="height:400px;">
      <textarea class="form-control" id="comment" name="text" disabled="true">${msg.content }</textarea>
</div>
 
<div style="text-align:center;">
<c:if test="${msg.recv_id eq id }"><input type="button" id="remsg" class="btn btn-info btn-sm" value="답장" style=" font-size:1.6rem;"></c:if>
<input type="button" id="delmsg" class="btn btn-danger btn-sm" value="삭제" style=" font-size:1.6rem;">
<c:if test="${msg.recv_id eq id }">
	<input type="button" id="back" value="목록" class="btn btn-secondary btn-sm" onclick="location.href='./recvlist.do?recv_id=${id}&page=${page }'" style=" font-size:1.6rem;">
</c:if>
<c:if test="${msg.id eq id }">
	<input type="button" id="back" value="목록" class="btn btn-secondary btn-sm" onclick="location.href='./sendlist.do?id=${id}&page=${page }'" style=" font-size:1.6rem;">
</c:if>
</div>

</div>
</body>
</html>