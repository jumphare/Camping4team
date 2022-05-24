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
$(document).ready(function(){
    $("#sendmsg").click(function(){
    	$("#smsg").submit();
    	alert("전송되었습니다");
        setTimeout(function() {   
            window.close();
         }, 100);
    });
 });
</script>
</head>
<body>
받는사람 : ${recv_id }<br>
<div>
<form id="smsg" action="./sendmsg.do">
<input type="hidden" name="recv_id" value="${recv_id }">
<textarea rows="15" cols="30" name="content"></textarea><br>
<input type="button" id="sendmsg" value="보내기" >
</form>
</div>
</body>
</html>