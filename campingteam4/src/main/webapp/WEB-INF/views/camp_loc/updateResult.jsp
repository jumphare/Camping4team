<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result==1}">
	<script>
		alert("사이즈가 큽니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result==2}">
	<script>
		alert("형식이 다릅니다.");
		history.go(-1);
	</script>
</c:if>