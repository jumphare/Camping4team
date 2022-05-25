<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
var locked = 0;

function show(star) {
	if (locked)
		return;
	var i;
	var image;
	var el;
	var e = document.getElementById('startext');
	var stateMsg;

	for (i = 1; i <= star; i++) {
		image = 'image' + i;
		el = document.getElementById(image);
		el.src = "img/star1.png"
	}

	switch (star) {
	case 1:
		stateMsg = "별로에요";
		break;
	case 2:
		stateMsg = "기대는 마세요";
		break;
	case 3:
		stateMsg = "보통이에요";
		break;
	case 4:
		stateMsg = "나쁘지 않아요";
		break;
	case 5:
		stateMsg = "최고에요!!!!";
		break;
	default:
		stateMsg = "";
	}
	e.innerHTML = stateMsg;
}

function noshow(star) {
	if (locked)
		return;
	var i;
	var image;
	var el;


	for (i = 1; i <= star; i++) {
		image = 'image' + i;
		el = document.getElementById(image);
		el.src = "img/star0.png"
	}
}

function lock(star){
	show(star);
	locked=1;
}
function mark(star){
	lock(star);
	alert("선택한 값은 "+star+"입니다.");
	document.cmtform.score.value=star;
}
</script>
<title>글수정</title>
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
<div id=rating>
    			<span>
    			<img id=image1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="img/star0.png">
    			<img id=image2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="img/star0.png">
    			<img id=image3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="img/star0.png">
    			<img id=image4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="img/star0.png">
    			<img id=image5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="img/star0.png">
    			 </span><br>
    			 <span id="startext">평가하기</span>		
    			</div>
    			<input type="hidden" name="score"/>
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