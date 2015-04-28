package Action.Sign;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;

public class SendSignListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SignDAO signdao = new SignDAO();
		List sendsignlist = new ArrayList();
		
		HttpSession session = request.getSession();
		int empno = (Integer)session.getAttribute("empno");
		int page = 1;
		int limit = 10;
		String status = request.getParameter("status");
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int sendsignlistcount = signdao.sendSignListCount(); // �� ����Ʈ �� �޾ƿ�
		sendsignlist = signdao.getSendSignList(empno, page, limit, status);
		
		int maxpage = (int) ((double) sendsignlistcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		request.setAttribute("page", page); // ���� ������ ��
		request.setAttribute("maxpage", maxpage); // �ִ� ������ ��
		request.setAttribute("startpage", startpage); // ���� �������� ǥ���� ù ������ ��
		request.setAttribute("endpage", endpage); // ���� �������� ǥ���� �� ������ ��
		request.setAttribute("getsignlistcount", sendsignlistcount); // �� ��
		request.setAttribute("getsignlist", sendsignlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Sign_(3)Send.jsp");
		return forward;
	}
}
