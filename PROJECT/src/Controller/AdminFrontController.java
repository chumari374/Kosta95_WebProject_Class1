package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import Action.Check_EmailAction;
import Action.Check_EmpnoAction;
import Action.LoginAction;
import Action.Pwd_SearchAction;
import Action.RegisterAction;
import DAO.AccountsDAO;


//@WebServlet("/AdminFrontController")
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminFrontController() {
        super();
    }

    private void proccess(HttpServletRequest request, HttpServletResponse response){
    	String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		
		String command = RequestURI.substring(ContextPath.length());
		
	    //RequestURI : /Web_JSP17_ServletBoard/boardList.do
		//ContextPath : /Web_JSP17_ServletBoard
		//command : /boardList.do
		
		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);
		
		//일괄처리를 위해서
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/pwd_search.ad")){
			
			action = new Pwd_SearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/empnoCheck.ad")){
			action = new Check_EmpnoAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/emailCheck.ad")){
			action = new Check_EmailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/register_Ok.ad")){
			action = new RegisterAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/login_Ok.ad")){
			action = new LoginAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
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
