package Action.CompFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardModifyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
	 	request.setCharacterEncoding("utf-8");
   		
		C_DbrdDAO boarddao = new C_DbrdDAO();
	   	C_DbrdDTO boarddata = new C_DbrdDTO();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
	   	boarddata = boarddao.getDetail(num);
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	forward.setRedirect(false);
   		forward.setPath("./Comp/Comp_File/Comp_File_Modify.jsp");
   		return forward;
	}

}
