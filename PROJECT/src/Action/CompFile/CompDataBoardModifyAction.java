package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;

public class CompDataBoardModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		 ActionForward forward = new ActionForward();
		 
		 HttpSession session = request.getSession();
		 int empno = (Integer)session.getAttribute("empno");
		 
		 int num=Integer.parseInt(request.getParameter("num"));
		 
		 C_DbrdDAO boarddao = new C_DbrdDAO();
		 
		 boolean usercheck = boarddao.isboardWriter(num, empno);
		 
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./CompDataBoardList.cf';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		forward.setRedirect(false);
	   	forward.setPath("./CompDataBoardModifyView.cf");
		return forward;
	}

}
