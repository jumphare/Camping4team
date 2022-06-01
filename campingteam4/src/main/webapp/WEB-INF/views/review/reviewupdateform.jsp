<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
<style>
  html { font-size:15px; } 
  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  .title{
  margin-top:3rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  
  table{
  font-size:2.8rem;
  }
  
   th, td{
    text-align: center;
    vertical-align : middle;
    } 

a{
color: #000;
}
a:hover{
text-decoration:none;
}

.container {
  position: absolute;
  margin-left: -200px;
  margin-top: -200px;
  left: 39%;
  top: 30%;
};

  </style> 
<title>글수정</title>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" >
<form id="update" name="cmtform" method=post action="<%=request.getContextPath()%>/reviewupdate.do" enctype="multipart/form-data">
<input type="hidden" name="re_no" value="${review.re_no}">
<input type="hidden" name="page" value="${page}">
	<div class="title">후기 수정</div>
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
    				
    			</div>
    			<input type="hidden" name="score"/>
		<td><textarea rows="10" cols="100" dir="auto" maxlength="284"
		id="content" name="content">${review.content}</textarea></td>
	<tr>
		<td><input type=file id="re_file" name="re_file1" value="${review.re_file}" required="required" size="60" maxlength="29" ></td>
	</tr>
<%-- 	<tr><th>첨부</th>
		<td><input type=file id="re_file2" name="re_file2" value="${review.re_file2}"required="required" size="60" maxlength="29" ></td>
	</tr> --%>
	<div style="padding:10px; margin: 0 auto; height: 200px;">
		<td colspan=2 align=center>
			<input type=button value="글목록"
			onClick="location.href='reviewlist.do?page=${page}'" class="btn btn-success" style="font-size:1.0em;">
			<input type="button" id="savebutton" value="수정하기" class="btn btn-success" style="font-size:1.0em;">
			<input type=reset value="취소" class="btn btn-success" style="font-size:1.0em;">
		</td>
		</div>
	</form>
	</div>
<!-- SmartEditor2 --> 
<script type="text/javascript" src = "js/sejs2.js"></script>
</body>
</html>