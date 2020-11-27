<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>chart3</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cash.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div class="container-xl">
			<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
			
			<h2 class="text-center">CHART</h2>
			<h5 class="text-center mb-5">년도별 총 수입</h5>
			
			<div class="m-4">
				<canvas id="chart"></canvas>
			</div>
			
			<script>
				let chartData = {
				    type: 'line',
				    data: {
				        labels: [],
				        datasets: [{
				            label: '년도별 총 수입',
				            backgroundColor: 'rgba(192, 255, 128, 0.5)',
				            borderColor: 'rgba(192, 255, 128, 0.5)',
				            data: []
				        }]
				    },
				    options: {}
				};
				
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/rest/chart3',
					type: 'get',
					success: function(data) {
						console.log(data);
	
						$(data).each(function(_, map) {
							chartData.data.labels.push(map.year);
							chartData.data.datasets[0].data.push(map.value);
						});
	
						let context = document.getElementById('chart');
						let chart = new Chart(context, chartData);
					}
				});
			</script>
		</div>
	</body>
</html>