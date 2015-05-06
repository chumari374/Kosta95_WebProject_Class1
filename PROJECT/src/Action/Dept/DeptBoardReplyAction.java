package Action.Dept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;
import DTO.C_BrdDTO;
import DTO.D_BrdDTO;

public class DeptBoardReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	 	request.setCharacterEncoding("utf-8");
	 	ActionForward forward = new ActionForward();
	 	
		D_BrdDAO boarddao=new D_BrdDAO();
   		D_BrdDTO boarddata=new D_BrdDTO();
   		int result=0;
   		int deptcode = (Integer)request.getSession().getAttribute("deptcode");
   		
   		boarddata.setNum(Integer.parseInt(request.getParameter("BOARD_NUM")));
   		boarddata.setEmpno(Integer.parseInt(request.getParameter("BOARD_ID")));
   		boarddata.setTitle(request.getParameter("BOARD_TITLE"));
   		boarddata.setContent(request.getParameter("BOARD_CONTENT"));
   		boarddata.setRef(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
   		boarddata.setStep(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
   		boarddata.setDpth(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
   		boarddata.setEname((String)(request.getSession().getAttribute("ename")));
   		
   		result=boarddao.boardReply(boarddata , deptcode);
   		if(result==0){
   			System.out.println("답장 실패");
   			return null;
   		}
   		System.out.println("답장 완료");
   		
   		forward.setRedirect(false);
   		forward.setPath("./DeptBoardList.dp");
   		return forward;
	}

}
