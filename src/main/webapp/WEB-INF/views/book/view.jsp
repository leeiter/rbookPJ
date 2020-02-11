<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<table class="table small text-center">
	<tr>
		<th>도서코드</th>
		<th>도서이름</th>
		<th>출판사</th>
		<th>저자</th>
		<th>구입일자</th>
		<th>가격</th>
	</tr>
	<tr>
		<td>${BOOK.b_code}</td>
		<td>${BOOK.b_name}</td>
		<td>${BOOK.b_comp}</td>
		<td>${BOOK.b_auther}</td>
		<td>${BOOK.b_year}</td>
		<td><fmt:formatNumber value="${BOOK.b_iprice}" type="number" maxFractionDigits="3" var="commaPrice"/>${commaPrice}</td>
	</tr>
</table>