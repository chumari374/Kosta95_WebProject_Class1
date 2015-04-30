package Action.Sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.SignDAO;
import DTO.SignDTO;

public class DetailGetSignListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		SignDAO signdao = new SignDAO();
		SignDTO signdata = new SignDTO();
		
		System.out.println("�׼ǵ���");
		System.out.println("Action : " + num);
		signdata = signdao.DetailgetSign(num);
		
		if(signdata == null) {
			System.out.println("Null Data ó��");
			return null;
		}
		System.out.println("SignDTO Data �Ϸ�");
		
		request.setAttribute("signdata", signdata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Sign/Sign_(5)Receive_View.jsp");
		return forward;
	}

}
