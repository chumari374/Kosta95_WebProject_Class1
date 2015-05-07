//변수 선언
var WebSocket = require('faye-websocket'), //websocket 요구
	http = require('http'), 
	server = http.createServer(), //서버를 생성
	clients = new Array(); //클라이언트를 넣을 배열 
var chief = ["192.168.7.235","192.168.7.192","192.168.7.237","192.168.7.209","192.168.7.187","192.168.7.50","192.168.7.234"]; //임원
var dev = ["192.168.7.1","192.168.7.2","192.168.7.3","192.168.7.4","192.168.7.5"]; //외주
var sol = ["192.168.7.6","192.168.7.7","192.168.7.8","192.168.7.9","192.168.7.10"]; //솔루션
var acc = ["192.168.7.11","192.168.7.12","192.168.7.13","192.168.7.14","192.168.7.15"]; //경리
var manage = ["192.168.7.16","192.168.7.17","192.168.7.18","192.168.7.19","192.168.7.20","192.168.7.234","192.168.7.235"]; //경영
var person = ["192.168.7.21","192.168.7.22","192.168.7.23","192.168.7.24","192.168.7.25"]; //인사
var tec_mg = ["192.168.7.26","192.168.7.27","192.168.7.28","192.168.7.29","192.168.7.30"]; //기술 경영
var AS = ["192.168.7.31","192.168.7.32","192.168.7.33","192.168.7.34","192.168.7.35"]; //A/S

//리스너 추가
server.addListener('upgrade', function(request, socket, head) {
	var ws = new WebSocket(request, socket, head); //객체생성

	ws.onopen = function(event) { //커넥션이 연결이 되면
		console.log("connection..." + ws);
		clients.push(ws); //ws객체 넣기
		sendmsg(null,clients.length+"||");
	};
	
	ws.onmessage = function(event) { //클라이언트로부터 메세지를 받으면
		var array = event.data.split(","); //받은 값을 분리해 배열에 넣기
		var data = '[' + array[0] + ']:' + array[1]; //포맷 설정
		var count = clients.length; //현재 접속자수
		var ip = array[2].replace("\n\n","");
		var teamname = array[3];

		console.log(ip+"'s receive data : " + event.data);
		console.log(teamname);
		console.log(count);
		//ws.send(event.data); //원본소스
		
		//수정 소스
		sendmsg(teamname,count+"||"+data);
	};

	ws.onclose = function(event) { //커넥션이 끊기면
		console.log('close', event.code, event.reason);
		ws = null; //객체를 비워줌
		var i=0;
		while(i < clients.length){
			if(!(clients[i].readable)){
				clients.splice(i);
			}
			i++;
		}
		sendmsg(null,clients.length+"||");
		
	};
	
	var sendmsg = function(teamname,msg) {
		for (var i = 0; i < clients.length; i++) { //객체 갯수만큼
			try {
				var temp = clients[i]._stream. _readableState.pipes._driver._request.headers.origin.replace('http://',"").split(':');
				var origin = temp[0];
				var temp2 = ws._driver._request.headers.origin.replace('http://',"").split(':');
				var origin2 = temp2[0];
				//console.log("_stream: "+origin);
				console.log("_driver: "+origin2);
				switch (teamname) {
				case 'chief': teamname=chief;
					break;
				case 'sol': teamname=sol;
					break;
				case 'dev': teamname=dev;
					break;
				case 'acc': teamname=acc;
					break;
				case 'manage': teamname=manage;
					break;
				case 'person': teamname=person;
					break;
				case 'tec_mg': teamname=tec_mg;
					break;
				case 'AS': teamname=AS;
					break;
				}
				for(var j=0;j<teamname.length;j++){
					var target = teamname[j];
					if(origin2==target){
						clients[i].send(msg); //객체마다 데이터 뿌림
					}
				}
				
			} catch (e) { //예외나면
				continue; //스킵
			}
			
			
		}
	}
});
server.listen(8070); //8070포트에 대기
