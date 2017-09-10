import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAppEngine extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws IOException, ServletException {
      
    //response.setContentType("text/plain");
    //response.getWriter().print("Hello App Engine!\r\n");
    RequestDispatcher view = request.getRequestDispatcher("/main.jsp");
    //req.setAttribute("heroes", heroes);
	//req.setAttribute("season", DPServlet.CURRENT_SEASON);
	view.forward(request, response);
  }
}