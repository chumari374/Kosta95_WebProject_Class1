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
		AccountsDAO dao = new AccountsDAO(); //���������� ������ dao
		
		MemberInfoDAO dao2 = new MemberInfoDAO(); //���������� ������ ���� dao2
		MemberInfoDTO dto = dao2.getMemberInfo(empno); //���������� ���� dto
		
		System.out.println("empno/"+empno);
		String pwd = request.getParameter("pwd");
		boolean loginCheck = dao.loginCheck(empno, pwd); //��ġȮ�� �Լ�
		
		if(loginCheck==false){ // false (��ġ���� ������)
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('����� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
	   		out.println("location.href='Login.jsp';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		// true (��ġ�ϸ�)
		EmpDTO emp = dao.getEmp(empno);//���������� ���� ������� ����
		
		HttpSession session = request.getSession();//������ �޾ƿ�
		//�ʿ��� �������� ����
		session.setAttribute("empno", emp.getEmpno());
		session.setAttribute("ename", emp.getEname());
		session.setAttribute("teamcode", emp.getTeamcode());
		String teamName = dto.getTeamname();
		switch (teamName) {
		case "������":
			session.setAttribute("teamname", "dev");
			break;
		case "�ַ����":
			session.setAttribute("teamname", "sol");
			break;
		case "�渮��":
			session.setAttribute("teamname", "acc");
			break;
		case "�濵��":
			session.setAttribute("teamname", "manage");
			break;
		case "�λ���":
			session.setAttribute("teamname", "person");
			break;
		case "����濵��":
			session.setAttribute("teamname", "tec_mg");
			break;
		case "A/S��":
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
		forward.setPath("SubMain.jsp"); //SubMain.jsp�� forward
		return forward;
	}
}
