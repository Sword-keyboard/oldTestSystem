import data.informatdata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/editinformat")
public class editinformat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String relation= request.getParameter("relation");
        if(relation.equals("其他")) relation=request.getParameter("otherrelation");
        String contacts = request.getParameter("contacts");
        String phone= request.getParameter("phone");
        String number= request.getParameter("number");
        String idnumber= request.getParameter("idnumber");
        informatdata data=new informatdata(name,relation,contacts,phone,number,idnumber);
        Dao dao=new Dao();
        try {
            dao.editinformat(data);
            response.sendRedirect("operator.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
