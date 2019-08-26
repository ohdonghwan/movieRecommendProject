<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Movie Detail Page</title>
<style>
div { text-align: center; }
tr {text-align: center;}
</style>
</head>
<sec:authentication var="mvo" property="principal" /> 
<sec:authorize access="isAuthenticated()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#actorNm").click(function() {
       $("#direcResult").hide();
       $("#actorResult").show();

   });


   $("#direcNm").click(function() {
        $("#actorResult").hide();
       $("#direcResult").show();

   });
      function selectReply(){
         $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/reply/selectReply",
            data:"${_csrf.parameterName}=${_csrf.token}&movieNo=${MovieDTO.movieNo}",
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
                  data+="<td><input type='button' class='btn btn-info' name='replyDelete' value='삭제'></td>";
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
      //비공감 버튼 클릭
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
      
      //댓글 삭제
      $(document).on("click", "input[name=replyDelete]", function(){
         var params={
            "${_csrf.parameterName}":"${_csrf.token}",
            replyNo:$(this).parent().parent().children().first().val(),
            memberId:"${mvo.memberId}"
         }
         
         $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/reply/replyDelete",
            data:params,
            success:function(result){
               if(result==1) selectReply();
               else alert("니가 쓴 댓글 아니야 ^^")
            }
         })
      })
});



</script>
<body>
<h1 align="center">상세검색 결과 : ${MovieDTO.movieName}의 상세 정보</h1>


<table width="80%" border="1" align="center" cellpadding="0">

<tr>
<td rowspan="7"><div><img src="${MovieDTO.moviePoster}" border="1" align="middle"/></div></td>
</tr>
<tr>
<th><span>제목</span></th><td>${MovieDTO.movieName}</td>
</tr>
<tr>
<th><span>장르</span></th><td>${MovieDTO.movieGenre}</td>
</tr>
<tr>
<th><span>줄거리</span></th><td>${MovieDTO.movieStory}</td>
</tr>
<tr>
<th><span>출연배우</span></th><td><a id="actorNm" href="#">${MovieDTO.movieActor}</a></td>
</tr>
<tr>
<th><span>감독</span></th><td><a id="direcNm" href="#">${MovieDTO.movieDirector}</a></td>
</tr>

<tr>
<th colspan="2" align="center" class="back" >
<a href="javascript:history.go(-1)">돌아가기</a>
 
</th>
</tr>
        </table>
     
        
        <br>
        <br>
        <br>
        
            <div id="actorResult" style="display: none;">
        <h3>   배우 이름 = ${MovieDTO.movieActor} </h3> 
          <c:forEach items="${actorDetail}" var="map">        
            <h3>    ${map.key} =  ${map.value} </h3>   <br>
             </c:forEach>
        </div>
        
          <div id="direcResult" style="display: none;">
        <h3>   감독 이름 = ${MovieDTO.movieDirector} </h3> 
          <c:forEach items="${directorDetail}" var="map">        
            <h3>    ${map.key} =  ${map.value} </h3>   <br>
             </c:forEach>
        </div>
        <table id="replyTable" class="table table-hover" align="center"><!-- 댓글출력 --></table>
<div align="center" style="margin-top: 150px"><!-- 댓글작성상자 -->
   <table id="insertReplyTable" border="1" align="center">
      <tr>
         <th>댓글 내용</th>
         <th>등록 버튼</th>
      </tr>
      <tr>
         <form name="insertReplyForm" method="post">   
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="hidden" name="replyNo" value="0"/>
            <input type="hidden" name="movieNo" value="${MovieDTO.movieNo}"/>
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
</sec:authorize>
</html>