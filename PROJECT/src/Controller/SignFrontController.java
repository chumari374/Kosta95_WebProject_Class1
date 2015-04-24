package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.GetSignListAction;
import Action.Action;
import Action.ActionForward;

@WebServlet("*.hong")
public class SignFrontController {
	private static final long serialVersionUID = 1L;
	
	public SignFrontController() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	
	private void Process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command = RequestURI.substring(ContextPath.length()); // 슬래쉬 전까지 자른다
		
		/*
		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);
		*/
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/getsignlist.hong")) {
			System.out.println("signlist Display");
			
			action = new GetSignListAction();
			
			try {
				forward = action.execute(request, response);
				// System.out.println("getsignlist :  forward");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
