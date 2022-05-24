<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<meta charset="UTF-8">

<title>장비 관리 페이지</title>
<script type="text/javascript">
	$(function() {
		$('#eqlist').load('./eq_table.do?camp_no=${camp_no}');
	});	
	function table(value){
		$('#eqlist').load('./eq_table.do?camp_no='+value);
	}
	 
</script>
</head>
<body>

<div>
  <h2>장비관리</h2>
  <br>

      <a class="nav-link active" id="sl" href="javascript:;" onclick="table(1)">서울</a> <br>
      <a class="nav-link" id="ca" href="javascript:;" onclick="table(2)">천안</a> <br>
      <a class="nav-link" id="dj" href="javascript:;" onclick="table(3)">대전</a> <br>

  <div>
     	<div id="eqlist"></div>
  </div>
</div>




</body>
</html>