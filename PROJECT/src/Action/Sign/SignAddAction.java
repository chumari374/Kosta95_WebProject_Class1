package Action.Sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		// 파일 업로드
		String realFolder = "";
		String saveFolder = "SignUpload";
		
		int filesize = 10 * 1024 * 1024; // 10M
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
			
			signdata.setTitle(multi.getParameter("TITLE")); // 제목
			signdata.setTitle(multi.getParameter("CONTENT")); // 내용
			signdata.setFile_sign(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result = signdao.Sign(sign, grade, deptcode, teamcode)
		}
		
	}
}
