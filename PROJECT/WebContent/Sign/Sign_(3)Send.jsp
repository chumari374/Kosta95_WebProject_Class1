<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List sendsignlist = (List)request.getAttribute("sendsignlist");
	List sendsugnlistcount = (Integer)request.getAttribute("sendsignlistcount");
	int nowpage=(Integer)request.getAttribute("page");
	int maxpage=(Integer)request.getAttribute("maxpage");
	int startpage=(Integer)request.getAttribute("startpage");
	int endpage=(Integer)request.getAttribute("endpage");
	
	System.out.println(sendsignlistcount + "/ " + nowpage + " / " + maxpage + " / ");
	System.out.println(startpage + " / " + endpage);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>kostra net</title>
</head>
<body>
	<table width=50% border="0" cellpadding="0" cellspacing="0">
		<%if(listcount > 0) {%>
			<tr align="center" valign="middle">
				<td colspan="4">보낸 결재 게시판</td>
				<td align=right>
					<font size=2>글 개수 : ${sendsignlistcount }</font>
				</td>
			</tr>
			
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
					<div align="center">작성자</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
					<div align="center">날짜</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
					<div align="center">조회수</div>
				</td>
			</tr>
			<% for(int i=0;i<sendsignlist.size();i++){
				SignDTO sl=(SignDTO)sendsignlist.get(i);
			%>
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family:Tahoma;font-size:10pt;">
					<%=sl.getSignnum()%>
				</td>
				
				<td style="font-family:Tahoma;font-size:10pt;">
					<div align="left">
					
	</table>
</body>
</html>