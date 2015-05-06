package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;

public class Emp_EditAdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		
		int num = Integer.parseInt(request.getParameter("empno"));

		MemberInfoDTO member = dao.getMemberInfo(num);
		request.setAttribute("member", member);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Admin/Emp_Edit.jsp");
		return forward;
	}

}
