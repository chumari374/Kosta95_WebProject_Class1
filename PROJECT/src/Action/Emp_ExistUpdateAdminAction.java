package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberInfoDAO;

public class Emp_ExistUpdateAdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO ();
		System.out.println(request.getParameter("empno"));
		int result = dao.MemberInfoDelete(Integer.parseInt(request.getParameter("empno")));
		System.out.println(result);
		forward.setRedirect(true);
		forward.setPath("MemberDelete.admin");
		return forward;
	}

}
