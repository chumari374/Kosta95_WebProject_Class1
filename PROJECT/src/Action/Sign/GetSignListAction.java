package Action.Sign;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;

public class GetSignListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SignDAO signdao = new SignDAO();
		List getsignlist = new ArrayList();
		
		HttpSession session = request.getSession();
		int empno = (Integer)session.getAttribute("empno");
		int page = 1;
		int limit = 10;
		String status = request.getParameter("status");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int getsignlistcount = signdao.getSignListCount(empno); // �� ����Ʈ �� �޾ƿ�
		getsignlist = signdao.getGetSignList(empno, page, limit, status); // ����Ʈ �޾ƿ�
		
		int maxpage = (int) ((double) getsignlistcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		request.setAttribute("page", page); // ���� ������ ��
		request.setAttribute("maxpage", maxpage); // �ִ� ������ ��
		request.setAttribute("startpage", startpage); // ���� �������� ǥ���� ù ������ ��
		request.setAttribute("endpage", endpage); // ���� �������� ǥ���� �� ������ ��
		request.setAttribute("getsignlistcount", getsignlistcount); // �� ��
		request.setAttribute("getsignlist", getsignlist);
		
		// forward ���� ó�� ����///////////////////////////
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Sign_(2)Receive.jsp");
		return forward;
	}
}
