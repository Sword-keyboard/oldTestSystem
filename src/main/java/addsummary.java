import data.summarydata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/addsummary")
public class addsummary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        int level1 = parseInteger(request.getParameter("level1"),0);
        int level2 = parseInteger(request.getParameter("level2"),0);
        int level3 = parseInteger(request.getParameter("level3"),0);
        int level4 = parseInteger(request.getParameter("level4"),0);
        int level5 = parseInteger(request.getParameter("level5"),0);
        int level6 = parseInteger(request.getParameter("level6"),0);
        int level7 = parseInteger(request.getParameter("level7"),0);
        String name1=request.getParameter("name1");
        String name2=request.getParameter("name2");
        Date date1=Date.valueOf(request.getParameter("date1"));
        String name3=request.getParameter("name3");
        Date date2=Date.valueOf(request.getParameter("date2"));
        String idnumber=request.getParameter("idnumber");
        summarydata data=new summarydata(level1,level2,level3,level4,level5,level6,level7,name1,name2,date1,name3,date2,idnumber,"");
        Dao dao=new Dao();
        try {
            if(dao.addsummary(data)) {
                response.sendRedirect("operator.jsp");
            }
            else {
                request.getRequestDispatcher("addsummary.jsp").forward(request, response);
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
