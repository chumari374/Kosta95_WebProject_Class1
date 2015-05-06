<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인페이지 -->
<!DOCTYPE HTML>
<HTML>
<HEAD>
   <meta charset="UTF-8">
   <TITLE> index </TITLE>
   <script type="text/javascript" src="chatting/js/async.js"></script>
   <link type="text/css" rel="stylesheet" href="css/mystyle.css">
	<script type="text/javascript" src="js/myscript.js"></script>
   <style>
   </style>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	getip2();
</script>
</HEAD>

<BODY>
   <header>
   ${sessionScope.empno},${sessionScope.ename},${sessionScope.teamname},${sessionScope.grade},${sessionScope.admin}
   </header>

   <nav>
   &nbsp;
   </nav> 

   <aside id="left">
     
     <h4 onclick="javascript:location.href='SubMain.jsp'"><b>KOSTA 인트라넷 </b></h4>
      <div id="leftdiv1">
      <br>
                  <p> </p>
                  <p><img src="http://192.168.7.235:8090/PROJECT/Upload/${sessionScope.p_picture}" width="80px" height="80px"></p>
                  <p>${sessionScope.ename }님 로그인 하셨습니다.</p>
                  <p><input type="button" value="로그아웃" onclick="logout('<%= request.getContextPath()%>')"></p>
      
      </div>
      
      <div id="leftdiv2">
      
       <ul>
        <li>    
             <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;사내     
              <ul class="submenu">         
                 <li><a href="CompNoticeList.cn" >공지사항</a></li>          
                 <li><a href="CompDataBoardList.cf" >자료실</a></li>       
                 <li><a href="CompBoardList.cp" >게시판</a></li>    
              </ul>    
         </li>
        
        
            <li>     
              <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;부서     
              <ul class="submenu">         
                 <li><a href="DeptBoardList.dp">부서 게시판</a></li>          
                 <li><a href="#" onclick="chatting_window()">팀 게시판</a></li>       
                 <li><a href="#">자료실(공사중)</a></li>    
              </ul>    
           </li>
        
           <li>      
              <span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;결재   
              <ul class="submenu">         
                 <li><a href="#">결재 현황</a></li>          
                 <li><a href="SignWrite.hong">결재 기안</a></li>       
                 <li><a href="sendSignList.hong">보낸 결재</a></li>    
                 <li><a href="getSignList.hong">받은 결재</a></li>    
                 <li><a href="#">완료 결재함</a></li>    
              </ul>    
        </li> 
     
         <li>       
         <a href="MemberList.info"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;사원검색</a>       
         </li> 
      
     <li>      
             <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;마이페이지                    
              <ul class="submenu">         
                 <li><a href="Account_Edit.mp">개인정보 수정</a></li>          
                 <li><a href="">메세지함</a></li>       
                 <li><a href="SchedulePage.mp">일정관리</a></li>    
              </ul>    
        </li>
        
              
         <li>      
              <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp; 관리자페이지                
              <ul class="submenu">         
                 <li><a href="MemberAdd.admin">신입사원 추가</a></li>
                 <li><a href="MemberList.admin">사원정보 수정</a></li>            
              </ul>    
          </li>
        </ul> 
       
      </div>
    </aside>

 	<input type="hidden" id="ip">
<!--     <div id="main" align="center" > -->
<!--     사내 공지사항 -->
<!-- <!-- <div id="div1">사내 공지사항</div> -->
<!--     <div id="div2">...div2</div> -->
<!--     <div id="div3">...div3</div> -->
<!--     <div id="div4">...div4</div> -->
<!--     </div> -->
    
<!--     <footer>Copyright (c) 2015 KOSTA</footer> -->
</HTML>
