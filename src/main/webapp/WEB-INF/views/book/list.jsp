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
.name-search {
	margin-left: auto; 
}
</style>
<script>
$(function() {
	
	$("#btn-write").click(function() {
		document.location.href="${rootPath}/book/input"
	})
	
	$(".rblist tr").click(function() {
		let b_code = $(this).attr("data-id")
		document.location.href = "${rootPath}/book/view/" + b_code
	})
	
	
	var contextCallBack = function(key, options) {
		
		if(key == 'edit') {
			let b_code = $(this).attr("data-id");
			document.location.href = "${rootPath}/book/update/" + b_code
			alert("수정 : " + $(this).attr("data-id"))
		}
		
		if(key == 'delete') {
			if(confirm("도서정보를 삭제할까요?")) {
				let b_code = $(this).attr("data-id");
				document.location.href = "${rootPath}/book/delete/" + b_code
				alert("삭제 : " + $(this).attr("data-id"))
			}
		}
		
	}
		
	$.contextMenu({
		selector : '.blist-item',
		callback : contextCallBack,
		items : {
			'edit' : {name : '수정', icon : 'edit'},
			'delete' : {name : '삭제', icon : 'delete'}
		}
		
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
			<c:when test="${BODY == 'B_INPUT'}">
				<%@ include file="/WEB-INF/views/book/input.jsp"%>
			</c:when>
			<c:otherwise>
				<form>
					<input type="search" name="search" value="${search}" class="form-control mb-2 mr-sm-2 col-4 name-search" 
						placeholder="검색 : 도서명을 입력한 후 Enter...">
				</form>
				<%@ include file="/WEB-INF/views/book/list-body.jsp"%>
				<%@ include file="/WEB-INF/views/book/pagination.jsp"%>
				<div class="text-center">
					<button type="button" id="btn-write" class="btn btn-primary">도서 등록</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<%@ include file="/WEB-INF/views/include/include-footer.jsp" %>
</div>

</body>
</html>