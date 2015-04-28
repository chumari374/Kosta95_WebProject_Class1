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
		String ContextPath = request.getContextPath() + "/Sign";

		System.out.println(RequestURI);
		System.out.println(ContextPath);

		String command = RequestURI.substring(ContextPath.length()); // 슬래쉬 전까지
																		// 자른다

		/*
		 * System.out.println("RequestURI : " + RequestURI);
		 * System.out.println("ContextPath : " + ContextPath);
		 * System.out.println("command : " + command);
		 */

		// 일괄처리를 위해서
		ActionForward forward = null;
		Action action = null;

		// 받은결재함
		if (command.equals("/getSignList.hong")) {
			// System.out.println("getsignlist Display");
			action = new GetSignListAction(); // action에 어떤 함수를 쓸껀지 쓰는것 마다 만들어
												// 준다
			// action 객체 변수 ....

			try {
				forward = action.execute(request, response);
				System.out.println("getsignlist :  forward");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 보낸결재함
		if (command.equals("/sendSignList.hong")) {
			// System.out.println("getsignlist Display");
			action = new SendSignListAction(); // action에 어떤 함수를 쓸껀지 쓰는것 마다 만들어
												// 준다
			// action 객체 변수 ....

			try {
				forward = action.execute(request, response);
				System.out.println("sendsignlist :  forward");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 결재문서 작성
		else if (command.equals("/SignWrite.hong")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Sign_(1)Start.jsp");
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

		if (forward != null) {
			if (forward.isRedirect()) { // view 단 바로....재접속 하시겠습니까? true
				System.out.println("forward.isRedirect() : "
						+ forward.isRedirect());
				response.sendRedirect(forward.getPath()); // 재요청
			} else { // false
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath()); // 어디로갈지
				dispatcher.forward(request, response); // 그 주소로 보낸다
			}
		}
	}

}
