<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/cover.css"
	rel="stylesheet">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {

		if ($("#pwForm").submit(function() {
			if ($("#pw").val() !== $("#pw2").val()) {
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			} else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			} else if ($.trim($("#pw").val()) !== $("#pw").val()) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			} else if ($("#pw").val().length < 8 || $("#pw2").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}
		}))
			;
	})
</script>

<style>
body{
	height:100%;
	display:flex;
	
}

.signinhead {
	font-family: "Do Hyeon";
	font-size: "25pt";
	color: white;
}

#formgroup {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	vertical-align: middle;
	display: inline-block;
}



.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[name="newName"] {
	margin-bottom: 10px;

}

.form-signin input[name="memberPwd2"] {
		margin-bottom: 10px;
	
}

.form-signin input[name="memberPwd"] {
		margin-bottom: -1px;
	
}

.form-signin input[name="pw"] {
		margin-bottom: 10px;
	
}

</style>

</head>
<sec:authorize access="isAuthenticated()">
	<body class="text-center">
		<div id="formgroup" class="align-middle">
			<form class="form-signin align-middle" id="pwForm"
				action="${pageContext.request.contextPath}/updateMemberAction"
				method="post">
				<h1 class="signinhead">정보 수정</h1>
				<input type="hidden" name="command" value="update"> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<label for="New Name" class="sr-only">New Name</label> <input
				text="text" class="form-control" placeholder="New Name"
					id="newName" name="newName" required autofocus>
				<label for="New Password" class="sr-only">New Password</label> <input
					type="password" class="form-control" placeholder="New Password"
					id="pw" name="memberPwd" required autofocus> 
				<label for="Confirmation" class="sr-only">Confirm</label>
				 <input type="password" name="memberPwd2" id="pw2" class="form-control"
					placeholder="Confirm Password" required>

				<button class="btn btn-lg btn-secondary btn-block" type="submit"
					id="joinBtn">비밀번호 변경</button>
			</form>


			<form class="form-signin" id="wdForm"
				action="${pageContext.request.contextPath}/withdrawal" method="post">
				<<input type="hidden" name="id" readonly value="${memberEmail}">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <label for="Password"
					class="sr-only">Password</label> <input type="password"
					class="form-control" placeholder="Password" name="pw">

				<button type="submit" id="withdrawalBtn"
					class="btn btn-lg btn-secondary btn-block">회원 탈퇴</button>
			</form>
		</div>
</sec:authorize>

</body>
</html>