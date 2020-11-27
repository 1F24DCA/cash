<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<div class="d-flex">
			<div class="p-3">
				<h2>LOGIN</h2>
				<form action="${pageContext.request.contextPath}/login" method="post">
					<div class="d-table">
						<div class="d-table-row">
							<div class="d-table-cell text-center px-2">ID</div>
							<div class="d-table-cell"><input type="text" name="id" value="goodee" class="form-control m-1"></div>
						</div>
						<div class="d-table-row">
							<div class="d-table-cell text-center px-2">PW</div>
							<div class="d-table-cell"><input type="password" name="pw" value="1234" class="form-control m-1"></div>
						</div>
						<div class="d-table-row">
							<div class="d-table-cell"></div>
							<div class="d-table-cell">
								<button type="submit" class="btn btn-success btn-block m-1">로그인</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="flex-grow-1 p-3">
				<h2>NOTICE</h2>
				<div>
					<table class="table table-sm table-borderless">
						<thead class="border-bottom">
							<tr>
								<th>ID</th>
								<th>TITLE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${noticeList}">
								<tr>
									<td>${n.noticeId}</td>
									<td>${n.noticeTitle}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>