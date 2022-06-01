<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/date.css" />
<script src="<%=request.getContextPath() %>/js/date.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
<style>
   html { font-size:10px; }  

   @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 

   body{
font-size:1.6rem;
}   
   .title{
  margin-top:1rem;
  margin-left:4rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  } 

 .eqtable th{
 text-align:center;  
} 
.eqtable td{
   /* text-align:center; */

}
/* .mg{
margin:1rem;
} */
 
/* .pmt{
width:40%; 
border:dotted #a0a0a0; 
border-radius:5px;
padding: 2rem;
} */

 /* a {
 text-decoration:none;
 color:#E35E0A;
 } */
 a:hover{text-decoration:none;}
 
/*  .pgn a{
color:#000;
} */

/* .headb {
	font-weight: bold;
} */

/* .wrb{
	position : absolute;
	font-weight : bold;
	right : 10px;
} */
 .div1{
	margin : 50px 250px;
} 
</style>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>

<form action="noticeInsert.do" method=post enctype="multipart/form-data">
<h2 class="title">글작성</h2>
<div class = "div1">
	<table class = "table eqtable" width=400 align=center>
		<tr><th>제목</th>
			<td><input type=text id = "subject" name="subject" required="required" autofocus="autofocus"  style="width:100%" ></td>
		</tr>
			<tr><th>옵션</th>
			<td ><input type=checkbox id = "noti_flag" name="noti_flag" value="1">공지글</td>
		</tr>	
		<tr><th>내용</th>
			<td><textarea cols = 23 rows = 5 id = "content" name = "content" required = "required" style="width:100%" ></textarea>
		</tr> 
	
		<tr>
			<td style="font-family: 'Nanum Gothic', sans-serif;">
				<div align="center" style="font-weight:bold; ">파일</div>
			</td>
			<td>
				<input name="not_file1" type="file" style="width:100%;"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" style="height:1px;"></td>
		</tr>
		
		<tr>
			<td colspan=8 align=center>
				<input type=submit value="등록">
				<input type=reset value="취소"
				onClick="location.href='noticelist.do?not_no=${board.not_no}&page=${page}' ">
			</td>		
		</tr>
	</table>
</form>
</body>
</html>