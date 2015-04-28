package Action.Mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.MemberInfoDAO;

public class Accounts_EditAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO();
		return null;
	}
	
}
