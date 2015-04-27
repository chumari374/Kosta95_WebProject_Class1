package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountsDAO;

public class Check_EmpnoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AccountsDAO dao = new AccountsDAO();
		ActionForward forward = new ActionForward();
		int empno = Integer.parseInt(request.getParameter("empno"));
		boolean isExistEmpno = dao.isExistEmpno(empno);
		if(isExistEmpno){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
		   		out.println("alert('존재하는 사원번호입니다.');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
	   		
		}else{
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
		   		out.println("alert('사용 가능한 사원번호입니다.');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
