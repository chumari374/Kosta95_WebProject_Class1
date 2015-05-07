<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 구글 맵 api -->
<!-- <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> -->
<!-- 구글 맵 api 끝-->

<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- 구글 맵 api -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
<!-- 구글 맵 api 끝-->


<!-- 실시간 시계 -->
<script type="text/javascript">
	function go_time() {

		var now = new Date();

		var year = now.getFullYear(); //년
		var month = now.getMonth() + 1; //월
		var day = now.getDay() + 3; //일
		var hour = now.getHours(); //시
		var min = now.getMinutes(); //분
		var sec = now.getSeconds(); //초

		document.getElementById("clock").innerHTML = year + "년 " + month + "월 "
				+ day + "일 " + hour + ":" + min + ":" + sec
		//id가 clock인 html에 현재시각을 넣음

		setTimeout("go_time()", 1000);
		//1초마다 해당 펑션을 실행함.
	}
</script>
<!-- 실시간 시계 끝 -->

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	height: 60%;
	margin: 0;
	text-align: right;
}

/* 구글 맵 api */
/* html, body, #map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
} */
/* 구글 맵 api 끝 */
</style>

<!-- 구글 맵 api -->
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
<!-- 구글 맵 api 끝 -->

</head>
<body onload="go_time()">
	<jsp:include page="Main.jsp"></jsp:include>
	<div id="submain" align="left" style="padding-left: 80px;">
		<div class="container">
			<table>
				<tr>
					<td>
						<!-- 실시간 시계 -->
						<div id="clock"
							style="font-size: 18px; color: black; text-align: center;"></div>
						<!-- 실시간 시계 끝 -->
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
									<img src="img/slide_1.jpg" alt="Chania" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/slide_2.png" alt="Chania" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/slide_3.jpg" alt="Flower" width="460" height="200">
								</div>

								<div class="item">
									<img src="img/slide_4.png" alt="Flower" width="460" height="200">
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
						구글 맵 api
						<div id="map-canvas"
							style="width: 300px; height: 360px; margin-top: 0px; padding-top: 0px;"></div>
						구글 맵 api 끝
					</td> -->
				</tr>


			</table>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>