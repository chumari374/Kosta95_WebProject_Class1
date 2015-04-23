<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기안서 작성</title>
<style type="text/css">
table, td, tr {
   border: 1px solid gray;
   border-collapse: collapse;
   width: 800px;
}

.left {
   width: 100px;
   height: 24px;
   font-size: 13px;
   text-align: center;
   vertical-align: middle;
   background-color: #EAEAEA;
}

.content {
   height: 250px;
}
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<SCRIPT type="text/javascript">
   function check() {

      if (!bbs.subject.value) {
         alert("제목을 입력하세요");
         bbs.subject.focus();
         return false;
      }

      if (!bbs.writer.value) {

         alert("이름을 입력하세요");
         bbs.writer.focus();
         return false;
      }

      var ckeditor = CKEDITOR.instances['content']; //객체가져오기
      if (ckeditor.getData() == "") {//null값은 안옴 = 빈문자열
         alert("글 내용을 입력하세요");
         ckeditor.focus();
         return false;
      }

      if (!bbs.pwd.value) {
         alert("비밀번호를 입력하세요");
         bbs.pwd.focus();
         return false;
      }

      document.bbs.submit();

   }
</SCRIPT>
</head>
<body>
  <table>
      <tr>
         <td class="left">문서종류</td>
         <td>&nbsp;<select><option>선택하세요</option></select></td>
      </tr>
      <tr>
         <td class="left">부서</td>
         <td></td>
      </tr>
        <tr>
         <td class="left">팀</td>
         <td></td>
      </tr>
      <tr>
      </tr>
      <tr>
         <td class="left">제목</td>
         <td></td>
      </tr>
      <tr>
         <td class="left">파일첨부</td>
         <td>&nbsp;<input type="button" value="첨부하기"></td>
      </tr>
      <tr class="content">
         <td class="left">내용</td>
         <td><textarea rows="10" cols="60" name="content" id="content"></textarea>
            <script type="text/javascript">
               CKEDITOR.replace('content');
            </script>
         </td>
      </tr>
      <tr>
         <td class="left">결재자</td>
         <td></td>
      </tr>
   </table>
   <button>미리보기</button>&nbsp;<button>임시저장</button>&nbsp;<button>작성완료</button>


</body>
</html>

