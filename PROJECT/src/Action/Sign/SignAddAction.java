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
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
			
			HttpSession session = request.getSession();
			
			signdata.setStarter((int) session.getAttribute("STARTER"));
			signdata.setEmpno((int) session.getAttribute("EMPNO"));
			signdata.setGetsign(Integer.parseInt(multi.getParameter("GETSIGN")));
			signdata.setTitle(multi.getParameter("TITLE")); // ����
			signdata.setContent(multi.getParameter("CONTENT")); // ����
			signdata.setRef(Integer.parseInt(multi.getParameter("REF")));
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
			forward.setPath("getSignList.hong");
			return forward;
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
