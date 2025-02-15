import data.mooddata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addmood")
public class addmood extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int cogintion = parseInteger(request.getParameter("cogintion"), 0);
        int attack = parseInteger(request.getParameter("attack"), 0);
        int depression = parseInteger(request.getParameter("depression"), 0);
        int total = parseInteger(request.getParameter("total"), 0);
        int level = parseInteger(request.getParameter("level"), 0);
        String idnumber = request.getParameter("idnumber");
        mooddata data=new mooddata(cogintion,attack,depression,total,level,"",idnumber);
        Dao dao=new Dao();
        try {
            if(dao.addmood(data)) {
                request.getSession().setAttribute("idnumber",idnumber);
                response.sendRedirect("addperception.jsp");
            }
            else {
                request.getRequestDispatcher("addmood.jsp").forward(request, response);
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
