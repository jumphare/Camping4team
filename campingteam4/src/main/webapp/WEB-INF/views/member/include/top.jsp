<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>top</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
<!-- <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script> -->
<link rel="stylesheet" href="${path }/css/style.css">

<script>
$(function(){
	var frmData='${id}';
/* 	$.post('${path}/profile.do', frmData, function(data) {
		console.log(data);
//		$('#profile').html("<img src='${path }/images/"+data+"' style='width:30px; height:30px; border-radius:15px;'>");
		$('#profile').html("<img src='${path }/images/camping.jpg' style='width:30px; height:30px; border-radius:15px;'>");
	}); */
//	alert(frmData);
	if(${not empty id}){
	 $.ajax({
     	type : "get",
     	async : false,
     	url : "./profile.do",
     	data : { "id" : frmData  }
     }).done(function(data) {
     	console.log(data);	  
 //    	프로필사진이 null인 경우 오류가 있어서 다 디폴트이미지가 뜨게 수정해놨고 나중에 data로 변경만 하면 됩니다
     		$('#profile').html("<a href='./mypage.do'><img src='${path }/upload/"+data+"' style='width:30px; height:30px; border-radius:15px;'></a>");

     });
	 $.ajax({
	     	type : "get",
	     	async : false,
	     	url : "./navmsg.do",
	     	data : { "id" : frmData  }
	     }).done(function(data) {
	     	console.log(data);	  
	     	if (data==0)	//안 읽은 쪽지 0개
	     		$('#malert').html("<a href='javascript:;' onclick='rcvlist()' style='color:gray'>NEW  "+data+"</a>");
	     	else
	     		$('#malert').html("<a href='javascript:;' onclick='rcvlist()' style='color:#E35E0A;'>NEW  "+data+"</a>");
	     });
	}
});

function rcvlist(){
	var frmData='${id}';
	window.open("./recvlist.do?recv_id="+frmData, "쪽지 보관함", "width=600, height=500, left=100, top=50");
}
</script>
  <style>
  header {
  position: fixed;
  top: 0;
  /* width: 100% */
  left: 0;
  right: 0;
  z-index:100;
  /* 생략 */
}
  </style>
 </head>
 <body>
<!--  	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Website menu #06</h2>
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="container">
				<div class="row justify-content-between">
						<div class="col">
							<p class="mb-0 phone"><span class="fa fa-phone"></span> <a href="#">+00 1234 567</a></p>
						</div>
						<div class="col d-flex justify-content-end">
							<div class="social-media">
				    		<p class="mb-0 d-flex">
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
				    		</p>
			        </div>
						</div>
				</div>
			</div>
		</div> -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a href="./layout2.do"><img src="img/camp.png" ></a>
  


<!-- 	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span>
	      </button> -->
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav m-auto">
	 <!-- 공통 메뉴 -->
	        	<li class="nav-item active"><a href="./layout2.do" class="nav-link">Home</a></li>
	         	<li class="nav-item"><a href="./noticelist.do" class="nav-link">NOTICE</a></li> <!-- 공지 -->
	        	<li class="nav-item"><a href="./pbList.do" class="nav-link">PARTNERS</a></li> <!-- 동행찾기 -->
	        	<li class="nav-item"><a href="./reviewlist.do" class="nav-link">REVIEW</a></li> <!-- 리뷰 -->
	          
	  <!-- 비회원&일반회원은 마이페이지 드롭다운버튼 - 비회원이 클릭 시 로그인 창으로 넘어가겠지 -->
	        <c:if test="${empty id || id!='admin' }">
	          	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Page</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="./member_edit.do">내 정보</a>
                <a class="dropdown-item" href="./reserveList.do">내 예약</a>
                <a class="dropdown-item" href="./myreviewlist.do">내 리뷰</a>
                 <a class="dropdown-item" href="./member_del.do">탈퇴</a> 
              </div>
            	</li>
            </c:if>
	  <!-- 관리자일 경우 관리자페이지 드롭다운버튼 -->
	        <c:if test="${id=='admin' }">
	          	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Page</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="./memberlist.do">회원관리</a>
                <a class="dropdown-item" href="./admin_camp_list.do">장소관리</a>
                <a class="dropdown-item" href="./eq_table.do">장비관리</a>
                <a class="dropdown-item" href="./res_admin.do">예약관리</a>
                <a class="dropdown-item" href="./reviewlist.do">리뷰관리</a>
              </div>
            	</li>
            </c:if>          
	        </ul>
	      </div>
	
	<!-- 프로필사진 & 메시지 -->
	      <div class=" d-flex" style="float:left; margin-top:5px;">
          	 <c:if test="${empty id }"><a href="./member_login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></c:if>
       		 <c:if test="${not empty id }">
       		 <div id="malert" style="margin-top:3px; margin-right:10px; font-size:14px;">NEW 0</div>
       		 <div id="profile" style="margin-right:20px; color:white;">prifile</div>
       		 <a href="./member_logout.do"><span class="glyphicon glyphicon-log-in"></span> Logout</a></c:if>
          </div>
	    </div>
	  </nav>
    <!-- END nav -->


<%-- 	<script src="${path }/js/js/jquery.min.js"></script> --%>
  <script src="${path }/js/js/popper.js"></script>
  <script src="${path }/js/js/bootstrap.min.js"></script>
  <script src="${path }/js/js/main.js"></script>
 
 </body>
</html>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
 <%--  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:#fff;
    }

  
    .navbar-nav li a{  
             background-color:#fff!important;
             color:#000!important;
             }
  
    .navbar-nav li a:hover {
    background: silver!important;
  }
      
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="./index.jsp" >Home</a></li>
        <li><a href="./member_login.do" >로그인</a></li>
        <li><a href="./mypage.do" >마이페이지</a></li>
        <li><a href="./noticelist.do" >공지게시판</a></li>
        <li><a href="./reviewlist.do" >리뷰목록</a></li>
        <li><a href="./date_sel.do">예약하기</a></li>
        <li><a href="./eq_table.do">장비</a></li>
        <li><a href="./recvlist.do">메세지</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${empty id }"><li><a href="./member_login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li></c:if>
        <c:if test="${not empty id }"><li><a href="./member_logout.do"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li></c:if>
      </ul>
    </div>
  </div>
</nav> --%>