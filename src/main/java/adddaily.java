import data.dailydata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/adddaily")
public class adddaily extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idnumber = request.getParameter("idnumber");
        int eat = parseInteger(request.getParameter("eat"), 0);
        int bath = parseInteger(request.getParameter("bath"), 0);
        int wash = parseInteger(request.getParameter("wash"), 0);
        int cloth = parseInteger(request.getParameter("cloth"), 0);
        int stool = parseInteger(request.getParameter("stool"), 0);
        int urinal = parseInteger(request.getParameter("urinal"), 0);
        int toilet = parseInteger(request.getParameter("toilet"), 0);
        int walk = parseInteger(request.getParameter("walk"), 0);
        int move = parseInteger(request.getParameter("move"), 0);
        int floor = parseInteger(request.getParameter("floor"), 0);
        int total = parseInteger(request.getParameter("total"), 0);
        int level = parseInteger(request.getParameter("level"), 0);

        dailydata data = new dailydata(eat, bath, wash, cloth, stool, urinal, toilet, walk, move, floor, total, level, "", idnumber);
        Dao dao = new Dao();
        try {
            if (dao.adddaily(data)) {
                request.getSession().setAttribute("idnumber", idnumber);
                response.sendRedirect("addmood.jsp");
            } else {
                request.getRequestDispatcher("adddaily.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    private int parseInteger(String value, int defaultValue) {
        if (value == null || value.trim().isEmpty()) {
            return defaultValue;
        }
        return Integer.parseInt(value);
    }
}
