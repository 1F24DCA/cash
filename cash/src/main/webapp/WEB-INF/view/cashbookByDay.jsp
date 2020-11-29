<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center mb-3">CALENDAR</h2>
		<h5 class="text-center mb-5">
			<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}" class="text-success text-decoration-none">◀</a>
			${currentYear} - ${currentMonth} - ${currentDay}
			<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}" class="text-success text-decoration-none">▶</a>
		</h5>
		<div class="text-center mb-2">
			<a href="${pageContext.request.contextPath}/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}" class="font-weight-bold text-success">ADD CASHBOOK</a>
		</div>
		<table class="table table-sm table-borderless px-5">
			<thead class="border-top border-bottom">
				<tr>
					<th>ID</th>
					<th>KIND</th>
					<th>CATEGORY</th>
					<th>PRICE</th>
					<th>CONTENT</th>
					<th>MODIFY</th>
					<th>REMOVE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td><a href="${pageContext.request.contextPath}/admin/modifyCashbook?cashbookId=${c.cashbookId}" class="font-weight-bold text-success">MODIFY</a></td>
						<td><a href="${pageContext.request.contextPath}/admin/removeCashbook?cashbookId=${c.cashbookId}" class="font-weight-bold text-success">REMOVE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>