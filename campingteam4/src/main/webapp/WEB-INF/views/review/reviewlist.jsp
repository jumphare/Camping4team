<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<div class="">
		<table class="">
			<th>캠핑종류</th>
			<th>지역</th>
			<th>인원수</th>
			<th>캠핑사진</th>
			<tbody id="">
				<c:forEach items="${list}" var="row">
				<tr>
					<td>
						${row.productId}
					</td>
					<td href="${path}">
						
					</td>
				</tr>
				</c:forEach>
						<div>
							<fmt:parseDate var="" value="" pattern="" />
						</div>
			</tbody>
		</table>
</div>
</body>
</html>