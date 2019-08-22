<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" />
<sec:authorize access="isAuthenticated()">
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
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/cover.css"
	rel="stylesheet">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#menu1").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/myRecommendGrade?memberId=${mvo.memberId}",
				success : function(result) {
					$("#mainpage").html(result);
				}
			});
		});
		
		$("#menu2").click(function() {
			$.ajax({		
				url : "${pageContext.request.contextPath }/member/updateForm",
				success : function(result) {
					$("#mainpage").html(result);
					
				}
				
			});
			
		});
		
		$("#menu3").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath }/member/myWishList?memberId="+"${mvo.memberId}",
				success : function(result){
					$("#mainpage").html(result);	
				}															
			});
		});
	})
</script>

<style>
#menucontents {
	margin: auto;
	color: white !important;
	font-family: "Do Hyeon";
	font-size: 20px;
}

#menucontents>ul>li.navbar-brand {
	font-weight: bold;
	font-size: 30px;
}

#hometitle {
	font-family: 'Black Han Sans', sans-serif;
	font-size:35px;
}

#menucontents > ul > li > a {
	color: white;
}

#menucontents > ul > li{
	padding-top: 10px;
}
</style>

</head>


<body>

	<c:if test="${not empty requestScope.errorMessage}">
		<span style="color: red">${requestScope.errorMessage}</span>
	</c:if>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
		<div id="menubar"
			style="float: left; width: 15%; z-index: 1; background-color: black; display: flex; height: 100%;">
			<div id="menucontents" class="align-middle" style="margin: auto;">
				<ul class="nav flex-column">
					<li id="hometitle">영화보고갈래?</li>
					<li><input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}"></li>
					<li class="navbar-brand"><sec:authentication property="principal.memberName" />의 페이지</li>
					<li class="nav-item"><a id="menu1" href="#">내가 별점 준 영화</a></li>
					<li class="nav-item"><a id="menu2" href="#">정보 수정</a></li>
					<li class="nav-item"><a id="menu3" href="#">찜목록</a>
					</li>

					<li class="nav-item"><a
						href="${pageContext.request.contextPath}">홈으로</a></li>
				</ul>

			</div>
		</div>
	</sec:authorize>
	<div id="mainpage"
		style="float: right; width: 85%; display: flex; height: 100%;">
		<video class="video-background" height="100%" width="100%"
			preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"
			style="object-position: right; object-fit: cover">
			<source
				src="${pageContext.request.contextPath}/resources/video/young-movie-actors-doing-a-scene-in-the-movie-J8DRAN6.mp4"
				type="video/mp4">
		</video>
	</div>


</body>
	</html>
</sec:authorize>
