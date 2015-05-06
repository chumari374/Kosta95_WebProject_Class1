package Action.Sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;
import DTO.SignDTO;

public class SignAddAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SignDAO signdao = new SignDAO();
		SignDTO signdata = new SignDTO();
		
		// ���� ���ε�
		String realFolder = "";
		String saveFolder = "SignUpload";
		
		int filesize = 10 * 1024 * 1024; // 10M
		realFolder =  "\\\\192.168.7.235\\Upload";
		
		boolean result = false;
		
		try {
			
			System.out.println(request.getParameter("STARTER"));
			
			System.out.println(realFolder);
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
			
			System.out.println(Integer.parseInt(multi.getParameter("STARTER")));
			System.out.println(Integer.parseInt(multi.getParameter("EMPNO")));
			System.out.println(Integer.parseInt(multi.getParameter("GETSIGN")));
			System.out.println(multi.getParameter("TITLE"));
			System.out.println(multi.getParameter("CONTENT"));
			System.out.println(Integer.parseInt(multi.getParameter("STEP")));
			System.out.println(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			signdata.setStarter(Integer.parseInt(multi.getParameter("STARTER")));
			signdata.setEmpno(Integer.parseInt(multi.getParameter("EMPNO")));
			signdata.setGetsign(Integer.parseInt(multi.getParameter("GETSIGN")));
			signdata.setTitle(multi.getParameter("TITLE")); // ����
			signdata.setContent(multi.getParameter("CONTENT")); // ����
			signdata.setStep(Integer.parseInt(multi.getParameter("STEP")));
			signdata.setStatus("���");
			signdata.setFile_sign(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result = signdao.SignStart(signdata);
			
			if (result == false) {
				System.out.println("Insert Fail");
				return null;
			}
			System.out.println("Insert success");
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("sendSignList.hong");
			return forward;
		}
		
		catch (Exception e) {
			System.out.println("�ʵ��ݾ� ��û��");
			e.printStackTrace();
		}
		
		return null;
	}
}
