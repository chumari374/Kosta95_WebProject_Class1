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
import Action.Comp.CompBoardAddAction;
import Action.Comp.CompBoardDeleteAction;
import Action.Comp.CompBoardDetailAction;
import Action.Comp.CompBoardListAction;
import Action.Comp.CompBoardModifyAction;
import Action.Comp.CompBoardModifyView;
import Action.Comp.CompBoardRealModifyAction;
import Action.Comp.CompBoardReplyAction;
import Action.Comp.CompBoardReplyView;
import Action.Dept.DeptBoardAddAction;
import Action.Dept.DeptBoardDeleteAction;
import Action.Dept.DeptBoardDetailAction;
import Action.Dept.DeptBoardListAction;
import Action.Dept.DeptBoardModifyAction;
import Action.Dept.DeptBoardModifyView;
import Action.Dept.DeptBoardRealModifyAction;
import Action.Dept.DeptBoardReplyAction;
import Action.Dept.DeptBoardReplyView;

@WebServlet("*.dp")
public class DeptFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeptFrontController() {
        
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 
     request.setCharacterEncoding("UTF-8");
     String RequestURI=request.getRequestURI();
	 String contextPath=request.getContextPath();
	 String command=RequestURI.substring(contextPath.length());
	 ActionForward forward=null;
	 Action action=null;
	   
	   if(command.equals("/DeptBoardList.dp")){
		   action = new DeptBoardListAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardWrite.dp")){
		   forward=new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./Dept/Dept_Board/Dept_Board_Write.jsp");
	   }else if(command.equals("/DeptBoardWriteOk.dp")){
		   	action = new DeptBoardAddAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardDetailAction.dp")){
		   	action = new DeptBoardDetailAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardDeleteAction.dp")){
		   	action = new DeptBoardDeleteAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardModify.dp")){
		   	action = new DeptBoardModifyAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardModifyView.dp")){
		   	action = new DeptBoardModifyView();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardRealModifyAction.dp")){
		   	action = new DeptBoardRealModifyAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardReplyView.dp")){
		   	action = new DeptBoardReplyView();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/DeptBoardReplyAction.dp")){
		   	action = new DeptBoardReplyAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
