<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<sec:authentication var="mvo" property="principal" />
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">
<title>검색</title>
<style>

body {

padding-top: 20px;

padding-bottom: 30px;

}

</style>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<sec:authorize access="isAuthenticated()">
<script>
	
	$(document).on('click', '#gomain', function(e){
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/";
	});

	function selectMovieResult(){
		var params = {
			searchKind:"${param.searchKind}",
			keyWord:"${param.searchByMovieKeyWord}",
			"${_csrf.parameterName}":"${_csrf.token}"
		}
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/movie/selectMovie",
			data:params,
			dataType:"json",
			success:function(result){
				var data="<table border='1' cellpadding='5'>";
				 data+="<form method='post'>";
				 $.each(result, function(index, item){
					data += "<input type='hidden' id='memberId' value='${mvo.memberId}' name='memberId'/>";
					data += "<tr>";
						data+="<input type='hidden' value='"+item.movieNo+"'>";
						data+="<td><img src='"+item.moviePoster+"'></td>";
						data+="<td>"+item.movieName+"</td>";
						data+="<td>"+item.movieGenre+"</td>";
						data+="<td>"+item.movieStory+"</td>";
						data+="<td>"+item.movieActor+"</td>";
						data+="<td>"+item.movieDirector+"</td>";
						data+="<td><input type='button' value='찜하기' name='wishListBtn'></td>";
					data += "</tr>";
				 })
				data+="</form>";
				data+="</table>";				
				$("#selectResult").html(data);	
			}
		})
	}
	selectMovieResult();
	
	$(document).on("click", "input[name=wishListBtn]", function(){
		var params={
			memberId:$("#memberId").val(),
			movieNo:$(this).parent().parent().children().first().val(),
			"${_csrf.parameterName}":"${_csrf.token}"
		}
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/member/insertWishList",
			data:params,
			success:function(result){
				if(result==1){
					alert("찜목록에 추가되었습니다!")
				}
				else{
					alert("이미 찜목록에 들어 있습니다!")
				}
			}
		})
		
	})

</script>
</sec:authorize>

<sec:authorize access="!isAuthenticated()">
<script>
$(document).on('click', '#gomain', function(e){
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/";
});

function selectMovieResult(){
	var params = {
		searchKind:"${param.searchKind}",
		keyWord:"${param.searchByMovieKeyWord}",
		"${_csrf.parameterName}":"${_csrf.token}"
	}
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/movie/selectMovie",
		data:params,
		dataType:"json",
		success:function(result){
			var data="<table border='1' cellpadding='5'>";
			 data+="<form method='post'>";
			 $.each(result, function(index, item){
				data += "<tr>";
					data+="<input type='hidden' value='"+item.movieNo+"'>";
					data+="<td><img src='"+item.moviePoster+"'></td>";
					data+="<td>"+item.movieName+"</td>";
					data+="<td>"+item.movieGenre+"</td>";
					data+="<td>"+item.movieStory+"</td>";
					data+="<td>"+item.movieActor+"</td>";
					data+="<td>"+item.movieDirector+"</td>";
				data += "</tr>";
			 })
			data+="</form>";
			data+="</table>";				
			$("#selectResult").html(data);	
		}
	})
}
selectMovieResult();
</script>
</sec:authorize>
</head>
<body>

 <br><br>
<article>
<button type="button" class="btn btn-sm btn-primary" id="gomain">메인으로</button>
<h1>검색</h1>
<div id="selectResult">
</div>

</article>
</body>
</html>