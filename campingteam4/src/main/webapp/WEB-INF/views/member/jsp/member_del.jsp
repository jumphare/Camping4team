<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
 function check(){
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
</script>
<style type="text/css">
 html { font-size:10px; } 
  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  .title{
  margin-top:3rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  
  table{
  font-size:1.6rem;
  }
 

a{
color: #000;
}
a:hover{
text-decoration:none;
}

.container1 {
  position: absolute;
  height: 200px;
  margin-left: -200px;
  margin-top: 60px;
  left: 52%;
  top: 15%;
};

</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<div class="container" >
  <form class="container1" method="post" action="member_del_ok.do" 
  					  onsubmit="return check()">
  	<div class="title">회원 탈퇴</div>
    <table class="table">
     <tr>
      <th>회원아이디</th>
      <td>
      ${d_id}
      </td>
     </tr>
     
     <tr>
      <th>회원이름</th>
      <td>${d_name}</td>
     </tr>
     
     <tr>
      <th>비밀번호</th>
      <td>
      <input type="password" name="pwd" id="pwd" size="14" 
      			class="input_box" />
      </td>
     </tr> 
    </table>
    
    <div style="padding:0px; margin: 0 auto; width:200px; height: 200px;">
     <input type="submit" value="탈퇴" class="btn btn-success" style="font-size:1.0em;" />
     <input type="reset" value="취소" class="btn btn-success" style="font-size:1.0em;"
     	onclick="$('#pwd').focus();" />
    </div>
  </form>
 </div>
</body>
</html>