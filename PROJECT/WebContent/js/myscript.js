/**
 * 
 */

function ppurija(ad) { 
   $.ajax({ 
      type : 'post', 
      url : ad, 
      async : false, 
         data : {}, 
         error : function(xhr, status) {alert('Unknown error ' + status); }, 
         success : function(data) { 
             $("#main").html(data); 
         } 
   }); 
}

function chatting_window(){
	var ip = $('#ip').val();
	window.open("http://"+ip+":8090/PROJECT/chatting/client.html", "chattingroom", "height=500 width=350")
}

function info(empno){
	window.open('Member.info?empno='+empno,'상세정보', 'width=600 height=424')
}
function logout(path){
	
	location.href=path;
}