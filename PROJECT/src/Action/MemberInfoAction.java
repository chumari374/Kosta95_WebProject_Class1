package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;


public class MemberInfoAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		
		int num = Integer.parseInt(request.getParameter("empno"));

		MemberInfoDTO member = dao.getMemberInfo(num);
		//HttpSession session = request.getSession();
		request.setAttribute("empno", member.getEmpno());
		request.setAttribute("ename", member.getEname());
		request.setAttribute("celphone", member.getCelphone());
		request.setAttribute("email", member.getEmail());
		request.setAttribute("deptname", member.getDeptname());
		request.setAttribute("teamname", member.getTeamname());
		request.setAttribute("gradename", member.getGradename());
		request.setAttribute("emptel", member.getEmptel());
		request.setAttribute("p_picture", member.getP_picture());
		request.setAttribute("p_content", member.getP_content());

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Emp_Info.jsp");
		return forward;
	}

}
