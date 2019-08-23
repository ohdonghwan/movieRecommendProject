<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 영화 목록</title>
</head>

<body>

	<table border="1" align="center" summary="목록">

		<caption>

			<span>목록</span>

		</caption>

		<thead>
			<tr>
				<th><span>번호</span></th>
				<th><span>제목</span></th>
				<th><span>장르</span></th>
				<th><span>줄거리</span></th>
				<th><span>출연배우</span></th>
				<th><span>출연감독</span></th>
			</tr>
		</thead>



		<c:if test="${List.size() == 0 }">

			<tfoot>

				<tr>

					<td colspan="3">현재 데이타가 없습니다.</td>

				</tr>
			</tfoot>

		</c:if>

		<tbody>

			<c:forEach var="MovieDTO" items="${requestScope.list}" varStatus="status">

			<tr>
			
		<td>${status.count}</td>
		<td><a href="${pageContext.request.contextPath}/api/movieDetail/${MovieDTO.movieNo}">${MovieDTO.movieName}</a></td>
		<td>${MovieDTO.movieGenre}</td>
		<td>${MovieDTO.movieStory}</td>
		<td>${MovieDTO.movieActor}</td>
		<td>${MovieDTO.movieDirector}</td>
			</tr>
			</c:forEach>

		</tbody>

	</table>



</body>
</html>