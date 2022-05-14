<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="reviewupdate_table">
		<form action="${path}/reviewupdate/pageNum/${pageNum}" method="post">
		<input type="hidden" name="re_no" value="${review.re_no}"> 
			<!-- onsubmit="return chk()"> -->
			<table id="r_up_table1" class="table table-hover" >
            <h2>후기 글수정</h2>
            &nbsp;
				<tr>
					<td>번호</td>
					<td>${review.re_no}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required" size="60"
						value="${review.subject}"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${review.id}</td>
				</tr>
				<tr>
					<td>내용</td>

			<td><textarea rows="25" cols="70" name="content" required="required" maxlength="284" id="content">
		     ${review.content}</textarea>
<!--		<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('content',
			{filebrowserUploadUrl:'/comm/imageupload'
			});
		    </script>
 -->			</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class="btn btn-dark" type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>