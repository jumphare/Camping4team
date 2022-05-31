<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
 <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>예약 상세내역</title>
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
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }

.restable th{
width:20%;
}
.restable td{
padding-left:4rem;
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
</style>
</head>
<body>
<script>
function sending(value){
	window.open("./writemsg.do?recv_id="+value, "쪽지 보내기", "width=600, height=500, left=100, top=50");
}
</script>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" style="background-color:white;">
<div class="title">예약 상세내역</div>
<table class="table restable">
<tr>	<th>예약번호</th> <td>${res.res_no}      <input type="button" class="btn btn-outline-info btn-sm" id="sendmsg" value="예약자에게 쪽지 보내기" style="font-size:1.4rem;" onclick="sending('${mem.id}')"></td></tr>
<tr>	<th>예약일</th> <td><fmt:formatDate value="${res.res_date}" pattern="yyyy.MM.dd"/></td></tr>
<tr>	<th>예약상태</th> 
	<td><c:if test="${res.state eq '0'}" ><span style="color:#CD1039">결제대기</span></c:if>
		 <c:if test="${res.state eq '1'}" ><span style="color:#006400">예약완료</span></c:if>
		 <c:if test="${res.state eq '2'}" ><span style="color:#828282">예약취소</span></c:if></td></tr>
		 <c:if test="${res.state eq '3'}" ><span style="color:#3065AC">반납완료</span></c:if></td></tr>
<tr>	<th>캠핑일</th> <td>${fn:substring(res.start_date,0,10)}  ~  ${fn:substring(res.end_date,0,10)}</td></tr>
<tr>	<th>예약자</th> <td>${mem.name }</td></tr>
<tr>	<th>휴대전화</th> 	<td>${mem.phone }</td></tr>
<tr>		<th>이메일</th><td>${mem.email }</td>	</tr>
<tr><td></td><td></td></tr>
</table>

<div class=mg">&nbsp;</div>
<div class="title">예약상품</div>

<table class="table restable">
<tr><td rowspan=4 style="width:40%;">${spot.image }</td>
	<th>장소</th><td>[${camp.name }] ${spot.sp_name }</td>	</tr>
<tr><th>타입</th> <td>${spot.type }</td>	</tr>
<tr><th>동행인원</th><td>${res.num }</td> </tr>
<tr><th>추가옵션</th>
<c:if test="${res.price==spot.price }"><td>선택한 옵션이 없습니다.</td></c:if>
<c:if test="${res.price!=spot.price}">
	<c:set var="i" value="0"/>
	<td>
		<c:forEach var="eqm" items="${eqlist }">
			<c:if test="${eqm_num[i]!=0 }" >
					${eqm.name} (${eqm.price })   X   ${eqm_num[i]} <br>
			</c:if>
			<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</td>
	 </c:if></tr>
<tr><td></td><td></td><td></td></tr>
</table>

<div class=mg">&nbsp;</div>
<div class="title">결제정보</div>
<div class="pmt">
<table style="width:100%; border-collapse: collapse; ">
<tr  style="font-weight:bolder;">
	<td></td>
	<td style="text-align:center">${spot.sp_name }</td>
	<td style="text-align:right; padding:0.5rem 1rem 0.5rem 0.5rem;">${spot.price }</td> </tr>
<c:if test="${res.price!=spot.price}">
	<c:set var="j" value="0"/>
	<c:forEach var="eqm" items="${eqlist }">
<tr>
	<c:if test="${eqm_num[j]!=0 }" >
		<td></td>
		<td style="text-align:center">${eqm.name } X ${eqm_num[j] }</td>
		<td style="text-align:right; padding:0.5rem 1rem 0.5rem 0.5rem;">${eqm.price*eqm_num[j] }</td>
	</c:if>
	<c:set var="j" value="${j+1 }"/>
</tr>
	</c:forEach>
	</c:if>
	<tr>
	<td colspan=3><hr size="2"></td></tr>
	<tr style="font-size:2rem; font-weight:bolder; color:#00008C;">
		<td></td><td style="text-align:center">총 합계</td> <td style="text-align:right; padding:0.5rem 1rem 0.5rem 0.5rem;"> ${res.price }</td>
	</tr>
</table>
</div>
<div class=mg">&nbsp;</div>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td colspan=2>
			<button class="btn btn-success btn-lg" style=" font-size:1.6rem;" type="button" onclick="./eq_returnview.do?res_no=${res.res_no}">
			<c:if test="${res.state==1 }">장비반납</c:if><c:if test="${res.state==3 }">반납취소</c:if></button>
			 <input type="button" class="btn btn-light btn-lg" value="목록" style=" font-size:1.6rem;" onclick="history.back()">
		</td>
	</tr>
</table>
<div class=mg">&nbsp;</div>
<div class=mg">&nbsp;</div>
<div class=mg">&nbsp;</div>
</div>
</body>
</html>