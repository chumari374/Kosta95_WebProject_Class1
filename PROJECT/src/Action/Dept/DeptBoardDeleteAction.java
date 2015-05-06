package Action.Dept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;

public class DeptBoardDeleteAction implements Action {

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
		   	
		   	D_BrdDAO boarddao=new D_BrdDAO();
		   	usercheck=boarddao.isboardWriter(num, empno);
		   	
		   	if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('������ ������ �����ϴ�.');");
		   		out.println("location.href='./DeptBoardList.dp';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
		   	
		   	result=boarddao.Delete(num);
		   	if(result==false){
		   		System.out.println("�Խ��� ���� ����");
		   		return null;
		   	}
		   	
		   	System.out.println("�Խ��� ���� ����");
		   	forward.setRedirect(true);
	   		forward.setPath("./DeptBoardList.dp");
	   		return forward;
	}

}
