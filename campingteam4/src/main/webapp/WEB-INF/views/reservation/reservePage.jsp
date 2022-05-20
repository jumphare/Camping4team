<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>

<meta charset="UTF-8">
<title>예약 페이지</title>

<script type="text/javascript">

$(function(){	
	$('.p').hide();
	$('.minus').click(function(e){
		e.preventDefault();
		var id  = $(this).attr('id');
		var stat = $('#cnt_'+id).text();
		var num = parseInt(stat,10);
		num--;
		
		var eqname=$('#eqname_'+id).text();
		var eqprice=parseInt($('#eqprice_'+id).text(),10);
		var price=parseInt(eqprice*num);	
		
		if(num>=0){
			var tt=parseInt($("#total_price").text(),10);
			var pp=tt-eqprice;
			$("#total_price").text(pp);
			$("#price").val(pp);
		}
		
		if(num<=0){
			num =0;
			$("#p_"+id).hide();
		} else {
			$('#t2_'+id).text(num);
			$('#t3_'+id).text(price);
		}
		$('#cnt_'+id).text(num);
		$('#ii_'+id).val(num);
	});
	
	$('.plus').click(function(e){
		e.preventDefault();
		var id  = $(this).attr('id');
		var cnt = $('#eqnum_'+id).text();
		var stat = $('#cnt_'+id).text();
		var num = parseInt(stat,10);
		num++;
		
		var eqname=$('#eqname_'+id).text();
		var eqprice=parseInt($('#eqprice_'+id).text(),10);
		var price=parseInt(eqprice*num);		

		if(num<=cnt){
			var tt=parseInt($("#total_price").text(),10);
			var pp=tt+eqprice;
			$("#total_price").text(pp);	
			$("#price").val(pp);
		}
 		
		if(num==1){
			$("#p_"+id).show();
		}  
		if(num>cnt){
			num=cnt;
		}
		if(num>0&&num<=cnt){
			$('#t2_'+id).text(num);
			$('#t3_'+id).text(eqprice*num);
		}
		$('#cnt_'+id).text(num);
		$('#ii_'+id).val(num);
	});

});

 
</script>

 
</head>
<body>
값 확인<br>
아이디:${id}<br>
camp_no:${loc.camp_no }<br>
spot_no:${spot.sp_no }<br>
장비 옵션 출력 <br>
<c:forEach var="eqm" items="${list}">
eq_no: ${eqm.eq_no }<br>
</c:forEach>
시작일: ${res.start_date }<br>
종료일: ${res.end_date }<br>

<table>
	<tr>
		<td>[ ${loc.name } ] ${spot.type } </td>
	</tr>
</table>
<table border=1>
	<tr>
		<td>옵션 선택</td>
		<td>수량</td>
	</tr>
	<c:if test="${not empty eqm.eq_no}"> <td colspan=3>옵션이 존재하지 않는 상품입니다.</td></c:if>
	<c:forEach var="eqm" items="${list }"> 
	<span style="display:none" id="eqname_${eqm.eq_no }">${eqm.name }</span>
	<span style="display:none" id="eqprice_${eqm.eq_no }">${eqm.price }</span>
	<span style="display:none" id="eqnum_${eqm.eq_no }">${eqm.rm_num }</span>
	<tr>
		<td>
			${eqm.name }   (+${eqm.price }원)   [현재 수량 : ${eqm.rm_num }]
		</td> 
		<td>
			<a href="javascript:;" class="minus" id="${eqm.eq_no }" ><i class="fa-solid fa-minus"></i></a>
					<span id="cnt_${eqm.eq_no }" >0</span>
			<a href="javascript:;" class="plus" id="${eqm.eq_no }" ><i class="fa-solid fa-plus"></i></a>
		</td>
	</tr>
	</c:forEach>
</table>
<form method="post" name="frm1" >
<input type=hidden name="id" value=${id }>
<input type=hidden name="camp_no" value="${loc.camp_no }">
<input type=hidden name="sp_no" value="${spot.sp_no }">
<input type=hidden name="start_date" value="${res.start_date}">
<input type=hidden name="end_date" value="${res.end_date}">
<input type=hidden name="num" value="${res.num}">
<input type=hidden id="price" name="price" value="${spot.price }">
<br><br><br>
<table border=1 id="total">
	<tr>
		<td>옵션</td>	<td>수량</td> 	<td>가격</td>
	</tr>
	<tr>
		<td colspan=2>${spot.type }</td>		<td>${spot.price }</td>
	</tr>
	<c:forEach var="eqm" items="${list }"> 
 	<input type=hidden name="eqm_no" value="${eqm.eq_no }">
	<input type=hidden id="ii_${eqm.eq_no }" name="eqm_num" value="0"> 
	<tr id="p_${eqm.eq_no }" class="p">
		<td id="t1_${eqm.eq_no }" >${eqm.name }</td>
		<td id="t2_${eqm.eq_no }" >0</td>
		<td id="t3_${eqm.eq_no }" >0</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan=2>총 합계</td>		<td id="total_price">${spot.price }</td>
	</tr>
</table>

<input type="submit" value="저장" formaction="./res_save.do">
<input type="submit" value="다음"  formaction="./res_pay.do">
</form>
</body>
</html>