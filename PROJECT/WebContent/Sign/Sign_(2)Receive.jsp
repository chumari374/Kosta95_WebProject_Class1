<%@page import="DAO.SignDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DTO.SignDTO" %>
<%
	List getSignList=(List)request.getAttribute("getsignlist");
	int listcount=(Integer)request.getAttribute("getsignlistcount");
	int nowpage=(Integer)request.getAttribute("page");
	int maxpage=(Integer)request.getAttribute("maxpage");
	int startpage=(Integer)request.getAttribute("startpage");
	int endpage=(Integer)request.getAttribute("endpage");
	
	System.out.println(listcount + "/ " + nowpage + " / " + maxpage + " / ");
	System.out.println(startpage + " / " + endpage);
	
	SignDAO signdao = new SignDAO();
	
%>

<html>
<head>
	<title>받은 결제함</title>
</head>

<body>
<jsp:include page="../Main.jsp"></jsp:include>
 <div id="main" align="center">
<!-- 게시판 리스트 -->

<table width=50% border="0" cellpadding="0" cellspacing="0">
<%
if(listcount > 0){
%>
	<tr align="center" valign="middle">
		<td colspan="4">받은 결제함</td>
		<td align=right>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">결재 번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">기안자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">송부자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">날짜</div>
		</td> 
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">상태</div>
		</td>
	</tr>
	
	<%
		for(int i=0;i<getSignList.size();i++){
			SignDTO signdto = (SignDTO)getSignList.get(i);
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=signdto.getSignnum()%>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<a href="DetailGetSignList.hong?num=<%=signdto.getSignnum() %>"><div align="center"><%=signdto.getTitle() %></div></a>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=signdao.getEmpname(signdto.getStarter()) %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=signdao.getEmpname(signdto.getEmpno()) %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=signdto.getWrite_date() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=signdto.getStatus() %></div>
		</td>
	</tr>
	<%} %>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="getSignList.hong?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="getSignList.hong?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="getSignList.hong?page=<%=nowpage+1 %>">[다음]</a>
			<%} %>
		</td>
	</tr>
	<%
    }
	else
	{
	%>
	<tr align="center" valign="middle">
		<td colspan="4">받은 결재함</td>
		<td align=right>
			<font size=2>받은 결재가 없습니다</font>
		</td>
	</tr>
	<%
	}
	%>
	
</table>
</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>