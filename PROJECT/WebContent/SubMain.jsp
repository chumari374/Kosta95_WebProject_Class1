<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- ���� �� api -->
<!-- <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> -->
<!-- ���� �� api ��-->

<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- ���� �� api -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
<!-- ���� �� api ��-->


<!-- �ǽð� �ð� -->
<script type="text/javascript">
	function go_time() {

		var now = new Date();

		var year = now.getFullYear(); //��
		var month = now.getMonth() + 1; //��
		var day = now.getDay() + 3; //��
		var hour = now.getHours(); //��
		var min = now.getMinutes(); //��
		var sec = now.getSeconds(); //��

		document.getElementById("clock").innerHTML = year + "�� " + month + "�� "
				+ day + "�� " + hour + ":" + min + ":" + sec
		//id�� clock�� html�� ����ð��� ����

		setTimeout("go_time()", 1000);
		//1�ʸ��� �ش� ����� ������.
	}
</script>
<!-- �ǽð� �ð� �� -->

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	height: 60%;
	margin: 0;
	text-align: right;
}

/* ���� �� api */
/* html, body, #map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
} */
/* ���� �� api �� */
</style>

<!-- ���� �� api -->
<!-- <script>
	var map;
	function initialize() {
		var mapOptions = {
			zoom : 16,
			center : new google.maps.LatLng(37.3908894, 127.0967915)
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script> -->
<!-- ���� �� api �� -->

</head>
<body onload="go_time()">
	<jsp:include page="Main.jsp"></jsp:include>
	<div id="main" align="left" style="padding-left: 80px;">
		<div class="container">
			<table>
				<tr>
					<td>
						<!-- �ǽð� �ð� -->
						<div id="clock"
							style="font-size: 18px; color: black; text-align: center;"></div>
						<!-- �ǽð� �ð� �� -->
					</td>
				</tr>
				<tr>
					<td><br>
						<div id="myCarousel" class="carousel slide" data-ride="carousel"
							style="width: 900px; height: auto;">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="img/1.jpg" alt="Chania" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/2.jpg" alt="Chania" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/3.jpg" alt="Flower" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/4.jpg" alt="Flower" width="460" height="200">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div></td>

					<!-- <td>
						���� �� api
						<div id="map-canvas"
							style="width: 300px; height: 360px; margin-top: 0px; padding-top: 0px;"></div>
						���� �� api ��
					</td> -->
				</tr>


			</table>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>