package Action.Mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.MessageDAO;

public class MessageDeleteAction implements Action {
	
	String url;
    public MessageDeleteAction(){
    }
    public MessageDeleteAction(String url){
       this.url = url;
    }

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
			ActionForward forward = new ActionForward();
			request.setCharacterEncoding("utf-8");
			
			HttpSession session=request.getSession();
			int empno=(Integer)session.getAttribute("empno");
			
			int result = 0;
		   	int msgnum=Integer.parseInt(request.getParameter("msgnum"));
		   	
		   	MessageDAO messageDao = new MessageDAO();
		   	
		   	result = messageDao.messageDelete(msgnum, url);
		   	if(result==0){
		   		
		   		System.out.println("쪽지 삭제 실패");
		   		return null;
		   	}
		   	
		   	System.out.println("쪽지 삭제 성공");
		   	forward.setRedirect(true);
	   		forward.setPath("../MessageList.mb");
	   		return forward;
	}

}
