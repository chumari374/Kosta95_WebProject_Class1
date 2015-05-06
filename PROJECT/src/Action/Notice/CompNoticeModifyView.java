package Action.Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.C_N_BrdDAO;
import DTO.C_BrdDTO;
import DTO.C_N_BrdDTO;

public class CompNoticeModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
	 	request.setCharacterEncoding("utf-8");
   		
		C_N_BrdDAO boarddao=new C_N_BrdDAO();
	   	C_N_BrdDTO boarddata=new C_N_BrdDTO();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
	   	boarddata=boarddao.getDetail(num);
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	forward.setRedirect(false);
   		forward.setPath("./Comp/Comp_Notice/Comp_Notice_Modify.jsp");
   		return forward;
	}

}
