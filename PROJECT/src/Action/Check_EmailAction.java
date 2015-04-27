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
			try {
				System.out.println("도착2");
				out = response.getWriter();
				out.println("<script>");
		   		out.println("alert('존재하는 이메일입니다.');");
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
				System.out.println("도착3");
				out = response.getWriter();
				out.println("<script>");
		   		out.println("alert('사용 가능한 이메일입니다.');");
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
