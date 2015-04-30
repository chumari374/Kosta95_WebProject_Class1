package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.AccountsDAO;
import DTO.AccountsDTO;

public class RegisterAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = request.getRealPath("upload");
		String path2 = "\\\\192.168.7.235\\Upload";
		System.out.println("--:"+path);
		
		MultipartRequest multi =  new MultipartRequest(
	      	      request, //jsp������ request(��û��ü) ������ 
	      	      path2 , // ������ (������ ���)
	      	      10*1024*1024 , //����ũ��(�ѹ��� ���ε� �Ҽ� �ִ� ������ ũ��)10M 
	      	      "utf-8", //���ڵ� ó�� (�ѱ�)
	      	      new DefaultFileRenamePolicy() //���ϸ� �ߺ�ó�� ��ü ���
	      	      );
		String file = (String)multi.getFileNames().nextElement();
		String p_picture = multi.getFilesystemName(file);
		
		AccountsDAO dao = new AccountsDAO();
		AccountsDTO account = new AccountsDTO();
		ActionForward forward = new ActionForward();
		
		int empno = Integer.parseInt(multi.getParameter("empno"));
		String pwd = multi.getParameter("pwd");
		String email = multi.getParameter("email");
		String addr = multi.getParameter("addr");
		String celphone = multi.getParameter("celphone");
		String p_content = multi.getParameter("p_content");
		
		account.setEmpno(empno);
		account.setPwd(pwd);
		account.setEmail(email);
		account.setAddr(addr);
		account.setCelphone(celphone);
		account.setP_picture(p_picture);
		account.setP_content(p_content);
		
		int result = dao.AccountsInsert(account);
		System.out.println(result);
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp");
		return forward;
	}

}
