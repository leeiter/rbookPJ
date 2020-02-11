<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/include/include-head.jsp" %>

<style>
.login-from {
	margin: 0 auto;
}
</style>

<script>
$(function(){
		
		$("#btn-join").click(function(){
			document.location.href="${rootPath}/member/join"
		})
			
		$("#btn-login").click(function(){
			
			// 유효성 검사
			// id, password가 입력되지 않았을 때 경고
			let u_id = $("#u_id").val()
			if(u_id == ""){
				alert("아이디를 입력하세요")
				$("#u_id").focus
				return false
			}
			
			var params = $("form").serialize();
			$.ajax({
				url : "${rootPath}/member/login",
				type : 'POST',
				data: params,
				success:function(result){
					if(result == "LOGIN_OK"){
						document.location.href="${rootPath}/"
					}
					 
				}
			})
			
		})
		
		
		
		
})
</script>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/views/include/include-header.jsp" %>
	<%@ include file="/WEB-INF/views/include/include-nav.jsp" %>
	
	<br>
	<div class="text-center">
		<h3>LOGIN</h3>
		<form method="POST" action="${rootPath}/member/login">
			<c:if test="${LOGIN_MSG == 'FAIL'}">
				<h4>아이디 혹은 비밀번호를 다시 확인하시고 입력해주세요</h4>
			</c:if>
	
			<c:if test="${LOGIN_MSG == 'TRY'}">
				<h4>login required</h4>
			</c:if>
			
			<c:if test="${LOGIN_MSG == 'NO_AUTH'}">
				<h4>작성자만이 볼 수 있음!!</h4>
			</c:if>
		
			<div class="form-group">
      			<input type="email" id="m_id" name="m_id" class="form-control col-3 login-from" placeholder="YOUR ID" >
			</div>
			<div class="form-group">
      			<input type="password" id="m_password" name="m_password" class="form-control col-3 login-from" placeholder="YOUR PASSWORD">
			</div>
			<button type="button" class="btn btn-primary" id="btn-login">SIGN IN</button>
			<button type="button" class="btn btn-success" id="btn-join">SIGN UP</button>
		</form>
	</div>
	<br>

	<%@ include file="/WEB-INF/views/include/include-footer.jsp" %>
</div>

</body>
</html>