<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>
<body>
 <div class="review_insert_table" >
<form method=post action="reviewupdate.do">
<input type="hidden" name="re_no" value="${review.re_no}">
<input type="hidden" name="page" value="${page}">
<table id="r_inert_table1" class="table table-hover">
	<h2>후기 글수정</h2>

	<tr><th>제목</th>
		<td><input type=text id="subject" name="subject" value="${review.subject }" required="required" size="60" maxlength="29" placeholder="제목(최대 29자)"></td>
	</tr>
	<tr><th>별점(1~5)</th>
		<td><input type=text id="score" name="score" value="${review.score}"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols=40 rows=5 id="content" name="content" requrired="required" autofocus="autofocus">${review.content}</textarea></td>
	</tr>
	<tr><th>메인사진</th>
		<td><input type=file id="re_file" name="re_file" value="${review.re_file}" required="required" size="60" maxlength="29" ></td>
	</tr>
	<tr><th>첨부</th>
		<td><input type=file id="re_file2" name="re_file2" value="${review.re_file2}"required="required" size="60" maxlength="29" ></td>
	</tr>

	
	<tr><td colspan=2 align=center>
			<input class="btn btn-dark" type=button value="글목록"
			onClick="location.href='reviewlist.do?page=${page}' ">
			<input class="btn btn-dark" type=submit value="수정하기">
			<input class="btn btn-dark" type=reset value="취소">
		</td>
	</tr>

</table>
</form>

</div>
</body>
</html>