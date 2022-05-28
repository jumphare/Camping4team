<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<h1>상단바</h1><br><br>
<div class="container" style="width:60%">
<div class="title">예약</div>
<div class="title2" >캠핑정보</div>
<div class="pmt">
<table class="table rstable" >
<tr> <th style="border-top:0">장소</th><td style="border-top:0">[${loc.name }] ${spot.sp_name }</td> </tr>
<tr> <th>타입</th><td>${spot.type }</td> </tr>
<tr> <th>인원</th><td>${res.num }</td> </tr>
<tr> <th>일자</th><td>${fn:substring(res.start_date,0,10)}  ~  ${fn:substring(res.end_date,0,10)}</td></tr></td> </tr>
</table>
</div>

<div class="title2" >추가옵션선택</div>
<div class="pmt">
<table class="table rstable">
<tr>
		<th colspan=2 style="border-top:0; width:75%" >옵션 선택</th>
		<th style="border-top:0; width:25%" >수량</th>
</tr>
	<c:if test="${not empty eqm.eq_no}"> <td colspan=3>옵션이 존재하지 않는 상품입니다.</td></c:if>
	<c:forEach var="eqm" items="${list }"> 
	<span style="display:none" id="eqname_${eqm.eq_no }">${eqm.name }</span>
	<span style="display:none" id="eqprice_${eqm.eq_no }">${eqm.price }</span>
	<span style="display:none" id="eqnum_${eqm.eq_no }">${eqm.rm_num }</span>
	<tr>
		<td>
			${eqm.name }   (+${eqm.price }원)  
		</td> 
		<td> [현재 수량 : ${eqm.rm_num }]</td>
		<td style="text-align:center; padding-left:1rem">
			<a href="javascript:;" class="minus" id="${eqm.eq_no }" ><i class="fa-solid fa-minus"></i></a>
					<span id="cnt_${eqm.eq_no }" >0</span>
			<a href="javascript:;" class="plus" id="${eqm.eq_no }" ><i class="fa-solid fa-plus"></i></a>
		</td>
	</tr>
	</c:forEach>
</table>
</div>
<div class="title2" >금액</div>
<div class="pmt">
<form method="post" name="frm1" >
<input type=hidden name="id" value=${id }>
<input type=hidden name="camp_no" value="${loc.camp_no }">
<input type=hidden name="sp_no" value="${spot.sp_no }">
<input type=hidden name="start_date" value="${res.start_date}">
<input type=hidden name="end_date" value="${res.end_date}">
<input type=hidden name="num" value="${res.num}">
<input type=hidden id="price" name="price" value="${spot.price }">

<table class="table-borderless rstable" id="total">
	<tr>
		<th style="border-bottom:1px solid #E2E2E2; width:60%">옵션</th>	<th  style="border-bottom:1px solid #E2E2E2; width:10%">수량</th> 	<th style="text-align:right; padding-right:10rem;border-bottom:1px solid #E2E2E2; width:30%">가격</th>
	</tr>
	<tr>
		<td colspan=2 style="width:70%; padding-left:10rem; font-weight:bolder;">${spot.type }</td>		<td style="width:30%; text-align:right; padding-right:10rem;">${spot.price }</td>
	</tr>
	<c:forEach var="eqm" items="${list }"> 
 	<input type=hidden name="eqm_no" value="${eqm.eq_no }">
	<input type=hidden id="ii_${eqm.eq_no }" name="eqm_num" value="0"> 
	<tr id="p_${eqm.eq_no }" class="p">
		<td id="t1_${eqm.eq_no }" style="padding-left:10rem;">${eqm.name }</td>
		<td id="t2_${eqm.eq_no }" style="padding-left:3.5rem;">0</td>
		<td id="t3_${eqm.eq_no }" style="text-align:right; padding-right:10rem;">0</td>
	</tr>
	</c:forEach>
	<tr style="font-size:2rem; font-weight:bolder; color:#00008C;">
		<td colspan=2 style="width:70%; padding-left:10rem; border-top:1px solid #E2E2E2;">총 합계</td>
		<td id="total_price" style="width:30%; text-align:right; padding-right:10rem; border-top:1px solid #E2E2E2;">${spot.price }</td>
	</tr>
</table>
<div class=mg">&nbsp;</div>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td colspan=2  >
<input type="submit" class="btn btn-secondary btn-lg" value="저장" formaction="./res_save.do">
<input type="submit" class="btn btn-success btn-lg" value="다음"  formaction="./res_pay.do">
		</td>
	</tr>
</table>

</form>
</div>

</div>
<div class=mg">&nbsp;</div><div class=mg">&nbsp;</div><div class=mg">&nbsp;</div>
</body>
</html>