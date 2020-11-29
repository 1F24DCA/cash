<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center">NOTICE</h2>
		<div class="text-center mt-5 mb-2">
			<a href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}" class="font-weight-bold text-success mx-2">MODIFY NOTICE</a>
			<a href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}"class="font-weight-bold text-success mx-2">REMOVE NOTICE</a>
		</div>
		<table class="table table-sm table-borderless w-75 mx-auto">
			<tr class="border-top border-bottom">
				<td class="font-weight-bold">ID</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr class="border-bottom">
				<td class="font-weight-bold">TITLE</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr class="border-bottom">
				<td class="font-weight-bold">CONTENT</td>
				<td>${notice.noticeContent}</td>
			</tr>
			<tr class="border-bottom">
				<td class="font-weight-bold">DATE</td>
				<td>${notice.noticeDate}</td>
			</tr>
			<tr class="border-bottom">
				<td class="font-weight-bold">FILE</td>
				<td>
					<c:forEach var="nf" items="${notice.noticeFileList}">
						<c:if test="${nf.noticeFileId>0}">
							<div>
								<a href="${filePath}/${nf.noticeFileName}" class="font-weight-bold text-secondary">${nf.noticeFileName}</a> TYPE:${nf.noticeFileType} SIZE:${nf.noticeFileSize}
							</div>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr class="border-bottom">
				<td colspan="2">
					<form method="POST" action="${pageContext.request.contextPath}/admin/addNoticeComment">
						<input type="hidden" name="noticeId" value="${notice.noticeId}">
						<div class="row">
							<div class="col-9">
								<textarea name="noticeCommentContent" rows="3" cols="20" placeholder="TYPE COMMENT HERE..." class="form-control"></textarea>
							</div>
							<div class="col-3">
								<button type="submit" class="btn btn-success btn-block h-100">ADD COMMENT</button>
							</div>
						</div>
					</form>
				</td>
			</tr>
			<tr class="border-bottom">
				<td class="font-weight-bold">COMMENT</td>
				<td>
					<c:forEach var="nc" items="${notice.noticeCommentList}">
						<c:if test="${nc.noticeCommentId>0}">
							<div class="border-bottom">
								<div class="text-left">
									${nc.noticeCommentContent}
								</div>
								<div class="small text-right">
									<a href="${pageContext.request.contextPath}/admin/removeNoticeComment/${notice.noticeId}/${nc.noticeCommentId}" class="font-weight-bold text-secondary">REMOVE</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>