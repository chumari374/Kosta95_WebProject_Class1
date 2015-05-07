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
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		
		dto.setDeptcode(Integer.parseInt(request.getParameter("deptcode")));
		dto.setTeamcode(Integer.parseInt(request.getParameter("teamcode")));
		dto.setGrade(Integer.parseInt(request.getParameter("grade")));
		dto.setEmptel(request.getParameter("emptel"));
		
		System.out.println("teamcode : " + Integer.parseInt(request.getParameter("teamcode")));
		System.out.println("teamcode : " + Integer.parseInt(request.getParameter("teamcode"))%1000);
		System.out.println("grade : " + Integer.parseInt(request.getParameter("grade")));
		
		if(Integer.parseInt(request.getParameter("grade"))==1){
			out.println("<script>");
	   		out.println("alert('fail : head of our company is only steve hong !!!');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("teamcode"))%1000 !=0 && Integer.parseInt(request.getParameter("grade"))==2){
	   		out.println("<script>");
	   		out.println("alert('fail : head of department does not have a team...');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("teamcode"))%1000 ==0 && Integer.parseInt(request.getParameter("grade"))!=2){
	   		out.println("<script>");
	   		out.println("alert('fail : sorry error...');"); //~~부장으로 팀 이름이 끝나는데 직급이 부장이 아닐경우
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("deptcode"))==100 && Integer.parseInt(request.getParameter("grade"))!=1){
	   		out.println("<script>");
	   		out.println("alert('fail : sorry error...');"); //부서가 대표이사인데 직급이 대표이사가 아닐경우
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}

		if(Integer.parseInt(request.getParameter("grade"))!=4){
			int count = dao.MemberCount(dto);
			System.out.println(count);
			if(count==1){
		   		out.println("<script>");
		   		out.println("alert('fail : same rank employee exist...');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
			
			int result = dao.MemberInfoUpdate(Integer.parseInt(request.getParameter("empno")),dto);
			
			if(result!=2){
				
		   		
		   		out.println("<script>");
		   		out.println("alert('fail');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
			
			out.println("<script>");
	   		out.println("alert('Success');");
	   		out.println("window.close();");
	   		out.println("</script>");
			
			/*forward.setRedirect(true);
			forward.setPath("SubMain.jsp");*/
			return null;
		}
		
//		System.out.println("deptcode" + request.getParameter("deptcode"));
//		System.out.println("사번 : "+Integer.parseInt(request.getParameter("empno")));
		int result = dao.MemberInfoUpdate(Integer.parseInt(request.getParameter("empno")),dto);
		
		if(result!=2){
			
	   		
	   		out.println("<script>");
	   		out.println("alert('fail');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		out.println("<script>");
   		out.println("alert('Success');");
   		out.println("window.close();");
   		out.println("</script>");
		
		/*forward.setRedirect(true);
		forward.setPath("SubMain.jsp");*/
		return null;
	}
	
}
