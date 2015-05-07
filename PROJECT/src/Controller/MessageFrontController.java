package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import Action.Mypage.MessageAddAction;
import Action.Mypage.MessageDeleteAction;
import Action.Mypage.MessageDetailAction;
import Action.Mypage.MessageListAction;
import Action.Mypage.MessageReplyAction;
import Action.Mypage.MessageSentDeleteAction;

@WebServlet("*.mb")
public class MessageFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MessageFrontController() {
        
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 
     request.setCharacterEncoding("UTF-8");
     String RequestURI=request.getRequestURI();
	 String contextPath=request.getContextPath();
	 String command=RequestURI.substring(contextPath.length());
	 ActionForward forward=null;
	 Action action=null;
 System.out.println (command);
	   
	   if(command.equals("/MessageList.mb")){
		   action = new MessageListAction(command);
		   System.out.println("MessageListOk");
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
	   }else if(command.equals("/MessageReply.mb")){
		   forward=new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./MyPage/Message_Reply.jsp");
		   System.out.println("MessageReply");
		   
	   }else if(command.equals("/MessageReplyOk.mb")){
		   System.out.println("messageReplyActionOk");
		   	action = new MessageAddAction();
		   	System.out.println("MessageReplyOk");
		   	
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   
		   
	   }else if(command.equals("/MessageWrite.mb")){
		   forward=new ActionForward();
		   forward.setRedirect(true);
		   forward.setPath("./MyPage/Message_Write.jsp");
		   System.out.println("MessageWrite");
		   
	   }else if(command.equals("/MessageWriteOk.mb")){
		   System.out.println("messageAddActionOk");
		   	action = new MessageAddAction();
		   	System.out.println("MessageAddOk");
		   	
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/MessageDetailAction.mb")){
		   	action = new MessageDetailAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   
	   }else if(command.equals("/MessageDeleteAction.mb")){
		   	action = new MessageDeleteAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }
	  
	   }else if(command.equals("/Message_List.mb")){
		  
		   forward=new ActionForward();
		   forward.setRedirect(true);
		   forward.setPath("./MyPage/Message_List.jsp");
	   }
	   
    else if(command.equals("/Recieved.mb")){
    	   action = new MessageListAction(command);
		   System.out.println("RecievedOk");
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	   
      else if(command.equals("/Sent.mb")){
    	   action = new MessageListAction(command);
		   System.out.println("SentOk");
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
    }
	   
      else if(command.equals("/RecievedDeleteAction.mb")){
    	  action = new MessageDeleteAction(command);
    	  System.out.println("RecievedDeleteOk");
    	  try{
    		  forward = action.execute(request, response);
    	  }catch(Exception e){
    		  e.printStackTrace();
    	  }
      }
	   
      else if(command.equals("/SentDeleteAction.mb")){
    	  action = new MessageSentDeleteAction(command);
    	  System.out.println("SentDeleteOk");
    	  try{
    		  forward = action.execute(request, response);
    	  }catch(Exception e){
    		  e.printStackTrace();
    	  }
      }

	   
	   
	   
	   if(forward != null){
		   if(forward.isRedirect()){
			   System.out.println(forward.getPath());
			   response.sendRedirect(forward.getPath());
		   }else{
			   RequestDispatcher dispatcher=
					   request.getRequestDispatcher(forward.getPath());
			   dispatcher.forward(request, response);
		   }
	     }
	   }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
