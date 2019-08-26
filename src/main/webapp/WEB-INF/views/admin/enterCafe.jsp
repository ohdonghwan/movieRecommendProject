<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">
<title>회원목록, 회원댓글, 신고당한 횟수 등...</title>
<style>

body {

padding-top: 20px;

padding-bottom: 30px;

}

</style>
<script>
	$(document).on('click', '#gomain', function(e){
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/";
	});

</script>
</head>
<body>
<sec:authentication var="mvo" property="principal" />
 <br><br>
<h1 align="center">총 회원수 : ${map.count}명</h1>

<article>
<div class="container">

<div class="table-responsive">

<table class="table table-striped table-sm">
	<colgroup>

			<col style="width:5%;" />

			<%-- <col style="width:auto;" /> --%>

			<%-- <col style="width:15%;" /> --%>

			<col style="width:10%;" />	

			<col style="width:10%;" />

		</colgroup>
	<tr>
		<td>회원이메일</td>
		<td>회원이름</td>
		<td>회원아이디</td>
	</tr>
	<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.memberEmail}</td>
		<td>${row.memberName}</td>
		<td>${row.memberId}</td>
	</tr>
	</c:forEach>
</table>
</div>
	<form name="form1" method="post" action="${pageContext.request.contextPath}/enterCafe">
	<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}">
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected' : ''}"/>> 전체</option>
			<option value="member_email" <c:out value="${map.searchOption == 'member_email'?'selected' : ''}"/>> 이메일</option>
			<option value="member_name" <c:out value="${map.searchOption == 'member_name'?'selected' : ''}"/>> 이름</option>
			<option value="member_Id" <c:out value="${map.searchOption == 'member_Id'?'selected' : ''}"/>> 아이디</option>
		</select>
		<input name ="keyword" value="${map.keyword}">
		<input type="submit" value="검색"> 
	</form>
<div >
<button type="button" class="btn btn-sm btn-primary" id="gomain">메인으로</button>
</div>
</div>

</article>
</body>
</html>