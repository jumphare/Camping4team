<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){	
    $("#remsg").click(function(){
    	console.log("답장 클릭");
    	var id="${msg.id}";
         $.ajax({
            type:"POST",
            url:"./mb_chk.do",
            data: {"id":id},        
            success: function (data) { 
          	  if(data==1){	//존재하는 회원
          		window.open("./writemsg.do?recv_id=${msg.id}","쪽지 보내기", "width=600, height=500, left=100, top=50");
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
<c:if test="${msg.id eq id}">받는사람 : ${msg.recv_id }<br></c:if>
<c:if test="${msg.recv_id eq id}">보낸사람 : ${msg.id }<br></c:if>
<div>
<textarea rows="15" cols="30" name="content" disabled>${msg.content }</textarea><br>
<c:if test="${msg.recv_id eq id }"><input type="button" id="remsg" value="답장" ></c:if>
<input type="button" id="delmsg" value="삭제" >
<input type="button" id="back" value="목록" onclick="history.back()">
</div>
</body>
</html>