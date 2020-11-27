<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		
		<div class="container-xl">
			<h2 class="text-center mb-5">ADD MEMBER</h2>
			
			<div class="w-50 mx-auto">
			<form method="post" action="${pageContext.request.contextPath}/admin/addMember">
					<div class="my-2">
						ID
						<input id="id" type="text" name="id" class="form-control">
					</div>
					<div class="my-2">
						PW
						<input id="pw" type="password" name="pw" class="form-control">
					</div>
					<div class="my-2">
						<!-- TODO 사용중인 아이디일 때 폼 액션이 실행되지 않도록 유효성 검사 -->
						<button type="submit" class="btn btn-success btn-block">ADD MEMBER</button>
					</div>
				</form>
			</div>
			
			<script>
				$('#id').focus();
				$('#id').blur(function() {
					$.ajax({
						url: '/admin/idCheck',
						data: { id: $('#id').val() },
						type: 'post',
						success: function(data) {
							if (data == "yes") {
								$('#pw').focus();
							} else {
								alert($('#id')+"은(는) 사용중인 ID입니다"); // FIXME: span태그로 document상에 표시되도록 변경
								// $('#id').focus();
								$('#id').select(); // 전체 선택
							}
						}
					});
				});
			</script>
		</div>
	</body>
</html>