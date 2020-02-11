<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.subject-search {
	margin-left: auto; 
}
</style>

<form>
	<input type="search" name="search" value="${search}" class="form-control mb-2 mr-sm-2 col-4 subject-search" 
			placeholder="검색 : 한줄소감을 입력한 후 Enter...">
</form>

<table class="table table-hover small text-center rblist">
	<tr>
		<th>사용자ID</th>
		<th>도서코드</th>
		<th>도서이름</th>
		<th>독서일자</th>
		<th>독서시작시각</th>
		<th>독서시간(분)</th>
		<th>한줄소감</th>
		<th>독서느낌(별점)</th>
	</tr>
	<c:choose>
		<c:when test="${empty RBLIST}">
			<tr>
				<td>독서록이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${RBLIST}" var="RBOOK">
				<tr data-id="${RBOOK.rb_seq}">
					<td>사용자ID</td>
					<td>${RBOOK.rb_bcode}</td>
					<td>${RBOOK.rb_bname}</td>
					<td>${RBOOK.rb_date}</td>
					<td>${RBOOK.rb_stime}</td>
					<td>${RBOOK.rb_rtime}</td>
					<td>${RBOOK.rb_subject}</td>
					<td>${RBOOK.rb_star}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>