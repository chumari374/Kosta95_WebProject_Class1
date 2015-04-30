package Action.CompFile;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Action.Action;
import Action.ActionForward;
import DAO.C_DbrdDAO;
import DTO.C_DbrdDTO;

public class CompDataBoardRealModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path2 = "\\\\192.168.7.235\\Upload";
		System.out.println("--:"+path2);
		
		MultipartRequest multi =  new MultipartRequest(
	      	      request, //jsp������ request(��û��ü) ������ 
	      	      path2 , // ������ (������ ���)
	      	      10*1024*1024 , //����ũ��(�ѹ��� ���ε� �Ҽ� �ִ� ������ ũ��)10M 
	      	      "utf-8", //���ڵ� ó�� (�ѱ�)
	      	      new DefaultFileRenamePolicy() //���ϸ� �ߺ�ó�� ��ü ���
	      	      );
		String file = (String)multi.getFileNames().nextElement();
		String p_picture = multi.getFilesystemName(file);
		
		HttpSession session = request.getSession();
		C_DbrdDAO boarddao = new C_DbrdDAO();
		C_DbrdDTO boarddto = new C_DbrdDTO();
		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int result = 0;
		PrintWriter out = response.getWriter();

		try{

			boarddto.setEmpno((int)session.getAttribute("empno"));
			boarddto.setTitle(multi.getParameter("BOARD_TITLE"));
			boarddto.setContent(multi.getParameter("BOARD_CONTENT"));
			boarddto.setNum((Integer.parseInt(multi.getParameter("BOARD_NUM"))));
			boarddto.setData(p_picture);
			System.out.println(p_picture);

			result=boarddao.Modify(boarddto);

			if(result==0){

				out.println("<script>");
				out.println("alert('�Խ��� ���� ����.');");
				out.println("</script>");

				System.out.println("�Խ��� ���� ����");
				forward.setRedirect(true);
				forward.setPath("./CompDataBoardList.cf");
				return forward;
			}

			out.println("<script>");
			out.println("alert('�Խ��� ���� ����');");
			out.println("</script>");

			System.out.println("�Խ��� ���� �Ϸ�");

			forward.setRedirect(false);
			forward.setPath("./CompDataBoardList.cf");
			
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
