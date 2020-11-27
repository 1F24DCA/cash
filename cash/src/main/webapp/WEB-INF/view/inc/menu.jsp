<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-sm fixed-top bg-success">
	<ul class="navbar-nav">
		<li class="nav-item mr-5">
			<a href="${pageContext.request.contextPath}/admin/index" class="text-light text-decoration-none" style="font-size: 2rem">Cashbook</a>
		</li>
		<c:if test="${loginId != null}">
			<li class="nav-item my-auto">
				<a href="${pageContext.request.contextPath}/admin/cashbookByMonth" class="nav-link text-light text-decoration-none">CALENDAR</a>
			</li>
			<li class="nav-item my-auto">
				<a href="${pageContext.request.contextPath}/admin/cashbookList/1" class="nav-link text-light text-decoration-none">IN/OUT LIST</a>
			</li>
			<li class="nav-item my-auto">
				<a href="${pageContext.request.contextPath}/admin/noticeList" class="nav-link text-light text-decoration-none">NOTICE</a>
			</li>
			<li class="nav-item my-auto">
				<a href="${pageContext.request.contextPath}/admin/chart1.jsp" class="nav-link text-light text-decoration-none">CHART</a>
			</li>
			<li class="nav-item my-auto">
				<a href="${pageContext.request.contextPath}/admin/addMember" class="nav-link text-light text-decoration-none">MEMBER</a>
			</li>
			<li class="nav-item ml-4 my-auto">
				<a href="${pageContext.request.contextPath}/admin/logout" class="nav-link text-light text-decoration-none">LOGOUT</a>
			</li>
		</c:if>
	</ul>
</nav>