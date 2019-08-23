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
img{width: 100px; height: 150px}

.starImg{width: 80px; height: 30px;}

#recommendTable{
	margin: auto;
	color: white !important;
	font-family: "Do Hyeon";
	font-size: 20px;
}
#caption{
	color: white !important;
	font-family: "Do Hyeon";
	font-size: 40px;
}
</style>

</head>


<body>

<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

  <h5 id='caption'>내가 별점 준 영화</h5>
  <div class="card mb-3">          
            <div class="table-responsive">
              <table class="table table-dark table-hover table-borderless" id="dataTable" width="100%" cellspacing="0">
                <thead style = "text-align:center; vertical-align: middle;" >
					<tr>
						<th>포스터</th>
						<th>제목</th>
						<th>장르</th>
						<th>줄거리</th>
						<th>주연배우</th>
						<th>감독</th>
						<th>내 별점</th>
					</tr>
				</thead>
  		<tbody>
  		<c:forEach items="${list}" var="list">
  			<tr>
  				<td><img src='${list.moviePoster}'/></td>
  				<td>${list.movieName}</td>
  				<td>${list.movieGenre}</td>
  				<td>${list.movieStory}</td>
  				<td>${list.movieActor}</td>
  				<td>${list.movieDirector}</td>
  				<td>  				
  				<c:choose>
  					<c:when test="${list.recommendDTO.recommendGrade eq 5}"><img class='starImg' src="../resources/images/star5.png"/></c:when>
  					<c:when test="${list.recommendDTO.recommendGrade eq 4}"><img class='starImg' src="../resources/images/star4.png"/></c:when>
  					<c:when test="${list.recommendDTO.recommendGrade eq 3}"><img class='starImg' src="../resources/images/star3.png"/></c:when>
  					<c:when test="${list.recommendDTO.recommendGrade eq 2}"><img class='starImg' src="../resources/images/star2.png"/></c:when>
  					<c:when test="${list.recommendDTO.recommendGrade eq 1}"><img class='starImg' src="../resources/images/star1.png"/></c:when>
  				</c:choose>  				
  				</td>
  			</tr>
  		</c:forEach>
  		</tbody>
  	</table>
  	</div>
  	</div>
  	      	<!-- Bootstrap core JavaScript -->
		<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


		<!-- Page level plugin JavaScript-->
		<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

		<!-- Demo scripts for this page-->
		<script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>        
</body>
</html>
</sec:authorize>
