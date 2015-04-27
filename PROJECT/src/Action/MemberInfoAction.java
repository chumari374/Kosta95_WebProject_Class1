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
		
		ActionForward forward = new ActionForward();
		MemberInfoDAO dao = new MemberInfoDAO();
		
		int empno = Integer.parseInt(request.getParameter("empno"));

		MemberInfoDTO member = dao.getMemberInfo(empno);
		HttpSession session = request.getSession();
		session.setAttribute("empno", member.getEmpno());
		session.setAttribute("ename", member.getEname());
		session.setAttribute("celphone", member.getCelphone());
		session.setAttribute("email", member.getEmail());
		session.setAttribute("deptname", member.getDeptname());
		session.setAttribute("teamname", member.getTeamname());
		session.setAttribute("gradename", member.getGradename());
		session.setAttribute("emptel", member.getEmptel());
		session.setAttribute("p_picture", member.getP_picture());
		session.setAttribute("p_content", member.getP_content());

		forward.setRedirect(true);
		forward.setPath("./Emp_Info.jsp");
		return forward;
	}

}
