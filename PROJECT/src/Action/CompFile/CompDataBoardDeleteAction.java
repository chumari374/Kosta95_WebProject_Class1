package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;

public class CompDataBoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
			ActionForward forward = new ActionForward();
			request.setCharacterEncoding("utf-8");
			
			HttpSession session=request.getSession();
			int empno=(Integer)session.getAttribute("empno");
			
		   	int result=0;
		   	boolean usercheck=false;
		   	int num=Integer.parseInt(request.getParameter("num"));
		   	
		   	C_DbrdDAO boarddao = new C_DbrdDAO();
		   	usercheck = boarddao.isboardWriter(num, empno);
		   	
		   	if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('삭제할 권한이 없습니다.');");
		   		out.println("location.href='./CompDataBoardList.cf';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
		   	
		   	result = boarddao.Delete(num);
		   	System.out.println(result);
		   	if(result==0){
		   		System.out.println("게시판 삭제 실패");
		   		return null;
		   	}
		   	
		   	System.out.println("게시판 삭제 성공");
		   	forward.setRedirect(true);
	   		forward.setPath("./CompDataBoardList.cf");
	   		return forward;
	}

}
