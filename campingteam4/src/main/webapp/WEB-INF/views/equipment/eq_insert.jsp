<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>장비 등록</title>
<script>
$(function() {
	var cm="camp_no=1";
	$.post('./eq_option.do',cm, function(data) {
		$('#typechk').html(data);
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

<form name="form" method="post" action="./eq_insert.do">
<div> <select id="camp" name="camp_no" onchange="opt(this.value)">
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
</div>
<div id="typechk">장소를 선택해주세요.</div>
<div>장비명 <input type=text name="name" ></div>
<div>가격 <input type=text name="price" ></div>
<div>수량 <input type=number name="num" ></div>

<div><input type=submit value="등록">  <input type=button value="목록" onclick="location.href='./eq_admin.do'"></div>
</form>
</body>
</html>