<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>

<c:if test="${sessionScope.id == null }"> 
  <script>
   alert("다시 로그인 해주세요!");
   location.href="<%=request.getContextPath()%>/member_login.do";
  </script>
</c:if>

<c:if test="${sessionScope.id != null }">  
	<a href="member_logout.do">로그아웃</a>
    <a href="reviewlist.do">리뷰 목록</a><br>
 <div id="main_wrap">
   <h2 class="main_title">사용자 메인화면</h2>  
   <form method="post" action="member_logout.do"> 
   <table id="main_t">
    <tr>
     <th colspan="2">
     <input type="button" value="정보수정" class="input_button"
     		onclick="location='member_edit.do'" />
     <input type="button" value="회원탈퇴" class="input_button"
     		onclick="location='member_del.do'" />
     <input type="submit" value="로그아웃" class="input_button" />     
     </th>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>${name}님 로그인을 환영합니다</td>
    </tr>
    
    <tr>
     <th>프로필사진</th>
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
    	<td>
    	<a href="pbList.do">동행찾기</a>
    	</td>
    </tr>
   </table>   
   </form>
   <br><br><br>
   <input type = "button" value="채팅하기" onclick="chat()"/>
   <script type="text/javascript">
	function chat() {
		// 함수 동작 테스트 
		//alert("팝업 테스트");
		
		//window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
		 window.open("chatlist.do", "chatting", "width=450, height=500, top=150, left=200");
	}
	</script>
 </div>
</c:if>
	
</body>
</html>