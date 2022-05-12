<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">

<title>예약정보 확인</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	   	  
		var IMP = window.IMP;
		var code = "imp17604781"; //가맹점 식별코드
		IMP.init(code);
		
		$("#payd").click(function(e){
			//결제요청
			IMP.request_pay({
				//name과 amout만있어도 결제 진행가능
				pg : 'kakaopay',
            	pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '[${camp.name }] ${spot.sp_name }', // 상품명
				amount : '${res.price }',  //실제 결제 가격
				buyer_email : '${mem.email }',
				buyer_name : '${mem.name }',
				buyer_tel : '${mem.phone }',  //필수항목
				//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
				//m_redirect_url : 'https://localhost:8080/payments/complete'
			}, function(rsp){
				if(rsp.success){//결제 성공시
					var result = {
					"imp_uid" : rsp.imp_uid,    //결제번호
					"merchant_uid" : rsp.merchant_uid,    //주문번호
					"biz_email" : '${mem.email }',
					"pay_date" : new Date().getTime(),
					"amount" : rsp.paid_amount,
					"card_no" : rsp.apply_num,
					"refund" : 'payed'
					}
				
					$.ajax({
						url : './pay_result.do', 
				        type :'POST',
				        data : JSON.stringify(result,
				        		['imp_uid', 'merchant_uid', 'biz_email', 
				        			'pay_date', 'amount', 'card_no', 'refund']),
				        contentType:'application/json;charset=utf-8',
				        dataType: 'json', //서버에서 보내줄 데이터 타입
					}).done(function(data) {
		                    //서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    if ( data ) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\결제 금액 : ' + rsp.paid_amount;
		                        msg += '카드 승인번호 : ' + rsp.apply_num;             
		                        alert(msg);
		                    } 
		                });
					//성공시 예약목록 페이지로
					location.href='/reserveList.do';
				}
				else{//결제 실패시
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg;
	                alert(msg);
					//실패시 다시 예약페이지로
	                location.href="/reservePage.do?camp_no=${res.camp_no}&spot_no=${res.sp_no}";
				}
				console.log(msg);
			});//pay
		}); //결제 버튼 
	}); //doc.ready
</script>	
	
${id }님의 예약정보 확인<br>
<table>
	<tr>
		<td>캠핑일</td><td>//나중에 date값 받으면 그걸로 변경// 5월 12일(목)  ~ 5월 14일(토)</td>
	</tr>
	<tr>		<td>예약자명</td><td>${mem.name }</td>	</tr>
	<tr>		<td>휴대전화</td><td>${mem.phone }</td>	</tr>
	<tr>		<td>이메일</td><td>${mem.email }</td>	</tr>
</table>
	<span>숙소정보</span>
<table>
	<tr>
		<td>숙소명</td> <td>[${camp.name }] ${spot.sp_name }</td>
	</tr>
	<tr><td>타입</td> <td>${spot.type }</td>	</tr>
	<tr><td>동행인원</td><td>${res.num }</td> 	</tr>
	<tr><td>추가옵션</td>
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
요금 합계
<table border=1>
	<tr> <td>${spot.sp_name }</td>
		<td style="text-align:right">${spot.price }</td> </tr>
		<c:if test="${res.price!=spot.price}">
		<c:set var="j" value="0"/>
		<c:forEach var="eqm" items="${eqlist }">
		<tr>
				<c:if test="${eqm_num[j]!=0 }" >
					<td>${eqm.name } X ${eqm_num[j] }</td>
					<td style="text-align:right">${eqm.price*eqm_num[j] }</td>
			</c:if>
			<c:set var="j" value="${j+1 }"/>
		</tr>
		</c:forEach>
		</c:if>
	<tr>
		<td>총 합계</td> <td style="text-align:right"> ${res.price }</td>
	</tr>
</table>

<table>
	<tr>
		<td colspan=2>
			<input type="button" id="payd" value="결제(아직 안됨)">
			<input type="button" onclick="history.back()" value="다시선택">
		</td>
	</tr>
</table>
</body>
</html>