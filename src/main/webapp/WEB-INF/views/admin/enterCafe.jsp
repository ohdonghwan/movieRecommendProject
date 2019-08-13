<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록, 회원댓글, 신고당한 횟수 등...</title>
<script type=""></script>
</head>
<body>
<sec:authentication var="mvo" property="principal" />
 <br><br>
<h1>총 회원수 ${requestScope.count}명</h1>

<table border="1">
	<tr>
		<td>회원이메일</td>
		<td>회원이름</td>
		<td>회원아이디</td>
	</tr>
	<c:forEach var="MemberDTO" items="${list}">
	<tr>
		<td>${MemberDTO.memberEmail }</td>
		<td>${MemberDTO.memberName }</td>
		<td>${MemberDTO.memberId }</td>
		<td>${MemberDTO.memberAddress }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>