/*
function getip() {
	var xhr;
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		throw new Error("Ajax XMLHttpRequest를 지원하지 않아요");
	}
	xhr.open("GET", "getIP.jsp");
	xhr.send('');
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status >= 200 && xhr.status < 400) {
				var ip = xhr.responseText.replace(" ", "");
				document.getElementById('ip').value = ip;
			}
		}
	}

}
*/
function getip(){
	$.get(
			"getIP.jsp",
			function(data){
				$('#ip').val(data);
			}
	);
}

function getip2(){
	$.get(
			"chatting/getIP.jsp",
			function(data){
				data2 = data.replace("\n\n","");
				/*console.log(data2);*/
				$('#chatting').attr('href','http://'+data2+':8090/PROJECT/chatting/client.html?');
			}
	);
}

function getEname(){
	$.get(
			"getEname.jsp",
			function(data){
				$('#ename').val(data);
			}
	);
}