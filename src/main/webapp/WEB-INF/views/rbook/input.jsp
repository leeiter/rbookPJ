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
		let url = "${rootPath}/rbook/"
		
		if(btn_id == "btn-clear") {
			url += "input"
		} else if(btn_id == "btn-list") {
			url += "list"
		}
		document.location.href = url
	})
	

	$("#btn-save").click( function() {
		
		if($("#rb_bcode").val() == "") {
			alert("도서 코드는 반드시 입력해야 합니다")
			$("#rb_bcode").focus()
			return false
		}
		
		if(parseInt($("#rb_rtime").val()) < 1) {
			alert("독서 시간은 반드시 입력해야 합니다")
			$("#rb_rtime").focus()
			return false
		}
		
		if($("#rb_subject").val() == "") {
			alert("한줄평은 반드시 입력해야 합니다")
			$("#rb_subject").focus()
			return false
		}
		$("form").submit()
		
	})
	
	$("#rb_bcode, #rb_bname, #rb_rtime, #rb_subject").focus(function(){
		$(this).select()
	})
	
	$("#rb_bname").keypress(function(event){
		
		if(event.keyCode == 13) {
			
			let strText = $(this).val()
			if(strText == "") {
				alert("도서이름을 입력한 후 Enter를 눌러주세요")
				return false
			}
			
			$("#modal-box").css("display", "block")
			
			$.post("${rootPath}/book/search", {strText : strText},
					function(result){
						$("#modal-content").html(result)
			})
		}
	})
	
	$(".modal-header span").click(function(){
		$("#modal-box").css("display", "none")
	})
	
	var toolbar = [
		['style',['bold','italic','underline'] ],
		['fontsize',['fontsize']],
		['font Style',['fontname']],
		['color',['color']],
		['para',['ul','ol','paragraph']],
		['height',['height']],
		['table',['table']],
		['insert',['link','hr','picture']],
		['view',['fullscreen','codeview']]
	]
	
	$("#rb_text").summernote({
		lang:'ko-KR',
		placeholder:'본문을 입력하세요',
		width:'100%',
		toolbar:toolbar,
		height:'200px',
		disableDragAndDrop : true
	})
	
	$("#rb_star").change(function(){
		let star = $(this).val()
		star = star * 10
		$("span.star-red").css("width",star + "%")
		$("span#star-v").text($(this).val())
	})
	
})
</script>

<form:form action="${rootPath}/rbook/save" modelAttribute="rbVO">
	<form:input type="hidden" path="rb_seq" />
	
	<div class="form-group">
		<form:input class="form-control" path="rb_bcode" placeholder="도서코드" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="rb_bname" placeholder="도서 이름을 입력한 후 Enter..."/>
	</div>
		
	<div class="form-group">
		<form:input class="form-control" path="rb_date" placeholder="독서일자" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="rb_stime" placeholder="독서시작시각" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="rb_rtime" placeholder="독서시간" />
	</div>
	
	<div class="form-group">
		<form:input class="form-control" path="rb_subject" placeholder="한줄소감" />
	</div>
	
	<div class="form-group text-center">		
		<span>별점&nbsp;&nbsp;:&nbsp;&nbsp;</span>
		<form:input type="range"  path="rb_star" min="1" max="10" />
		<span class="star-box">
			<span class="star-red"></span>
		</span>		
		<span id="star-v"></span>
	</div>
	
	<div class="form-group">
		<form:textarea path="rb_text"/>
	</div>
</form:form>

<div class="form-group text-center">
	<button id="btn-clear" class="btn btn-warning" type="reset">새로작성</button>
	<button id="btn-save" class="btn btn-success" type="button">저장</button>
	<button id="btn-list" class="btn btn-info " type="button">리스트로 가기</button>
</div>

<div id="modal-box">
	<div class="modal-header">
		<span>&times;</span>
	</div>
	<div id="modal-content">
	</div>
</div>
