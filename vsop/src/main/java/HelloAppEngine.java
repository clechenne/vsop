import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.dao.DatastoreDao;
import cl.objects.Player;
import cl.objects.Result;

public class HelloAppEngine extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		DatastoreDao dao = new DatastoreDao();
		String startCursor = request.getParameter("cursor");
		List<Player> players = null;
		String endCursor = null;
		try {
			Result<Player> result = dao.listPlayers(startCursor);
			players = result.result;
			endCursor = result.cursor;
			request.setAttribute("players", players);  
		} catch (Exception e) {
			throw new ServletException("Error listing player", e);
		}
		// response.setContentType("text/plain");
		// response.getWriter().print("Hello App Engine!\r\n");
		RequestDispatcher view = request.getRequestDispatcher("/main.jsp");
		// req.setAttribute("heroes", heroes);
		// req.setAttribute("season", DPServlet.CURRENT_SEASON);
		view.forward(request, response);
	}
}