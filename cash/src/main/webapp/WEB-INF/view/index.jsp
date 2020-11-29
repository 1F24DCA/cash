<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center">HOME</h2>
		<h5 class="text-center mb-5">최근 수입 및 지출 요약</h5>
		<!-- 수입/지출 -->
		<div class="d-flex">
			<c:forEach var="io" items="${inOutList}">
				<div class="flex-fill">
					<div class="bg-lightgray m-2 px-3 py-2">
						<h5 class="text-center mt-2 mb-5">${io["날짜"]}</h5>
						<div class="clearfix py-1">
							<h6 class="d-inline float-left font-weight-bold">수입</h6>
							<h6 class="d-inline float-right">￦ ${io["수입"]}</h6>
						</div>
						<div class="clearfix py-1">
							<h6 class="d-inline float-left font-weight-bold">지출</h6>
							<h6 class="d-inline float-right">￦ ${io["지출"]}</h6>
						</div>
						<div class="clearfix py-1">
							<h6 class="d-inline float-left font-weight-bold">수익</h6>
							<h6 class="d-inline float-right">￦ ${io["합계"]}</h6>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 공지 -->
		<h2 class="text-center mt-4">NOTICE</h2>
		<div class="text-center mb-5">
			<a href="${pageContext.request.contextPath}/admin/noticeList" class="font-weight-bold text-success">MORE</a>
		</div>
		<table class="table table-sm table-borderless w-50 mx-auto">
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
</body>
</html>