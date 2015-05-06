package Action.Dept;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_BrdDAO;
import DAO.D_BrdDAO;

public class DeptBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		D_BrdDAO boarddao = new D_BrdDAO();
		// DB���� ,,,, select ������ �ִ� ��ü
		List boardlist;
		List noticelist;
		// �������� �����͸� ó���ϱ� ���Ͽ� �迭
		int deptcode = (Integer)request.getSession().getAttribute("deptcode");
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// ����ڰ� ��û�� ������ ��ȣ ó��
		// �⺻ 1�� : View
		// �׷��� �ʴٸ� : ��û�� ������ ��ȣ

		int listcount = boarddao.getListCount(); // �� ����Ʈ ���� �޾ƿ�
		boardlist = boarddao.getBoardList(page,limit,deptcode); // ����Ʈ�� �޾ƿ�
		noticelist = boarddao.getNoticeList(deptcode);
		// page =2 , limit =10 (�������� ����)

		// �� ������ ��
		// listcount =12/10
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 0.95�� ���ؼ� �ø� ó��

		// ���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// ���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		//�Ѿ�� request �ּ�
		//key point ...
		request.setAttribute("page", page); // ���� ������ ��
		request.setAttribute("maxpage", maxpage); // �ִ� ������ ��
		request.setAttribute("startpage", startpage); // ���� �������� ǥ���� ù ������ ��
		request.setAttribute("endpage", endpage); // ���� �������� ǥ���� �� ������ ��
		request.setAttribute("listcount", listcount); // �� ��
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("noticelist", noticelist);

		// forward ���� ó�� ����///////////////////////////
		ActionForward forward = new ActionForward();
		System.out.println(request.getAttribute("page"));
		forward.setRedirect(false);
		forward.setPath("./Dept/Dept_Board/Dept_Board_List.jsp");
		return forward;
	}

}
