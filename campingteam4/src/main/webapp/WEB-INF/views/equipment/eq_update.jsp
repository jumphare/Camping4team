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
	<c:forEach var="s" items="${type}">
		var s = "${s}";
		console.log(s);
		$("input:checkbox[name='typechk'][value='"+s+"']").prop("checked", true);
	</c:forEach>
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

<form name="form" method="post" action="./eq_update.do">
<input type="hidden"  name="eq_no" value="${eqm.eq_no }">
<div> <select id="camp" name="camp_no" onchange="opt(this.value)">
			<option value="1">서울</option>
			<option value="2">천안</option>
			<option value="3">대전</option>
		</select>
</div>
<div id="typechk">
<c:forEach var="op" items="${eq_op}">
<input type="checkbox" name="typechk" value="${op}"> ${op }
</c:forEach></div>
<div>장비명 <input type=text name="name" value="${eqm.name }"></div>
<div>가격 <input type=text name="price" value="${eqm.price }"></div>
<div>수량 <input type=number name="num" value="${eqm.num }" ></div>

<div><input type=submit value="등록">  <input type=button value="목록" onclick="location.href='./eq_admin.do'"></div>
</form>
</body>
</html>