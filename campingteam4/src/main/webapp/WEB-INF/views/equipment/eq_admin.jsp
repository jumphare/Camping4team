<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>장비 관리 페이지</title>
<script type="text/javascript">
	/* 	window.onload=function() {
	
	 } */
	$(function() {
		$('#eqlist1').load('./eq_table.do?camp_no=1');
		
		$("#sl").click(function(){
			$('#eqlist1').load('./eq_table.do?camp_no=1');
			$('#eqlist2').text("");
			$('#eqlist3').text("");
		});
		$("#ca").click(function(){
			$('#eqlist2').load('./eq_table.do?camp_no=2');
			$('#eqlist1').text("");
			$('#eqlist3').text("");
		});
		$("#dj").click(function(){
			$('#eqlist3').load('./eq_table.do?camp_no=3');
			$('#eqlist2').text("");
			$('#eqlist1').text("");
		});
	});	
</script>
</head>
<body>

<div class="container mt-3">
  <h2>장비관리</h2>
  <br>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" id="sl" data-toggle="tab" href="#l1">서울</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="ca" data-toggle="tab" href="#l2">천안</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="dj" data-toggle="tab" href="#l3">대전</a>
    </li>
  </ul>

  <div class="tab-content">
    <div id="l1" class="container tab-pane active"><br>
      <h3>서울</h3>
     	<div id="eqlist1"></div>
    </div>
    <div id="l2" class="container tab-pane fade"><br>
      <h3>천안</h3>
      <div id="eqlist2"></div>
    </div>
    <div id="l3" class="container tab-pane fade"><br>
      <h3>대전</h3>
      <div id="eqlist3"></div>
    </div>
  </div>
</div>




</body>
</html>