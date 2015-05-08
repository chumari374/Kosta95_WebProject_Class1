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
		boolean mailcheck = false; //�궗踰덇낵 �씠硫붿씪 �씪移섑븯�뒗吏� 李�,嫄곗쭞 蹂��닔
		
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		
		int empno = Integer.parseInt(request.getParameter("empno")); //�궗踰�
		String email = request.getParameter("email"); //�씠硫붿씪
		mailcheck = dao.isEmail(empno, email); // �궗踰덇낵 �씠硫붿씪�쓣 �솗�씤�븯�뒗 �븿�닔(return : boolean)
		
		if(mailcheck==false){ //false(留욎��븡�떎硫�)
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('사원번호와 이메일이 일치하지 않습니다.');");
	   		out.println("location.href='Pwd_Search.jsp';"); //�떎�떆 鍮꾨�踰덊샇 李얘린 �럹�씠吏�濡� �씠�룞
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		// true硫�...
		AccountsDTO account = dao.pwd_search(empno); //�궗踰덉쓽 怨꾩젙 媛앹껜 李얘린
		//System.out.println("account="+account);
		
		new NaverMailTest().sendmail(account); //硫붿씪諛쒖넚
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp"); //硫붿씪 諛쒖넚�썑�뿉 濡쒓렇�씤�럹�씠吏�濡� 由щ떎�씠�젆�듃 
		return forward;
	}

}
