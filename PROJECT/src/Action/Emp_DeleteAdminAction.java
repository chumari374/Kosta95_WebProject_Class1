package Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberInfoDAO;

public class Emp_DeleteAdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO();

		forward.setRedirect(false);
		forward.setPath("Admin/Emp_Delete.jsp");
		return forward;
	}

}
