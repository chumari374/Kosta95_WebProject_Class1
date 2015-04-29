package Action.CompFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardDetailAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
		C_DbrdDAO boarddao=new C_DbrdDAO();
	   	C_DbrdDTO boarddata=new C_DbrdDTO();
	   	
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
	   	forward.setPath("./Comp/Comp_File/Comp_File_View.jsp");
		return forward;
	}
   	
}
