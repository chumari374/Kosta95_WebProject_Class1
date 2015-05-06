//변수 선언
var WebSocket = require('faye-websocket'), //websocket 요구
	http = require('http'), 
	server = http.createServer(), //서버를 생성
	clients = new Array(); //클라이언트를 넣을 배열 
var team1 = ["192.168.7.235","192.168.7.192","192.168.7.237","192.168.7.209"]

//리스너 추가
server.addListener('upgrade', function(request, socket, head) {
	var ws = new WebSocket(request, socket, head); //객체생성

	ws.onopen = function(event) { //커넥션이 연결이 되면
		console.log("connection..." + ws);
		clients.push(ws); //ws객체 넣기
		sendmsg(clients.length+"||");
	};
	
	ws.onmessage = function(event) { //클라이언트로부터 메세지를 받으면
		var array = event.data.split(","); //받은 값을 분리해 배열에 넣기
		var data = '[' + array[0] + ']:' + array[1]; //포맷 설정
		var count = clients.length; //현재 접속자수
		var ip = array[2].replace("\n\n","");
		/*var to = array[1];*/

		console.log(ip+"'s receive data : " + event.data);

		console.log(count);
		//ws.send(event.data); //원본소스
		
		//수정 소스
		sendmsg(count+"||"+data);
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
		sendmsg(clients.length+"||");
		
	};
	
	var sendmsg = function(msg) {
		for (var i = 0; i < clients.length; i++) { //객체 갯수만큼
			try {
				var temp = clients[i]._stream. _readableState.pipes._driver._request.headers.origin.replace('http://',"").split(':');
				var origin = temp[0];
				var temp2 = ws._driver._request.headers.origin.replace('http://',"").split(':');
				var origin2 = temp2[0];
				//console.log("_stream: "+origin);
				console.log("_driver: "+origin2);
				
				for(var j=0;j<team1.length;j++){
					var target = team1[j];
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
