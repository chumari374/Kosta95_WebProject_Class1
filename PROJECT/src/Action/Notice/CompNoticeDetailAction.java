package Action.Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_N_BrdDAO;
import DTO.C_N_BrdDTO;

public class CompNoticeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
   		
		C_N_BrdDAO boarddao=new C_N_BrdDAO();
	   	C_N_BrdDTO boarddata=new C_N_BrdDTO();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		boarddao.setReadCountUpdate(num);
	   	boarddata=boarddao.getDetail(num);
	   	
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
	   	forward.setPath("./Comp/Comp_Notice/Comp_Notice_View.jsp");
   		return forward;
	}

}
