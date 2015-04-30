package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardRealModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path2 = "\\\\192.168.7.235\\Upload";
		System.out.println("--:"+path2);
		
		MultipartRequest multi =  new MultipartRequest(
	      	      request, //jsp가지는 request(요청객체) 얻어오기 
	      	      path2 , // 저장경로 (물리적 경로)
	      	      10*1024*1024 , //파일크기(한번에 업로드 할수 있는 파일의 크기)10M 
	      	      "utf-8", //인코딩 처리 (한글)
	      	      new DefaultFileRenamePolicy() //파일명 중복처리 객체 사용
	      	      );
		String file = (String)multi.getFileNames().nextElement();
		String p_picture = multi.getFilesystemName(file);
		
		HttpSession session = request.getSession();
		C_DbrdDAO boarddao = new C_DbrdDAO();
		C_DbrdDTO boarddto = new C_DbrdDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int result = 0;
		PrintWriter out = response.getWriter();

		try{

			boarddto.setEmpno((int)session.getAttribute("empno"));
			boarddto.setTitle(multi.getParameter("BOARD_TITLE"));
			boarddto.setContent(multi.getParameter("BOARD_CONTENT"));
			boarddto.setNum((Integer.parseInt(multi.getParameter("BOARD_NUM"))));
			boarddto.setData(p_picture);
			System.out.println(p_picture);

			result=boarddao.Modify(boarddto);

			if(result==0){

				out.println("<script>");
				out.println("alert('게시판 수정 실패.');");
				out.println("</script>");

				System.out.println("게시판 수정 실패");
				forward.setRedirect(true);
				forward.setPath("./CompDataBoardList.cf");
				return forward;
			}

			out.println("<script>");
			out.println("alert('게시판 수정 성공');");
			out.println("</script>");

			System.out.println("게시판 수정 완료");

			forward.setRedirect(false);
			forward.setPath("./CompDataBoardList.cf");
			
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
