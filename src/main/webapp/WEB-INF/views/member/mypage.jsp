<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 
<sec:authorize access="isAuthenticated()">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="영화 보고 갈래는 무인 팀이 제작한 사용자 경험 기반 영화 추천 사이트 입니다.">
<meta name="author" content="Team Muin">
<link rel="icon" href="../../favicon.ico">
<title>마이 페이지</title>

<!-- link for main fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>

</style>
<script>
$(function(){
	function printMyRecommendGrade(){
		alert(1);	
	}	
	printMyRecommendGrade();
})
</script>
</head>


<body>

<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
	<div><h1>마이 페이지</h1>	
		<div><a href="${pageContext.request.contextPath}/member/myRecommendGrade?memberId=${mvo.memberId}">내가 별점 준 영화</a></div><br>
		<div><a href="${pageContext.request.contextPath }/member/updateForm">정보 수정</a></div><br>
		<div><a href="${pageContext.request.contextPath}">홈으로</a></div><br>
		<div><a href="${pageContext.request.contextPath }/member/myWishList?memberId=${mvo.memberId}">찜목록</a></div>
	</div>
	</sec:authorize>
	<div align="center">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		이메일 : <input type="text" name="memberEmail" value="<sec:authentication property="principal.memberEmail"/>" readonly><br>
		이름 : <input type="text" name="memberName" value="<sec:authentication property="principal.memberName"/>" readonly>
	</div>
</body>
</html>
</sec:authorize>
