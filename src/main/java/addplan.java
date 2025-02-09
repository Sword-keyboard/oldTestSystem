import data.plandata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/addplan")
public class addplan extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String number = request.getParameter("number");
        Date date = Date.valueOf(request.getParameter("date"));
        String reason = request.getParameter("reason");
        plandata data=new plandata(number,date,reason);
        Dao dao=new Dao();
        try {
            if(dao.addplan(data)){
                request.getSession().setAttribute("number",number);
                response.sendRedirect("addpeople.jsp");
            }
            else request.getRequestDispatcher("addplan.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
