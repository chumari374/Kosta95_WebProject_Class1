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
		System.out.println("액션에 온걸 환영한다 젊은이");

		SignDAO signdao = new SignDAO();
		List getsignlist = new ArrayList();
		System.out.println("앵커1");

		HttpSession session = request.getSession();
		int empno = (Integer) session.getAttribute("empno");
		int page = 1;
		int limit = 10;
		String status = "대기";

		System.out.println("앵커2");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		if (request.getParameter("status") != null) {
			status = request.getParameter("status");
		}

		System.out.println("앵커3");

		System.out.println(empno);

		int getsignlistcount = signdao.getSignListCount(empno); // 총 리스트 수 받아옴
		getsignlist = signdao.getGetSignList(empno, page, limit, status);
		System.out.println("앵커4");

		System.out.println(getsignlistcount);
		System.out.println(getsignlist.size());

		int maxpage = (int) ((double) getsignlistcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		request.setAttribute("page", page); // 현재 페이지 수
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("getsignlistcount", getsignlistcount); // 글 수
		request.setAttribute("getsignlist", getsignlist);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Sign/Sign_(2)Receive.jsp");
		return forward;
	}
}
