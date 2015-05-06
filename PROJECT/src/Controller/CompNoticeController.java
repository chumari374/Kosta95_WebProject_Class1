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
import Action.Notice.CompNoticeAddAction;
import Action.Notice.CompNoticeDeleteAction;
import Action.Notice.CompNoticeDetailAction;
import Action.Notice.CompNoticeListAction;
import Action.Notice.CompNoticeModifyAction;
import Action.Notice.CompNoticeModifyView;
import Action.Notice.CompNoticeRealModifyAction;

@WebServlet("*.cn")
public class CompNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CompNoticeController() {
        
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 
     request.setCharacterEncoding("UTF-8");
     String RequestURI=request.getRequestURI();
	 String contextPath=request.getContextPath();
	 String command=RequestURI.substring(contextPath.length());
	 ActionForward forward=null;
	 Action action=null;
	   
	   if(command.equals("/CompNoticeList.cn")){
		   action = new CompNoticeListAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeWrite.cn")){
		   forward=new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("./Comp/Comp_Notice/Comp_Notice_Write.jsp");
	   }else if(command.equals("/CompNoticeWriteOk.cn")){
		   	action = new CompNoticeAddAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeDetailAction.cn")){
		   	action = new CompNoticeDetailAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeDeleteAction.cn")){
		   	action = new CompNoticeDeleteAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeModify.cn")){
		   	action = new CompNoticeModifyAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeModifyView.cn")){
		   	action = new CompNoticeModifyView();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }else if(command.equals("/CompNoticeRealModifyAction.cn")){
		   	action = new CompNoticeRealModifyAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
//	   else if(command.equals("/CompBoardReplyView.cp")){
//		   	action = new CompBoardReplyView();
//		   try{
//			   forward=action.execute(request, response);
//		   }catch(Exception e){
//			   e.printStackTrace();
//		   }
//	   }else if(command.equals("/CompBoardReplyAction.cp")){
//		   	action = new CompBoardReplyAction();
//		   try{
//			   forward=action.execute(request, response);
//		   }catch(Exception e){
//			   e.printStackTrace();
//		   }
//	   }
	   
	   
	   
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
