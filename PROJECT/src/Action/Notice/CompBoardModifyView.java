package Action.Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DTO.C_BrdDTO;

public class CompBoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
	 	request.setCharacterEncoding("utf-8");
   		
		C_BrdDAO boarddao=new C_BrdDAO();
	   	C_BrdDTO boarddata=new C_BrdDTO();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
	   	boarddata=boarddao.getDetail(num);
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	forward.setRedirect(false);
   		forward.setPath("./Comp/Comp_Board/Comp_Board_Modify.jsp");
   		return forward;
	}

}
