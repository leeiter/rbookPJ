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

<script>
$(function() {
	
	$("#btn-write").click(function() {
		document.location.href="${rootPath}/rbook/input"
	})
	
	$(".rblist tr").click(function() {
		let rb_seq = $(this).attr("data-id")
		document.location.href = "${rootPath}/rbook/view/" + rb_seq
	})
	
})
</script>
</head>
<body>

<div class="container">
	<%@ include file="/WEB-INF/views/include/include-header.jsp" %>
	<%@ include file="/WEB-INF/views/include/include-nav.jsp" %>
		
	<div>
	    <c:choose>
			<c:when test="${BODY == 'RB_INPUT'}">
				<%@ include file="/WEB-INF/views/rbook/input.jsp"%>
			</c:when>
			<c:when test="${BODY == 'RB_VIEW'}">
				<%@ include file="/WEB-INF/views/rbook/view.jsp"%>
			</c:when>
			<c:otherwise>
				<form>
					<input type="search" name="search" value="${search}" class="form-control mb-2 mr-sm-2 col-4 subject-search" 
							placeholder="검색 : 한줄소감을 입력한 후 Enter...">
				</form>
				<%@ include file="/WEB-INF/views/rbook/list-body.jsp"%>
				<%@ include file="/WEB-INF/views/rbook/pagination.jsp"%>
				<div class="text-center">
					<button type="button" id="btn-write" class="btn btn-primary">독서록 등록</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<%@ include file="/WEB-INF/views/include/include-footer.jsp" %>
</div>

</body>
</html>