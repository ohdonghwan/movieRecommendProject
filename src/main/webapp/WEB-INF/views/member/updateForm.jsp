<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
<sec:authorize access="isAuthenticated()">
 <form method="post" action="${pageContext.request.contextPath}/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		이메일 : <input type="text" name="memberEmail" value="<sec:authentication property="principal.memberEmail"/>" readonly>
		<br>패스워드 : <input type="password" name="memberPwd" >	
		<br>이름 : <input type="text" name="memberName" value="<sec:authentication property="principal.memberName"/>">
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
<h3>회원정보수정</h3>
		
