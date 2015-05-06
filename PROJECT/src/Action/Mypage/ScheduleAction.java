package Action.Mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.ScheduleDAO;
import DTO.ScheduleDTO;

public class ScheduleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScheduleDAO dao = new ScheduleDAO();
		HttpSession session = request.getSession();
		List<ScheduleDTO> list = dao.scheduleList();
		System.out.println(list);
		
		session.setAttribute("list", list);
		forward.setRedirect(false);
		forward.setPath("MyPage/Schedule.jsp");
		return forward;
	}

}
