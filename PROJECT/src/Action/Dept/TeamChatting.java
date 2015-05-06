package Action.Dept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;

public class TeamChatting implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String team = request.getParameter("teamname");
		request.setAttribute("team", team);
		forward.setRedirect(false);
		forward.setPath("chatting/client.html"); //SubMain.jsp·Î forward
		return forward;
	}

}
