<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  


<sec:authentication var="mvo" property="principal" /> 
<sec:authorize access="isAuthenticated()">
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
	function selectRecommendView(){		
		$.ajax({			
			type:"POST",
			url:"${pageContext.request.contextPath}/recommend/select",
			data:"${_csrf.parameterName}=${_csrf.token}&memberId="+"${mvo.memberId}",
			dataType:"json",
			success:function(result){							
				 var data="<table border='1' cellpadding='5'>";
				 data+="<form method='post'>";
				 $.each(result, function(index, item){
					data += "<input type='hidden' id='memberId' value='${mvo.memberId}' name='memberId'/>";
					//data += "<input type='hidden' id='movieNo' value="+item.movieNo+" name='movieNo'/>";					
					data+="<tr>";
						data+="<td id='movieNo'>"+item.movieNo+"</td>";
						data+="<td>"+item.movieName+"</td>";
						data+="<td>"+item.movieGenre+"</td>";
						data+="<td>"+item.movieStory+"</td>";
						data+="<td>"+item.movieActor+"</td>";
						data+="<td>"+item.movieDirector+"</td>";
						data+="<td><img src='"+item.moviePoster+"'/></td>";
						data+="<td><select id='"+index+"' name='recommendGrade'>";
						data+="<option value=''>---별점 선택---</option>";
						data+= "<option value='1'>★☆☆☆☆</option>";
						data+= "<option value='2'>★★☆☆☆</option>";
						data+= "<option value='3'>★★★☆☆</option>";
						data+= "<option value='4'>★★★★☆</option>";
						data+= "<option value='5'>★★★★★</option>";
						data+= "</select></td>";
					data+="</tr>";
				 })
				data+="</form>";
				data+="</table>";	
				
				$("#movieListView").html(data);	
			}
		});	
	} 
	selectRecommendView();
	
	$(document).on("change","select[name=recommendGrade]" ,function(){ // 별점 select 할때마다 ajax처리로 바로바로 영화 들어가게끔 한다.		
		var params = {
			memberId:$("#memberId").val(),
			movieNo:$(this).parent().parent().children().first().text(), // movieNo를 가져오는 방법을 찾지 못해 DOM을 사용했습니다.
			//UI가 바뀌게 되면 수정해야 하니 꼭 말씀해주세요
			recommendGrade:$(this).val(),
			"${_csrf.parameterName}":"${_csrf.token}"
		};
		//console.log($(this).parent().parent().children().first().text());
		$(this).parent().parent().remove(); // 평점 누르면서 동시에 행 삭제, db에선 삭제하지않는다.
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/recommend/insert",				
			data:params			
		});//ajax
	});	
});
</script>
<body>
	<h1>회원 가입 후 이동하여 DB에 본인이 관심있는 영화 정보 축적하는 페이지입니다.</h1>
	<br>
	<h3>
		영화 목록 랜덤으로 20개 띄워주고<br> 별표 누를때 마다 ajax로
		user_id,Movie_no,recommend_grade를 table에 insert해줍니다.
	</h3>
	<div id="movieListView">여기에 영화 뿌리는거임!</div>
</body>
</html>
</sec:authorize>