package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountsDAO;

public class Check_EmailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AccountsDAO dao = new AccountsDAO();
		ActionForward forward = new ActionForward();
		String email = request.getParameter("email");
		
		boolean isExistEmail = dao.isExistEmail(email);
		if(isExistEmail){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try { //존재하면 ""
				out = response.getWriter();
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
	   		
		}else{ //존재하지않으면 "email"출력
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println(email);
				
		   		out.close();
		   		return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
