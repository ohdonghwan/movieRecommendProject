<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
<sec:authorize access="isAuthenticated()">
 <form method="post" action="${pageContext.request.contextPath}/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이디 : <input type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>
		<br>패스워드 : <input type="text" name="password" >	
		<br>이름 : <input type="text" name="name" 
		value="<sec:authentication property="principal.name"/>" >	
		<br>주소 : <input type="text" name="address" 
		value="<sec:authentication property="principal.address"/>" >	
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
<h3>회원정보수정</h3>
		
