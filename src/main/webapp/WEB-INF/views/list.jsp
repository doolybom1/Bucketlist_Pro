<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 버킷리스트</title>
<style>
@media only screen and (max-width: 768px) {
  #btn-edit, #btn-delete{
  	display: none;
  }
  .buc-form{
  	text-align: right;
  }
  
 
 
}

	*{
		margin:0 auto;
		padding:0;
	}

	body{
		line-height: 1;
	}
		
	.tr_value #btn-edit, #btn-delete{
		margin: 2px;
		padding: 6px;
		background-color: #007bff;
		color:white;
		border-radius: 5px;
		text-decoration: none;
		display: inline-block;
	
	}
	
	 #btn-edit,#btn-delete{
	 	display:inline-block;
		 width: 50px;
	 }
	
	.btn-confirm{
		color: blue;
		font-weight: bold;
		cursor: pointer;
	}
	
		
	.buc-form{
		text-align: center;
	}
	.ed{
		display: flex;
		text-align: center !important;
	}
	.table_form{
		width: 800px;
		margin: 0 auto;
	}
	.underline{
		text-decoration: line-through;
	}

	
</style>

<script>
	$(function() {
		$("#b-button").click(function() {
			document.location.href = "${rootPath}/insert"
		})
	
	
		$(".btn-confirm").click(function() {
				let confirm = $(this).data("confirm");
				let b_seq = $(this).data("id");			
				let subject = $(this).data("subject");
				let date = $(this).data("date");
				
				if(confirm == "X"){
					confirm = 'O';
				}else if(confirm == "O"){
					confirm = 'X';
				}
			$.ajax({
				url : "${rootPath}/update?b_seq="+b_seq,
				data : {b_confirm: confirm, b_subject:subject, b_date:date},
				type : "POST",
				success : function(result) {
					location.reload();
				},
				error : function() {
					alert("통신에러")
				}
			})
		});
	})
</script>
</head>
<body>
	<section class="table-responsive">
	<table class="table table-hover table-striped text-center table_form">
		<tr>
			<th>NO</th>
			<th>My Bucket</th>
			<th>계획일</th>
			<th>달성</th>
			<th></th>
		</tr>
		<c:choose>
			<c:when test="${empty BUC_LIST}">
				<tr><td colspan="5">데이터가 없습니다</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${BUC_LIST}" var="buc" varStatus="index">
					<tr class="tr_value text-center">
						<td >${index.count}</td>
						<td <c:if test="${buc.b_confirm == 'O'}">class='underline'</c:if>>${buc.b_subject}</td>
						<td <c:if test="${buc.b_confirm == 'O'}">class='underline'</c:if>>${buc.b_date}</td> 
						<td class="btn-confirm" data-confirm="${buc.b_confirm}" data-id="${buc.b_seq}" data-subject="${buc.b_subject}" data-date="${buc.b_date}">${buc.b_confirm}</td> 
						<td class="ed">
							<a href="${rootPath}/update?b_seq=${buc.b_seq}" id="btn-edit" >수정</a>
							<a href="${rootPath}/delete?b_seq=${buc.b_seq}" id="btn-delete">삭제</a>
						</td>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="p-3 buc-form">
		<button id="b-button" class="btn btn-primary btn-bucket">버킷리스트 작성</button>
	</div>
	</section>
</body>
</html>