<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center mb-5">ADD CASHBOOK</h2>
		
		<form method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
			<table class="table table-sm table-borderless px-5 text-center">
				<tr class="border-top border-bottom">
					<td class="font-weight-bold">DATE</td>
					<td class="w-75">
						<input type="text" name="cashbookDate" 
									value="${param.currentYear}-${param.currentMonth}-${param.currentDay}" 
									readonly="readonly" class="form-control">
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">KIND</td>
					<td>
						<div class="row my-1">
							<div class="col">
								<input type="radio" name="cashbookKind" value="수입">
								수입
							</div>
							<div class="col">
								<input type="radio" name="cashbookKind" value="지출">
								지출
							</div>
						</div>
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">CATEGORY</td>
					<td>
						<select name="categoryName" class="form-control">
							<c:forEach var="c" items="${categoryList}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">PRICE</td>
					<td>
						<input type="text" name="cashbookPrice" class="form-control">
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">CONTENT</td>
					<td>
						<input type="text" name="cashbookContent" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-success btn-block">ADD CASHBOOK</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>