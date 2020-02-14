<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
span {
	color: #6c757d;
}
</style>

<script>
$(function(){
	
	$("button").click(function(){
		
		let btn_id = $(this).attr("id")
		let url = "${rootPath}/book/"
		
		if(btn_id == "btn-clear") {
			url += "input"
		} else if(btn_id == "btn-list") {
			url += "list"
		}
		document.location.href = url
	})
	
	$("#btn-save").click( function() {
		
		if($("#b_name").val() == "") {
			alert("도서명은 반드시 입력해야 합니다")
			$("#b_name").focus()
			return false
		}
		
		if($("#b_comp").val() == "") {
			alert("출판사는 반드시 입력해야 합니다")
			$("#b_comp").focus()
			return false
		}
		
		if($("#b_auther").val() == "") {
			alert("저자는 반드시 입력해야 합니다")
			$("#b_auther").focus()
			return false
		}
		
		if(parseInt($("#b_iprice").val()) < 1) {
			alert("구입 가격은 반드시 입력해야 합니다")
			$("#b_iprice").focus()
			return false
		}

		$("form").submit()
		
	})
	
	$("#b_name, #b_comp, #b_auther, #b_iprice").focus(function(){
		$(this).select()
	})
	
})
</script>

<form:form action="${rootPath}/book/save" modelAttribute="booksVO">
	<form:input type="hidden" path="b_code" placeholder="도서코드" />
	
	<div class="form-group">
		<form:input class="form-control" path="b_name" placeholder="도서명" />
	</div>

	<div class="form-group">
		<form:input class="form-control" path="b_comp" placeholder="출판사" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="b_auther" placeholder="저자" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="b_year" placeholder="구입일자" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="b_iprice" placeholder="가격" />
	</div>
</form:form>

<div class="form-group text-center">
	<button id="btn-clear" class="btn btn-warning" type="reset">새로작성</button>
	<button id="btn-save" class="btn btn-success" type="button">저장</button>
	<button id="btn-list" class="btn btn-info " type="button">리스트로 가기</button>
</div>
