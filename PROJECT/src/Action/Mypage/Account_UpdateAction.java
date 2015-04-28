package Action.Mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.AccountsDAO;
import DTO.AccountsDTO;

public class Account_UpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		HttpSession session = request.getSession();
		AccountsDTO dto = new AccountsDTO();
		dto.setPwd(request.getParameter("pwd"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddr(request.getParameter("addr"));
		dto.setCelphone(request.getParameter("celphone"));
		dto.setP_picture(request.getParameter("p_picture"));
		dto.setP_content(request.getParameter("p_content"));
		int result = dao.AccountUpdate((int)session.getAttribute("empno"),dto);
		System.out.println(result);
		
		if(result==0){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('실패했습니다');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		forward.setRedirect(false);
		forward.setPath("Main.jsp");
		return forward;
	}
	
}
