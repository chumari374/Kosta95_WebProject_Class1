package Action.Notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.C_N_BrdDAO;
import DTO.C_BrdDTO;
import DTO.C_N_BrdDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CompNoticeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		HttpSession session = request.getSession();
		C_N_BrdDAO boarddao=new C_N_BrdDAO();
		C_N_BrdDTO boarddto=new C_N_BrdDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");		   	
		response.setCharacterEncoding("UTF-8");
		boolean result=false;
//		String notice = "";
		PrintWriter out = response.getWriter();

		try{

//			if(request.getParameter("BOARD_NOTICE")!=null){
//				notice = "true";
//			}else{
//				notice = "false";
//			}

			boarddto.setEmpno((int)session.getAttribute("empno"));
			boarddto.setEname((String)session.getAttribute("ename"));
			boarddto.setTitle(request.getParameter("BOARD_TITLE"));
			boarddto.setContent(request.getParameter("BOARD_CONTENT"));
		//	boarddto.setNotice(notice);

			result=boarddao.Insert(boarddto);

			if(result==false){

				out.println("<script>");
				out.println("alert('게시판 등록 실패.');");
				out.println("</script>");

				System.out.println("게시판 등록 실패");
				forward.setRedirect(true);
				forward.setPath("./CompNoticeList.cn");
				return forward;
			}

			out.println("<script>");
			out.println("alert('게시판 등록 성공');");
			out.println("</script>");

			System.out.println("게시판 등록 완료");
//			response.setCharacterEncoding("UTF-8");
			forward.setRedirect(true);
			forward.setPath("./CompNoticeList.cn");
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}  	

}
