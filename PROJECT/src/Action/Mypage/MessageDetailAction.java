package Action.Mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.MessageDAO;
import DTO.C_BrdDTO;
import DTO.MessageDTO;

public class MessageDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
request.setCharacterEncoding("utf-8");
   		
		MessageDAO messagedao=new MessageDAO();
	   	MessageDTO messagedata=new MessageDTO();
	   	
	   	
		int msgnum=Integer.parseInt(request.getParameter("msgnum"));
	   	messagedata=messagedao.getMessageDetail(msgnum);
	   	
	   	if(messagedata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("messagedata", messagedata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
	   	forward.setPath("./MyPage/Message_View.jsp");
   		return forward;
   		
	    }
	}


