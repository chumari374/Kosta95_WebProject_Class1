
window.onload = function() {

	getip();
	getEname($('#temp').val());
	var ws = new WebSocket("ws://192.168.7.241:8070");
	console.log(ws);
	
	var clientCount = function(count){
		$('#clients').text(count);
	};
	var logger = document.getElementById("replymsg");
	var log = function(text) {
		logger.innerHTML += text + '\n';
	}
	
	ws.open = function() {
		
	}

	ws.onmessage = function(e) {
		var txtarray = e.data.split("||");
		var clients = txtarray[0];
		var msg = txtarray[1];
		
		if(msg.length>0)log(msg);
		clientCount(clients);
		
		show(msg);
	}

	ws.close = function() {
		
	}

	document.getElementById("submit").onclick = function(e) {
		var msg = $('#msg').val();
		var ename = $('#ename').val();
		var ip = $('#ip').val();
		var teamname = $('#teamname').val();
		console.log(ip+"/"+teamname+"/"+ename);
		ws.send(ename+","+msg+","+ip+","+teamname);
		document.getElementById("msg").value = "";
	}
	
	var Notification = window.Notification || window.mozNotification || window.webkitNotification;

	Notification.requestPermission(function (permission) {
		// console.log(permission);
	});

	function show(msg) {
		window.setTimeout(function () {
			var instance = new Notification(msg);

			instance.onclick = function () {
				// Something to do
			};
			instance.onerror = function () {
				// Something to do
			};
			instance.onshow = function () {
				// Something to do
			};
			instance.onclose = function () {
				// Something to do
			};
		}, 1000);

		return false;
	}
};