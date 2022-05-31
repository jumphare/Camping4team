<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>상세 페이지</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
  html { font-size:10px; } 

  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
font-size:1.6rem;
}
  .title{
  margin-top:1rem;
  margin-left:4rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }

.eqtable th{
text-align:center;
}
.eqtable td{
text-align:center;

}
.mg{
margin:1rem;
}
 
.pmt{
width:40%; 
border:dotted #a0a0a0; 
border-radius:5px;
padding: 2rem;
}

 a {
 text-decoration:none;
 color:#E35E0A;
 }
 a:hover{text-decoration:none;}
 
 .pgn a{
color:#000;
}

.headb {
	font-weight: bold;
}

.wrb{
	position : absolute;
	font-weight : bold;
	right : 10px;
}

.div1{
	margin : 50px 250px;

}


</style>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:30px;">--</h1>
<script>

</script>
	<h2 class="title" >상세 페이지</h2>
	<div class = "div1"> 
	<table class = "table eqtable" align=center style="width:100%">
		
		<tr>
			<td class = "headb">작성자</td>
			<td>${partner.id}</td>
		</tr>
		<tr>
			<td class = "headb">날짜</td>
			<td><fmt:formatDate value="${partner.p_date}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td class = "headb">조회수</td>
			<td>${partner.readcount}</td>
		</tr>
		<tr>
			<td class = "headb">제목</td>
			<td>${partner.subject}</td>
		</tr>
		<tr>
			<td class = "headb">참가인원</td>
			<td>${partner.id }
			<c:if test = "${partner.id == id }">
				<c:forEach var="j_id" items="${joinlist}" begin="0" end= "${fn:length(joinlist) }"  >
					<a href ="./writemsg.do?recv_id=${j_id.join_id }">${j_id.join_id }</a>
				</c:forEach>
			</c:if>
			<c:if test = "${partner.id != id }">
				<c:forEach var="j_id" items="${joinlist}" begin="0" end= "${fn:length(joinlist) }"  >
					${j_id.join_id }
				</c:forEach>
			</c:if>
			</td>
		</tr>
		<tr>
			<td class = "headb">내용</td>
			<td><pre>${partner.content}
			</pre></td>
		</tr>
		<tr>
			
			<td colspan=2 align=center>
				<c:choose>
					<c:when test="${result == 0}">
						<input type=button value="신청"
							onClick="location.href='pbJoin.do?par_no=${par_no }&page=${page}' ">
					</c:when>
					<c:when test="${result >= 1}">
						<input type=button value="취소"
							onClick="location.href='pbCancel.do?par_no=${par_no }&page=${page}' ">
					</c:when>
					<c:when test="${partner.now_num == partner.want_num }">
						<input type=button value="마감">
					</c:when>
				</c:choose> 
				
				<input type="button" value="목록"
				onClick="location.href='pbList.do?page=${page}' "> 
				<c:choose>
					<c:when test = "${partner.id == id }">
						<input type="button" value="수정"
						onClick="location.href='pbUpdate.do?par_no=${partner.par_no}&page=${page}' ">
		
						<input type="button" value="삭제"
						onClick="location.href='pbDelete.do?par_no=${partner.par_no}&page=${page}' ">
					</c:when>
					<c:when test = "${id eq 'admin' }">
						<input type="button" value="수정"
						onClick="location.href='pbUpdate.do?par_no=${partner.par_no}&page=${page}' ">
		
						<input type="button" value="삭제"
						onClick="location.href='pbDelete.do?par_no=${partner.par_no}&page=${page}' ">
					</c:when>
				</c:choose>
			</td>
		</tr>
	</table>
	</div>
	<!-- 댓글 작성 -->
	<div class = "div1">
			<form align="center" method="post" action="pbreply.do">
				<input type="hidden" name="id" value="${id}"> 
				<input type="hidden" id="par_no" name="par_no" value="${partner.par_no}">
				<input type="hidden" id="page" name="page" value="${page}">

				<p>댓글쓰기 : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type="submit" value="확인"></p>
				
				<textarea class="form-control" rows="3" cols="50" name="content"></textarea>
				
	
				<!-- 댓글 list 불러오는곳 -->
				
					<table class = "table eqtable" align=center width=700>
					<tr><th>id</th>
						<th>댓글</th>
						<th>작성일</th>
						<c:if test="${id == l.id}">
						<td>삭제</td>
						</c:if>
						<c:if test = "${pclist eq null}">
							<td col = 3 value = "등록된 댓글이 없습니다.">
							</td>
						</c:if>
						<c:forEach items="${pclist}" var="l">
						<tr>
							<td>${l.id}</td>
							<td>${l.content}</td>
							<td><fmt:formatDate value="${l.c_date}" pattern="yyyy-MM-dd" /></td>
							<c:if test="${id == l.id}">
							<td>
								<input type="button" value="삭제"
									onclick="location.href='pcdelete.do?com_no=${l.com_no }&par_no=${partner.par_no}&page=${page}'" />
							</td>
							</c:if>
						</tr>
						</c:forEach>
					</table>
	</div>			
			</form>
	
</body>
</html>