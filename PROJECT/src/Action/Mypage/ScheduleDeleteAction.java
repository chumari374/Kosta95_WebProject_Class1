package Action.Mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.ScheduleDAO;

public class ScheduleDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ScheduleDAO dao = new ScheduleDAO();
		int scnum = Integer.parseInt(request.getParameter("scnum"));
		
		int result = dao.ScheduleDelete(scnum);
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
