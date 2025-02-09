import data.indexdata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/index")
public class index extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        indexdata data=new indexdata(id,password);
        Dao dao = new Dao();
        try {
            if(dao.index(data)){
                    request.getSession().setAttribute("id",id);
                    request.getSession().setAttribute("type",type);
                    response.sendRedirect("operator.jsp");
                }
            else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException e) {
                throw new ServletException(e);
            }
    }
}
