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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<style>
img{width: 100px; height: 150px}

</style>

</head>


<body>

<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>
<h1>찜목록</h1><br>
<div><a href="${pageContext.request.contextPath}/member/myRecommendGrade?memberId=${mvo.memberId}">내가 별점 준 영화</a></div><br>
<div><a href="${pageContext.request.contextPath }/member/updateForm">정보 수정</a></div><br>
<div><a href="${pageContext.request.contextPath}">홈으로</a></div><br>
<div><a href="${pageContext.request.contextPath }/member/myWishList?memberId=${mvo.memberId}">찜목록</a></div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

  <div class="container">
  
  	<table class="table table-hover">
  		<thead>
  			<tr>
  				<td>포스터</td>
  				<td>영화제목</td>
  				<td>영화장르</td>
  				<td>영화감독</td>
  			</tr>
  		</thead>
  		<tbody>
  		<c:forEach items="${list}" var="list">
  			<tr>
  				<td><img src='${list.moviePoster}'/></td>
  				<td>${list.movieName}</td>
  				<td>${list.movieGenre}</td>
  				<td>${list.movieDirector}</td>
  			</tr>
  		</c:forEach>
  		</tbody>
  	</table>      
  	
        <div class="text-center">
          <ul class="pagination">
            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li class="active"><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
          </ul>          
        </div>
      </div>   
</body>
</html>
</sec:authorize>
