<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="pagination justify-content-center">
	<c:if test="${pageVO.startPageNo > 1}">	
		<li class="page-item"><a href="${rootPath}/book/list?currentPageNo=1&search=${search}" class="page-link">1</a></li>
		<li class="page-item"><a href="${rootPath}/book/list?currentPageNo=${pageDTO.prePageNo}&search=${search}" class="page-link">&lt;</a></li>
	</c:if>
	
	<c:if test="${pageVO.startPageNo > 2}">
		<li class="page-item"><a class="page-link">&middot;&middot;&middot;</a></li>
	</c:if>
	
	<c:forEach begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" var="pageNo">
		<li class="page-item <c:if test="${pageNo == pageVO.currentPageNo}">active</c:if>"> 
			<a href="${rootPath}/book/list?currentPageNo=${pageNo}&search=${search}" class="page-link">${pageNo}</a>
		</li>
	</c:forEach>
	
	<c:if test="${pageVO.endPageNo != pageVO.finalPageNo}">
		<li class="page-item"><a class="page-link">&middot;&middot;&middot;</a></li>
		<li class="page-item"><a href="${rootPath}/book/list?currentPageNo=${pageVO.nextPageNo}&search=${search}" class="page-link">&gt;</a></li>
		<li class="page-item">
			<a href="${rootPath}/book/list?currentPageNo=${pageVO.finalPageNo}&search=${search}" class="page-link">${pageVO.finalPageNo}</a>
		</li>
	</c:if>
</ul>
