<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-sm bg-light">
	<ul  class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="${rootPath}/rbook/list">독서록</a></li>
		<li class="nav-item"><a class="nav-link" href="${rootPath}/book/list">도서</a></li>
		
		<c:if test="${empty MEMBER}">
		    <li class="nav-item"><a class="nav-link" href="${rootPath}/member/login">로그인</a></li>
		    <li class="nav-item"><a class="nav-link" href="${rootPath}/member/join">회원가입</a></li>
	    </c:if>
	    
	    <c:if test="${!empty MEMBER}">
	    	<li class="nav-item"><a class="nav-link">"${MEMBER.m_id}"님 안녕하세요!</a></li>
		    <li class="nav-item"><a class="nav-link" href="${rootPath}/member/logout">로그아웃</a></li>
		</c:if>
	</ul>
</nav>
<br>
