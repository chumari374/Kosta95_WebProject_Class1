package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountsDAO;
import DAO.MemberInfoDAO;
import DTO.EmpDTO;
import DTO.MemberInfoDTO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int empno = Integer.parseInt(request.getParameter("empno"));
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO(); //계정정보를 추출할 dao
		
		MemberInfoDAO dao2 = new MemberInfoDAO(); //세션정보를 추출을 위한 dao2
		MemberInfoDTO dto = dao2.getMemberInfo(empno); //세션정보를 담을 dto
		
		System.out.println("empno/"+empno);
		String pwd = request.getParameter("pwd");
		boolean loginCheck = dao.loginCheck(empno, pwd); //일치확인 함수
		
		if(loginCheck==false){ // false (일치하지 않으면)
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('사번과 비밀번호가 일치하지 않습니다.');");
	   		out.println("location.href='Login.jsp';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		// true (일치하면)
		EmpDTO emp = dao.getEmp(empno);//세션정보를 담을 사원정보 추출
		
		HttpSession session = request.getSession();//세션을 받아옴
		//필요한 세션정보 설정
		session.setAttribute("empno", emp.getEmpno());
		session.setAttribute("ename", emp.getEname());
		session.setAttribute("teamcode", emp.getTeamcode());
		String teamName = dto.getTeamname();
		switch (teamName) {
		case "외주팀":
			session.setAttribute("teamname", "dev");
			break;
		case "솔루션팀":
			session.setAttribute("teamname", "sol");
			break;
		case "경리팀":
			session.setAttribute("teamname", "acc");
			break;
		case "경영팀":
			session.setAttribute("teamname", "manage");
			break;
		case "인사팀":
			session.setAttribute("teamname", "person");
			break;
		case "기술경영팀":
			session.setAttribute("teamname", "tec_mg");
			break;
		case "A/S팀":
			session.setAttribute("teamname", "AS");
			break;
		default:
			session.setAttribute("teamname", "chief");
			break;
		}
		//session.setAttribute("teamname", dto.getTeamname());
		session.setAttribute("deptcode", emp.getDeptcode());
		session.setAttribute("grade", emp.getGrade());
		session.setAttribute("admin", emp.getAdmin());
		session.setAttribute("p_picture", dto.getP_picture());
		
		//String host = request.getRemoteHost();
		//System.out.println(host);
		
		forward.setRedirect(false);
		forward.setPath("SubMain.jsp"); //SubMain.jsp로 forward
		return forward;
	}
}
