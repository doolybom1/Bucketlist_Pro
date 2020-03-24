<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>나의 홈페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-header.jspf" %>
	<section>
	<c:choose>
		<c:when test="${CHANGE == 'LIST'}">
			<%@ include file="/WEB-INF/views/list.jsp" %>
		</c:when>
		<c:when test="${CHANGE == 'INSERT'}">
			<%@ include file="/WEB-INF/views/insert.jsp" %>
		</c:when>		
		<c:otherwise>
		<c:when test="${CHANGE == 'UPDATE'}">
			<%@ include file="/WEB-INF/views/insert.jsp" %>
		</c:when>
		</c:otherwise>
	</c:choose>	
	</section>
</body>
</html>