<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<s:authentication property="principal" var="user" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상세페이지</title>
<!-- 별점 출력 -->
<style>
.heart {
  width: 100px;
  height: 100px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background: url(https://cssanimation.rocks/images/posts/steps/heart.png) no-repeat;
  background-position: 0 0;
  cursor: pointer;
  animation: fave-heart 1s steps(28);
}
.heart:hover {
  background-position: -2800px 0;
  transition: background 1s steps(28);
}
@keyframes fave-heart {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: -2800px 0;
  }
}
h2 {font-size:15px;} 
.star-rating {width:143px; }
.star-rating,.star-rating span {display:inline-block; height:21px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
html { font-size:10px; } 
  @font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.title{
align=center
  margin-top:3rem;
   font-family: 'GmarketSansBold';
   font-size:3.2rem;
   color:#E35E0A;
   margin-bottom:1rem;
  }
  table{
  font-size:1.5rem;
  }
  a{
color: #000;
}
a:hover{
text-decoration:none;
}
input[type="text"]{
      padding: 8px; text-align: center; margin: 0px;
</style>
<!-- jQuery문 설정 불러오기 -->
<script src="${path}/js/info/jquery.js"></script>

<!-- 로그인한 사람과 글쓴사람이 동일할때 수정,삭제 가능 -->
<script type="text/javascript">
	var session = '${id}';
	var id = '${review.id}';
	console.log(id);
	$(function() {
		$("#chk1").submit(function() {
			if (member_id != session) {
				alert("사용자가 다르면 수정할 수 없습니다");
				return false;
			}
		});
		$("#chk2").submit(function() {
			if (member_id != session) {
				alert("사용자가 다르면 삭제할 수 없습니다");
				return false;
			}
		});
	});
</script>

<!-- 좋아요 버튼 -->
<script type="text/javascript">
	var session = '${id}';
	var id = '${review.id}';
	$(function() {
		$("#like").submit(function() {
			if (member_id == session) {
				alert("사용자가 같으면 좋아요를 할수 없습니다.");
				return false;

			}

		});
	});
</script>
<script type="text/javascript">
	function fn_replydelete(reply_no) {
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}
		$("#form2").attr("action", "fn_replydelete");
		$("#reno2").val(reply_no);
		$("#form2").submit();
	}
</script>

<!-- 좋아요 -->
<script>
	$(document).ready(function() {

		var heartval = $
		{
			heart
		}
		;

		if (heartval > 0) {
			console.log(heartval);
			$("#heart").prop("src", "/resources/images/like2.png");
			$(".heart").prop('name', heartval)
		} else {
			console.log(heartval);
			$("#heart").prop("src", "/resources/images/like1.png");
			$(".heart").prop('name', heartval)
		}

		$(".heart").on("click", function() {

			var that = $(".heart");

			var sendData = {
				'boardId' : '${boardVO.boardId}',
				'heart' : that.prop('name')
			};
			$.ajax({
				url : '/board/heart',
				type : 'POST',
				data : sendData,
				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						$('#heart').prop("src", "/resources/images/like2.png");
					} else {
						$('#heart').prop("src", "/resources/images/like1.png");
					}

				}
			});
		});
	});
</script>
<!-- 댓글 작성 jQuery문 -->
<%-- <script type="text/javascript">
	$(function() {
		$('#review_reply').load('${path}/review_reply/re_no/${review.re_no}')

		$('#review_reply_insert').click(function() {
			if (!frm.review_re_content.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.review_re_content.focus();
				return false;
			}
			var frmData = $('#frm').serialize();
			$.post('${path}/review_reply_insert', frmData, function(data) {
				$('#review_reply').html(data);
				frm.review_re_content.value = '';
			});
		});
	}); 
</script> --%>

</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>
</header>
<h1 style="margin-bottom:50px;">--</h1>
		<div class="container">
		<div class="title">후기 상세</div>
		 <form class="container">
			<table class="table">
				&nbsp;
					<tr>
						<td><b>대표이미지</b></td>
						<td><img src="<%=request.getContextPath() %>/reviewupload/${review.re_file}" height="300" width="300" /></td>
					</tr>
					<tr>
						<td><b>제목</b></td>
						<td>${review.subject}</td>
					</tr>
					<tr>
						<td><b>별점</b></td>
						<td>
								<div class='star-rating'>
									<span style="width: <fmt:formatNumber value="${review.score/5}" type="percent"/>"></span>
								</div>
							</td>
						
					<tr>
						<td><b>장소</b></td>
						<td>${spname}</td>
					</tr>
					<tr>
						<td><b>작성자</b></td>
						<td>${review.id}</td>
					</tr>
					<tr>
						<td><b>조회수</b></td>
						<td>${review.readcount}</td>
					</tr>
					<tr>
						<td><b>내용</b></td>
						
						<td><pre>${review.content}</pre>
					
						</td>
					</tr>
						<td colspan=2 align="center"><input type="button" value="목록"
							class="btn btn-success" style="font-size:1.0em;"
							onClick="location.href='reviewlist.do?page=${page}' "> <c:if
								test="${id == review.id || id == 'admin'}">
								<input type="button" value="수정" class="btn btn-success" style="font-size:1.0em;"
									onClick="location.href='reviewupdateform.do?re_no=${review.re_no}&page=${page}' ">
								<input type="button" value="삭제" class="btn btn-success" style="font-size:1.0em;"
									onClick="location.href='reviewdeleteform.do?re_no=${review.re_no}&page=${page}' ">
							</c:if>
							<form action="/revlike?re_no=${review.re_no}&pageNum=${pageNum}"
								method="post" id="like">
								<c:if test="${likecheck==0}">
									<input type="button" value="좋아요" class="btn btn-success" style="font-size:1.0em;"
										onclick="location.href='reviewlike.do?re_no=${review.re_no}&page=${page}'">
								</c:if>
								<c:if test="${likecheck==1}">
									<input type="button" value="좋아요취소" class="btn btn-success" style="font-size:1.0em;"
										onclick="location.href='reviewdelete.do?re_no=${review.re_no}&page=${page}'">
								</c:if>
								
								
								좋아요 수: ${likecount}
							</form></td>
			</table>
			</form>
			</div>
			<!-- 댓글 작성 -->
			<form class="container" method="post" action="replywrite.do">
				<table class="table">
				<input type="hidden" name="id" value="${id}"> <input
					type="hidden" id="re_no" name="re_no" value="${review.re_no}">
				<input type="hidden" id="page" name="page" value="${page}">
				<input type="hidden" id="res_no" name="res_no"
					value="${review.res_no}">
				<div class="title">댓글 작성</div>
				<input type="text" class="" rows="3" cols="50" style="height:80%; width:90%;" name="content" >&nbsp;&nbsp;
				<input type="submit" value="확인" class="btn btn-success" style="font-size:1.0em;">
				</table>
				<!-- 댓글 list 불러오는곳 -->
				
					<table class="table" align=center width=300>
					<tr><th>id</th>
						<th>댓글</th>
						<th>작성일</th>
						<th></th>
						<c:forEach items="${list}" var="l">
						<tr>
							<td>${l.id}</td>
							<td>${l.content}</td>
							<td><fmt:formatDate value="${l.re_date}" pattern="yyyy-MM-dd" /></td>
							<td><c:if test="${id == l.id}">
								<input type="button" value="댓글 삭제"
									onclick="location.href='replydelete.do?reply_no=${l.reply_no}&re_no=${review.re_no}&page=${page}'"
									class="btn btn-success" style="font-size:0.8em;" />
							</c:if></td>
						</tr>
						</c:forEach>
					</table>
				</form>
</body>
</html>