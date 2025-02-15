import data.perceptiondata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addperception")
public class addperception extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int consciousness = parseInteger(request.getParameter("consciousness"),0);
        int vision= parseInteger(request.getParameter("vision"),0);
        int hearing= parseInteger(request.getParameter("hearing"),0);
        int communication= parseInteger(request.getParameter("communication"),0);
        int level= parseInteger(request.getParameter("level"),0);
        String idnumber= request.getParameter("idnumber");
        perceptiondata data=new perceptiondata(consciousness,vision,hearing,communication,level,"",idnumber);
        Dao dao=new Dao();
        try {
            if(dao.addperception(data)) {
                request.getSession().setAttribute("idnumber",idnumber);
                response.sendRedirect("addsocial.jsp");
            }
            else {
                request.getRequestDispatcher("addperception.jsp").forward(request, response);
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
