<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
	
	
	<sec:authentication var="mvo" property="principal" /> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){	
	function recommendMovie(){		
		$.ajax({			
			type:"post",
			url:"${pageContext.request.contextPath}/recommend/recommendMovie",
			data:"${_csrf.parameterName}=${_csrf.token}&memberId="+"${mvo.memberId}",
			dataType:"json",
			success:function(result){							
				console.log(result);
				 var data="<table border='1' cellpadding='5'>";
				 data+="<form method='post'>";
				  $.each(result, function(index, item){
					data += "<input type='hidden' id='memberId' value='${mvo.memberId}' name='memberId'/>";
					data+="<tr>";
						data+="<td id='movieNo'>"+item.movieNo+"</td>";
						data+="<td><a href='${pageContext.request.contextPath}/detail/movieDetail'>"+item.movieName+"</a></td>";
						data+="<td>"+item.movieGenre+"</td>";
						data+="<td>"+item.movieStory+"</td>";
						data+="<td>"+item.movieActor+"</td>";
						data+="<td>"+item.movieDirector+"</td>";
						data+="<td>"+item.moviePoster+"</td>";
					data+="</tr>";
				 })
				data+="</form>";
				data+="</table>";	
				
				$("#movieListView").html(data);	 
			}
		});	
	} 
	recommendMovie();
});
</script>
<body>
	<h1>추천된 영화 뿌려주는 페이지</h1>
	<br>
	<h3>
		머하웃을 사용하여 뿌려줍니다.
	</h3>
	<div id="movieListView">여기에 영화 뿌리는거임!</div>
</body>
</html>