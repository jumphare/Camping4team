<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>예약 완료</title>
<style>
  html { font-size:10px; } 

  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
font-size:1.6rem;
}
  .title{
  margin-top:1rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  .pmt img{
   width:3.2rem;
   height:3.2rem;
  }

.rstable{
width:100%; 
border-collapse: collapse; 
}
.rstable th{
text-align:center;
color:#E35E0A;
padding-bottom:1rem;
}
.rstable td{
padding: 1rem 1rem 1rem 3rem;

}
.mg{
margin:1rem;
}
 
.pmt{
border:dotted #a0a0a0; 
padding: 2rem;
padding-left:3rem;
padding-right:3rem;
font-family: 'GangwonEdu_OTFBoldA';
}
.pmt input{
   font-family: 'GmarketSansMedium';
 font-size:1.6rem;
}
.pb{
   font-family: 'GmarketSansMedium';
}
 a {
 text-decoration:none;
 color:#E35E0A;
 }
 a:hover{text-decoration:none;}
 
</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" style="background-color:white; width:60%;">
<div class="title" style="text-align:center;">예약되었습니다</div>
<div class="pmt" style="font-size:3.2rem; text-align:center; ">
<p style="margin: 3rem 0 2rem 0;"><img src="${path }/images/check.png"></p>
<p style="margin: 2rem 0 3rem 0;">예약번호 ${res.res_no }</p>
<p style="margin: 1rem 0 1rem 0; font-size:2rem;">${mem.name }님, ${fn:substring(res.start_date,0,10)}일에 만나요!</p>

<div class=mg">&nbsp;</div>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td colspan=2  >
<input type=button id="mainbck" class="btn btn-secondary btn-lg"  value="메인으로" onclick="./layout2.do">
<input type=button id="resList" class="btn btn-info btn-lg" value="예약내역" onclick="location.href='./reserveList.do'">
		</td>
	</tr>
</table>
</div>
<div class="pb">나와 같은 날 떠나는 사람이 있을까? <a href="./pbList.do">동행 찾으러 가기</a></div>

</div>
</body>
</html>