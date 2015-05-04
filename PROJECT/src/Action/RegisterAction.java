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
		String path2 = "\\\\192.168.7.235\\Upload"; // 저장경로 설정
		System.out.println("--:"+path);
		
		//파일업로드 위한 MultipartRequest 객체 생성
		MultipartRequest multi =  new MultipartRequest(
	      	      request, //jsp가지는 request(요청객체) 얻어오기 
	      	      path2 , // 저장경로 (물리적 경로)
	      	      10*1024*1024 , //파일크기(한번에 업로드 할수 있는 파일의 크기)10M 
	      	      "utf-8", //인코딩 처리 (한글)
	      	      new DefaultFileRenamePolicy() //파일명 중복처리 객체 사용
	      	      );
		String file = (String)multi.getFileNames().nextElement();//파일이름들의 다음 엘리멘트
		String p_picture = multi.getFilesystemName(file);//파일의 이름:따로추출
		
		AccountsDAO dao = new AccountsDAO();
		AccountsDTO account = new AccountsDTO();
		ActionForward forward = new ActionForward();
		
		//파라메터 값을 변수에 담음
		int empno = Integer.parseInt(multi.getParameter("empno"));
		String pwd = multi.getParameter("pwd");
		String email = multi.getParameter("email");
		String addr = multi.getParameter("addr");
		String celphone = multi.getParameter("celphone");
		String p_content = multi.getParameter("p_content");
		
		//account 객체에 설정
		account.setEmpno(empno);
		account.setPwd(pwd);
		account.setEmail(email);
		account.setAddr(addr);
		account.setCelphone(celphone);
		account.setP_picture(p_picture);
		account.setP_content(p_content);
		
		int result = dao.AccountsInsert(account);//account 객체를 테이블에 삽입
		System.out.println(result);
		
		forward.setRedirect(true);
		forward.setPath("Login.jsp"); //로그인페이지로 리다이렉트
		return forward;
	}

}
