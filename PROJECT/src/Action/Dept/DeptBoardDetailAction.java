package Action.Dept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;
import DTO.C_BrdDTO;
import DTO.D_BrdDTO;

public class DeptBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
   		
		D_BrdDAO boarddao=new D_BrdDAO();
	   	D_BrdDTO boarddata=new D_BrdDTO();
	   	
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
	   	forward.setPath("./Dept/Dept_Board/Dept_Board_View.jsp");
   		return forward;
	}

}
