<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(function(){
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>

<%-- <sec:authorize access="isAuthenticated()">
 <form method="post" action="${pageContext.request.contextPath}/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		이메일 : <input type="text" name="memberEmail" value="<sec:authentication property="principal.memberEmail"/>" readonly>
		<br>패스워드 : <input type="password" name="memberPwd" >	
		<br>이름 : <input type="text" name="memberName" value="<sec:authentication property="principal.memberName"/>" >	
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize> --%>

<sec:authorize access="isAuthenticated()">
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>정보수정</h3>
			</div>
			<div>
				<form id="myForm" action="${pageContext.request.contextPath}/updateMemberAction" method="post">
					<input type="hidden" name="command" value="update">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="memberPwd" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
				<form id="wdForm" action="${pageContext.request.contextPath}/withdrawal" method="post">
					<input type="hidden" name="id" readonly  value="${memberEmail}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<p>
						<label>Password</label>
						<input class="w3-input" type="password" name="pw" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="withdrawalBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원탈퇴</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</sec:authorize>