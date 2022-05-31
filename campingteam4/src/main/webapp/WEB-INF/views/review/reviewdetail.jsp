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
<title>상세페이지</title>
<!-- 별점 출력 -->
<style>
h2 {font-size:15px;}
.star-rating {width:304px; }
.star-rating,.star-rating span {display:inline-block; height:55px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
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



	<!-- center -->
	<div class="reviewlist_center">

		<div class="review_view_table">
			<table border=1 align=center width=700>
				<h2>후기 게시판</h2>
				&nbsp;
				<tbody>
					<tr>
						<td>대표이미지</td>
						<td><img src="<%=request.getContextPath() %>/reviewupload/${review.re_file}" height="300" width="300" /></td>
					</tr>
					<tr>
						<td width="90">제목</td>
						<td>${review.subject}</td>
					</tr>
					<tr>
						<td>별점</td>
						<td>
						<div class="wrap-star">
								<h2>평점 : ${review.score}</h2>
								<div class='star-rating'>
									<span style="width: <fmt:formatNumber value="${review.score/5}" type="percent"/>"></span>
								</div>
							</div>
							</td>
						
					<tr>
						<td>장소</td>
						<td>${spname}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${review.id}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${review.readcount}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><pre>${review.content}</pre></td>
					</tr>
					<tr>
						<td colspan=2 align="center"><input type="button" value="목록"
							class="btn btn-dark"
							onClick="location.href='reviewlist.do?page=${page}' "> <c:if
								test="${id == review.id || id == 'admin'}">
								<input type="button" value="수정" class="btn btn-dark"
									onClick="location.href='reviewupdateform.do?re_no=${review.re_no}&page=${page}' ">
								<input type="button" value="삭제"
									onClick="location.href='reviewdeleteform.do?re_no=${review.re_no}&page=${page}' ">
							</c:if>
							<form action="/revlike?re_no=${review.re_no}&pageNum=${pageNum}"
								method="post" id="like">
								좋아요 수: ${likecount}
								<c:if test="${likecheck==0}">
									<input class="btn btn-dark" type="button" value="좋아요"
										onclick="location.href='reviewlike.do?re_no=${review.re_no}&page=${page}'">
								</c:if>
								<c:if test="${likecheck==1}">
									<input class="btn btn-dark" type="button" value="좋아요취소"
										onclick="location.href='reviewdelete.do?re_no=${review.re_no}&page=${page}'">
								</c:if>
							</form></td>
					</tr>
				</tbody>
			</table>
 
			<!-- 댓글 작성 -->
			<form align="center" method="post" action="replywrite.do">
				<input type="hidden" name="id" value="${id}"> 
				<input type="hidden" id="re_no" name="re_no" value="${review.re_no}">
				<input type="hidden" id="page" name="page" value="${page}">
				<input type="hidden" id="res_no" name="res_no"
					value="${review.res_no}">
				<p>댓글쓰기 :</p>
				<textarea class="form-control" rows="3" cols="50" name="content"></textarea>
				<input type="submit" value="확인">

				<!-- 댓글 list 불러오는곳 -->
				
					<table border=1 align=center width=700>
					<tr><th>id</th>
						<th>댓글</th>
						<th>작성일</th>
						<th>삭제</th>
						<c:forEach items="${list}" var="l">
						<tr>
							<td>${l.id}</td>
							<td>${l.content}</td>
							<td><fmt:formatDate value="${l.re_date}" pattern="yyyy-MM-dd" /></td>
							<td><c:if test="${id == l.id}">
								<input type="button" value="삭제"
									onclick="location.href='replydelete.do?reply_no=${l.reply_no}&re_no=${review.re_no}&page=${page}'" />
							</c:if></td>
						</tr>
						</c:forEach>
					</table>
				
			</form>
</body>
</html>