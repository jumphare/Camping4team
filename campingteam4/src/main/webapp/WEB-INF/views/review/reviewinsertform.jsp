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
<form method=post action="re_insert.do">
<table id="r_inert_table1" class="table table-hover">
	<h2>후기 글작성</h2>
	&nbsp;
	<tbody>
	<tr><th>제목</th>
		<td><input type=text id="subject" name="subject" required="required" size="60" maxlength="29" placeholder="제목(최대 29자)"></td>
	</tr>
	<tr><th>별점(1~5)</th>
		<td><input type=text id="score" name="score"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea id="content" name="content" rows="25" cols="70" maxlength="284" placeholder="내용(최대 284자)"></textarea>
<!-- 		<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('content',
			{filebrowserUploadUrl:'/comm/imageupload'
			});
		</script></td>
 -->
	</tr>
	<tr><th>첨부</th>
		<td><input type=file id="re_file" name="re_file" required="required" size="60" maxlength="29" ></td>
	</tr>
	<tr><th>첨부2</th>
		<td><input type=file id="re_file2" name="re_file2" required="required" size="60" maxlength="29" ></td>
	</tr>

	
	<tr><td colspan=2 align=center>
			<input class="btn btn-dark" type=button value="글목록"
			onClick="location.href='reviewlist' ">
			<input class="btn btn-dark" type=submit value="글작성">
			<input class="btn btn-dark" type=reset value="취소">
		</td>
	</tr>
	</tbody>
</table>
</form>

</div>
</body>
</html>