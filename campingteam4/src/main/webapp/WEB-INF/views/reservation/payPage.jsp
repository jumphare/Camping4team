<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript"  src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">

<title>예약정보 확인</title>
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
  .title2{
    margin-top:4rem;
   font-family: 'GmarketSansBold';
   font-size:2.6rem;
   color:#E8894F;
   margin-bottom:1rem;
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
<div class="container" style="background-color:white; width:60%">
<div class="title">예약정보확인</div>

<div class="title2" >예약자정보</div>
<div class="pmt">
<table class="table rstable" >
	<tr><th style="border-top:0">예약자명</th><td style="border-top:0">${mem.name }</td>	</tr>
	<tr><th>휴대전화</th><td>${mem.phone }</td>	</tr>
	<tr><th>이메일</th><td>${mem.email }</td>	</tr>
</table>
</div>

<div class="title2" >캠핑정보</div>
<div class="pmt">
<table class="table rstable" >
<tr> <th style="border-top:0">장소</th><td style="border-top:0">[${camp.name }] ${spot.sp_name }</td> </tr>
<tr> <th>타입</th><td>${spot.type }</td> </tr>
<tr> <th>인원</th><td>${res.num }</td> </tr>
<tr> <th>일자</th><td>${fn:substring(res.start_date,0,10)}  ~  ${fn:substring(res.end_date,0,10)}</td></tr>
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
		<td>
		 </c:if>
		</tr>
</table>
</div>

<div class="title2" >결제금액</div>
<div class="pmt">
<table class="table-borderless rstable" >
<tr>
		<th style="border-bottom:1px solid #E2E2E2; width:60%">옵션</th>	<th  style="border-bottom:1px solid #E2E2E2; width:10%">수량</th> 	<th style="text-align:right; padding-right:10rem;border-bottom:1px solid #E2E2E2; width:30%">가격</th>
	</tr>
<tr>
		<td colspan=2 style="width:70%; padding-left:10rem; font-weight:bolder;">${spot.type }</td>		<td style="width:30%; text-align:right; padding-right:10rem;">${spot.price }</td>
	</tr>
		<c:if test="${res.price!=spot.price}">
	<c:set var="j" value="0"/>
	<c:forEach var="eqm" items="${eqlist }">
		<tr>
	<c:if test="${eqm_num[j]!=0 }" >
		<td style="padding-left:10rem;">${eqm.name }</td>
		<td style="padding-left:3.5rem;"> ${eqm_num[j] }</td>
		<td style="text-align:right; padding-right:10rem;">${eqm.price*eqm_num[j] }</td>
	</c:if>
	<c:set var="j" value="${j+1 }"/>
		</tr>
	</c:forEach>
		</c:if>
	<tr style="font-size:2rem; font-weight:bolder; color:#00008C;">
		<td colspan=2 style="width:70%; padding-left:10rem; border-top:1px solid #E2E2E2;">총 합계</td>
		<td id="total_price" style="width:30%; text-align:right; padding-right:10rem; border-top:1px solid #E2E2E2;">${res.price }</td>
	</tr>	
</table>
<div class=mg">&nbsp;</div>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td colspan=2  >
		<input type="button" class="btn btn-secondary btn-lg" onclick="history.back()" value="다시선택">
		<button id="payed" class="btn btn-success btn-lg" type="button" >결제</button>
		</td>
	</tr>
</table>
</div>
</div>
<div class=mg">&nbsp;</div><div class=mg">&nbsp;</div><div class=mg">&nbsp;</div>
<script type="text/javascript">
 		$("#payed").click(function(){
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
			        //	alert("결제 및 결제검증완료");
			        	location.href="./pay_result.do?res_no=${res.res_no}&imp_uid="+rsp.imp_uid;
		        	} else {
		        		alert("결제 실패");
		        	}
		        });
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
//		    alert(msg);
		});
		
		}); //결제 버튼  
</script>	
</body>
</html>