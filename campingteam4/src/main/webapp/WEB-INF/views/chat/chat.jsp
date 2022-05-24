<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
var websock;
$(function() {
	$('#message').keypress(function(event) {
		var keycode = event.keyCode ? event.keyCode : event.which;
		if (keycode == 13)
			send();
		event.stopPropagation();
	});
	$('#enterBtn').click(function() {
		connect();
	});
	$('#exitBtn').click(function() {
		disconnect();
	});
	$('#sendBtn').click(function() {
		send();
	});
});
function send() {
	var nickName = $('#nickName').val();
	var msg = $('#message').val();
	websocket.send('msg:' + nickName + ' => ' + msg);
	$('#message').val('');
}
function connect() {
	websock = new WebSocket("ws://localhost:80/campingteam4/chat-ws.do");
	websock.onopen = onOpen;
//	websock.onclose = onClose;
	websock.onmessage = onMessage;
}
function disconnect() {
	websock.close();
}
function send() {
	var nickname = $('#nickName').val();
	var message = $('#message').val();
	websock.send('msg:' + nickname + ' : ' + message);
	$('#message').val('');
}
function onOpen(event) {
	var nickName = $('#nickName').val();
	websock.send('msg:'+nickName + " 님이 연결되었습니다.");
	$('#message').val('');
}
function onClose(event) {
	var nickName = $('#nickName').val();
	websock.send('msg:'+nickName + "님의 연결이 종료되었니다.");
	$('#message').val('');
}
function onMessage(event) {
	var data = event.data;
	appendMessage(data);
}
function appendMessage(msg) {
	$('#chatMessageArea').append(msg + "<br>");
	var chatAreaheight = $('#chatArea').height();
	var maxscroll = $('#chatMessageArea').height() - chatAreaheight;
	$('#chatArea').scrollTop(maxscroll);
}

	</script>
</head>
<body>
	현재 아이디 : ${id}


		
			
		<div class="container">
		별명 : <input type="text" id="nickName"> 
		     <input type="button" value="입장" id="enterBtn" class="btn btn-success"> 
		     <input	type="button" value="퇴장" id="exitBtn" class="btn btn-danger">
		     
			 <h2 class="text-primary">${loc} 지역의 대화영역</h2>
			 
			 <input type="text" id="message" required="required"> 
			 <input	type="button" value="전송" id="sendBtn" class="btn btn-info">
			 <div id="chatArea">
				<div id="chatMessageArea"></div>
			 </div>
		</div>
</body>
</html>