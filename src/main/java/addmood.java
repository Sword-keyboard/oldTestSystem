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
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int cogintion=Integer.parseInt(request.getParameter("cogintion"));
        int attack=Integer.parseInt(request.getParameter("attack"));
        int depression=Integer.parseInt(request.getParameter("depression"));
        int total=Integer.parseInt(request.getParameter("total"));
        int level=Integer.parseInt(request.getParameter("level"));
        String idnumber=request.getParameter("idnumber");
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
}
