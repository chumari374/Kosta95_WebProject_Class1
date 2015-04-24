package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminFrontController
 */
@WebServlet("/AdminFrontController")
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminFrontController() {
        super();
    }

    private void proccess(HttpServletRequest request, HttpServletResponse response){
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request, response);
	}

}
