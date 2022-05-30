<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 레이아웃</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${path }/css/layout.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/date.css" />
<script src="<%=request.getContextPath() %>/js/date.js"></script>

  <style>
h2 {font-size:15px;}
.star-rating {width:143px; }
.star-rating,.star-rating span {display:inline-block; height:24px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
  </style>
  
<!--   <script>
$(function(){
	$(".text-res").load("./date_sel.do");
});
document.getElementById('startdate').value = new Date().toISOString().substring(0, 10);
</script> -->
</head>
<body>
<h1>상단바 영역</h1><br>

<!-- 임시 상단바 -->
<c:if test="${sessionScope.id != null}">
	<a href="member_logout.do">로그아웃</a><br>
	<a href="mypage.do">마이페이지</a> <br>
</c:if>
<c:if test="${sessionScope.id == null}">
	<a href="member_join.do">회원가입</a><br>
	<a href="member_login.do">로그인</a><br>
	 
</c:if>

 <a href="date_sel.do">예약하기</a> <br>
    <a href="admin_camp_list.do">관리자 캠핑장 관리</a><br>
	<a href="pbList.do">동행 찾기</a><br>
	<a href="reviewlist.do">리뷰 목록</a><br>
    <a href="readreview.do">댓글 목록</a><br>
    <a href="eq_table.do">장비</a><br>
    <a href="noticelist.do">공지사항 목록</a><br>
	<a href="res_admin.do">예약관리</a><br>
	<a href="./layout2.do">레이아웃</a><br>
<!-- 캐러셀 -->
<div class="container-carousel">
<div id="demo" class="carousel slide" data-ride="carousel">
     
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="center-block" src="${path }/images/camping.jpg" alt="Camping" style="width: 100%;">
      <div class="carousel-caption">
			 자연 속에서의 힐링 <p>#한강캠핑</p> 
		</div> 
    </div> 
    <div class="carousel-item">
     <img class="center-block"  src="${path }/images/glamping.jpg" alt="Glamping" style="width: 100%;">
		<div class="carousel-caption">
			 복잡한 도심을 벗어나 <p>#자연 #함께 #힐링 </p> 
		</div> 
    </div>   
    <div class="carousel-item">
      <img  class="center-block"  src="${path }/images/people.jpg" alt="Caravane" style="width: 100%;">
	<div class="carousel-caption">
		 도심 속 힐링캠핑의 명소 <p>#감성캠핑 </p>
	</div>
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a> 
</div>
</div>  

<!-- 예약 -->      
<div class="container my-3">
  <div class="hr-sect"><h1>RESERVATION</h1></div>
  <div class="conten">  
<form method="get" action="<%=request.getContextPath()%>/camp_sel.do">
<br>
      <p>체크인 : <input type="text" id='startDate' name='startDate' width="10px">
		체크아웃 : <input type="text" id='endDate' name='endDate'>
      인원 :  <input type=text name="memcount" id="memcount"></p>
      <br>
      
      <p><input type="submit" class="w-btn w-btn-red" value="방 검색"></p><br>
      
    </form>
  </div>
</div> 
 
 <!-- 타입 별 클릭하면 해당 타입 예약 페이지로 이동 -->
<div class="container my-3 "> 
  <div class="hr-sect"><h1>TYPE</h1> </div>
  
 <div class="sect" style="position: relative; float: left; width: 25%;">
<a href="type_list.do?type=글램핑"><img class="th" src="${path }/images/glamping2.jpg" ></a>
  <div class="middle">  
    <div class="text"></div>
  </div>
</div>  
<div class="sect" style="position: relative; float: left; width: 25%;">
<a href="type_list.do?type=카라반"><img class="th" src="${path }/images/caravan2.jpg" ></a>
  <div class="middle">
    <div class="text"></div>
  </div>
</div>
<div class="sect" style="position: relative; float: right; width: 25%;">
<a href="type_list.do?type=캠핑"><img class="th" src="${path }/images/camping2.jpg" ></a>
  <div class="middle">
    <div class="text"></div>
  </div>
  </div>
<div class="sect" style="position: relative; float: right; width: 25%;">
<a href="type_list.do?type=차박"><img class="th" src="${path }/images/car-camping2.jpg"></a>
  <div class="middle">
    <div class="text"></div>
  </div></div>
  
 <%--  <div>
  	<a href="#"><img src="${path }/images/glamping2.jpg" style="width: 25%; height: 25%;"></a><a href="#"><img src="${path }/images/caravan2.jpg" style="width: 25%; height: 25%;"></a><a href="#"><img src="${path }/images/camping2.jpg" style="width: 25%; height: 25%;"></a><a href="#"><img src="${path }/images/car-camping2.jpg" style="width: 25%; height: 25%;"></a>
  </div> --%>
</div>   
<div>&nbsp;&nbsp;</div>  
<!-- 후기 : 추천 순으로 정렬해서 두 개 정보 출력. forEach문 이용 --> 
<section class="mb-4">
	<div class="container my-3">   
	<div class="hr-sect"><h1>BEST REVIEW </h1> </div>
		<div class="card-deck"> 
			<div class="card">  
			<img class="card-img" src="<%=request.getContextPath() %>/reviewupload/${rv1.re_file}" alt="">
				<div class="card-body">
					<h5 class="card-title">
					<a href="reviewdetail.do?re_no=${rv1.re_no}&page=1&ch=1">
				${rv1.subject}</a></h5>
					<div class='star-rating'>
					<span style="width: <fmt:formatNumber value="${rv1.score/5}" type="percent"/>"></span>
					</div>
					<p class="card-text">${rv1.content}</p>
					<span style="font-size:1.5rem;"><div style="float:left;">${rv1.r_date}</div><div style="float:right;"><a href="reviewdetail.do?re_no=${rv2.re_no}&page=1&ch=1" class="card-link">더보기</a></div></span>
				</div>
			</div>
			<div class="card"> 
			<img class="card-img" src="<%=request.getContextPath() %>/reviewupload/${rv2.re_file}" alt="">
				<div class="card-body"> 
					<h5 class="card-title">
					<a href="reviewdetail.do?re_no=${rv2.re_no}&page=1&ch=1">
					${rv2.subject}</a></h5>  
					<div class='star-rating'>
					<span style="width: <fmt:formatNumber value="${rv2.score/5}" type="percent"/>"></span>
					</div>
					<p class="card-text">${rv2.content}</p>
					<span style="font-size:1.5rem;"><div style="float:left;">${rv2.r_date}</div><div style="float:right;"><a href="reviewdetail.do?re_no=${rv2.re_no}&page=1&ch=1" class="card-link">더보기</a></div></span>					
				</div> 
			</div>
		</div>
		 <p style="float:right;"><a href="reviewlist.do?re_no=${rv2.re_no}&page=1&ch=1" class="card-link">더 많은 후기를 보고 싶다면?</a></p>
	</div>
</section>
<!-- <div class="container" >
<h2 class="card-title">인기 후기</h2>
  <div class="card-group vgr-cards" >
    <div class="card">  
      <div class="card-img-body">
      <img class="card-img" src="https://picsum.photos/500/230" alt="Card image cap">
      </div>
      <div class="card-body" id="rev">
        <h4 class="card-title">Card title</h4>
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer. This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little
          bit longer.</p>
        <a href="#" class="btn btn-outline-primary">Primary</a>
      </div>
    </div>
</div>
</div> -->

</body>
</html>
