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
		<h2 class="text-center mb-5">GUESTBOOK</h2>
		<form action="${pageContext.request.contextPath}/admin/createGuestBook" method="post">
			<table class="table table-sm table-borderless p-5 text-center">
				<tr>
					<th>WRITER</th>
					<td><input type="text" name="guestBookWriter" class="form-control m-1"></td>
					<td rowspan="2"><button type="submit" class="btn btn-success btn-block h-100 m-1">WRITE</button></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea name="guestBookContent" rows="4" cols="20" class="form-control m-1"></textarea></td>
				</tr>
			</table>
		</form>
		
		<div class="px-5">
			<c:forEach var="g" items="${map['guestBookList']}">
				<div class="border-bottom m-2 p-2">
					<div class="font-weight-bold small">
						${g.guestBookWriter}
					</div>
					<div class="mx-2">
						${g.guestBookContent}
					</div>
					<div class="small text-right">
						<a href="${pageContext.request.contextPath}/admin/removeGuestBook/${g.guestBookId}" class="font-weight-bold text-secondary">
							REMOVE
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>