<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$(".btn-save").click(function() {
			let subject = $("#b_subject").val()
			if(subject == ""){
				alert("버킷 제목을 입력해주세요")
				$("#b_subject").focus()
				return false;
			}
			
			let date = $("#b_date").val()
			if(date == ""){
				alert("계획일을 입력해주세요")
				$("#b_date").focus()
				return false;
			}
			
						
			$("form").submit()
		})
		
	})
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-header.jspf" %>
	 <form method="POST" modelAttribute="bucketVO">
	 	<div class="form-group m-3">
	 		<label for="b_subject">마이버킷</label>
	 		<input name="b_subject" id="b_subject" placeholder="하고 싶은 일을 써주세요" value="${bucketVO.b_subject}" class="form-control">
	 	</div >
	 	<div class="form-group m-3">
	 		<label for="b_date">계획일</label>
	 		<input name="b_date" type="date" id="b_date" placeholder="계획일자" value="${bucketVO.b_date}" class="form-control">
	 	</div>
	 	<div class="form-group m-3">
	 		<label for="b_content">내용</label>
	 		<input name="b_content" placeholder="내용" value="${bucketVO.b_content }" class="form-control">
	 	</div>
	 	<c:choose>
		 	<c:when test="${CHANGE == 'INSERT'}">
		 		<input type="hidden" name="b_confirm" placeholder="확인란" value="X" class="form-control">
		 	</c:when>
		 	<c:otherwise>
		 	<div class="form-group m-3">
	 			<label for="b_content">달성</label>
		 		<input name="b_confirm" id="b_confirm" placeholder="확인란" value="${bucketVO.b_confirm}" class="form-control">
		 	</div>
		 	</c:otherwise>
	 	</c:choose>
	 	
	 	<button type="button" class="btn m-3 btn-primary btn-save" >저장</button>
	 </form>
</body>
</html>