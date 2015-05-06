package Action.Comp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DTO.C_BrdDTO;

public class CompBoardReplyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	 	ActionForward forward = new ActionForward();
	 	
		C_BrdDAO boarddao=new C_BrdDAO();
   		C_BrdDTO boarddata=new C_BrdDTO();
   		
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
   		forward.setPath("./Comp/Comp_Board/Comp_Board_Reply.jsp");
   		return forward;
	}

}
