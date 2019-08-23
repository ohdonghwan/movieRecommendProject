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
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">

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
				var data = "<form method='post'>";
				 $.each(result, function(index, item){
					data += "<tr>";
						data+="<input type='hidden' value='"+item.movieNo+"'>";
						data += "<input type='hidden' value='${mvo.memberId}' name='memberId'/>";
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
				$("#selectResult").html(data);	
			}
		})
	}
	selectMovieResult();
	
	$(document).on("click", "input[name=wishListBtn]", function(){
		/* console.log($(this).parent().parent().children().first().val());
		console.log($('input[name=memberId]').val()); */
		var params={
			memberId:$('input[name=memberId]').val(),
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
<!-- 로그인 안한 사용자의 접근 (로그인 안하면 안쓰실거면 삭제하셔도 됩니다 !isAuthenticated()전부다-->
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
			 var data = "<form method='post'>";
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
<!-- DataTables Example -->
	<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	영화 검색 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead style = "text-align:center; vertical-align: middle;" >
					<tr>
						<th>포스터</th>
						<th>제목</th>
						<th>장르</th>
						<th>줄거리</th>
						<th>주연배우</th>
						<th>감독</th>
						<th>찜하기</th>
					</tr>
				</thead>              
                <tbody style = "text-align:center; vertical-align: bottom;" id='selectResult'>                
                <!-- 영화 검색 결과 들어가는 body, ajax에서 처리합니다. --> 
                </tbody> 
              </table>
            </div>
          </div>
        </div>

</article>
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