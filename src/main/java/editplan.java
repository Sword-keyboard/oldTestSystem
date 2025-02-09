import data.plandata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/editplan")
public class editplan extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String number = request.getParameter("number");
        Date date = Date.valueOf(request.getParameter("date"));
        String reason = request.getParameter("reason");
        plandata data=new plandata(number,date,reason);
        Dao dao=new Dao();
        try {
            dao.editplan(data);
            response.sendRedirect("editpeople.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
