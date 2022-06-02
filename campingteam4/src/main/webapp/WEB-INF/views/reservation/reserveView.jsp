<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
 <!DOCTYPE html>
<html>
<head>
<!--   <script type="text/javascript" src='https://code.jquery.com/jquery-3.1.0.min.js'></script> -->
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

 
</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" style="background-color:white;">
<div class="title">예약 상세내역</div>
<table class="table restable">
<tr>	<th>예약번호</th> <td>${res.res_no}</td></tr>
<tr>	<th>예약일</th> <td><fmt:formatDate value="${res.res_date}" pattern="yyyy.MM.dd"/></td></tr>
<tr>	<th>예약상태</th> 
	<td><c:if test="${res.state eq '0'}" ><span style="color:#CD1039">결제대기</span></c:if>
		 <c:if test="${res.state eq '1'}" ><span style="color:#006400">예약완료</span></c:if>
		 <c:if test="${res.state eq '2'}" ><span style="color:#828282">예약취소</span></c:if></td></tr>
<tr>	<th>캠핑일</th> <td>${fn:substring(res.start_date,0,10)}  ~  ${fn:substring(res.end_date,0,10)}</td></tr>
<tr>	<th>예약자</th> <td>${mem.name }</td></tr>
<tr>	<th>휴대전화</th> 	<td>${mem.phone }</td></tr>
<tr><td></td><td></td></tr>
</table>

<div class=mg">&nbsp;</div>
<div class="title">캠핑정보</div>
<table class="table restable">
<tr><td rowspan=4 style="width:40%; text-align:center;"><img style="height:20rem; width:20rem;" src="${path }/campupload/${spot.image }"></td>
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
		<td colspan=2  >
		<c:if test="${res.state eq '0' && compare2>1}" >
			<button id="paying" type="button" class="btn btn-success btn-lg">결제</button>
		</c:if>
			<c:if test="${res.state eq '0' || res.state eq '2'}" ><input type="button" value="내역삭제" class="btn btn-secondary btn-lg" onclick="location.href='./res_del.do?res_no=${res.res_no}';" ></c:if>
			<c:if test="${res.state eq '1' && compare2>1}" ><input type="button" value="예약취소" class="btn btn-danger btn-lg"  onclick="cancelPay()"></c:if>
			<c:if test="${(res.state eq '1' || res.state eq '3') && compare2<=1 && re_no==0}" ><input type="button" value="리뷰작성" class="btn btn-success btn-lg"  onclick="location.href='./re_insertform.do?res_no=${res.res_no}&sp_no=${res.sp_no}'"></c:if>
			<input type="button" class="btn btn-light btn-lg" value="목록" onclick="history.back()">
		</td>
	</tr>
</table>
<div class=mg">&nbsp;</div>
<div class=mg">&nbsp;</div>
<script type="text/javascript">
$("#paying").click(function(){
	console.log("결제 진입");
 	var IMP = window.IMP;
	var code = "imp17604781"; //가맹점 식별코드
	IMP.init(code);
	//결제요청
	IMP.request_pay({
    pg : 'kakaopay',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name :'[${camp.name }] ${spot.sp_name }' , //결제창에서 보여질 이름
    amount : ${res.price }, //실제 결제되는 가격
    buyer_email :  '${mem.email }',
    buyer_name :'${mem.name }',
    buyer_tel :'${mem.phone }',
}, function(rsp) {
	console.log(rsp);
    if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.log(msg);

        $.ajax({
        	type : "POST",
        	async : false,
        	url : "./verifyIamport.do",
        	data : { "imp_uid" : rsp.imp_uid  }
        }).done(function(data) {
        	console.log(data);	        	
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	if(rsp.paid_amount == data.response.amount){
	        	alert("결제 및 결제검증완료");
	        	location.href="./pay_result.do?res_no=${res.res_no}&imp_uid="+rsp.imp_uid;
        	} else {
        		alert("결제 실패");
        	}
        });
    } else {
    	 var msg = '결제에 실패하였습니다.';
         msg += '에러내용 : ' + rsp.error_msg;
    } 
 }); 
});
function cancelPay() {
	console.log("취소함수 진입");
	var imp_uid="${res.imp_uid}";
      $.ajax({
      	type : "POST",
      	url : "./imp_cancel.do?price=${res.price}", // 예: http://www.myservice.com/payments/cancel
      	data : { "imp_uid": imp_uid  }
      }).done(function(data) {
      	console.log(data);	        	
      	alert("예약이 정상적으로 취소되었습니다.");
      	location.href="./res_cancel.do?res_no=${res.res_no}";
      });
  }
 

</script>

</div>
</body>
</html>