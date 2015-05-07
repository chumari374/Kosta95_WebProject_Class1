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

function chatting_window(teamname){
	var ip = $('#ip').val();
	window.open("http://"+ip+":8090/PROJECT/chatting/client.jsp?teamname="+teamname, "chattingroom", "height=500 width=350")
}

function info(empno){
	window.open('Member.info?empno='+empno,'상세정보', 'width=600 height=424')
}

function msgsend(empno){

	var popupWidth = 310;
	var popupHeight = 200;
	var popup_options = "top="+((screen.availHeight - popupWidth)/2)+", left="+((screen.availWidth - popupHeight)/2)+", width=310, height=200, location=no";
	var url = "MessageReply.mb";
	var target = "_blank";

	window.open(url, target, popup_options);
}

function logout(path){
	
	location.href=path;
}


function infoAdmin(empno){
	window.open('Member.admin?empno='+empno,'상세정보', 'width=600 height=424')
}

function editAdmin(empno){
	window.close()
	window.open('MemberEdit.admin?empno='+empno,'정보수정','width=600 height=424')
}

function deleteAdmin(empno){
	alert('Arrive');
	location.href="MemberExistUpdate.admin?empno="+empno;
}