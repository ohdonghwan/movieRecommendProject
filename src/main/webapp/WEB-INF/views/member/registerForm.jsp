<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="./js/jquery-1.11.3.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkResultmemberId="";		
	$("#regForm").submit(function(){			
		if($("#regForm :input[name=memberPwd]").val().trim()==""){
			alert("패스워드를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=memberName]").val().trim()==""){
			alert("이름을 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=memberEmail]").val().trim()==""){
			alert("주소를 입력하세요");				
			return false;
		}	
		if(checkResultmemberId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}	
	});//submit
	
	
	//아이디 체크...
	$("#regForm :input[name=memberEmail]").keyup(function(){
		var memberEmail=$(this).val().trim();
		//alert(id);
		if(memberEmail.length<4 || memberEmail.length>10){
			$("#idCheckView").html("4>id length OR id length>10").css("background","pink");
			checkResultmemberId="";
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/idcheckAjax",				
			data:"${_csrf.parameterName}=${_csrf.token}&memberEmail="+memberEmail,	
			success:function(data){						
				if(data=="fail"){
				$("#idCheckView").html("  "+memberEmail+" ID Can't Use!! ").css("background","red");
					checkResultId="";
				}else{						
					$("#idCheckView").html("  "+memberEmail+" ID Can Use!! ").css("background","yellow");		
					checkResultmemberId=memberEmail;
				}					
			}//callback			
		});//ajax
	});//keyup
});//ready
</script>
</head>
<body>
<h2>Member Register Form</h2><p>
<form method="post" action="${pageContext.request.contextPath}/registerMember" id="regForm">
	<input type="hidden" name="memberId" id="memberId"><br><br><!-- Id는 seq로 준다. 로그인 아이디는 email -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	EMIAL <input type="text" name="memberEmail"><span id="idCheckView"></span><br><br>
	PASSWORD <input type="password" name="memberPwd"><br><br>
	NAME <input type="text" name="memberName"><br><br>
	UERT TYPE <input type="radio" value="0" name="userType">ROLE_MEMBER
			  <input type="radio" value="1" name="userType">ROLE_ADMIN<br><br>
	<input type="submit" value="Register Member">
</form>
</body>
</html>