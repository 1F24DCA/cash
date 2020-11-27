<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			let html = '<div><input type="file" name="noticeFileList" class="noticeFileList form-control my-2" style="padding-bottom: 2.25rem"></div>';
			$('#fileinput').append(html);
		});
		
		$('#delBtn').click(function() {
			$('#fileinput').children().last().remove();
		});
	
		$('#submitBtn').click(function() {
			let ck = true;
			$('.noticeFileList').each(function(index, item) {
				if ($(item).val() == '') {
					ck = false;
					return;
				}
			});
			if (ck == false) {
				alert('선택되지 않은 파일이 있습니다');
			} else {
				$('#modifyForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container-xl">
		<h2 class="text-center mb-5">MODIFY NOTICE</h2>
		
		<form id="modifyForm" method="post" action="${pageContext.request.contextPath}/admin/modifyNotice" enctype="multipart/form-data">
			<table class="table table-sm table-borderless px-5 text-center">
				<tr class="border-top border-bottom">
					<td class="font-weight-bold">ID</td>
					<td class="w-75">
						<input type="text" name="noticeId" value="${notice.noticeId}" readonly="readonly" class="form-control">
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">TITLE</td>
					<td>
						<input type="text" name="noticeTitle" value="${notice.noticeTitle}" class="form-control">
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">CONTENT</td>
					<td>
						<!-- TODO WYSIWYG 에디터 추가(네이버 스마트에디터 권장) -->
						<textarea rows="5" cols="40" name="noticeContent" class="form-control">${notice.noticeContent}</textarea>
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">UPLOADED</td>
					<td>
						<c:forEach var="nf" items="${notice.noticeFileList}">
							<c:if test="${nf.noticeFileId>0}">
								<div class="border-bottom">
									<div class="text-left">
										<a href="${pageContext.request.contextPath}/upload/${nf.noticeFileName}" class="font-weight-bold text-secondary">${nf.noticeFileName}</a> TYPE:${nf.noticeFileType} SIZE:${nf.noticeFileSize}
									</div>
									<div class="small text-right">
										<a href="${pageContext.request.contextPath}/admin/removeNoticeFile/${notice.noticeId}/${nf.noticeFileId}" class="font-weight-bold text-secondary">REMOVE</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr class="border-bottom">
					<td class="font-weight-bold">FILES</td>
					<td>
						<div class="row">
							<div class="col">
								<button type="button" id="addBtn" class="btn btn-primary btn-block">APPEND FILE TO TAIL</button>
							</div>
							<div class="col">
								<button type="button" id="delBtn" class="btn btn-danger btn-block">DELETE LAST FILE</button>
							</div>
						</div>
						<div id="fileinput"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="submitBtn" type="button" class="btn btn-success btn-block">MODIFY NOTICE</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>