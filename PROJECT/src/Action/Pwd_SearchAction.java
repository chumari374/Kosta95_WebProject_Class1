package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.image.impl.IntArgb;

import etc.NaverMailTest;
import DAO.AccountsDAO;
import DTO.AccountsDTO;

public class Pwd_SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		//System.out.println("empno="+request.getParameter("empno"));
		int empno = Integer.parseInt(request.getParameter("empno"));
		
		AccountsDTO account = dao.pwd_search(empno);
		System.out.println("account="+account.toString());
		
		new NaverMailTest().sendmail(account);
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp");
		return null;
	}

}
