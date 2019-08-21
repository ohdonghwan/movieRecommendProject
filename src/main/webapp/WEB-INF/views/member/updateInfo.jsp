<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#pwdconfirm").click(function(){
			document.form1.action = "${pageContext.request.contextPath}/confirm";
			document.form1.submit();	
		});
	
	
	})
</script>
<sec:authorize access="isAuthenticated()">
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
 <form method="post" name="form1">
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="memberEmail" readonly value="${memberEmail}">
		이메일 : <input type="text" name="memberEmail" value="<sec:authentication property="principal.memberEmail"/>" readonly>
		<p>
			비밀번호 : 
			<input type="password" name="memberPwd" required>
		
		</p>
		<p>
		<input type="button" value="비밀번호 확인" id = "pwdconfirm" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">
		</p>
		</form>
		
		<div style="color: red;">${message}</div>
		</div>
		</div>
		</div>
</sec:authorize>
<h3>정보수정 하기 전에 비밀번호 확인 한 번더...</h3>