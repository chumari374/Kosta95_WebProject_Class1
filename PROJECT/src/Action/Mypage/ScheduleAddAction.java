package Action.Mypage;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.ScheduleDAO;
import DTO.ScheduleDTO;

public class ScheduleAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScheduleDAO dao = new ScheduleDAO();
		ScheduleDTO dto = new ScheduleDTO();
		HttpSession session = request.getSession();
		Enumeration<String> paranames = request.getParameterNames();
		int i=1;
		while(paranames.hasMoreElements()){
			System.out.println(i+":"+paranames.nextElement());
			i++;
		}
		String startDate = request.getParameter("sd");
		String[] startDt = startDate.split("-");
		String endDate = request.getParameter("ed");
		String[] endDt = endDate.split("-");
		String title = request.getParameter("cal[title]");
		
		int empno = (int)session.getAttribute("empno");
		dto.setEmpno(empno);
		dto.setStartdate(new Date(Integer.parseInt(startDt[0]),Integer.parseInt(startDt[1])-1,Integer.parseInt(startDt[2])));
		dto.setEnddate(new Date(Integer.parseInt(endDt[0]),Integer.parseInt(endDt[1])-1,Integer.parseInt(endDt[2])));
		dto.setTitle(title);
		int result = dao.ScheduleAdd(dto);
		if(result>0){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.print(result);
	   		out.close();
	   		return null;
		}else{
	   		return null;
		}
		
	}

}
