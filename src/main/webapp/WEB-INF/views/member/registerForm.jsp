<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


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
<title>영화 보고 갈래 : 로그인 해주세요</title>

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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var checkResultmemberId = "";
						$("#regForm").submit(
								function() {
									if ($("#regForm :input[name=memberPwd]")
											.val().trim() == "") {
										alert("패스워드를 입력하세요");
										return false;
									}
									if ($("#regForm :input[name=memberName]")
											.val().trim() == "") {
										alert("이름을 입력하세요");
										return false;
									}
									if ($("#regForm :input[name=memberEmail]")
											.val().trim() == "") {
										alert("주소를 입력하세요");
										return false;
									}
									if (checkResultmemberId == "") {
										alert("아이디 중복확인을 하세요");
										return false;
									}
								});//submit

						//아이디 체크...
						$("#regForm :input[name=memberEmail]")
								.keyup(
										function() {
											var memberEmail = $(this).val()
													.trim();
											//alert(id);
											if (memberEmail.length<4 || memberEmail.length>10) {
												$("#idCheckView")
														.html(
																"4자 이상 10자 이하로 작성해주세요")
														.css("font-family",
																"Do Hyeon");
												checkResultmemberId = "";
												return;
											}

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/idcheckAjax",
														data : "${_csrf.parameterName}=${_csrf.token}&memberEmail="
																+ memberEmail,
														success : function(data) {
															if (data == "fail") {
																$(
																		"#idCheckView")
																		.html(
																				"  "
																						+ memberEmail
																						+ "이미 존재한 아이디 입니다.")
																		.css("font-family",
																		"Do Hyeon");
																checkResultId = "";
															} else {
																$(
																		"#idCheckView")
																		.html(
																				"  "
																						+ memberEmail
																						+ "사용 가능한 아이디 입니다.")
																		.css("font-family", "Do Hyeon");
																checkResultmemberId = memberEmail;
															}
														}//callback			
													});//ajax
										});//keyup
					});//ready
</script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.signinhead {
	font-family: "Do Hyeon";
	font-size: "25pt";
}

html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

#regForm {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

#regForm .checkbox {
	font-weight: 400;
}

#regForm .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

#regForm .form-control:focus {
	z-index: 2;
}

#regForm input{
	margin-bottom: -1px;
}



</style>

</head>
<body>

	<form id="regForm"
		action="${pageContext.request.contextPath}/registerMember"
		method="post">
		<h1 class="signinhead">
			이렇게 간단한<br>회원가입 해 봤어?
		</h1>
		<input type="hidden" name="memberId" id="memberId"><br> <br>
		<!-- Id는 seq로 준다. 로그인 아이디는 email -->
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}"> <label for="inputEmail"
			class="sr-only">Email address</label> <input type="text"
			name="memberEmail" class="form-control"
			placeholder="Email address" required autofocus> <span
			id="idCheckView"></span> <label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="memberPwd"
			class="form-control" placeholder="Password" required> <label
			for="inputName" class="sr-only">Name</label> <input type="text" name="memberName" class="form-control" placeholder="Name" required>
		<div class="checkbox mb-3">
			<input type="radio" value="0" name="userType">		ROLE_MEMBER <input
				type="radio" value="1" name="userType">		ROLE_ADMIN

		</div>
		<button class="btn btn-lg btn-secondary btn-block" type="submit"
			value="Register Member">웰컴</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2019 created by
			Bootstrap project by team MUIN</p>
	</form>


</body>
</html>