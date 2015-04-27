package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountsDAO;
import DTO.AccountsDTO;
import etc.NaverMailTest;

public class Pwd_SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean mailcheck = false;
		
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		String email = request.getParameter("email");
		mailcheck = dao.isEmail(empno, email);
		
		if(mailcheck==false){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('사원번호와 이메일이 일치하지 않습니다.');");
	   		out.println("location.href='Pwd_Search.jsp';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		AccountsDTO account = dao.pwd_search(empno);
		//System.out.println("account="+account);
		
		new NaverMailTest().sendmail(account);
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp");
		return forward;
	}

}
