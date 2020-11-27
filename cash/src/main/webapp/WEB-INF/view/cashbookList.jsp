<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center">IN/OUT LIST</h2>
		
		<div class="text-center mb-5">
			<a href="${pageContext.request.contextPath}/admin/cashbookListExcel" class="font-weight-bold text-success text-decoration-none">DOWNLOAD EXCEL</a>
		</div>
		
		<table class="table table-sm table-borderless">
			<thead class="border-bottom">
				<tr>
					<th>ID</th>
					<th>KIND</th>
					<th>NAME</th>
					<th>PRICE</th>
					<th>CONTENT</th>
					<th>DATE</th>
					<th>CREATED</th>
					<th>UPDATED</th>
				</tr>
			</thead>
			<tbody class="border-bottom small">
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td>${c.cashbookDate}</td>
						<td>${c.createDate}</td>
						<td>${c.updateDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="text-center">
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}" class="text-success text-decoration-none">◀</a>
			</c:if>
			<span>PAGE ${currentPage}</span>
			<c:if test="${currentPage < 99999999}">
				<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}" class="text-success text-decoration-none">▶</a>
			</c:if>
		</div>
	</div>
</body>
</html>