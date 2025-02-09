import data.plandata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;

@WebServlet("/checkplan")
public class checkplan extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String number = request.getParameter("number");
        Dao dao = new Dao();
        try {
            List<plandata> data=dao.checkplan(number);
            request.setAttribute("data", data);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("checkplan.jsp").forward(request, response);
    }
}
