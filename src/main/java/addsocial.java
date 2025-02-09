import data.socialdata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addsocial")
public class addsocial extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int live=Integer.parseInt(request.getParameter("live"));
        int work=Integer.parseInt(request.getParameter("work"));
        int timespace=Integer.parseInt(request.getParameter("timespace"));
        int relation=Integer.parseInt(request.getParameter("relation"));
        int socialing=Integer.parseInt(request.getParameter("socialing"));
        int total=Integer.parseInt(request.getParameter("total"));
        int level=Integer.parseInt(request.getParameter("level"));
        String idnumber=request.getParameter("idnumber");
        socialdata data=new socialdata(live,work,timespace,relation,socialing,total,level,"",idnumber);
        Dao dao=new Dao();
        try {
            if(dao.addsocial(data)) {
                response.sendRedirect("addsummary.jsp");
            }
            else {
                request.getRequestDispatcher("addsocial.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
