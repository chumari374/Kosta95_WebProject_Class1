package Action.Notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.C_N_BrdDAO;

public class CompNoticeDeleteAction implements Action {

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
		   	
		   	C_N_BrdDAO boarddao=new C_N_BrdDAO();
		   	usercheck=boarddao.isboardWriter(num, empno);
		   	
		   	if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('������ ������ �����ϴ�.');");
		   		out.println("location.href='./CompNoticeList.cn';");
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
	   		forward.setPath("./CompNoticeList.cn");
	   		return forward;
	}

}
