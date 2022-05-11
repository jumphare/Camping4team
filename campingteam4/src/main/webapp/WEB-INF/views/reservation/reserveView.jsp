<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세내역</title>
</head>
<body>
${id }님의 예약정보<br>
	<div>예약번호 ${res.res_no}</div>
	<div>예약일자 <fmt:formatDate value="${res.res_date}" pattern="yyyy.MM.dd"/></div>
	<span>예약상태</span>
	<span><c:if test="${res.payment eq '0'}" >결제대기</c:if>
			 <c:if test="${res.payment eq '1'}" >예약완료</c:if>
			 <c:if test="${res.payment eq '2'}" >예약취소</c:if></span>

<table>
	<tr>
		<td>캠핑일</td><td><fmt:formatDate value="${res.start_date }" pattern="MM-dd(E)"/>  ~ 
		<fmt:formatDate value="${res.end_date }" pattern="MM-dd(E)"/></td>
	</tr>
	<tr>		<td>예약자명</td><td>${mem.name }</td>	</tr>
	<tr>		<td>휴대전화</td><td>${mem.phone }</td>	</tr>
	<tr>		<td>이메일</td><td>${mem.email }</td>	</tr>
</table>
	<span>예약상품</span>
<table>
	<tr>
		<td>${spot.image }</td> <td>[${camp.name }] ${spot.sp_name }</td>
	</tr>
	<tr><td>타입</td> <td>${spot.type }</td>	</tr>
	<tr><td>동행인원</td><td>${res.num }</td> 	</tr>
	<tr><td>추가옵션</td>
		<c:if test="${res.price==spot.price }"><td>선택한 옵션이 없습니다.</td></c:if>
		<c:if test="${res.price!=spot.price}">
		<c:set var="i" value="0"/>
		<td>
		<c:forEach var="eqm" items="${eqlist }">
			<c:if test="${eqm_num[i]!=0 }" >

					${eqm.name} (${eqm.price })   X   ${eqm_num[i]} <br>
			</c:if>
			<c:set var="i" value="${i+1 }"/>
		</c:forEach>
		<td>
		 </c:if>
		</tr>
</table>
요금 합계
<table border=1>
	<tr> <td>${spot.sp_name }</td>
		<td style="text-align:right">${spot.price }</td> </tr>
		<c:if test="${res.price!=spot.price}">
		<c:set var="j" value="0"/>
		<c:forEach var="eqm" items="${eqlist }">
		<tr>
				<c:if test="${eqm_num[i]!=0 }" >
					<td>${eqm.name } X ${eqm_num[j] }</td>
					<td style="text-align:right">${eqm.price*eqm_num[j] }</td>
			</c:if>
			<c:set var="j" value="${j+1 }"/>
		</tr>
		</c:forEach>
		</c:if>
	<tr>
		<td>총 합계</td> <td style="text-align:right"> ${res.price }</td>
	</tr>
</table>

만약 결제완료인 상태라면 이쪽에 결제내역 테이블 추가할 것

<table>
	<tr>
		<td colspan=2>
			<c:if test="${res.payment eq '0'}" ><input type="button" value="결제">
			<input type="button" value="삭제"></c:if>
			 <c:if test="${res.payment eq '1'}" ><input type="button" value="예약취소"></c:if>
			 <input type="button" value="목록">
		</td>
	</tr>
</table>



</body>
</html>