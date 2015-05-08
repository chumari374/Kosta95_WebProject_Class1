package Action.Mypage;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.MessageDAO;
import DTO.MessageDTO;

public class MessageAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MessageDAO messagedao=new MessageDAO();
		MessageDTO messagedto=new MessageDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");	
		response.setCharacterEncoding("UTF-8");

		boolean result=false;
		PrintWriter out = response.getWriter();
		System.out.println("1");

		try{
			
			
//			messagedto.setMsgnum((int)session.getAttribute("msgnum"));
			messagedto.setEmpno(Integer.parseInt(request.getParameter("empno")));
			messagedto.setTitle(request.getParameter("title"));
			messagedto.setContent(request.getParameter("content"));
			messagedto.setFilepath(request.getParameter("filepath"));
			messagedto.setSendempno(Integer.parseInt(request.getParameter("sendempno")));

			result=messagedao.MessageWrite(messagedto);
			System.out.println("2");

			if(result==false){

				out.println("<script charset='UTF-8'>");
				out.println("alert('Fail');");
				out.println("</script>");

				System.out.println("발송 실패");
/*				forward.setRedirect(true);
				forward.setPath("./MessageList.mb");
				return forward;*/
			}
     
			out.println("<script charset='UTF-8'>");
			out.println("alert('Success');");
			out.println("</script>");
			out.println("<script charset='UTF-8'>");
			out.println("window.close();");
			out.println("</script>");

			System.out.println("발송 완료");
			
/*
			forward.setRedirect(false);
			forward.setPath("./MessageList.mb");
			return forward;*/

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}  	
}

