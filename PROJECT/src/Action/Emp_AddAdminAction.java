package Action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Domain_SetDAO;
import DAO.EmpDAO;
import DAO.MemberInfoDAO;
import DTO.Domain_SetDTO;
import DTO.EmpDTO;
import DTO.MemberInfoDTO;

public class Emp_AddAdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO ();
		MemberInfoDTO dto = new MemberInfoDTO();
		
		EmpDAO Empdao = new EmpDAO();
		EmpDTO Empdto = new EmpDTO();
		Empdto.setEmpno(Integer.parseInt(request.getParameter("empno")));
		Empdto.setEname(request.getParameter("ename"));
		Empdto.setAdmin(request.getParameter("admin"));
		Empdto.setDeptcode(Integer.parseInt(request.getParameter("dept")));
		Empdto.setTeamcode(Integer.parseInt(request.getParameter("team")));
		Empdto.setGrade(Integer.parseInt(request.getParameter("grade")));
		
		Domain_SetDAO domain_setdao = new Domain_SetDAO();
		Domain_SetDTO domain_setdto = new Domain_SetDTO();
		domain_setdto.setEmpno(Integer.parseInt(request.getParameter("empno")));
		domain_setdto.setEmptel(request.getParameter("emptel"));
		domain_setdto.setSex(request.getParameter("sex"));
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		domain_setdto.setBirth(new Date(year-1900, month-1, day));
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		System.out.println("teamcode : " + Integer.parseInt(request.getParameter("team")));
		System.out.println("teamcode : " + Integer.parseInt(request.getParameter("team"))%1000);
		System.out.println("grade : " + Integer.parseInt(request.getParameter("grade")));
		
		if(Integer.parseInt(request.getParameter("grade"))==1){
			out.println("<script>");
	   		out.println("alert('fail : head of our company is only steve hong !!!');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("team"))%1000 !=0 && Integer.parseInt(request.getParameter("grade"))==2){
	   		out.println("<script>");
	   		out.println("alert('fail : head of department does not have a team...');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("team"))%1000 ==0 && Integer.parseInt(request.getParameter("grade"))!=2){
	   		out.println("<script>");
	   		out.println("alert('fail : sorry error...');"); //~~부장으로 팀 이름이 끝나는데 직급이 부장이 아닐경우
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		if(Integer.parseInt(request.getParameter("dept"))==100 && Integer.parseInt(request.getParameter("grade"))!=1){
	   		out.println("<script>");
	   		out.println("alert('fail : sorry error...');"); //부서가 대표이사인데 직급이 대표이사가 아닐경우
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}

		//사원이 아닐경우
		if(Integer.parseInt(request.getParameter("grade"))!=4){
			int count = Empdao.EmpCount(Empdto);
			System.out.println(count);
			if(count==1){
		   		out.println("<script>");
		   		out.println("alert('fail : same rank employee exist...');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
			
			int result = Empdao.EmpInsert(Empdto);
			int result2 = 0;
			if(result==1){
				result2 = domain_setdao.Domain_SetInsert(domain_setdto);
			}
			
			if(result!=1){
				
		   		
		   		out.println("<script>");
		   		out.println("alert('fail');");
		   		out.println("history.go(-1);");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
			
			out.println("<script>");
	   		out.println("alert('Success');");
	   		out.println("</script>");
			
	   		forward.setRedirect(true);
			forward.setPath("MemberDelete.admin");
			return forward;
		}
		//사원
		int result = Empdao.EmpInsert(Empdto);
		int result2 = 0;
		if(result==1){
			result2 = domain_setdao.Domain_SetInsert(domain_setdto);
		}else{
			
	   		
	   		out.println("<script>");
	   		out.println("alert('fail');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		out.println("<script>");
   		out.println("alert('Success');");
   		out.println("</script>");
		
		forward.setRedirect(true);
		forward.setPath("MemberDelete.admin");
		return forward;
	}

}
