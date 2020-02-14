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
.join-from {
	margin: 0 auto;
}
</style>

<script>
$(function() {
	
	$("#btn-join").click(function(){
		// 유효성검사
		// id, password가 입력되지 않았을때 경고
		let m_id = $("#m_id")
		let m_password = $("#m_password")
		let re_m_password = $("#re_m_password")
		
		if(m_id.val() == "") {
			alert("아이디를 입력하세요")
			m_id.focus()
			return false;
		}
		if(m_password.val() == "") {
			alert("비밀번호를 입력하세요")
			m_password.focus()
			return false;
		}
		if(re_m_password.val() == "") {
			alert("비밀번호 확인 입력하세요")
			re_m_password.focus()
			return false;
		}
		if(m_password.val() != re_m_password.val()) {
			alert("비밀번호와 비빌번호 확인이 다릅니다")
			m_password.focus()
			return false;
		}
		$("form").submit()
		
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
		<h3>JOIN</h3>
		<br>
		<form method="POST" action="${rootPath}/member/join">
			<div class="form-group">
      			<input type="email" id="m_id" name="m_id" class="form-control col-3 join-from" placeholder="USER ID" >
			</div>
			<div class="form-group">
      			<input type="password" id="m_password" name="m_password" class="form-control col-3 join-from" placeholder="USER PASSWORD">
			</div>
			<div class="form-group">
      			<input type="password" id="re_m_password" name="re_m_password" class="form-control col-3 join-from" placeholder="USER PASSWORD CONFIRM">
			</div>
			<button type="button" class="btn btn-primary" id="btn-join">JOIN</button>
		</form>
	</div>
	<br>

	<%@ include file="/WEB-INF/views/include/include-footer.jsp" %>
</div>

</body>
</html>