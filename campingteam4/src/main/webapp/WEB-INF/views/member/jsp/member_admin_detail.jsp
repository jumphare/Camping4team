<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<s:authentication property="principal" var="user" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
h2 {
	font-size: 15px;
}

.star-rating {
	width: 143px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 29px;
	overflow: hidden;
	background: url(img/star.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

html {
	font-size: 10px;
}

@font-face {
	font-family: 'GmarketSansBold';

	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

 .title{
  margin-top:1rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  .title2{
    margin-top:4rem;
   font-family: 'GmarketSansBold';
   font-size:2.6rem;
   color:#E8894F;
   margin-bottom:1rem;
  }

.pmt{
border:dotted #a0a0a0; 
padding: 2rem;
padding-left:3rem;
padding-right:3rem;
}

table {
	font-size: 1.6rem;
}

a {
	color: #000;
}

a:hover {
	text-decoration: none;
}

/* .container {
	  position: absolute;
	  height: 400px;
	  margin-left: -200px;
	  margin-top: -200px;
	  left: 30%;
	  top: 45%;
	};  */

	.table {
	table-layout:fixed;
	}
</style>
</head>
<body>
	<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" style="background-color:white; width:80%">
		<div class="title">회원 상세</div>
		<table class="table" align=center style="text-align:center">
			<thead>
				<tr class="cent" width=50rem >
					<th width=20%>아이디</th>
					<th width=15%>이름</th>
					<th width=30%>주소</th>
					<th width=15%>휴대폰번호</th>
					<th width=20%>이메일</th>
				</tr>
			</thead>
			<tr>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td>${member.addr1}</td>
				<td>${member.phone}</td>
				<td>${member.email}</td>
			</tr>
		</table>


<div class="title2" >예약내역/건</div>
<div class="pmt">
		<table width="100%" align="center"	class="table-bordered">
				<tr bgcolor=lightgrey align=center>
							<th width="15%">예약일</th>
							<th width="70%">예약정보</th>
							<th width="15%">예약취소</th>
						</tr>
						<c:set var="i" value="0"/>
						<c:forEach var="rv" items="${reslist}">
							<tr style="vertical-align: middle; text-align: center;">
								<td><fmt:formatDate value="${rv.res_date}"
										pattern="yyyy.MM.dd" /></td>
								<td class="info">
									<div style="font-weight: bolder;">${fn:substring(rv.start_date,0,10)}
										~ ${fn:substring(rv.end_date,0,10)}</div>
									<div>
										<a href='./reserveView.do?res_no=${rv.res_no}'>[${cname[i]}]
											${sname[i]}</a>
									</div>
									<div>
										<c:if test="${rv.state eq '0' }">
											<span style="color: #CD1039">결제대기</span>
										</c:if>
										<c:if test="${rv.state eq '1' }">
											<span style="color: #006400">예약완료</span>
										</c:if>
										<c:if test="${rv.state eq '2'}">
											<span style="color: #828282">예약취소</span>
										</c:if>
									</div>
								</td>
								
								<td align=center>
								<c:if test="${rv.state eq '1' }">
								<input type=button value="강제 예약 취소"
								class="btn btn-outline-danger btn-sm" style="font-size:1.6rem;"
									onClick="location.href='<%=request.getContextPath()%>/res_cancel.do?res_no=${rv.res_no}'">
									</c:if>
									</td>
								
							</tr>
								<c:set var="i" value="${i+1 }"/>
						</c:forEach>
			</table>
</div>

<div class="title2" >리뷰내역/건</div>
<div class="pmt">
		<table width="100%" align="center"	class="table-bordered">
						<tr bgcolor=lightgrey align=center>
							<th width="5%">No.</th>
							<th width="20%">제목</th>
							<th width="50%">내용</th>
							<th width="10%">등록일</th>
							<th width="15%">리뷰삭제</th>
						</tr>
						<c:forEach var="r" items="${rlist}">
							<tr style="vertical-align: middle; text-align: center; ">
								<td>${r.re_no}</td>
								<td>${r.subject}</td>
								<td>${r.content}</td>
								<td><fmt:formatDate value="${r.r_date}"
										pattern="yyyy-MM-dd" /></td>
								<td align=center><input type=button value="강제 리뷰 삭제"
									class="btn btn-outline-danger btn-sm" style="font-size:1.6rem;"
									onClick="location.href='<%=request.getContextPath()%>/reviewdeleteform.do?re_no=${r.re_no}&page=${page}'"></td>
							</tr>
						</c:forEach>
					</table>
</div>

			
	<%-- 				
					
					
					
					
		<div style="margin-top: 1%; width: 80%; text-align:center;"
			style="font-family: 'Nanum Gothic', sans-serif;">
			<ul class="nav nav-tabs">
			    <li class="nav-item">
			      <a class="nav-link active" data-toggle="tab" href="#menu1">예약내역/건</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#menu2">리뷰내역/건</a>
			    </li>
			  </ul>
			
			 <div class="tab-content">
				<div id="menu1" class="container tab-pane active">
					<br>
					<table width="100%" align="center"
						class="table-bordered">
						<tr bgcolor=lightgrey align=center>
							<th width="15%">예약일</th>
							<th width="70%">예약정보</th>
							<th width="15%">예약취소</th>
						</tr>
						<c:set var="i" value="0"/>
						<c:forEach var="rv" items="${reslist}">
							<tr style="vertical-align: middle; text-align: center;">
								<td><fmt:formatDate value="${rv.res_date}"
										pattern="yyyy.MM.dd" /></td>
								<td class="info">
									<div style="font-weight: bolder;">${fn:substring(rv.start_date,0,10)}
										~ ${fn:substring(rv.end_date,0,10)}</div>
									<div>
										<a href='./reserveView.do?res_no=${rv.res_no}'>[${cname[i]}]
											${sname[i]}</a>
									</div>
									<div>
										<c:if test="${rv.state eq '0' }">
											<span style="color: #CD1039">결제대기</span>
										</c:if>
										<c:if test="${rv.state eq '1' }">
											<span style="color: #006400">예약완료</span>
										</c:if>
										<c:if test="${rv.state eq '2'}">
											<span style="color: #828282">예약취소</span>
										</c:if>
									</div>
								</td>
								<td align=center><input type=button value="강제 예약 취소"
								class="btn btn-outline-danger btn-sm" style="font-size:1.6rem;"
									onClick="location.href='<%=request.getContextPath()%>/res_cancel.do?res_no=${rv.res_no}'"></td>
								
							</tr>
								<c:set var="i" value="${i+1 }"/>
						</c:forEach>
					</table>
				</div>

				<div id="menu2" class="container tab-pane fade">
					<br>
					<table width="100%" align="center"
						class="table-bordered">
						<tr bgcolor=lightgrey align=center>
							<th width="5%">No.</th>
							<th width="20%">제목</th>
							<th width="10%">내용</th>
							<th width="10%">등록일</th>
						</tr>
						<c:forEach var="r" items="${rlist}">
							<tr style="vertical-align: middle; text-align: center;">
								<td>${r.re_no}</td>
								<td>${r.subject}</td>
								<td>${r.content}</td>
								<td><fmt:formatDate value="${r.r_date}"
										pattern="yyyy-MM-dd" /></td>
								<td align=center><input type=button value="강제 리뷰 삭제"
									class="btn btn-outline-danger btn-sm"
									onClick="location.href='<%=request.getContextPath()%>/reviewdeleteform.do?re_no=${r.re_no}&page=${page}'"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div> --%>
		
		
<%-- 		<!-- 페이지처리 -->
		<center>
			<c:if test="${listcount>0}">

				<!-- 1페이지로 이동              //   text-decoration은 밑줄 없애기-->
				<a href="reviewlist.do?page=1" style="text-decoration: none"> <<
				</a>
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${startPage > 10}">
					<a href="reviewlist.do?page=${startPage-10}">[이전]</a>
				</c:if>
				<!-- 각 블럭에 10개의 페이지 출력 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == page}">
						<!-- 현재 페이지 -->
			[${i}]	
		</c:if>
					<c:if test="${i != page}">
						<!-- 현재 페이지가 아닌 경우 -->
						<a href="reviewlist.do?page=${i}">[${i}]</a>
					</c:if>
				</c:forEach>

				<!-- 다음 블럭으로 이동 -->
				<c:if test="${endPage < pageCount}">
					<a href="reviewlist.do?page=${startPage+10}">[다음]</a>
				</c:if>
				<!-- 마지막 페이지로 이동 -->
				<a href="reviewlist.do?page=${pageCount}"
					style="text-decoration: none"> >> </a>
			</c:if>
		</center> --%>
		
		<br>
	</div>
	<br>
<br>
<br>
<br>
</body>
</html>


