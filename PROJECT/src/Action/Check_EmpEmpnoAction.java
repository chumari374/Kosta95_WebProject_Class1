package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmpDAO;

public class Check_EmpEmpnoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		EmpDAO dao = new EmpDAO();
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
	   		
		}else{ //존재하지 않으면 "empno" 출력
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
