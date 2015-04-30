package Action.Mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.AccountsDAO;
import DAO.MemberInfoDAO;
import DTO.AccountsDTO;
import DTO.MemberInfoDTO;

public class Account_EditAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberInfoDAO infodao = new MemberInfoDAO();
		AccountsDAO accountdao = new AccountsDAO();
		HttpSession session = request.getSession();
		MemberInfoDTO infodto = infodao.getMemberInfo((int)session.getAttribute("empno"));
		AccountsDTO accountdto = accountdao.pwd_search((int)session.getAttribute("empno"));
		
		request.setAttribute("memberInfo", infodto);
		request.setAttribute("account", accountdto);
		forward.setRedirect(false);
		forward.setPath("MyPage/Account_Edit.jsp");
		return forward;
	}
	
}
