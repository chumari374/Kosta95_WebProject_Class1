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
		if(isExistEmpno){ //존재하면 ""
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try {
				out = response.getWriter();
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
	   		
		}else{ //존재하지않으면 "empno"출력
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try {
				out = response.getWriter();
		   		out.println(empno);
		   		
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
