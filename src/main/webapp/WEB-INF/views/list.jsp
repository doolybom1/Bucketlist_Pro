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
	}
	
	.con{
		cursor: pointer;
	}
	
	.buc-form{
		text-align: center;
		margin: 0;
	}
	.ed{
		display: flex;
		text-align: center !important;
	}
	.table_form{
		width: 800px;
		margin: 0 auto;
	}
</style>

<script>
	$(function() {
		$("#b-button").click(function() {
			document.location.href = "${rootPath}/insert"
		})
	
		<!--
		$(".btn-confirm").click(function() {
				var data = ""
				var b_seq = $(this).data("id");			
				var text = $('.con').text();
				if(text == "X"){
					data = $('.con').text("O");
				}else if(text == "O"){
					data = $('.con').text("X");
				}
			$.ajax({
				url : "${rootPath}/update",
				data : {b_confirm:data, b_seq:b_seq},
				type : "GET",
				success : function(result) {
					alert("통신성공")
				},
				error : function() {
					alert("통신에러")
				}
			})
		});
		-->
	})
</script>
</head>
<body>
	<section class="table-responsive">
	<table class="table table-hover table-striped table_form">
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
					<tr class="tr_value" data-id="${buc.b_seq}">
						<td class="th-NO">${index.count}</td>
						<td>${buc.b_subject}</td>
						<td>${buc.b_date}</td> 
						<td class="btn-confirm"><a class="con" id="b_confirm">${buc.b_confirm}</a></td> 
						<td class="ed">
							<a href="${rootPath}/update?b_seq=${buc.b_seq}" id="btn-edit" >수정</a>
							<a href="${rootPath}/delete?b_seq=${buc.b_seq}" id="btn-delete">삭제</a>
						</td>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</section>
	<div class="buc-form">
		<button id="b-button" class="btn btn-primary btn-bucket">버킷리스트 작성</button>
	</div>
</body>
</html>