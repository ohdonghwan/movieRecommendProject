<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<sec:authentication var="mvo" property="principal" />

<!DOCTYPE html>
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
<!-- Bootstrap core CSS -->
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
#caption {
	color: white !important;
	font-family: "Do Hyeon";
	font-size: 40px;
}

.card {
	background-color: transparent !important;
	   border: none;
    margin: auto;
    display: inline-block;
}

#mypick {
	text-align: center;
}

.movietd:hover {
	position: relative;
	margin: 0 auto;
}

.movietd:hover img.movieposter {
	opacity: 0.2;
}

.movietd:hover .movietitle {
	visibility: visible;
}

.movietitle {
	position: absolute;
	vertical-align: middle;
	z-index: 5;
	top: 20%;
	font-size: 25px;
	vertical-align: middle;
	text-align: center;
	color: white;
	visibility: hidden;
	font-family: "Do Hyeon";
	padding: 10px 25px 10px 0px;
	width: 100%;
	margin: 0 auto;
}

.movietitle .btn {
    margin: 10px;
    font-size: 20px!important;
    }
</style>

<title>추천 영화 리스트</title>
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$(document).on('click', '#gomain', function(e) {
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/";
		});
		function recommendMovie() {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/recommend/recommendMovie",
						data : "${_csrf.parameterName}=${_csrf.token}&memberId="
								+ "${mvo.memberId}",
						dataType : "json",
						success : function(result) {
							var data = "<form method='post'>";
							$.each(result,function(index, item){ data += "<input type='hidden' value='"+item.movieNo+"'>";
												data += "<input type='hidden' value='${mvo.memberId}' name='memberId'/>";
												var posterlist = item.moviePoster;
												var movieposter = posterlist
														.split("|", 1);
												data += "<td class='movietd'><input type='hidden' value='"+item.movieNo+"'>";
												data += "<img src='"+movieposter+"'class='movieposter' style='width:100%'>";
												data += "<div class='movietitle'><p>"+item.movieName+"</p>"
												data +="<a class='btn btn-light' href='${pageContext.request.contextPath}/api/movieDetail/"+item.movieNo+"'>상세 보기</a>";
												data += "<br><input type='button'class='btn btn-light' value='찜하기' name='wishListBtn'><div></td>";
												if (index % 3 == 2) {
													data += "</tr>";
												}
											})
							data += "</form>";
							$("#selectResult").html(data);
						},
					error:function(jqXHR,error){
						if(jqXHR.status==500){var data="<a href='${pageContext.request.contextPath}/recommend/main' style='font-size:50px; color:white;'>가서 마음에 드는 거 골라와봐</a>";

						$("#selectResult").html(data);}
					}
					});
		}
		recommendMovie();

		$(document).on("click","input[name=wishListBtn]",
						function() {
							console.log($(this).parent().parent().children().eq(0).val());
							/*console.log($('input[name=memberId]').val()); */
							var params = {
								memberId : $('input[name=memberId]').val(),
								movieNo : $(this).parent().parent().children().eq(0).val(),
								"${_csrf.parameterName}" : "${_csrf.token}"
							}

							$.ajax({type : "post",
										url : "${pageContext.request.contextPath}/member/insertWishList",
										data : params,
										success : function(result) {
											if (result == 1) {
												alert("찜목록에 추가되었습니다!")
											} else {
												alert("이미 찜목록에 들어 있습니다!")
											}
										}
									})

						})
	});
</script>
<body>		
		
		<!-- DataTables Example -->
		<div class="container" style="display:flex; width:100%;">
		<div id="mypick" class="align-middle" style="width:100%;">
		<span id='caption'>${mvo.memberName} 어서온나. 오늘은 뭐볼라꼬?</span>
		<div class="card mb-3">
			<div class="table-responsive">
				<table class="table table-borderless" width="100%" cellspacing="0">
					<thead style="text-align: center; vertical-align: middle;">
						<tbody style="text-align: center; vertical-align: bottom;"
							id='selectResult'>
							<!-- 영화 검색 결과 들어가는 body, ajax에서 처리합니다. -->
						</tbody>
						</thread>
					</table>
				</div>
			</div>
		</div>
		</div>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Page level plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Demo scripts for this page-->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>