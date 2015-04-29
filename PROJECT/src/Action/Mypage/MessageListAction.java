package Action.Mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;
import Action.ActionForward;
import DAO.MessageDAO;

public class MessageListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MessageDAO messagedao = new MessageDAO();
		// DB���� ,,,, select ������ �ִ� ��ü
		List messagelist;
		
		// �������� �����͸� ó���ϱ� ���Ͽ� �迭

				int page = 1;
				int limit = 10;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				// ����ڰ� ��û�� ������ ��ȣ ó��
				// �⺻ 1�� : View
				// �׷��� �ʴٸ� : ��û�� ������ ��ȣ

				int messagelistcount = messagedao.getMessageListCount(); // �� ����Ʈ ���� �޾ƿ�
				messagelist = messagedao.getMessageList(messagelistcount); // ����Ʈ�� �޾ƿ�
				// page =2 , limit =10 (�������� ����)

				// �� ������ ��
				// listcount =12/10
				int maxpage = (int) ((double) messagelistcount / limit + 0.95);
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
				request.setAttribute("messagelistcount", messagelistcount); // �� ��
				request.setAttribute("messagelist", messagelist);

		request.setAttribute("messagelist", messagelist);

		// forward ���� ó�� ����///////////////////////////
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MyPage/Message_List.jsp");
		return forward;
	}

}
