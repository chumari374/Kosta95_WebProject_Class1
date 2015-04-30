<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<%

   request.setCharacterEncoding("UTF-8");

   //다운로드할 파일명 얻기
   String filename =request.getParameter("filename");
   
   //request.getRealPath(savePath); 대체코드로 사용하셔도 됩니다
   //ServletContext context = getServletContext();
   //String sDownLoadPath = context.getRealPath(savePath);
   
   String sDownLoadPath = "\\\\192.168.7.235\\Upload";
   String sFilePath = sDownLoadPath + "\\" + filename;
   //file명  + 실 저장경로 TEST
   System.out.println("sFilePath : " + sFilePath);
   System.out.println("filename : " + filename);
   //out.println("sFilePath : " + sFilePath + "<br>");
   
   //파일을 읽어서 출력
   byte[] b = new byte[4096];
   
   //read
   //C:....//upload//1.jpg
   FileInputStream in = new FileInputStream(sFilePath); //실 저장 경로에서
   
   //실제 인지할수 있는 타입의 파일들이면 자신의 => contentType
   //application이 인지할 수 없는 확장자 파일은 null 경우에 형식을 잡아준다
   String sMimeType = getServletContext().getMimeType(sFilePath); //파일의 타입 정보
   if(sMimeType == null){
    //알수 없는 형식의 파일은 
    //application/octet-stream 기본값으로 (알수 없는 파일 형식)
    sMimeType = "application/octet-stream";
   }
   out.println("filname : " + filename + "형식 : " + sMimeType);
   
   //2. client 전달되는 형식을 지정(Type)
   response.setContentType(sMimeType);
   
   //3. 인코딩 처리(한글 : 파일이 가지고 있는 한글에 대한 처리)
    String SEncoding = new String(filename.getBytes("utf-8"),"utf-8");
   out.println("SEncoding : " + SEncoding);
   
   //4. 다운로드(기본 설정) 구현
   //response.setCharacterEncoding("euc-kr");
   //response.setHeader("Content-Disposition","attachment;filename="+SEncoding);
   //파일 다운로드를 위한 헤더 정보 수정 (파일이름 문자열 다시 인코딩)
   response.setHeader("Content-Disposition", 
           "attachment;filename="+new String(filename.getBytes(),"ISO8859_1"));   //
           //문서를 읽어 들여서 ISO8859_1 형식으로 변환 ......



   //5. 파일 출력하기
   ServletOutputStream out2 = response.getOutputStream();
   int numread;
   while((numread = in.read(b,0,b.length)) != -1){
      out2.write(b,0,numread);
   }
   
   out2.flush();
   out2.close();
   in.close();
   
%>    