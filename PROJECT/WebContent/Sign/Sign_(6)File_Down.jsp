<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>

<%

	String filename = request.getParameter("File_sign");
	String savePath ="SignUpload";
	
	ServletContext context = getServletContext();
	String SignDownLoadPath =  "\\\\192.168.7.235\\Upload";
	
	String SignFilePath = SignDownLoadPath + "\\" + filename.trim();
	
	 byte[] b = new byte[4096];
	 
	 FileInputStream in = new FileInputStream(SignFilePath);
	 
	 String sMimeType = getServletContext().getMimeType(SignFilePath);
	 
	 if(sMimeType ==null) { // 파일 형식 지정
   	  sMimeType = "application/octet-stream";
     }
	 
	 response.setContentType(sMimeType);
	 
	 // 한글처리 형식
	 String sEncoding = new String(filename.getBytes("utf-8"),"8859_1");
     response.setHeader("Content-Disposition","attachment;filename= " + sEncoding);
     
     ServletOutputStream out2 = response.getOutputStream();
     int numRead;
     
     while((numRead = in.read(b,0,b.length))!=-1) {
    	 out2.write(b,0,numRead);
     }
     
     out2.flush();
     out2.close();
     in.close();
%>
	