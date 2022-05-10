<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result!=1}">
	<script>
		alert("다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result==1}">
	<script>
		alert("저장되었습니다");
		location.href="./resmain.do";
	</script>
</c:if>