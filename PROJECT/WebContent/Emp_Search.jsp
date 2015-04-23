<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사원검색 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script type="text/javascript">
$(function() {
    $( "#search" ).menu();
  });
</script>
<style>
  .ui-menu { width: 150px; }
  </style>
</head>
<body>
	<table>
		<tr>
			<td colspan="6">
				<ul id="search">
				  <li>개발부
				     <ul>
				      <li>솔루션팀</li>
				      <li>외주팀</li>
				    </ul>
				  </li>
				  <li>영업부
				  	<ul>
				      <li>기술경영팀</li>
				      <li>A/S팀</li>
				    </ul>
				  </li>
				  <li>총무부
				  	<ul>
				      <li>경리팀</li>
				      <li>경영팀</li>
				      <li>인사팀</li>
				    </ul>
				  </li>
				</ul>
			</td>
		</tr>
	</table>
</body>
</html>