package Action.Sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;
import DTO.SignDTO;

public class DetailSendSignListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		SignDAO signdao = new SignDAO();
		SignDTO signdata = new SignDTO();
		
		System.out.println("액션도달");
		
		
		signdata = signdao.DetailsendSign(num);
		
		
		
		if(signdata == null) {
			System.out.println("Null Data 처리");
			return null;
		}
		System.out.println("SignDTO Data 완료");
		
		request.setAttribute("signdata", signdata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Sign/Sign_(4)Send_View.jsp");
		return forward;
	}
}
