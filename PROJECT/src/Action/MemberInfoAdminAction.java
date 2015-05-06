package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;


public class MemberInfoAdminAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		
		int num = Integer.parseInt(request.getParameter("empno"));

		MemberInfoDTO member = dao.getMemberInfo(num);
		request.setAttribute("member", member);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Emp_Info_Admin.jsp");
		return forward;
	}

}