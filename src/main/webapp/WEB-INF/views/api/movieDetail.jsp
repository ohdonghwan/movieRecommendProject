<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Detail Page</title>
<style>
div { text-align: center; }
tr {text-align: center;}
</style>
</head>
<body>
<h1 align="center">상세검색 결과 : ${MovieDTO.movieName}의 상세 정보</h1>


<table width="60%" border="1" align="center" cellpadding="0">

<tr>
<td colspan="2"><div><img src="${MovieDTO.moviePoster}" border="1" align="middle"/></div></td>
</tr>
<tr>
<th><span>제목</span></th><td>${MovieDTO.movieName}</td>
</tr>
<tr>
<th><span>장르</span></th><td>${MovieDTO.movieGenre}</td>
</tr>
<tr>
<th><span>줄거리</span></th><td>${MovieDTO.movieStory}</td>
</tr>
<tr>
<th><span><a href="${pageContext.request.contextPath}/api/movieDetail/${MovieDTO.movieActor}">출연배우</a></span></th><td>${MovieDTO.movieActor}</td>
</tr>
<tr>
<th><span>출연감독</span></th><td>${MovieDTO.movieDirector}</td>
</tr>

<tr>
<th colspan="2" align="center" class="back" >
<a href="javascript:history.go(-1)">돌아가기</a>
 
</th>
</tr>
        </table>

</body>
</html>