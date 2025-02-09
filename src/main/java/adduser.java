import data.indexdata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/adduser")
public class adduser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String type=request.getParameter("type");
        String id=request.getParameter("id");
        String password=request.getParameter("password");
        indexdata data=new indexdata(id,password);
        Dao dao=new Dao();
        try{
            if(dao.adduser(data,type)){
                response.sendRedirect("operator.jsp");
            }
            else {
                request.getRequestDispatcher("adduser.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
