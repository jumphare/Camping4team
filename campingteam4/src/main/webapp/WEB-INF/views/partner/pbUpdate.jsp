<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="pbHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>

</head>
<body>
no : ${param.par_no} <br>
page : ${param.page}
<form method=post action="pbUpdateResult.do">
<input type="hidden" name="no" value="${param.par_no}">
<input type="hidden" name="page" value="${param.page}">

	<div class="container" align="center">
		<h2 class="text-primary">게시글 글수정</h2>
			<table class="table table-striped">
				<tr>
					<td>번호</td>
					<td><input type = "text" name = "par_no" value = "${partner.par_no}" readonly></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required"
						value="${partner.subject}"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type ="text" name="id" value = "${partner.id}" readonly></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="5" cols="30" name="content" required="required">${partner.content}
						</textarea>
					</td>
				</tr>
				<tr><th>시작일</th>
					<td><input type="date" name = "start_date" id="start_date" required = "required"
			       	min="2022-01-01" max="2022-12-31" value = "${partner.start_date }">
			       	</td>
				</tr>
				<tr><th>종료일</th>
					<td><input type="date" name="end_date" id = "end_date" required="required"
			       	min="2022-01-01" max="2022-12-31" value = "${partner.end_date }"></td>
				</tr>
				<tr><th>캠핑지역</th>
					<td><select name="camp_area" id = "camp_area" required="required" value = "${partner.camp_area }">
					<option value="">캠핑 지역</option>
					<option value=서울>서울</option>
					<option value=천안>천안</option>
					<option value=대전>대전</option>
						
				</tr>
				<tr><th>캠핑종류</th>
					<td><select name="camp_type" id = "camp_type" required="required" value = "${partner.camp_type}">
					<option value="">캠핑 종류</option>
					<option value="차박">차박</option>
					<option value="글램핑">글램핑</option>
					<option value="캠핑">캠핑</option>
					<option value="오토캠핑">오토캠핑</option>
					<option value="카라반">카라반</option>
					</select>
					</td>
				</tr>
				<tr><th>신청인원</th>
					<td><input type=text name="want_num" id = "want_num" required="required" value = "${partner.want_num}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>