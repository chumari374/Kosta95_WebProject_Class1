package Action.Dept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;
import DTO.C_BrdDTO;
import DTO.D_BrdDTO;

public class DeptBoardRealModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		D_BrdDAO boarddao=new D_BrdDAO();
		D_BrdDTO boarddto=new D_BrdDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		boolean result=false;
		String notice = "";
		PrintWriter out = response.getWriter();

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
			boarddto.setNum((Integer.parseInt(request.getParameter("BOARD_NUM"))));
			boarddto.setNotice(notice);

			result=boarddao.Modify(boarddto);

			if(result==false){

				out.println("<script>");
				out.println("alert('�Խ��� ���� ����.');");
				out.println("</script>");

				System.out.println("�Խ��� ���� ����");
				forward.setRedirect(true);
				forward.setPath("./DeptBoardList.dp");
				return forward;
			}

			out.println("<script>");
			out.println("alert('�Խ��� ���� ����');");
			out.println("</script>");

			System.out.println("�Խ��� ���� �Ϸ�");

			forward.setRedirect(false);
//			forward.setPath("./CompBoardDetailAction.cp?num="+boarddto.getNum());
//			forward.setPath("./CompBoardDetailAction.cp?num="+Integer.parseInt(request.getParameter("BOARD_NUM")));
			forward.setPath("./DeptBoardList.dp");
			
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
