<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="star.css" rel="stylesheet" type="text/css">
<script src="${path}/js/star.js"></script>
</head>
<body>
		<form id="insert" method=post action="<%=request.getContextPath()%>/re_insert.do" enctype="multipart/form-data">
				<h2>후기 글작성</h2>
				&nbsp;
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type=text id="subject" name="subject"
							required="required" size="60" maxlength="29"
							placeholder="제목(최대 29자)"></td>
					</tr>

					<div class="container">
        <span class="score"></span>
        <div class="stars"></div>
        <div class="btns">
            <button class="reset">X</button>
            <button type="submit" class="grade_btn">O</button>
        </div>  
    </div>
					<!-- 	<tr><th>별점(1~5)</th>
		<td><input type=text id="score" name="score"></td>
	</tr> -->
					<tr>
						<th>내용</th>
						<td><textarea id="content" name="content" rows="10" cols="100" dir="auto"
								maxlength="284" placeholder="내용(최대 284자)"></textarea></td>
					</tr>
					<tr>
						<th>대표이미지</th>
						<td><input type=file id="re_file" name="re_file1"></td>
					</tr>
					<tr>
						<td colspan=2 align=center><input type=button value="글목록" 
						onClick="location.href='reviewlist' ">
							<input type="button" id="savebutton" value="글작성"> <input
							type=reset value="취소"></td>
					</tr>
				</tbody>
		</form>
	<!-- SmartEditor2 --> 
<script type="text/javascript" src = "js/sejs.js"></script>
</body>
</html>


