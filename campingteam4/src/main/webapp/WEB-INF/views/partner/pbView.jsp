<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
<script>

</script>
	<table border=1 width=400 align=center>
		<caption>상세 페이지</caption>
		<tr>
			<td>작성자</td>
			<td>${partner.id}</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><fmt:formatDate value="${partner.p_date}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${partner.readcount}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${partner.subject}</td>
		</tr>
		<tr>
			<td>참가인원</td>
			<td>${partner.id }
			<c:if test = "${partner.id == id }">
				<c:forEach var="j_id" items="${joinlist}" begin="0" end= "${fn:length(joinlist) }"  >
					<a href ="./writemsg.do?recv_id=${j_id.join_id }">${j_id.join_id }</a>
				</c:forEach>
			</c:if>
			<c:if test = "${partner.id != id }">
				<c:forEach var="j_id" items="${joinlist}" begin="0" end= "${fn:length(joinlist) }"  >
					${j_id.join_id }
				</c:forEach>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${partner.content}
			</pre></td>
		</tr>
		<tr>
			
			<td colspan=2 align=center>
				<c:choose>
					<c:when test="${result == 0}">
						<input type=button value="신청"
							onClick="location.href='pbJoin.do?par_no=${par_no }&page=${page}' ">
					</c:when>
					<c:when test="${result >= 1}">
						<input type=button value="취소"
							onClick="location.href='pbCancel.do?par_no=${par_no }&page=${page}' ">
					</c:when>
					<c:when test="${partner.now_num == partner.want_num }">
						<input type=button value="마감">
					</c:when>
				</c:choose> 
				
				<input type="button" value="목록"
				onClick="location.href='pbList.do?page=${page}' "> 
				<c:choose>
					<c:when test = "${partner.id == id }">
						<input type="button" value="수정"
						onClick="location.href='pbUpdate.do?par_no=${partner.par_no}&page=${page}' ">
		
						<input type="button" value="삭제"
						onClick="location.href='pbDelete.do?par_no=${partner.par_no}&page=${page}' ">
					</c:when>
					<c:when test = "${id eq 'admin' }">
						<input type="button" value="수정"
						onClick="location.href='pbUpdate.do?par_no=${partner.par_no}&page=${page}' ">
		
						<input type="button" value="삭제"
						onClick="location.href='pbDelete.do?par_no=${partner.par_no}&page=${page}' ">
					</c:when>
				</c:choose>
			</td>
		</tr>
	</table>
	<!-- 댓글 작성 -->
			<form align="center" method="post" action="pbreply.do">
				<input type="hidden" name="id" value="${id}"> 
				<input type="hidden" id="par_no" name="par_no" value="${partner.par_no}">
				<input type="hidden" id="page" name="page" value="${page}">

				<p>댓글쓰기 :</p>
				<textarea class="form-control" rows="3" cols="50" name="content"></textarea>
				<input type="submit" value="확인">

				<!-- 댓글 list 불러오는곳 -->
				
					<table border=1 align=center width=700>
					<tr><th>id</th>
						<th>댓글</th>
						<th>작성일</th>
						<c:if test="${id == l.id}">
						<td>삭제</td>
						</c:if>
						<c:if test = "${pclist eq null}">
							<td col = 3 value = "등록된 댓글이 없습니다.">
							</td>
						</c:if>
						<c:forEach items="${pclist}" var="l">
						<tr>
							<td>${l.id}</td>
							<td>${l.content}</td>
							<td><fmt:formatDate value="${l.c_date}" pattern="yyyy-MM-dd" /></td>
							<c:if test="${id == l.id}">
							<td>
								<input type="button" value="삭제"
									onclick="location.href='pcdelete.do?com_no=${l.com_no }&par_no=${partner.par_no}&page=${page}'" />
							</td>
							</c:if>
						</tr>
						</c:forEach>
					</table>
				
			</form>

</body>
</html>