<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		
		<!-- 구글 맵 api -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
		<!-- 구글 맵 api 끝-->
		
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  		
  		<!-- 구글 맵 api -->
  		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
  		<!-- 구글 맵 api 끝-->
  		
  		
  		<style>
  			.carousel-inner > .item > img,
  			.carousel-inner > .item > a > img {
      			width: 100%;
      			height: 60%;
      			margin: 0;
      			text-align: right;
  			}
  			
  			/* 구글 맵 api */
  			html, body, #map-canvas {
        		height: 100%;
        		margin: 0px;
        		padding: 0px
      		}
  			/* 구글 맵 api 끝 */
  		</style>
  		
  		<!-- 구글 맵 api -->
  		<script>
  		var map;
  		function initialize() {
  		  var mapOptions = {
  		    zoom: 8,
  		    center: new google.maps.LatLng(-34.397, 150.644)
  		  };
  		  map = new google.maps.Map(document.getElementById('map-canvas'),
  		      mapOptions);
  		}

  		google.maps.event.addDomListener(window, 'load', initialize);
  		</script>
  		<!-- 구글 맵 api 끝 -->
  		
	</head>
	<body>
		<jsp:include page="Main.jsp"></jsp:include>
	
	<div class="container" style="width: 65%; height: 50%;">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
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
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
  
  
  
</div>
<!-- 구글 맵 api -->
	<div id="map-canvas" style="width: 18%; height: 50%; float: right; vertical-align: top;" ></div>
<!-- 구글 맵 api 끝 -->
	
	
	
	
	
	
		
		
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>