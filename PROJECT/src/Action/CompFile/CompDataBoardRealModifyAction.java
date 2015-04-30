package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardRealModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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
			boarddto.setTitle(request.getParameter("BOARD_TITLE"));
			boarddto.setContent(request.getParameter("BOARD_CONTENT"));
			boarddto.setNum((Integer.parseInt(request.getParameter("BOARD_NUM"))));

			result=boarddao.Modify(boarddto);

			if(result==0){

				out.println("<script>");
				out.println("alert('게시판 수정 실패.');");
				out.println("</script>");

				System.out.println("게시판 수정 실패");
				forward.setRedirect(true);
				forward.setPath("./CompBoardList.cp");
				return forward;
			}

			out.println("<script>");
			out.println("alert('게시판 수정 성공');");
			out.println("</script>");

			System.out.println("게시판 수정 완료");

			forward.setRedirect(false);
			forward.setPath("./CompBoardList.cp");
			
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
