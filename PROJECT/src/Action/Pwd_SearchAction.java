package Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountsDAO;
import DTO.AccountsDTO;
import etc.NaverMailTest;

public class Pwd_SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean mailcheck = false; //사번과 이메일 일치하는지 참,거짓 변수
		
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		
		int empno = Integer.parseInt(request.getParameter("empno")); //사번
		String email = request.getParameter("email"); //이메일
		mailcheck = dao.isEmail(empno, email); // 사번과 이메일을 확인하는 함수(return : boolean)
		
		if(mailcheck==false){ //false(맞지않다면)
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('사원번호와 이메일이 일치하지 않습니다.');");
	   		out.println("location.href='Pwd_Search.jsp';"); //다시 비밀번호 찾기 페이지로 이동
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		// true면...
		AccountsDTO account = dao.pwd_search(empno); //사번의 계정 객체 찾기
		//System.out.println("account="+account);
		
		new NaverMailTest().sendmail(account); //메일발송
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp"); //메일 발송후에 로그인페이지로 리다이렉트 
		return forward;
	}

}
