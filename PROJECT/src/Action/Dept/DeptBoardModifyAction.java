package Action.Dept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DTO.C_BrdDTO;

public class DeptBoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		 request.setCharacterEncoding("utf-8");
		 ActionForward forward = new ActionForward();
		 
		 HttpSession session = request.getSession();
		 int empno = (Integer)session.getAttribute("empno");
	//	 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("num"));
		 
		 C_BrdDAO boarddao=new C_BrdDAO();
	//	 C_BrdDTO boarddata=new C_BrdDTO();
		 
		 boolean usercheck=boarddao.isboardWriter(num, empno);
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./CompBoardList.cp';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		forward.setRedirect(false);
	   	forward.setPath("./CompBoardModifyView.cp");
		return forward;
	}

}
