<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
<title>예약목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
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
  .title{
  margin-top:3rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  
  table{
  font-size:1.6rem;
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


  </style> 
</head>
<body>
<h1>상단바</h1><br><br>
<div class="container" >
<div class="title">예약내역</div>
 <table class="table">
 <thead><tr class="cent">
 	<th>예약일</th><th>예약정보</th><th>상세내역</th><th>리뷰</th>
 </tr></thead>
<c:set var="i" value="0"/>
<c:forEach var="r" items="${rlist }">
	<tr>
		<td><fmt:formatDate value="${r.res_date}" pattern="yyyy.MM.dd"/></td>
		<td class="info">
		<div style="font-weight:bolder;">${fn:substring(r.start_date,0,10)}  ~  ${fn:substring(r.end_date,0,10)}</div>
		<div><a href='./reserveView.do?res_no=${r.res_no}'>[${cname[i]}] ${sname[i]}</a> </div>
		<div><c:if test="${r.state eq '0' }" ><span style="color:#CD1039">결제대기</span></c:if>
		<c:if test="${r.state eq '1' }" ><span style="color:#006400">예약완료</span></c:if>
		<c:if test="${r.state eq '2'}" ><span style="color:#828282">예약취소</span></c:if></div></td>
		<td> 
		<div><a href="./reserveView.do?res_no=${r.res_no}" style="color:#834683; font-weight:bolder;">상세내역</a></div>
		<c:if test="${r.state eq '0' || r.state eq '2'}" ><a href="./res_del.do?res_no=${r.res_no}" style="color:#A52A2A; font-weight:bolder;">삭제</a></c:if>
		</td>
		<td>
		<input type="button" class="btn btn-outline-info btn-lg" value="리뷰 작성" onclick="location.href='./re_insertform.do?res_no=${r.res_no}&sp_no=${r.sp_no}' ">
		</td>
	</tr>
	<c:set var="i" value="${i+1 }"/>
</c:forEach>
</table>
</div>

</body>
</html>