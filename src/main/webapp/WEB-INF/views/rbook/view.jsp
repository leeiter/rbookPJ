<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){

	$("button").click(function(){
		
		let btn_id = $(this).attr("id")
		let url = "${rootPath}/rbook/"
		
		if(btn_id == "btn-update") {
			url += "update/${RBOOK.rb_seq}"
		} else if(btn_id == "btn-delete") {
			if(!confirm("독서록을 삭제할까요?")) {
				return false
			}
			url += "delete/${RBOOK.rb_seq}"
		} else if(btn_id == "btn-list") {
			url += "list"
		}
		document.location.href = url
	})
	
})
</script>

<style>
article {
	width: 100%;
	margin: 0 auto;
}

.item-box {
	display: flex;
	flex-flow: wrap;
}

.rb-view {
	display: inline-block;
	width: 73%;
	padding: 5px 16px;
	margin: 5px;
	background-color: #eee;
}

div.title-box {
	width: 25%;		
	background-color: #ccc;
	text-align: right;
}

div.text-box {
	width: 99%;
}

.item-btn {
	width: 100%;
	margin: 10px 0; 
}
</style>

<%@ include file="/WEB-INF/views/book/view.jsp" %>

<article>
	<div class="item-box">
		<div class="title-box rb-view">책 읽은 시간</div>
		<div class="rb-view">${RBOOK.rb_date}, ${RBOOK.rb_stime} 부터 ${RBOOK.rb_rtime}시간 동안 읽음</div>
	</div>
	
	<div class="item-box">
		<div class="title-box rb-view">한줄평 &amp; 별점</div>
		<div class="rb-view">${RBOOK.rb_subject}, ${RBOOK.rb_star}</div>
	</div>
	<div class="rb-view text-box">${RBOOK.rb_text}</div>
</article>

<article class="text-center item-btn">
	<button id="btn-update" type="button" class="btn btn-success">수정</button>
	<button id="btn-delete" type="button" class="btn btn-danger">삭제</button>
	<button id="btn-list" type="button" class="btn btn-info">전체리스트</button>
</article>

<%@ include file="/WEB-INF/views/rbook/list-body.jsp" %>
