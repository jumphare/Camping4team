<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<!-- 이미지 출력방법~! 위의 path 경로 잡은 거 꼭 header에 포함시킬 것! -->
<div class="ima"><img src="${path }/images/mail0.png" width="20px" height="20px" ></div><br>
</body>
</html>