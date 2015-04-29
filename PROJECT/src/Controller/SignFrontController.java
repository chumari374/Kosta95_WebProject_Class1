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
import Action.Sign.DetailSendSignListAction;
import Action.Sign.GetSignListAction;
import Action.Sign.SendSignListAction;
import Action.Sign.SignAddAction;
import Action.Sign.SignAddAction;

@WebServlet("*.hong")
public class SignFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignFrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	private void Process(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();

		System.out.println(RequestURI);
		System.out.println(ContextPath);

		String command = RequestURI.substring(ContextPath.length()); // ������ ������
																		// �ڸ���

		/*
		 * System.out.println("RequestURI : " + RequestURI);
		 * System.out.println("ContextPath : " + ContextPath);
		 * System.out.println("command : " + command);
		 */

		// �ϰ�ó���� ���ؼ�
		ActionForward forward = null;
		Action action = null;

		// ����������
		if (command.equals("/getSignList.hong")) {
			// System.out.println("getsignlist Display");
			action = new GetSignListAction(); // action�� � �Լ��� ������ ���°� ���� �����
												// �ش�
			// action ��ü ���� ....

			try {
				forward = action.execute(request, response);
				System.out.println("getsignlist :  forward");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ����������
		if (command.equals("/sendSignList.hong")) {
			// System.out.println("getsignlist Display");
			action = new SendSignListAction(); // action�� � �Լ��� ������ ���°� ���� �����
												// �ش�
			// action ��ü ���� ....

			try {
				forward = action.execute(request, response);
				System.out.println("sendsignlist :  forward");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ���繮�� �ۼ�
		else if (command.equals("/SignWrite.hong")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Sign/Sign_(1)Start.jsp");
			System.out.println("redirect : " + forward.getPath());
		} else if (command.equals("/SignAddAction.hong")) {
			System.out.println("SignWriteBefore");
	
			action = new SignAddAction();

			try {
				forward = action.execute(request, response);
				System.out.println("SignWriteAfter");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// �������翡�� ���� �󼼺���
		else if (command.equals("/detailSendSignList.hong")) {
			// System.out.println("BoardDetailBefore");
			// System.out.println("board num : " + request.getParameter("num"));
			
			action = new DetailSendSignListAction(); // action ��ü ������ request ������ ����
			
			try {
				request.setAttribute("signsign", "sign");
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		// ====================================================================

		if (forward != null) {
			if (forward.isRedirect()) { // view �� �ٷ�....������ �Ͻðڽ��ϱ�? true
				System.out.println("forward.isRedirect() : "
						+ forward.isRedirect());
				response.sendRedirect(forward.getPath()); // ���û
			} else { // false
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath()); // ���ΰ���
				dispatcher.forward(request, response); // �� �ּҷ� ������
			}
		}
	}

}
