<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="pbHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
text-align:center;

}
.mg{
margin:1rem;
}
 
.pmt{
width:40%; 
border:dotted #a0a0a0; 
border-radius:5px;
padding: 2rem;
}

 a {
 text-decoration:none;
 color:#E35E0A;
 }
 a:hover{text-decoration:none;}
 
 .pgn a{
color:#000;
}

.headb {
	font-weight: bold;
}

.wrb{
	position : absolute;
	font-weight : bold;
	right : 10px;
}

.div1{
	margin : 20px 250px;

}
</style>
</head>
<body>

<form method=post action="pbUpdateResult.do">
<input type="hidden" name="no" value="${param.par_no}">
<input type="hidden" name="page" value="${param.page}">
<h2 class="title">게시글 글수정</h2>
	<div class="container" align="center">
		
			<div class = "div1">
			<table class="table eqtable">
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
						<textarea rows="5" cols="23" name="content" required="required">${partner.content}
						</textarea>
					</td>
				</tr>
				<tr><td>시작일</td>
					<td><input type="date" name = "start_date" id="start_date" required = "required"
			       	min="2022-01-01" max="2022-12-31" value = "${partner.start_date }">
			       	</td>
				</tr>
				<tr><td>종료일</td>
					<td><input type="date" name="end_date" id = "end_date" required="required"
			       	min="2022-01-01" max="2022-12-31" value = "${partner.end_date }"></td>
				</tr>
				<tr><td>캠핑지역</td>
					<td><select name="camp_area" id = "camp_area" required="required" value = "${partner.camp_area }">
					<option value="">캠핑 지역</option>
					<option value=서울>서울</option>
					<option value=천안>천안</option>
					<option value=대전>대전</option>
						
				</tr>
				<tr><td>캠핑종류</td>
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
				<tr><td>신청인원</td>
					<td><input type=text name="want_num" id = "want_num" required="required" value = "${partner.want_num}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
			</div>
		</form>
	</div>
</body>
</html>