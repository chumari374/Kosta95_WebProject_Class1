package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		C_DbrdDAO boarddao = new C_DbrdDAO();
		C_DbrdDTO boarddto = new C_DbrdDTO();
		ActionForward forward = new ActionForward();

		request.setCharacterEncoding("UTF-8");		   	
		response.setCharacterEncoding("UTF-8");
		int result=0;
		PrintWriter out = response.getWriter();
		System.out.println("도착1");
		try{
			boarddto.setEmpno((int)session.getAttribute("empno"));
			boarddto.setTitle(request.getParameter("BOARD_TITLE"));
			boarddto.setContent(request.getParameter("BOARD_CONTENT"));

			result=boarddao.C_dbrdInsert(boarddto);

			if(result==0){

				out.println("<script>");
				out.println("alert('게시판 등록 실패.');");
				out.println("</script>");

				System.out.println("게시판 등록 실패");
				forward.setRedirect(true);
				forward.setPath("./CompDataBoardList.cf");
				return forward;
			}

			out.println("<script>");
			out.println("alert('게시판 등록 성공');");
			out.println("</script>");

			System.out.println("게시판 등록 완료");

			forward.setRedirect(false);
			forward.setPath("./CompDataBoardList.cf");

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return forward;
	}

}
