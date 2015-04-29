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
	window.open("chatting/client.html", "chattingroom", "height=500 width=350")
}

function info(empno){
	window.open('Member.info?empno='+empno,'상세정보', 'width=550 height=350')
}