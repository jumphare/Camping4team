<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="./js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
 function check(){
	 if($.trim($("#id").val())==""){
		 alert("로그인 아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
 
 /*비번찾기 공지창*/
 function pwd_find(){
	 window.open("pwd_find.do","비번찾기","width=450,height=500");
	 //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
	 //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
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

.container {
  position: absolute;
  height: 400px;
  margin-left: -200px;
  margin-top: -200px;
  left: 53%;
  top: 45%;
};

</style>
</head>
<body>
<h1>상단바</h1><br><br>
<div class="container" >
<div class="title">로그인</div>
  <form method="post" action="member_login_ok.do"
  		onsubmit="return check()">
   <table class="">
    <tr>
     <th>아이디</th>
     <td>
      <input name="id" id="id" size="20" class="input_box" />
     </td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="pwd" id="pwd" size="20" class="input_box"/>
     </td>
    </tr>
   </table>
   <br>
    <div style="">
    <input type="submit" value="로그인" class="btn btn-success" style="font-size:1.5em;" />
    <input type="reset" value="취소" class="btn btn-success" style="font-size:1.5em;
    		onclick="$('#id').focus();" />
    <input type="button" value="회원가입" class="btn btn-success" style="font-size:1.5em;"
    		onclick="location='member_join.do'" />
    <input type="button" value="비번찾기" class="btn btn-success" style="font-size:1.5em;
    		onclick="pwd_find()" />
    </div>
  </form>
 </div>
</body>
</html>