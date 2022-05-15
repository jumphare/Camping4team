<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 -->
<form method=post action="readreview.do">
<table>
<div id="reply">
  <ol class="replyList">
    <c:forEach items="${replylist}" var="replylist">
      <li>
        <p>
        	작성자 : ${replylist.writer}<br />
       		작성 날짜 :  <fmt:formatDate value="${replylist.re_date}" pattern="yyyy-MM-dd" />
        </p>

        <p>${replylist.content}</p>
      </li>
    </c:forEach>   
  </ol>
</div>
</table>
</form>
</body>
</html>