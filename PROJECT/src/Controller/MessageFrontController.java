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
	   
	   if(command.equals("/MessageList.mb")){
		   action = new MessageListAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/MessageWrite.cp")){
		   forward=new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./MyPage/Message_Write.jsp");
	   }else if(command.equals("/MessageWriteOk.cp")){
		   	action = new MessageAddAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/MessageDetailAction.cp")){
		   	action = new MessageDetailAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   
	   }else if(command.equals("/MessageDeleteAction.cp")){
		   	action = new MessageDeleteAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	  
	   
	   if(forward != null){
		   if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath());
		   }else{
			   RequestDispatcher dispatcher=
					   request.getRequestDispatcher(forward.getPath());
			   dispatcher.forward(request, response);
		   }
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
