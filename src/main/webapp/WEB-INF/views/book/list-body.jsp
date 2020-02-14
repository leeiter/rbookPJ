<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.search-table {
	border-collapse: collapse;
	width: 95%;
	margin:10px auto;
	border-bottom: 1px solid #ddd;	
}

.search-table td, .search-table th {
	white-space: nowrap;
	padding: 8px;
	vertical-align: top;
}
</style>

<script>
$(function(){
	
	$(".search-table tr").click(function(){
		
		let trs = $(this).children()
		let b_code = trs.eq(0).text()
		let b_name = trs.eq(1).text()
		
		$("#rb_bcode").val(b_code)
		$("#rb_bname").val(b_name)
		
		$("#modal-box").css("display", "none")
		
	})
	
})
</script>

<table class="table table-hover small text-center search-table blist">
	<tr>
		<th>도서코드</th>
		<th>도서이름</th>
		<th>출판사</th>
		<th>저자</th>
		<th>구입일자</th>
		<th>가격</th>
	</tr>
	<c:choose>
		<c:when test="${empty BLIST}">
			<tr>
				<td colspan="6">도서가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${BLIST}" var="BOOK">
				<tr data-id="${BOOK.b_code}" class="blist-item">
					<td>${BOOK.b_code}</td>
					<td>${BOOK.b_name}</td>
					<td>${BOOK.b_comp}</td>
					<td>${BOOK.b_auther}</td>
					<td>${BOOK.b_year}</td>
					<td><fmt:formatNumber value="${BOOK.b_iprice}" type="number" maxFractionDigits="3" var="commaPrice"/>${commaPrice}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>