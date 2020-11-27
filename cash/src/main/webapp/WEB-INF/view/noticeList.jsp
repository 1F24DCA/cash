<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center">NOTICE</h2>
		<div class="text-center mb-5">
			<a href="${pageContext.request.contextPath}/admin/addNotice" class="font-weight-bold text-success text-decoration-none">ADD NOTICE</a>
		</div>
		<table class="table table-sm table-borderless w-75 mx-auto">
			<thead class="border-bottom">
				<tr>
					<th>ID</th>
					<th class="w-75">TITLE</th>
					<th>DATE</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}" class="font-weight-bold text-secondary">
								${n.noticeTitle}
							</a>
						</td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<c:if test="${currentPage>1}">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage-1}" class="text-success text-decoration-none">◀</a>
			</c:if>
			PAGE ${currentPage}
			<c:if test="${currentPage<lastPage}">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage+1}" class="text-success text-decoration-none">▶</a>
			</c:if>
		</div>
	</div>
</body>
</html>