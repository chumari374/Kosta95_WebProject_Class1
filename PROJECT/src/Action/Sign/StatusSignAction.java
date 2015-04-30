package Action.Sign;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;
import DTO.SignDTO;

public class StatusSignAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("스테이터스 액션 도달");
		
		int ref = Integer.parseInt(request.getParameter("ref"));
		int step = Integer.parseInt(request.getParameter("step"));
		String status = request.getParameter("status");
		SignDAO signdao = new SignDAO();
		
		System.out.println(ref);
		System.out.println(step);
		System.out.println(status);
		
		
		signdao.SignStatus(status, ref, step);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/getSignList.hong");
		return forward;
	}
}