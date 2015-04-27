package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountsDAO;
import DTO.EmpDTO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		String pwd = request.getParameter("pwd");
		boolean loginCheck = dao.loginCheck(empno, pwd);
		
		if(loginCheck==false){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('사원번호와 비밀번호가 일치하지 않습니다.');");
	   		out.println("location.href='Login.jsp';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		EmpDTO emp = dao.getEmp(empno);
		HttpSession session = request.getSession();
		session.setAttribute("empno", emp.getEmpno());
		session.setAttribute("ename", emp.getEname());
		session.setAttribute("teamcode", emp.getTeamcode());
		session.setAttribute("teamname", emp.getTeamname());
		session.setAttribute("deptcode", emp.getDeptcode());
		session.setAttribute("grade", emp.getGrade());
		
		forward.setRedirect(false);
		forward.setPath("Main.jsp");
		return forward;
	}

}
