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
	 
	 #title {
	margin: 30px;
	margin-bottom: 10px;
}

#menudiv {margin-left: 80%; font-size: 12px;}

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
	
	
	</script>
	
	<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
</head>

<body>
<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="left">
		<div id="title">
			<h3>받은 쪽지함</h3>
		</div>
		
		<div id="menudiv">

     <a href="./Sent.mb">보낸쪽지함</a>&nbsp;
     <a href="" onclick='msgsend("+entry.empno+")'>쪽지보내기</a>
     
</div> 
		
		<div class="container" style="margin-left: 100px;">
			<div class="row">
				<div>
					<table class="table" style="width: 70%;">
						<tr align="center" valign="middle" bordercolor="#333333">
							<td style="font-family: Tahoma; font-size: 10pt;" width="15%"
								height="26">
								<div align="center"><b>쪽지번호</b></div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;" width="15%">
								<div align="center"><b>보낸사람</b></div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;" width="15%">
								<div align="center"><b>받는사람</b></div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;" colspan="2">
								<div align="center"><b>제목</b></div>
							</td>
						</tr>

						<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->



 	<%

		for(int i=0;i<messageList.size();i++){
			MessageDTO ml = (MessageDTO)messageList.get(i);
			
	%> 
	<tr>
		<td  align="center" valign="middle" bordercolor="#333333"> 
			 <%=ml.getMsgnum()%> 
		</td>
		<td  align="center" valign="middle" bordercolor="#333333">
			 <%=ml.getEmpno() %> 
		</td>
		<td  align="center" valign="middle" bordercolor="#333333">
		    <%= ml.getSendempno() %> 
		</td>
		<td>
			 <%-- <a href="MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>" target="blank"> --%>	 
			 <a href="#" onclick="window.open('MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>','window팝업','left=300, top=50, width=600, height=400, menubar=no, status=no, toolbar=no');">
			 <%=ml.getTitle()%></a>
			
		</td>
			<td width="10%">
		   	<a href="RecievedDeleteAction.mb?msgnum=<%=ml.getMsgnum()%>">
			[삭제]
			</a>&nbsp;&nbsp;
		</td>
	</tr>
	
 	<%} %>
 	
 		<!-- 페이징처리 시작 -->
	<tr align=center height=20>
		<td colspan="5" style="font-family:Tahoma;font-size:10pt;">
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
		</div>
		</div>
		</div>
		<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>