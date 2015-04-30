<%@page import="java.util.List"%>
<%@page import="DTO.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
List messageList=(List)request.getAttribute("messagelist");

int listcount=(Integer)request.getAttribute("listcount");
int nowpage=(Integer)request.getAttribute("page");
int maxpage=(Integer)request.getAttribute("maxpage");
int startpage=(Integer)request.getAttribute("startpage");
int endpage=(Integer)request.getAttribute("endpage");
	
// 	System.out.println(listcount + "/ " + nowpage + " / " + maxpage + " / ");
// 	System.out.println(startpage + " / " + endpage);
%>
<!-- 메세지함 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 
function Recieved(id) { 
   $.ajax({ 
      type : 'post', 
      url : 'Recieved.jsp', 
      async : false, 
         data : {}, 
         error : function(xhr, status) {alert('Unknown error ' + status); }, 
         success : function(data) { 
             $("#"+ id).html(data); 
         } 
   }); 
} 

function Sent(id) { 
	   $.ajax({ 
	      type : 'post', 
	      url : 'Sent.jsp', 
	      async : false, 
	         data : {}, 
	         error : function(xhr, status) {alert('Unknown error ' + status); }, 
	         success : function(data) { 
	             $("#"+ id).html(data); 
	         } 
	   }); 
	} 
</script> 

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쪽지함</title>

</head>
<body>
   <div id="main" align="center">
   <div id="title">
   </div>
	<div id="message_list">
	
	</div>
		<hr>
		  <a href="#" onclick="Recieved('message_list');"><input type="button" value="받은 쪽지함"></a>
  <a href="#" onclick="Sent('message_list');"><input type="button" value="보낸 쪽지함"></a>
  <input type="button" value="쪽지보내기">

	</div>
</html>