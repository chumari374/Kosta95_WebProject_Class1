
package Action.Mypage;

import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;
import Action.ActionForward;
import DAO.MessageDAO;

public class MessageListAction implements Action {
	String url;
    public MessageListAction(){
    }
    public MessageListAction(String url){
       this.url = url;
    }
   
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("url : "+url);
		System.out.println("execute");
		MessageDAO messagedao = new MessageDAO();
		HttpSession session = request.getSession();
		int empno = (int)session.getAttribute("empno");
		System.out.println("session.empno :"+empno);
		
		// DB연결 ,,,, select 가지고 있는 객체
		List messagelist;
		
		
		// 여러건의 데이터를 처리하기 위하여 배열

				int page = 1;
				int limit = 10;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				// 사용자가 요청한 페이지 번호 처리
				// 기본 1번 : View
				// 그렇지 않다면 : 요청한 페이지 번호

				System.out.println("empno:" + empno);
				System.out.println("url:" + url);
				System.out.println("page" + page);
				System.out.println("limit" + limit);
				int messagelistcount = messagedao.getMessageListCount(); // 총 리스트 수를 받아옴
				
				System.out.println("messagelistcount : " + messagelistcount);
				
				messagelist = messagedao.getMessageList(empno, url, page, limit); // 리스트를 받아옴
				
				System.out.println("messagelist : " + messagelist);
				// page =2 , limit =10 (페이지당 개수)

				// 총 페이지 수
				// messagelistcount =12/10
				int maxpage = (int) ((double) messagelistcount / limit + 0.95);
				// 0.95를 더해서 올림 처리

				// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
				int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
				// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
				int endpage = startpage + 10 - 1;

				if (endpage > maxpage) {
					endpage = maxpage;
				}
				
				//넘어온 request 주소
				//key point ...
				request.setAttribute("page", page); // 현재 페이지 수
				request.setAttribute("maxpage", maxpage); // 최대 페이지 수
				request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수
				request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수
				request.setAttribute("messagelistcount", messagelistcount); // 글 수
				request.setAttribute("messagelist", messagelist);

				 
		// forward 대한 처리 로직///////////////////////////
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(url.equals("/Recieved.mb")){
		forward.setPath("./MyPage/Recieved.jsp");
		}else if(url.equals("/Sent.mb")){
			forward.setPath("./MyPage/Sent.jsp"); 
		}
		return forward;
	}

}

