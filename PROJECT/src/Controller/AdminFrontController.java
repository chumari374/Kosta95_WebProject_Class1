package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;


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
		
		if(command.equals("/pwd_search.ps")){
			
			
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

}
