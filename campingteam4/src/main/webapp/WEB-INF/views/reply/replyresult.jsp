<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("댓글 입력 성공");
			location.href = "reviewdetail.do?re_no=${re.re_no}&page=${page}&res_no=${res_no}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("댓글 입력 실패");
			history.go(-1);
		</script>
	</c:if>