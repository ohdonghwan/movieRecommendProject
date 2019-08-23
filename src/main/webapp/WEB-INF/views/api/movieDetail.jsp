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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#actorNm").click(function() {
	    $("#direcResult").hide();
	    $("#actorResult").show();

	});


	$("#direcNm").click(function() {
		  $("#actorResult").hide();
	    $("#direcResult").show();

	});
});


</script>
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
<th><span>출연배우</span></th><td><a id="actorNm" href="#">${MovieDTO.movieActor}</a></td>
</tr>
<tr>
<th><span>감독</span></th><td><a id="direcNm" href="#">${MovieDTO.movieDirector}</a></td>
</tr>

<tr>
<th colspan="2" align="center" class="back" >
<a href="javascript:history.go(-1)">돌아가기</a>
 
</th>
</tr>
        </table>
     
        
        <br>
        <br>
        <br>
        
            <div id="actorResult" style="display: none;">
 		 <h3>   배우 이름 = ${MovieDTO.movieActor} </h3> 
          <c:forEach items="${actorDetail}" var="map">        
            <h3>    ${map.key} =  ${map.value} </h3>   <br>
             </c:forEach>
        </div>
        
          <div id="direcResult" style="display: none;">
 		 <h3>   감독 이름 = ${MovieDTO.movieDirector} </h3> 
          <c:forEach items="${directorDetail}" var="map">        
            <h3>    ${map.key} =  ${map.value} </h3>   <br>
             </c:forEach>
        </div>

</body>
</html>