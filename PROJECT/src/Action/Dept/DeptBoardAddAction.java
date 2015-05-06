package Action.Dept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.D_BrdDAO;
import DTO.D_BrdDTO;

public class DeptBoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		HttpSession session = request.getSession();
		D_BrdDAO boarddao=new D_BrdDAO();
		D_BrdDTO boarddto=new D_BrdDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");		   	
		response.setCharacterEncoding("UTF-8");
		boolean result=false;
		String notice = "";
		PrintWriter out = response.getWriter();
		int deptcode = (Integer)request.getSession().getAttribute("deptcode");

		try{

			if(request.getParameter("BOARD_NOTICE")!=null){
				notice = "true";
			}else{
				notice = "false";
			}

			boarddto.setEmpno((int)session.getAttribute("empno"));
			boarddto.setEname((String)session.getAttribute("ename"));
			boarddto.setTitle(request.getParameter("BOARD_TITLE"));
			boarddto.setContent(request.getParameter("BOARD_CONTENT"));
			boarddto.setNotice(notice);

			result=boarddao.Insert(boarddto,deptcode);

			if(result==false){

				out.println("<script>");
				out.println("alert('게시판 등록 실패.');");
				out.println("</script>");

				System.out.println("게시판 등록 실패");
				forward.setRedirect(true);
				forward.setPath("./DeptBoardList.dp");
				return forward;
			}

			out.println("<script>");
			out.println("alert('게시판 등록 성공');");
			out.println("</script>");

			System.out.println("게시판 등록 완료");
//			response.setCharacterEncoding("UTF-8");
			forward.setRedirect(true);
			forward.setPath("./DeptBoardList.dp");
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}  	

}
