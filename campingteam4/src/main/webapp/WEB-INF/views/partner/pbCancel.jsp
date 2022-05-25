<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="pbHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참석 취소</title>
</head>
<body>
	<c:if test="${result >= 0 }">
		<script type="text/javascript">
			alert("참석 취소 완료");
			location.href = "pbList.do?page=${page}";
		</script>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("이미 취소 되었습니다.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>