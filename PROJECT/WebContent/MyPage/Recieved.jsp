<%@page import="java.util.List"%>
<%@page import="DTO.MessageDTO"%>
<%@page import="DAO.MessageDAO"%>
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

int ing = (nowpage/5)+1; // 계층을 계산함 1~5 1단계 6~10 2단계 ...
int level = ing;// 위와 같은 의미로 쓰임
	int end = level*5;//단계에 5를 곱하면 현재 페이지의 끝페이지 알수 있음

if(nowpage%5==0){//그러나 5의 배수일 경우는 1단계 떨어뜨려줌  그렇지않으면 다음단계로 계산됌
	level = ing-1;
	end = level*5;
}
	
// 	System.out.println(listcount + "/ " + nowpage + " / " + maxpage + " / ");
// 	System.out.println(startpage + " / " + endpage);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
	    h3 { text-align: center; }
		#message_list_table {margin-left: 20%; color: #4C4C4C;}
		#message_list_table th 
		{
		/* border:0px solid black; 
		text-align:center; 
		background-color: #D5D5D5; */
		font-size: 14px;
		color: #282828;
	padding: 6px 14px;
	background: -moz-linear-gradient(
		top,
		#f5f5f5 0%,
		#f5f5f5);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f5f5f5),
		to(#f5f5f5));
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	border: 1px solid #c4c4c4;
	-moz-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5);
/* 	-webkit-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5); */
/* 	box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5); */
	text-shadow:
		0px 0px 0px rgba(000,000,000,0),
		0px 0px 0px rgba(255,255,255,0);
		}
		
		#message_list_table td {border-bottom:1px dashed #D5D5D5; font-size: 13.5px;}
		#pagingtable {border: 0px; margin-left: 40%;}
		#menudiv {margin-left: 67%; font-size: 12px;}
		a {color: #4C4C4C; text-decoration: none;}
		a:hover{color: #A6A6A6;}
		
button.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #282828;
	padding: 6px 14px;
	background: -moz-linear-gradient(
		top,
		#f5f5f5 0%,
		#f5f5f5);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f5f5f5),
		to(#f5f5f5));
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	border: 1px solid #c4c4c4;
	-moz-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5);
/* 	-webkit-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5);
	box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5); */
	text-shadow:
		0px 0px 0px rgba(000,000,000,0),
		0px 0px 0px rgba(255,255,255,0);
}


	</style>
	<script>
	function msgsend(empno){

		var popupWidth = 310;
		var popupHeight = 200;
		var popup_options = "top="+((screen.availHeight - popupWidth)/2)+", left="+((screen.availWidth - popupHeight)/2)+", width=310, height=200, location=no";
		var url = "MessageWrite.mb";
		var target = "_blank";

		window.open(url, target, popup_options);
	}
	
	
	function openwindow(){

		var popupWidth = 600;
		var popupHeight = 600;
		var popup_options = "top="+((screen.availHeight - popupWidth)/2)+", left="+((screen.availWidth - popupHeight)/2)+", width=600, height=600, location=no";
		var url = "";
		var target = "_blank";

		window.open(url, target, popup_options);
	}
	
	
	</script>
</head>

<body>
<h3>받은쪽지함</h3>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="left">
<div id="menudiv">

     <a href="./Sent.mb">보낸쪽지함</a>&nbsp;
     <a href="" onclick='msgsend("+entry.empno+")'>쪽지보내기</a>
     
</div> 
<table id="message_list_table" width="60%" height="50%">
			<tr>
				<th width="15%">쪽지번호</th>
				<th width="15%">보낸사람</th>
				<th width="15%">받는사람</th>
				<th colspan="2">제목</th>
			</tr>
 	<%

		for(int i=0;i<messageList.size();i++){
			MessageDTO ml = (MessageDTO)messageList.get(i);
			
	%> 
	<tr>
		<td> 
			 <%=ml.getMsgnum()%> 
		</td>
		<td>
			 <%=ml.getEmpno() %> 
		</td>
		<td>
		    <%= ml.getSendempno() %> 
		</td>
		<td>
			 <%-- <a href="MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>" target="blank"> --%>
			 <a href="MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>" onclick='windowopen()'>
				<%=ml.getTitle()%>
			</a> 
		</td>
			<td width="10%">
		   	<a href="RecievedDeleteAction.mb?msgnum=<%=ml.getMsgnum()%>">
			[삭제]
			</a>&nbsp;&nbsp;
		</td>
	</tr>
	
 	<%} %>
		</table>
		<br>
		
		
		
		<table id="pagingtable">
		 	
 	<!-- 페이징처리 시작 -->
	<tr align=center height=20>
		<td colspan="4" style="font-family:Tahoma;font-size:10pt;">
			<%if(level<=1){ %>
			<button type="button" value="" class="css3button">이전 </button>
			<%}else{ %>
			<a href ="Recieved.mb?page=<%=level*5-5 %>"><button type="button" value="" class="css3button">이전 </button></a>&nbsp;
			<%} %>
			
			<%for(int i=level*5-4;i<= end ;i++){
				if(i==nowpage){%>
				<button type="button" value="" class="css3button"><%=i %> </button>&nbsp;
				<%}else{ 
					if(i<=maxpage){
				%>
					<a href="Recieved.mb?page=<%=i %>"><button type="button" value="" class="css3button"><%=i %></button></a>&nbsp;
				<%
					}
				 }
				%>
			<%} %>
			
			<%if(level>=(maxpage/5)+1){ %>
			<button type="button" value="" class="css3button">다음</button>
			<%}else{ %>
			<a href="Recieved.mb?page=<%=level*5+1 %>"><button type="button" value="" class="css3button">다음</button></a>
			<%} %>
		</td>
	</tr>
	<!-- 페이징처리 끝 -->
		</table>
		</div>
		<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>