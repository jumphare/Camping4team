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
<title>쪽지 보관함</title>
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
<script type="text/javascript">
	$(function() {
		$('#msglist').load('./recvlist.do?recv_id=${id}');
	});	
	function table(value){
		if(value==1)
			$('#msglist').load('./recvlist.do?recv_id=${id}');
		else
			$('#msglist').load('./sendlist.do?id=${id}');
	}
	 
</script>
</head>
<body>
<h2>보관함</h2><br>
<%-- <span><a href="./recvlist.do?recv_id=${id }" >받은 메시지</a></span>
<span><a href="./sendlist.do?id=${id }" >보낸 메시지</a></span> <br> --%>
<span><a href="javascript:;" onclick="table(1)">받은 메시지</a></span>
<span><a href="javascript:;" onclick="table(2)">보낸 메시지</a></span> <br>
<div id="msglist"></div>
</body>
</html>