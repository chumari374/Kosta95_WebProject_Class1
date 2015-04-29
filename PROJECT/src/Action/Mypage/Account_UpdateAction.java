package Action.Mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.AccountsDAO;
import DTO.AccountsDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Account_UpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = request.getRealPath("upload");
		System.out.println("--:"+path);
		
		MultipartRequest multi =  new MultipartRequest(
	      	      request, //jsp������ request(��û��ü) ������ 
	      	      path , // ������ (������ ���)
	      	      10*1024*1024 , //����ũ��(�ѹ��� ���ε� �Ҽ� �ִ� ������ ũ��)10M 
	      	      "utf-8", //���ڵ� ó�� (�ѱ�)
	      	      new DefaultFileRenamePolicy() //���ϸ� �ߺ�ó�� ��ü ���
	      	      );
		String file = (String)multi.getFileNames().nextElement();
		String p_picture = multi.getFilesystemName(file);
		
		ActionForward forward = new ActionForward();
		AccountsDAO dao = new AccountsDAO();
		HttpSession session = request.getSession();
		AccountsDTO dto = new AccountsDTO();
		dto.setPwd(multi.getParameter("pwd"));
		dto.setEmail(multi.getParameter("email"));
		dto.setAddr(multi.getParameter("addr"));
		dto.setCelphone(multi.getParameter("celphone"));
		dto.setP_picture(p_picture);
		dto.setP_content(multi.getParameter("p_content"));
		int result = dao.AccountUpdate((int)session.getAttribute("empno"),dto);
		System.out.println(result);
		
		if(result==0){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('�����߽��ϴ�');");
	   		out.println("history.go(-1);");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		forward.setRedirect(false);
		forward.setPath("Main.jsp");
		return forward;
	}
	
}
