<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<sec:authentication var="mvo" property="principal" />
<sec:authorize access="isAuthenticated()">
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
.caption {
	color: white !important;
	font-family: "Do Hyeon";
	font-size: 40px;
}

.card {
	background-color: transparent !important;
}

#mystar {
	margin: 0 auto;
	text-align: left;
}

.movietd:hover {
	position: relative;
	margin: 0 auto;
}

.movietd:hover img.movieposter {
	opacity: 0.2;
}

.movietd:hover .movietitle {
	visibility: visible;
}

.movietitle {
	position: absolute;
	vertical-align: middle;
	z-index: 5;
	top: 20%;
	font-size: 25px;
	text-align: center;
	color: white;
	visibility: hidden;
	font-family: "Do Hyeon";
	padding: 20px 25px 20px 20px;
	word-break: break-all;
	width: 100%;
	margin: 0 auto;
}

p {
	margin-left: -20px;
}

.movietitle img {
	width: 60%;
	padding: 10px;
	margin-left: -20px;
}


</style>

	</head>


	<body>

		<c:if test="${not empty requestScope.errorMessage}">
			<span style="color: red">${requestScope.errorMessage}</span>
		</c:if>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
		<div id="mystar">
			<span class='caption'>${mvo.memberName}님이 별점 준 영화</span>
			<div class="card mb-3">
				<div class="table-responsive">
					<table class="table table-borderless" width="100%" cellspacing="0">
						<thead style="text-align: center; vertical-align: middle;">
						<tbody>
							<c:if test="${fn:length(list)==0}">
								<span class='caption'><a href="${pageContext.request.contextPath}/recommend/main" style="font-size:50px; color:white;">가서 마음에 드는 거 골라와봐</a></span>
							</c:if>
							<c:forEach items="${list}" var="list" varStatus="listStatus">
								<td class="movietd"><a
									href="${pageContext.request.contextPath}/api/movieDetail/${list.movieNo}">
										<c:forTokens var="poster" items="${list.moviePoster}"
											delims="|" varStatus="status">
											<c:if test="${status.first}">
												<img src="${poster}" class="movieposter"
													style="width: 100%; " />
											</c:if>
										</c:forTokens>
										<div class="movietitle">
											<p>${list.movieName}</p>
											<c:choose>
												<c:when test="${list.recommendDTO.recommendGrade eq 5}">
													<img class='starImg' src="../resources/images/star5.png" />
												</c:when>
												<c:when test="${list.recommendDTO.recommendGrade eq 4}">
													<img class='starImg' src="../resources/images/star4.png" />
												</c:when>
												<c:when test="${list.recommendDTO.recommendGrade eq 3}">
													<img class='starImg' src="../resources/images/star3.png" />
												</c:when>
												<c:when test="${list.recommendDTO.recommendGrade eq 2}">
													<img class='starImg' src="../resources/images/star2.png" />
												</c:when>
												<c:when test="${list.recommendDTO.recommendGrade eq 1}">
													<img class='starImg' src="../resources/images/star1.png" />
												</c:when>
											</c:choose>
										</div>
								</a></td>


								<c:if test="${listStatus.count%4==0}">
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</body>
</sec:authorize>

</html>
