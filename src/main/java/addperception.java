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
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int consciousness = Integer.parseInt(request.getParameter("consciousness"));
        int vision= Integer.parseInt(request.getParameter("vision"));
        int hearing= Integer.parseInt(request.getParameter("hearing"));
        int communication= Integer.parseInt(request.getParameter("communication"));
        int level= Integer.parseInt(request.getParameter("level"));
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
}
