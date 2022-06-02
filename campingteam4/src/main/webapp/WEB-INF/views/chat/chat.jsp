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
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
	websock = new WebSocket("ws://localhost:80/abc/chat-ws.do");
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
	var loc =$('#loc').val();
	websock.send('msg:'+'<'+ loc +'>' + nickname + ' : ' + message);
	$('#message').val('');
}
function onOpen(event) {
	var nickName = $('#nickName').val();
	var loc =$('#loc').val();
	websock.send('msg:'+'<'+ loc +'>'+nickName + " 님이 연결되었습니다.");
	$('#message').val('');
}
function onClose(event) {
	var nickName = $('#nickName').val();
	var loc =$('#loc').val();
	websock.send('msg:'+'<'+ loc +'>'+nickName + "님의 연결이 종료되었니다.");
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
    margin-left:98px;
  }

p{
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
width:300px;
height:20px;
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

.chatMessageArea{
background-color:#eeeeee;
 height: 300px;
  width: 400px;
  
    padding-left:0;

    margin:0;

    list-style-type:none;

    display:flex;

    flex-direction: column-reverse;

    overflow-y:auto;

    border-top:2px solid #fff;

    border-bottom:2px solid #fff;
}
	
	</style>
</head>
<body>

<div class="title">${id}님의 채팅</div>
		<div class="container">
			<input type="hidden" id="loc" value="${loc}">
		별명 : <input type="text" id="nickName"> 
		     <input type="button" value="입장" id="enterBtn" class="btn btn-success"> 
		     <input	type="button" value="퇴장" id="exitBtn" class="btn btn-danger">
		     <br><br>
		     <h2 class="text-primary" align=center>대화영역</h2>
			<div class="chatarea">
			 
			
			<div class="chatMessageArea" id="chatMessageArea"></div>
			
			 
			 <input type="text" id="message" required="required"> 
			 <input type="button" value="전송" id="sendBtn" class="btn btn-info">
			
			 
			</div>
		</div>
</body>
</html>