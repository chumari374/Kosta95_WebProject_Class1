package Action.Mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.MessageDAO;
import DTO.MessageDTO;

public class MessageReplyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	 	ActionForward forward = new ActionForward();
	 	
		MessageDAO messagedao=new MessageDAO();
   		MessageDTO messagedata=new MessageDTO();
   		
   		int num=Integer.parseInt(request.getParameter("sendempno"));
   		
   		messagedata=messagedao.getMessageDetail(num);

   		MessageDTO message = null;
   		
   		if(messagedata==null){
   			System.out.println("답글 페이지 이동 실패");
   			return null;
   		}
   		System.out.println("답글 페이지 이동 완료");
   		
   		request.setAttribute("messagedata", messagedata);
   		
   		forward.setRedirect(false);
   		forward.setPath("./MyPage/Message_Reply.jsp");
   		return forward;
	}

}