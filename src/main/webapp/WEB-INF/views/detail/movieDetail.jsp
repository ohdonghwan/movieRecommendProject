<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상세검색 결과 페이지입니다 _ test 중 . . . </h1>

<table border="1">
	<tr>
		<td>영화제목</td>
		<td>영화장르</td>
		<td>줄거리</td>
	</tr>
	<c:forEach var="DetailDTO" items="${list}">
	<tr>
		<td>${DetailDTO.movieName}</td>
		<td>${DetailDTO.genre}</td>
		<td>${DetailDTO.plot}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>