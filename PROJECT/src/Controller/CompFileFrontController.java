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
import Action.CompFile.CompDataBoardAddAction;
import Action.CompFile.CompDataBoardDeleteAction;
import Action.CompFile.CompDataBoardDetailAction;
import Action.CompFile.CompDataBoardListAction;


@WebServlet("*.cf")
public class CompFileFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CompFileFrontController() {
        super();
    }
    
    private void proccess(HttpServletRequest request, HttpServletResponse response){
    	String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		
		String command = RequestURI.substring(ContextPath.length());
		
	    //RequestURI : /Web_JSP17_ServletBoard/boardList.do
		//ContextPath : /Web_JSP17_ServletBoard
		//command : /boardList.do
		
		//System.out.println("RequestURI : " + RequestURI);
		//System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);
		
		//�ϰ�ó���� ���ؼ�
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/CompDataBoardList.cf")){
			action = new CompDataBoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/CompDataBoardWrite.cf")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Comp/Comp_File/Comp_File_Write.jsp");
			
		}else if(command.equals("/CompDataBoardWriteOk.cf")){
			action = new CompDataBoardAddAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/CompDataBoardDetailAction.cf")){
			action = new CompDataBoardDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/CompDataBoardDeleteAction.cf")){
		   	action = new CompDataBoardDeleteAction();
		   try{
			   forward=action.execute(request, response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
		
		if(forward != null){
			if(forward.isRedirect()){
				System.out.println("forward.isRedirect() : " + forward.isRedirect());
				try {
					response.sendRedirect(forward.getPath());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher =
				request.getRequestDispatcher(forward.getPath());
				try {
					dispatcher.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

}
