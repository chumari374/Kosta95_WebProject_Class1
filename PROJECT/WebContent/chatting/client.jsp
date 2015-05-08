<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String teamname = (String)session.getAttribute("teamname");
	String ename = (String)request.getParameter("ename");
%>
<!DOCTYPE html>
<!-- <html style="background-image: url('../img/Lighthouse.jpg');background-position: 30%"> -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Chatting Room</title>
	<script src="js/websocket.js"></script>
	<script src="js/async.js"></script>
	<script src="js/style.js"></script>
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/mystyle.css">
	<style type="text/css">
	input.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #383838;
	padding: 4px 10px;
	background: -moz-linear-gradient(
		top,
		#f7f7f7 0%,
		#ebebeb 50%,
		#dbdbdb 50%,
		#dbdbdb);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f7f7f7),
		color-stop(0.50, #ebebeb),
		color-stop(0.50, #dbdbdb),
		to(#dbdbdb));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 5px;
	border: 1px solid #c7c7c7;
}
	</style>
</head>
<body>
<!--		 메인 화면			 -->
<center>
	<div id="main">
		<div style="background-color: #0469af; height: 25px; padding-top: 5px;"><span style="color: white;">KOSTA 95th Chattingroom Version_1.3</span></div>
		<div style="height: 25px; text-align: left; padding-left: 2px;">
		<select id="bgcolor" onchange="bgcolor()">
			<option value="white" selected>흰색 바탕</option>
			<option value="#C2F0FF">파랑 바탕</option>
			<option value="#FFFFA3">노랑 바탕</option>
			<option value="#FFBDAD">빨강 바탕</option>
			<option value="black">검정 바탕</option>
		</select>
		<select id="color" onchange="color()">
			<option value="black" selected>검정 글씨</option>
			<option value="#003399">파랑 글씨</option>
			<option value="white">흰색 글씨</option>
			<option value="#CC0000">빨강 글씨</option>
			<option value="#006600">초록 글씨</option>
		</select>
		현재 접속자 : <span id="clients"></span>
		</div>
		<form action="#">
			<textarea rows="21" cols="42" id="replymsg" class="replymsg" readonly="readonly"></textarea>
			<div style="height: 30px;">
			<input type="text" id="ename" size="3" readonly="readonly">
			<!-- To:<input type="text" id="to" size="3"> -->
			<input type="text" id="msg" size="8">
			<input type="button" id="submit" value="전송" class="css3button"><br>
			</div>
		</form>
	</div>
	<input type="hidden" id="ip">
	<input type="hidden" id="teamname" value="<%= teamname %>">
	<input type="hidden" id="temp" value="<%= ename %>">
</center>
</body>
</html>