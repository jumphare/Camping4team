<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${path }/css/layout.css" />
<title>회원가입폼</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member.css" /> --%>
<!-- <script src="/springmember/js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//우편번호, 주소 Daum API
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('zip1').value = data.zonecode;
			document.getElementById('addr1').value = data.address;				
		}
	}).open();
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

/* /* .container {
  position: absolute;
  height: 400px;
  margin-left: -200px;
  margin-top: -200px;
  left: 30%;
  top: 45%;
}; */ */

</style>
</head>
<body > <!-- background="./images/camping.png" -->
<h1>상단바</h1><br><br>
<div class="container" >
<div class="title">회원가입</div>
  <form class="container" name="f" method="post" action="member_join_ok.do"
  		onsubmit="return check()" enctype="multipart/form-data">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table class="table">
    <tr>
     <th>회원아이디</th>
     <td>
      <input name="id" id="id" size="14" class="input_box" />
      <input type="button" value="아이디 중복체크" class="input_button"
      	onclick="id_check()" />
      <div id="idcheck"></div>
     </td>
    </tr>
    
    <tr>
     <th>회원비번</th>
     <td>
      <input type="password" name="pwd" id="pwd1" size="14"
      class="" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="pwd2" id="pwd2" size="14"
      class="" />
     </td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="name" id="name" size="14" class="" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="zip1" id="zip1" size="5" class=""
      		readonly onclick="post_search()" />
      <!-- -<input name="join_zip2" id="join_zip2" size="3" class="input_box" readonly 
      		onclick="post_search()"/> -->
      <input type="button" value="우편번호검색" class=""
      		onclick="openDaumPostcode()" />
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="addr1" id="addr1" size="50" class=""
      readonly onclick="post_search()" />
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="addr2" id="addr2" size="37" class="" />
     </td>
    </tr>
    
    <tr>
     <th>주민번호</th>
     <td>   
     <input name="jumin1" id="jumin1" size="6"
      maxlength="6" class="" />-<input  name="jumin2"
      id="jumin2" size="7" maxlength="7" class="" />
     </td>
    </tr>
    
    <tr>
     <th>휴대전화번호</th>
     <td>
     <%@ include file="../jsp/phone_number.jsp" %>
     <select name="phone1">
      <c:forEach var="p" items="${phone}" begin="0" end="5">
       <option value="${p}">${p}</option>
      </c:forEach>
     </select>-<input name="phone2" id="phone2" size="4"
     maxlength="4" class="" />-<input name="phone3"
     id="phone3" size="4" maxlength="4" class="" />
     </td>
    </tr>
    
    <tr>
     <th>전자우편</th>
     <td>
      <input name="mailid" id="mailid" size="10" 
      class="" />@<input name="maildomain" 
      id="maildomain" size="20" class="" readonly />
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net">daum.net</option>
      <option value="nate.com">nate.com</option>
      <option value="naver.com">naver.com</option>
      <option value="hotmail.com">hotmail.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
      <input type="file" name="profile1" />
     </td>
    </tr>
   </table>
   <div style="padding:10px; margin: 0 auto; width:200px; height: 200px;">
    <input type="submit" value="회원가입" class="btn btn-success" style="font-size:1.5em;" />
    <input type="reset" value="가입취소" class="btn btn-success" style="font-size:1.5em;"
    onclick="$('#id').focus();" />
   </div>
  </form>
  </div>
</body>
</html>
