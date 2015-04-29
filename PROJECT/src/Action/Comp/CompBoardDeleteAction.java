package Action.Comp;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;

public class CompBoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
			ActionForward forward = new ActionForward();
			request.setCharacterEncoding("utf-8");
			
			HttpSession session=request.getSession();
			int empno=(Integer)session.getAttribute("empno");
			
		   	boolean result=false;
		   	boolean usercheck=false;
		   	int num=Integer.parseInt(request.getParameter("num"));
		   	
		   	C_BrdDAO boarddao=new C_BrdDAO();
		   	usercheck=boarddao.isboardWriter(num, empno);
		   	
		   	if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('삭제할 권한이 없습니다.');");
		   		out.println("location.href='./CompBoardList.cp';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
		   	
		   	result=boarddao.Delete(num);
		   	if(result==false){
		   		System.out.println("게시판 삭제 실패");
		   		return null;
		   	}
		   	
		   	System.out.println("게시판 삭제 성공");
		   	forward.setRedirect(true);
	   		forward.setPath("./CompBoardList.cp");
	   		return forward;
	}

}
