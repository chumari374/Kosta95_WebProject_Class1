package Action.Comp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DTO.C_BrdDTO;

public class CompBoardReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	 	request.setCharacterEncoding("utf-8");
	 	ActionForward forward = new ActionForward();
	 	
		C_BrdDAO boarddao=new C_BrdDAO();
   		C_BrdDTO boarddata=new C_BrdDTO();
   		int result=0;
   		
   		boarddata.setNum(Integer.parseInt(request.getParameter("BOARD_NUM")));
   		boarddata.setEmpno(Integer.parseInt(request.getParameter("BOARD_ID")));
   		boarddata.setTitle(request.getParameter("BOARD_TITLE"));
   		boarddata.setContent(request.getParameter("BOARD_CONTENT"));
   		boarddata.setRef(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
   		boarddata.setStep(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
   		boarddata.setDpth(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
   		boarddata.setEname((String)(request.getSession().getAttribute("ename")));
   		
   		result=boarddao.boardReply(boarddata);
   		if(result==0){
   			System.out.println("답장 실패");
   			return null;
   		}
   		System.out.println("답장 완료");
   		
   		forward.setRedirect(false);
   		forward.setPath("./CompBoardList.cp");
   		return forward;
	}

}
