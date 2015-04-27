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
import Action.MemberInfoAction;

@WebServlet("*.info")
public class MemberInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberInfoController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	private void Process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		
		String command = RequestURI.substring(ContextPath.length());
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Member.info")){
			forward=new ActionForward();
			forward.setRedirect(false);
			action = new MemberInfoAction();
			
			try {
					forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
			
		}
		
		if(forward != null){
			if(forward.isRedirect()){ //view �� �ٷ�....
				System.out.println("forward.isRedirect() : " + forward.isRedirect());
				response.sendRedirect(forward.getPath());
			}else{
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher =
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}