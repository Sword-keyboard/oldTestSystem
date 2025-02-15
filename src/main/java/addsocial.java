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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int live=parseInteger(request.getParameter("live"),0);
        int work=parseInteger(request.getParameter("work"),0);
        int timespace=parseInteger(request.getParameter("timespace"),0);
        int relation=parseInteger(request.getParameter("relation"),0);
        int socialing=parseInteger(request.getParameter("socialing"),0);
        int total=parseInteger(request.getParameter("total"),0);
        int level=parseInteger(request.getParameter("level"),0);
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

    private int parseInteger(String value, int defaultValue) {
        if (value == null || value.trim().isEmpty()) {
            return defaultValue;
        }
        return Integer.parseInt(value);
    }
}
