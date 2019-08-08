<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>

<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>
<!--j_spring_security_check의 기본값은 login  -->
<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table style="width:350px">
		<tr>
			<td width="70px">Email</td>
			<td><input type="text" name="memberEmail" size="30"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="memberPwd" size="31"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>
