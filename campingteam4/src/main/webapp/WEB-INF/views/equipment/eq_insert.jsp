<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>장비 등록</title>
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
   margin-bottom:0.5rem;
  }
 
 .container{
	position: fixed;
    top: 45%;
    left: 70%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
 }

</style>
<script>
$(function() {
	var cm="camp_no=1";
	$.post('./eq_option.do',cm, function(data) {
		$('#typechk').html(data);
	});
	$("#isrt").click(function(){
    	$("#form").submit();
    	alert("등록되었습니다");
    	opener.parent.location.reload();
        setTimeout(function() {   
            window.close();
         }, 100);
    });
});
function opt(num){
	console.log('camp_no: '+num);
	var cm="camp_no="+num;
	$.post('./eq_option.do',cm, function(data) {
		$('#typechk').html(data);
	});
};
</script>
</head>
<body>
<div class="container" >
<div class="title">장비 등록</div>
<form name="form" id="form" method="post" action="./eq_insert.do">
<div class="form-group" style="width:10%; margin-top:0.5rem; margin-bottom:1rem;">
 <select id="camp" name="camp_no" onchange="opt(this.value)">
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
</div> 

<div id="typechk" style="margin-bottom:1rem;">장소를 선택해주세요.</div>
<div style="float:left; vertical-align:middle; margin-right:2rem;">장비명</div> <div style="margin-bottom:0.5rem;"><input type=text name="name" ></div>
<div style="float:left; vertical-align:middle; margin-right:3.6rem;">가격</div> <div style="margin-bottom:0.5rem;"><input type=text name="price" ></div>
<div style="float:left; vertical-align:middle; margin-right:3.6rem;">수량</div> <div style="margin-bottom:0.5rem;"><input type=number name="num" ></div>

<div style="margin-left:7.5rem; margin-top:1rem;"><input type="button" id="isrt" class="btn btn-success" value="등록" style=" font-size:1.6rem;">  <input type=button value="닫기" class="btn btn-light" style=" font-size:1.6rem;" onclick="window.close();"></div>
</form>
</div>
</body>
</html>