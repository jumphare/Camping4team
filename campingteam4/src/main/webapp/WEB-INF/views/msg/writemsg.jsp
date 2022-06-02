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
<title>쪽지 보내기</title>
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
    $("#sendmsg").click(function(){
    	$("#smsg").submit();
    	alert("전송되었습니다");
        setTimeout(function() {   
            window.close();
         }, 100);
    });
    var id="${id}";
    $.ajax({
       type:"POST",
       url:"./not_me.do?recv_id=${recv_id}",
       data: {"id":id},        
       success: function (data) { 
     	  if(data==1){	//타인에게 쪽지를 보냄
     		window.open("./writemsg.do?recv_id=${msg.id}","쪽지 보내기", "width=600, height=500, left=100, top=50");
     	  }else{	//나한테 쪽지를 보냄
     		  alert("자신에게 쪽지를 보낼 수 없습니다.");
     		  window.close();
     	  }  
       }
     });//$.ajax 
    
 });
</script>
</head>
<body>
<div class="container" style="width:90%; margin:0 auto;" >
<div class="title">받는이   ${recv_id }</div>
<form id="smsg" action="./sendmsg.do">
<input type="hidden" name="recv_id" value="${recv_id }">
<div class="form-group" style="height:400px;">
      <textarea class="form-control" id="comment" name="content" ></textarea>
</div>
<input type="button" id="sendmsg" class="btn btn-info btn-sm"  value="보내기" style=" font-size:1.6rem;" >
</form>
</div>
</body>
</html>