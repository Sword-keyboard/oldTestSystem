import data.peopledata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/checkpeople")
public class checkpeople extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String type = request.getParameter("type");
        String number;
        if(type.equals("评估员")||type.equals("管理员")) number = request.getParameter("number");
        else number = request.getParameter("idnumber");
        Dao dao = new Dao();
        try {
            List<peopledata> data=dao.checkpeople(type,number);
            request.setAttribute("data", data);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("checkpeople.jsp").forward(request, response);
    }
}
