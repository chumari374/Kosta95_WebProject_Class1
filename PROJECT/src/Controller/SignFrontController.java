package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import Action.GetSignListAction;

@WebServlet("*.hong")
public class SignFrontController extends HttpServlet {
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
		
		String command = RequestURI.substring(ContextPath.length()); // ������ ������ �ڸ���
		
		/*
		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);
		*/
		
		// �ϰ�ó���� ���ؼ�
		ActionForward forward = null;
		Action action = null;
		
		// ����������
		if(command.equals("/getsignlist.hong")) {
			// System.out.println("getsignlist Display");
			action = new GetSignListAction(); // action�� � �Լ��� ������ ���°� ���� ����� �ش�
			// action ��ü ���� ....
			
			try {
					forward = action.execute(request, response);
					System.out.println("getsignlist :  forward");
			} catch(Exception e) {
					e.printStackTrace();
			}
		}
	}
	
}
