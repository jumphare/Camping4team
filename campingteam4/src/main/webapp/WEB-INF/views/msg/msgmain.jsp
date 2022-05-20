<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/> <!-- 부트스트랩 -->
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 이미지 뱃지 다는 css */
.item {
    position:relative;
    padding-top:20px;
    display:inline-block;
}
.notify-badge{
    position: absolute;
    right:-8px;  
    top:13px;    
    background:red;    
    text-align: center;
    border-radius: 30px 30px 30px 30px;
    color:white;
    padding:3px 5px;
    font-size:10px;
}
</style>
</head>
<body>
<script>
function msgsending1() {
	window.open("./writemsg.do?recv_id=aaaa", "쪽지 보내기", "width=600, height=500, left=100, top=50");
}
function msgsending2() {
	window.open("./writemsg.do?recv_id=test", "쪽지 보내기", "width=600, height=500, left=100, top=50");
}
function msgbox(){
	window.open("./recvlist.do?recv_id=${id}", "쪽지 보관함", "width=600, height=500, left=100, top=50");
}
</script>
<c:if test="${id eq 'test' }"><div>test로 로그인</div>
<div><a href="javascript:;" onclick="msgsending1()">aaaa에게 쪽지 보내기</a></div><br>
</c:if>

<c:if test="${id eq 'aaaa' }"><div>aaaa로 로그인</div>
<div><a href="javascript:;" onclick="msgsending2()">test에게 쪽지 보내기</a></div><br>
 </c:if>
 
 <div><a href="javascript:;" onclick="msgbox()" >안 읽은 메시지 : ${cnt }</a></div>
<br>
<div class="col-sm-4">
    <div class="item">
        <a href="#" onclick="msgbox()">
            <span class="notify-badge">${cnt }</span>
            <img src="${pageContext.request.contextPath }/images/mail0.png"  alt="" width=30px height=30px />
        </a>
    </div>
</div>
</body>
</html>