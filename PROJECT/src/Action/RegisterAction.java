package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountsDAO;
import DTO.AccountsDTO;

public class RegisterAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AccountsDAO dao = new AccountsDAO();
		AccountsDTO account = new AccountsDTO();
		ActionForward forward = new ActionForward();
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String celphone = request.getParameter("celphone");
		String p_picture = request.getParameter("p_picture");
		String p_content = request.getParameter("p_content");
		
		account.setEmpno(empno);
		account.setPwd(pwd);
		account.setEmail(email);
		account.setAddr(addr);
		account.setCelphone(celphone);
		account.setP_picture(p_picture);
		account.setP_content(p_content);
		
		int result = dao.AccountsInsert(account);
		System.out.println(result);
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp");
		return forward;
	}

}
