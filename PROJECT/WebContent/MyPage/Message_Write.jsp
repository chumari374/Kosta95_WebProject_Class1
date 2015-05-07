<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		<style>
	    h3 { text-align: center; }
		#message_write_table { color: #4C4C4C;}
		#message_write_table th
		{
		/* border:0px solid black; 
		text-align:center; 
		background-color: #D5D5D5; */
		font-size: 13.5px;
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
	/* border: 1px solid #c4c4c4; */
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
		font-size: 12px;
		}
		
		#message_write_table td {border-bottom:1px dashed #D5D5D5;}
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

#menudiv {margin-left: 40%;}

</style>

<!-- 	<script language="javascript">
	function addMSGboard(){
		messageboardform.submit();
	}
	
</script> -->
<%
/*  String empno =  (String)session.getAttribute("empno"); */
	String empno = (String.valueOf(session.getAttribute("empno"))); 
%>
</head>
<body>
	<div id="message_write_div">
		<form action="../MessageWriteOk.mb" method="post" name="messageboardform">
			<table id="message_write_table">
			    <tr>
			       <th>보내는사원번호</th>
			       <td><input type="text" name="empno" cols="21" value= <%= empno %> readonly></td>
			    </tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" cols="21">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="5" cols="21"></textarea>
					</td>
				</tr>
<!--  				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="filepath">
					</td>
				</tr>  -->
					<tr align="center" valign="middle">
						<tr>
					<th>받는사원번호</th>
					<td>
						<input type="text" name="sendempno" cols="21">
					</td>
				</tr>
			</table>
			<br>
				<div id="menudiv">
				<button type="submit" value="" class="css3button">등록</button>
				</div>
		</form>
	</div>
</body>
</html>