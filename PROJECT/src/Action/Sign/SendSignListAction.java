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
		
		int sendsignlistcount = signdao.getSignListCount(); // ÃÑ ¸®½ºÆ® ¼ö ¹Þ¾Æ¿È
		sendsignlistcount = signdao.sendSendSignList(empno, page, limit, status); // ¸®½ºÆ® ¹Þ¾Æ¿È
		
}
