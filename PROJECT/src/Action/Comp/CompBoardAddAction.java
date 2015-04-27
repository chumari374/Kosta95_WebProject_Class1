package Action.Comp;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DTO.C_BrdDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CompBoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 throws Exception{
		
				HttpSession session = request.getSession();
				C_BrdDAO boarddao=new C_BrdDAO();
				C_BrdDTO boarddto=new C_BrdDTO();
			   	ActionForward forward=new ActionForward();
			   	
			   	request.setCharacterEncoding("UTF-8");		   	
			   	
		   		boolean result=false;
		   		
		   		PrintWriter out = response.getWriter();
		   		
		   		try{

		   
		   			boarddto.setEmpno(Integer.parseInt((String)session.getAttribute("empno")));
		   			boarddto.setEname((String)session.getAttribute("ename"));
		   			boarddto.setTitle(request.getParameter("BOARD_TITLE"));
		   			boarddto.setContent(request.getParameterValues("BOARD_NOTICE")[0]);
		   			boarddto.setNotice(request.getParameter("BOARD_NOTICE"));
		   				   		
			   		result=boarddao.Insert(boarddto);
			   		
			   		if(result==false){
			   			
				   		out.println("<script>");
				   		out.println("alert('게시판 등록 실패.');");
				   		out.println("</script>");
				   
			   			System.out.println("게시판 등록 실패");
			   			return null;
			   		}
			   		
			   		out.println("<script>");
			   		out.println("alert('게시판 등록 성공');");
			   		out.println("</script>");
			   		
			   		System.out.println("게시판 등록 완료");
			   		
			   		forward.setRedirect(true);
			   		forward.setPath("./Comp/Comp_Board/Comp_Board_List.jsp");
			   		return forward;
			   		
		  		}catch(Exception ex){
		   			ex.printStackTrace();
		   		}
		  		return null;
			}  	

}
