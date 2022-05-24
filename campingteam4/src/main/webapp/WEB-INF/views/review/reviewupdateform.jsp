<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>글작성</title>
</head>
<body>
 <div class="review_insert_table" >
<form id="update" method=post action="<%=request.getContextPath()%>/reviewupdate.do" enctype="multipart/form-data">
<input type="hidden" name="re_no" value="${review.re_no}">
<input type="hidden" name="page" value="${page}">
<table>
	<h2>후기 글수정</h2>

	<tr><th>제목</th>
		<td><input type=text id="subject" name="subject" value="${review.subject }" required="required" size="60" maxlength="29" placeholder="제목(최대 29자)"></td>
	</tr>
	<tr><th>별점(1~5)</th>
		<td><input type=text id="score" name="score" value="${review.score}"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea rows="10" cols="100" dir="auto" id="content" name="content" 
		requrired="required" autofocus="autofocus">${review.content}</textarea></td>
	</tr>
	<tr><th>메인사진</th>
		<td><input type=file id="re_file" name="re_file1" value="${review.re_file}" required="required" size="60" maxlength="29" ></td>
	</tr>
<%-- 	<tr><th>첨부</th>
		<td><input type=file id="re_file2" name="re_file2" value="${review.re_file2}"required="required" size="60" maxlength="29" ></td>
	</tr> --%>
	
	<tr><td colspan=2 align=center>
			<input type=button value="글목록"
			onClick="location.href='reviewlist.do?page=${page}' ">
			<input type="button" id="savebutton" value="수정하기">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>
</div>
<!-- SmartEditor2 --> 
<script type="text/javascript" src = "js/sejs2.js"></script>
</body>
</html>