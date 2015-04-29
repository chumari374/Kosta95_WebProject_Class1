package Action.CompFile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;

public class CompDataBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		C_DbrdDAO boarddao = new C_DbrdDAO();
		// DB���� ,,,, select ������ �ִ� ��ü
		List boardlist;
		// �������� �����͸� ó���ϱ� ���Ͽ� �迭

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// ����ڰ� ��û�� ������ ��ȣ ó��
		// �⺻ 1�� : View
		// �׷��� �ʴٸ� : ��û�� ������ ��ȣ

		int listcount = boarddao.getListCount(); // �� ����Ʈ ���� �޾ƿ�
		boardlist = boarddao.getDataBoardList(page,limit); // ����Ʈ�� �޾ƿ�
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

		// forward ���� ó�� ����///////////////////////////
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Comp/Comp_File/Comp_File_List.jsp");
		return forward;
	}

}
