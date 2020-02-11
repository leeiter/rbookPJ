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
</head>
<body>

<div class="container">
	<%@ include file="/WEB-INF/views/include/include-header.jsp" %>
	<%@ include file="/WEB-INF/views/include/include-nav.jsp" %>
	
	<br>
	<div class="text-center">
		<h3>JOIN</h3>
		<form method="POST" action="${rootPath}/member/join">
			<div class="form-group">
      			<input type="email" id="m_id" name="m_id" class="form-control col-3 join-from" placeholder="USER ID" >
			</div>
			<div class="form-group">
      			<input type="password" id="m_password" name="m_password" class="form-control col-3 join-from" placeholder="USER PASSWORD">
			</div>
			<button type="button" class="btn btn-primary" id="btn-login">JOIN</button>
		</form>
	</div>
	<br>

	<%@ include file="/WEB-INF/views/include/include-footer.jsp" %>
</div>

</body>
</html>