import data.peopledata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/editpeople")
public class editpeople extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String sex =request.getParameter("sex");
        Date birthday = Date.valueOf(request.getParameter("birthday"));
        String idnumber=request.getParameter("idnumber");
        String socialid=request.getParameter("socialid");
        String nation=request.getParameter("nation");
        if(nation.equals("少数民族")) nation=request.getParameter("othernation");
        String education=request.getParameter("education");
        String religion=request.getParameter("religion");
        if(religion.equals("有")) religion=request.getParameter("otherreligion");
        String marriage=request.getParameter("marriage");
        String reside=request.getParameter("reside");
        String medical=request.getParameter("medical");
        if(medical.equals("其他")) medical=request.getParameter("othermedical");
        String income=request.getParameter("income");
        if(income.equals("其他补贴")) income=request.getParameter("otherincome");
        String stupid=request.getParameter("stup");
        String mental=request.getParameter("mental");
        String chronic=request.getParameter("chronic");
        String tumble=request.getParameter("tumble");
        String lost=request.getParameter("lost");
        String dysphoria=request.getParameter("dysphoria");
        String suicide=request.getParameter("suicide");
        String other=request.getParameter("other");
        String number=request.getParameter("number");
        peopledata data=new peopledata(name,sex,birthday,idnumber,socialid,nation,education,religion,marriage,reside,medical,income,
                stupid,mental,chronic,tumble,lost,dysphoria,suicide,other,number);
        Dao dao=new Dao();
        try {
            dao.editpeople(data);
            response.sendRedirect("addinformat.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
