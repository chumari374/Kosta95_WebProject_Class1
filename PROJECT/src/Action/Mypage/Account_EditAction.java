package Action.Mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;

public class Account_EditAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO();
		HttpSession session = request.getSession();
		MemberInfoDTO dto = dao.getMemberInfo((int)session.getAttribute("empno"));
		
		request.setAttribute("account", dto);
		forward.setRedirect(false);
		forward.setPath("MyPage/Account_Edit.jsp");
		return forward;
	}
	
}
