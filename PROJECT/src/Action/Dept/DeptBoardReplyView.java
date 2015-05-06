package Action.Dept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;
import DTO.C_BrdDTO;
import DTO.D_BrdDTO;

public class DeptBoardReplyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	 	ActionForward forward = new ActionForward();
	 	
		D_BrdDAO boarddao=new D_BrdDAO();
   		D_BrdDTO boarddata=new D_BrdDTO();
   		
   		int num=Integer.parseInt(request.getParameter("num"));
   		
   		boarddata=boarddao.getDetail(num);
   		
   		if(boarddata==null){
   			System.out.println("답글 페이지 이동 실패");
   			return null;
   		}
   		System.out.println("답글 페이지 이동 완료");
   		
   		request.setAttribute("boarddata", boarddata);
   		
   		forward.setRedirect(false);
//   	forward.setPath("./board/qna_board_reply.jsp");
   		forward.setPath("./Dept/Dept_Board/Dept_Board_Reply.jsp");
   		return forward;
	}

}
