<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
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
  height: 400px;
  margin-left: -200px;
  margin-top: -200px;
  left: 50%;
  top: 40%;
};

</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<div class="container">
<c:if test="${sessionScope.id == null }"> 
  <script>
   alert("다시 로그인 해주세요!");
   location.href="<%=request.getContextPath()%>/member_login.do";
  </script>
</c:if> 

<c:if test="${sessionScope.id != null }"> 
   <form class="container1" method="post" action="member_logout.do"> 
      <div class="title">마이페이지</div>  
   <table class="">
    
    
    <tr>
     <td>${name}님 로그인을 환영합니다</td>
    </tr>
    
    <tr>
     <td>
       <c:if test="${empty profile}">
       &nbsp;
       </c:if>
       <c:if test="${!empty profile}">
       <img src="<%=request.getContextPath() %>/upload/${profile}" height="100" width="100" />
       </c:if>
     </td>
    </tr>
        <tr>
        <th>
    	<a href="reserveList.do">예약 내역 보기</a>
    	</th>
    </tr>
    <tr><th>
    	<a href="myreviewlist.do">내 리뷰 목록 보기</a>
    </th></tr>
    <tr><th>
    	<a href="memberlist.do">회원 목록</a>
    </th></tr>
   </table><br>
   <div>
   <script type="text/javascript">
	function chat() {
		// 함수 동작 테스트 
		//alert("팝업 테스트");
		
		//window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
		 window.open("chatlist.do", "chatting", "width=450, height=500, top=150, left=200");
	}
	</script>
	<tr>
     <th colspan="2">
     <input type="button" value="정보수정" class="btn btn-success" style="font-size:1.0em;"
     		onclick="location='member_edit.do'" />
     <input type="button" value="회원탈퇴" class="btn btn-success" style="font-size:1.0em;"
     		onclick="location='member_del.do'" />
     <input type="submit" value="로그아웃" class="btn btn-success" style="font-size:1.0em;" />     
     </th>
    </tr>
    </div>
      </form>
 </div>
</c:if>
	
</body>
</html>