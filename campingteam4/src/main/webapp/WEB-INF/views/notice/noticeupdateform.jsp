<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("form").submit(function(){
			if($("#subject").val()==''){	
				alert("제목을 입력하세요.");
				$("#subject").focus();
				return false;
			}			
			if($("#content").val()==''){	
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}	
		});	
	});
</script>

</head>
<body>
<form action="noticeupdate.do" method=post enctype="multipart/form-data">
<input type="hidden" name="not_no" value="${board.not_no}">
<input type="hidden" name="page" value="${page}">
<table cellpadding="0" cellspacing="0" align=center border=1 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">게시판</div></td></tr>
<tr>  
		<td>제목</td>
		<td>
			<input name="subject" id="subject" type="text" maxlength="100"  placeholder="제목" 
				style="height:30px; width:100%; border: 0; text-indent: 10px;" value="${board.subject}" />
		</td>
	</tr>
	<tr> 
 	    <td>내용</td>
		<td>
			<textarea name="content" id="content" rows="15" placeholder="내용"
			style="text-indent: 10px; width:100%;">${board.content}</textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family: 'Nanum Gothic', sans-serif;">
			<div align="center" style="font-weight:bold; ">파일</div>
		</td>
		<td>
			<input name="not_file1" type="file" style="width:100%;"/>
		</td>
	</tr>
	<tr >
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=submit value="등록" class="btn btn-primary  btn-sm flex-shrink-0">
			<input type=reset value="취소"  class="btn btn-primary  btn-sm flex-shrink-0">
		</td>
	</tr>
</table>
</form>
</body>
</html>