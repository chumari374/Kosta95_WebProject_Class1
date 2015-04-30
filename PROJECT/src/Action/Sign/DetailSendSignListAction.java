package Action.Sign;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;
import DTO.SignDTO;

public class DetailSendSignListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("�׼ǿ� �°� ȯ���Ѵ� ������");

		SignDAO signdao = new SignDAO();
		List getsignlist = new ArrayList();
		System.out.println("��Ŀ1");

		HttpSession session = request.getSession();
		int empno = (Integer) session.getAttribute("empno");
		int page = 1;
		int limit = 10;
		String status = "���";

		System.out.println("��Ŀ2");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		if (request.getParameter("status") != null) {
			status = request.getParameter("status");
		}

		System.out.println("��Ŀ3");

		System.out.println(empno);

		int getsignlistcount = signdao.getSignListCount(empno); // �� ����Ʈ �� �޾ƿ�
		getsignlist = signdao.getGetSignList(empno, page, limit, status);
		System.out.println("��Ŀ4");

		System.out.println(getsignlistcount);
		System.out.println(getsignlist.size());

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

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Sign/Sign_(2)Receive.jsp");
		return forward;
	}
}
