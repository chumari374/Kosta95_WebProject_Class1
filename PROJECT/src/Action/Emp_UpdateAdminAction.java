package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;

public class Emp_UpdateAdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward=new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO ();
		MemberInfoDTO dto = new MemberInfoDTO();
		
		dto.setDeptcode(Integer.parseInt(request.getParameter("deptcode")));
		dto.setTeamcode(Integer.parseInt(request.getParameter("teamcode")));
		dto.setGrade(Integer.parseInt(request.getParameter("grade")));
		dto.setEmptel(request.getParameter("emptel"));
		
		System.out.println("deptcode" + request.getParameter("deptcode"));
		
		int result = dao.MemberInfoUpdate(Integer.parseInt(request.getParameter("empno")),dto);
		
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
		
		forward.setRedirect(true);
		forward.setPath("SubMain.jsp");
		return forward;
	}
	
}
