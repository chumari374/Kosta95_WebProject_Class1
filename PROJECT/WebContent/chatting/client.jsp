<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String teamname = (String)session.getAttribute("teamname"); %>
<!DOCTYPE html>
<html style="background-image: url('../img/Lighthouse.jpg');background-position: 30%">
<head>
	<meta charset="UTF-8">
	<title>Chatting Room</title>
	<script src="js/websocket.js"></script>
	<script src="js/async.js"></script>
	<script src="js/style.js"></script>
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="css/common.css">	
</head>
<body>
<!--		 메인 화면			 -->
<center>
<!-- <div id="dialog" title="KOSTA 95th Chattingroom Version_1.3"> -->
	<div id="main">
		<span>KOSTA 95th Chattingroom Version_1.3</span>
		<hr color="red">
		<select id="bgcolor" onchange="bgcolor()">
			<option value="white" selected>흰색 바탕</option>
			<option value="blue">파랑 바탕</option>
			<option value="yellow">노랑 바탕</option>
			<option value="red">빨강 바탕</option>
			<option value="black">검정 바탕</option>
		</select>
		<select id="color" onchange="color()">
			<option value="black" selected>검정 글씨</option>
			<option value="blue">파랑 글씨</option>
			<option value="yellow">노랑 글씨</option>
			<option value="red">빨강 글씨</option>
			<option value="green">초록 글씨</option>
		</select>
		현재 접속자 : <span id="clients"></span>
		<form action="#">
			<textarea rows="21" cols="42" id="replymsg" class="replymsg" readonly="readonly"></textarea>
			<hr color="red">
			<input type="text" id="ename" size="3" readonly="readonly">
			<!-- To:<input type="text" id="to" size="3"> -->
			<input type="text" id="msg" size="8">
			<input type="submit" id="submit" value="전송"><br>
		</form>
	</div>
	<input type="hidden" id="ip">
	<input type="hidden" id="teamname" value="<%= teamname %>">
<!-- </div> -->
</center>
</body>
</html>