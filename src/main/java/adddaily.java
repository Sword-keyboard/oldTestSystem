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
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idnumber = request.getParameter("idnumber");
        int eat = Integer.parseInt(request.getParameter("eat"));
        int bath = Integer.parseInt(request.getParameter("bath"));
        int wash = Integer.parseInt(request.getParameter("wash"));
        int cloth = Integer.parseInt(request.getParameter("cloth"));
        int stool = Integer.parseInt(request.getParameter("stool"));
        int urinal= Integer.parseInt(request.getParameter("urinal"));
        int toilet= Integer.parseInt(request.getParameter("toile"));
        int walk= Integer.parseInt(request.getParameter("walk"));
        int move= Integer.parseInt(request.getParameter("move"));
        int floor= Integer.parseInt(request.getParameter("floor"));
        int total= Integer.parseInt(request.getParameter("total"));
        int level= Integer.parseInt(request.getParameter("level"));
        dailydata data=new dailydata(eat,bath,wash,cloth,stool,urinal,toilet,walk,move,
                floor,total,level,"",idnumber);
        Dao dao=new Dao();
        try {
            if(dao.adddaily(data)) {
                request.getSession().setAttribute("idnumber",idnumber);
                response.sendRedirect("addmood.jsp");
            }
            else {
                request.getRequestDispatcher("adddaily.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
