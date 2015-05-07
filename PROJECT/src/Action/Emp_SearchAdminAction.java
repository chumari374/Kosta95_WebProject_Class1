 package Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import DAO.MemberInfoDAO;
import DTO.MemberInfoDTO;

public class Emp_SearchAdminAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberInfoDAO dao = new MemberInfoDAO();
		
		//List MemberList = new ArrayList();
		//MemberList = dao.MemberList();

		//request.setAttribute("MemberList", MemberList);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Admin/Emp_Search.jsp");
		return forward;
/*		
		MemberInfoDAO dao = new MemberInfoDAO();
		
		JSONArray JSONList = new JSONArray();
		JSONList = dao.MemberListJSON();
		
		request.setAttribute("JSONList", JSONList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Emp_Search/Search.jsp");
		return forward;*/
	}
}
