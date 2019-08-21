<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 
<sec:authorize access="isAuthenticated()">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	function selectReply(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/reply/selectReply",
			data:"${_csrf.parameterName}=${_csrf.token}&memberId="+"${mvo.memberId}&movieNo=28",
			dataType:"json",
			success:function(result){
				var data="<tr><td>작성자</td><td>내용</td>";
				data+="<td>공감</td>";
				data+="<td>비공감</td>";
				data+="<td>작성일</td></tr>";
				$.each(result, function(index, item){
					data+="<tr>";
					data+="<input type='hidden' value='"+item.replyNo+"'>";
					data+="<td>"+item.memberName+"</td>";
					data+="<td>"+item.replyContent+"</td>";
					data+="<td><input type='button' class='btn btn-success' name='replyUp' value='공감 : "+item.replyUp+"'></td>";
					data+="<td><input type='button' class='btn btn-danger' name='replyDown' value='비공감 : "+item.replyDown+"'></td>";
					data+="<td>"+item.replyDate+"</td>";
					data+="</tr>";
				})
				$("#replyTable").html(data);
			}
		})
	}
	selectReply(); // 처음에 화면 띄울 때 전체 댓글 출력
	
	//등록 버튼 클릭시 실행
	$("#insertbtn").click(function(){
		var params = $("form[name=insertReplyForm]").serialize();		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/reply/insertReply",
			data:params,
			success: function(){
				$("input[name=replyContent]").val("");
				selectReply(); // insert 후 댓글 출력
			}
		});		
	})
	//공감버튼 클릭
	$(document).on("click", "input[name=replyUp]", function(){
		//console.log($(this).parent().parent().children().first().val())
		var params={
			"${_csrf.parameterName}":"${_csrf.token}",
			replyNo:$(this).parent().parent().children().first().val()
		}
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/reply/replyUp",
			data:params,
			success:function(){
				selectReply();
			}
		})
	})
	$(document).on("click", "input[name=replyDown]", function(){
		var params={
			"${_csrf.parameterName}":"${_csrf.token}",
			replyNo:$(this).parent().parent().children().first().val()
		}
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/reply/replyDown",
			data:params,
			success:function(){
				selectReply();
			}
		})
	})
})
</script>

<body>
<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>
<h1>상세검색 결과 페이지에서 댓글입력 테스트 중 . . . </h1>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<!-- 댓글 출력하는 table -->
<table id="replyTable" class="table table-hover"> </table>
<div align="center" style="margin-top: 200px">
	<table id="insertReplyTable" border="1">
		<tr>
			<th>댓글 내용</th>
			<th>등록 버튼</th>
		</tr>
		<tr>
			<form name="insertReplyForm" method="post">	
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="replyNo" value="0"/>
				<input type="hidden" name="movieNo" value="28"/><!-- 무비넘버 하드코딩, 바꿔야함 -->
				<td><input type="text" name="replyContent"></td>
				<input type="hidden" name="replyDate" value=""/>
				<input type="hidden" name="memberId" value="${mvo.memberId}"/>
				<td><input type="button" value="등록" id="insertbtn"/></td>
				<input type="hidden" name="memberName" value="${mvo.memberName}"/>
			</form>
		</tr>
	</table>
</div>
</body>
</html>
</sec:authorize>
