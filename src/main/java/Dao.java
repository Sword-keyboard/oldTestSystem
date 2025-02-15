import data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao {
    public Connection getConnection()throws SQLException ,ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/testsystem";
        String user = "root";
        String password = "123456";
        return DriverManager.getConnection(url, user, password);
    }

    public boolean index(indexdata data)throws SQLException ,ClassNotFoundException{
        String sql = "select * from user where id=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,data.getId());
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                if(data.getPassword().equals(rs.getString("password"))) return true;
            return false;
        }
    }

    public boolean registe(String id,String password,String type)throws SQLException ,ClassNotFoundException{
        if(id==null||password==null) return false;
        String sql = "insert into user values(?,?,?)";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,id);
            ps.setString(2,password);
            ps.setString(3,type);
            return ps.executeUpdate()>0;
        }
    }

    public boolean addplan(plandata data)throws SQLException ,ClassNotFoundException{
        if(data==null||data.getNumber().length()!=10) return false;
        String sql1="select * from plan where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)){
            ps.setString(1,data.getNumber());
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                if(rs.getString("number").equals(data.getNumber())) return false;
            }
        }
        String sql2 = "insert into plan values(?,?,?)";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql2)){
            ps.setString(1,data.getNumber());
            ps.setDate(2,data.getDate());
            ps.setString(3,data.getReason());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addpeople(peopledata data)throws SQLException ,ClassNotFoundException{
        if(data==null||data.getNumber().length()!=10||data.getIdnumber().length()!=18||data.getSocialid().length()!=9) return false;
        String sql1="select * from people where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)){
            ps.setString(1,data.getNumber());
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                if(rs.getString("number").equals(data.getNumber())) return false;
            }
        }
        String sql2 = "insert into people values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql2)){
            ps.setString(1,data.getName());
            ps.setString(2,data.getSex());
            ps.setDate(3,data.getBirthday());
            ps.setString(4,data.getIdnumber());
            ps.setString(5,data.getSocialid());
            ps.setString(6,data.getNation());
            ps.setString(7,data.getEducation());
            ps.setString(8,data.getReligion());
            ps.setString(9,data.getMarriage());
            ps.setString(10, data.getReside());
            ps.setString(11,data.getMedical());
            ps.setString(12,data.getIncome());
            ps.setString(13,data.getStupid());
            ps.setString(14,data.getMental());
            ps.setString(15,data.getChronic());
            ps.setString(16,data.getTumble());
            ps.setString(17,data.getLost());
            ps.setString(18,data.getDysphoria());
            ps.setString(19,data.getSuicide());
            ps.setString(20,data.getOther());
            ps.setString(21,data.getNumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addinformat(informatdata data)throws SQLException ,ClassNotFoundException{
        if(data==null||data.getNumber().length()!=10||data.getPhone().length()!=11||data.getIdnumber().length()!=18) return false;
        String sql1="select * from informat where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)){
            ps.setString(1,data.getNumber());
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                if(rs.getString("number").equals(data.getNumber())) return false;
            }
        }
        String sql2 = "insert into informat values(?,?,?,?,?,?)";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql2)){
            ps.setString(1,data.getName());
            ps.setString(2,data.getRelation());
            ps.setString(3,data.getContacts());
            ps.setString(4,data.getPhone());
            ps.setString(5,data.getNumber());
            ps.setString(6,data.getIdnumber());
            return ps.executeUpdate()>0;
        }
    }

    public List<plandata> checkplan(String number) throws SQLException, ClassNotFoundException {
        String sql;
        if(number.isEmpty()) sql="select * from plan";
        else sql="select * from plan where number=?";
        List<plandata> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            if(!number.isEmpty()) ps.setString(1,number);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                plandata data=new plandata(rs.getString("number"),
                        rs.getDate("date"),
                        rs.getString("reason"));
                list.add(data);
            }
            return list;
        }
    }

    public List<peopledata> checkpeople(String type,String number)throws SQLException,ClassNotFoundException{
        String sql;
        if(type.equals("评估员")||type.equals("管理员")) {
            if (number.isEmpty()) sql = "select * from people";
            else sql = "select * from people where number=?";
        }else sql = "select * from people where idnumber=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            if(!number.isEmpty()) ps.setString(1,number);
            ResultSet rs=ps.executeQuery();
            List<peopledata> list=new ArrayList<>();
            if(rs.next()){
                peopledata data=new peopledata(rs.getString("name"),
                        rs.getString("sex"),
                        rs.getDate("birthday"),
                        rs.getString("idnumber"),
                        rs.getString("socialid"),
                        rs.getString("nation"),
                        rs.getString("education"),
                        rs.getString("religion"),
                        rs.getString("marriage"),
                        rs.getString("reside"),
                        rs.getString("medical"),
                        rs.getString("income"),
                        rs.getString("stupid"),
                        rs.getString("mental"),
                        rs.getString("chronic"),
                        rs.getString("tumble"),
                        rs.getString("lost"),
                        rs.getString("dysphoria"),
                        rs.getString("suicide"),
                        rs.getString("other"),
                        rs.getString("number"));
                list.add(data);
            }
            return list;
        }
    }

    public List<informatdata> checkinformat(String type,String number)throws SQLException,ClassNotFoundException{
        String sql;
        if(type.equals("评估员")||type.equals("管理员")) {
            if (number.isEmpty()) sql = "select * from informat";
            else sql = "select * from informat where number=?";
        }else sql = "select * from informat where idnumber=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            if(!number.isEmpty()) ps.setString(1,number);
            ResultSet rs=ps.executeQuery();
            List<informatdata> list=new ArrayList<>();
            if(rs.next()){
                informatdata data=new informatdata(rs.getString("name"),
                        rs.getString("relation"),
                        rs.getString("contacts"),
                        rs.getString("phone"),
                        rs.getString("number"),
                        rs.getString("idnumber"));
                list.add(data);
            }
            return list;
        }
    }

    public boolean deleteplan(String number)throws SQLException,ClassNotFoundException{
        String sql="DELETE FROM plan WHERE number = ?;" +
        "DELETE FROM people WHERE number = ?;" +
                "DELETE FROM informat WHERE number = ?;" +
                "DELETE FROM daily WHERE number = ?;" +
                "DELETE FROM mood WHERE number = ?;" +
                "DELETE FROM perception WHERE number = ?;" +
                "DELETE FROM social WHERE number = ?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,number);
            ps.setString(2,number);
            ps.setString(3,number);
            ps.setString(4,number);
            ps.setString(5,number);
            ps.setString(6,number);
            ps.setString(7,number);
            return ps.executeUpdate()>0;
        }
    }
    /*
    public boolean deletepeople(String number)throws SQLException,ClassNotFoundException{
        String sql="delete from people where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,number);
            return ps.executeUpdate()>0;
        }
    }

    public boolean deleteinformat(String number)throws SQLException,ClassNotFoundException{
        String sql="delete from informat where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,number);
            return ps.executeUpdate()>0;
        }
    }
    */
    public boolean editplan(plandata data)throws SQLException,ClassNotFoundException{
        String sql="update plan set date=?,reason=? where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setDate(1,data.getDate());
            ps.setString(2,data.getReason());
            ps.setString(3,data.getNumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean editpeople(peopledata data)throws SQLException,ClassNotFoundException{
        String sql="update people set name=?,sex=?,birthday=?,idnumber=?,socialid=?,nation=?,education=?,religion=?,marriage=?," +
                "reside=?,medical=?,income=?,stupid=?,mental=?,chronic=?,tumble=?,lost=?,dysphoria=?,suicide=?,other=? where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,data.getName());
            ps.setString(2,data.getSex());
            ps.setDate(3,data.getBirthday());
            ps.setString(4,data.getIdnumber());
            ps.setString(5,data.getSocialid());
            ps.setString(6,data.getNation());
            ps.setString(7,data.getEducation());
            ps.setString(8,data.getReligion());
            ps.setString(9,data.getMarriage());
            ps.setString(10, data.getReside());
            ps.setString(11,data.getMedical());
            ps.setString(12,data.getIncome());
            ps.setString(13,data.getStupid());
            ps.setString(14,data.getMental());
            ps.setString(15,data.getChronic());
            ps.setString(16,data.getTumble());
            ps.setString(17,data.getLost());
            ps.setString(18,data.getDysphoria());
            ps.setString(19,data.getSuicide());
            ps.setString(20,data.getOther());
            ps.setString(21,data.getNumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean editinformat(informatdata data)throws SQLException,ClassNotFoundException{
        String sql="update informat set name=?,relation=?,contacts=?,phone=? where number=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setString(1,data.getName());
            ps.setString(2,data.getRelation());
            ps.setString(3,data.getContacts());
            ps.setString(4,data.getPhone());
            ps.setString(5,data.getNumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean adddaily(dailydata data)throws SQLException,ClassNotFoundException{
        String sql1="select number from people where idnumber=?";
        String number = "";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)) {
            ps.setString(1, data.getIdnumber());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("number");
            }
        }
        String sql = "insert into daily values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, data.getEat());
            ps.setInt(2, data.getBath());
            ps.setInt(3, data.getWash());
            ps.setInt(4, data.getCloth());
            ps.setInt(5, data.getStool());
            ps.setInt(6, data.getUrinal());
            ps.setInt(7, data.getToilet());
            ps.setInt(8, data.getWalk());
            ps.setInt(9, data.getMove());
            ps.setInt(10, data.getFloor());
            ps.setInt(11, data.getTotal());
            ps.setInt(12, data.getLevel());
            ps.setString(13, number);
            ps.setString(14, data.getIdnumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addmood(mooddata data)throws SQLException,ClassNotFoundException{
        String sql1="select number from people where idnumber=?";
        String number = "";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)) {
            ps.setString(1, data.getIdnumber());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("number");
            }
        }
        String sql = "insert into mood values(?,?,?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, data.getCogintion());
            ps.setInt(2, data.getAttack());
            ps.setInt(3,data.getDepression());
            ps.setInt(4, data.getTotal());
            ps.setInt(5, data.getLevel());
            ps.setString(6, number);
            ps.setString(7, data.getIdnumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addperception(perceptiondata data)throws SQLException,ClassNotFoundException{
        String sql1="select number from people where idnumber=?";
        String number = "";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)) {
            ps.setString(1, data.getIdnumber());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("number");
            }
        }
        String sql = "insert into perception values(?,?,?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, data.getConsciousness());
            ps.setInt(2, data.getVision());
            ps.setInt(3,data.getHearing());
            ps.setInt(4, data.getCommunication());
            ps.setInt(5,data.getLevel());
            ps.setString(6,number);
            ps.setString(7, data.getIdnumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addsocial(socialdata data)throws SQLException,ClassNotFoundException{
        String sql1="select number from people where idnumber=?";
        String number = "";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)) {
            ps.setString(1, data.getIdnumber());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("number");
            }
        }
        String sql = "insert into social values(?,?,?,?,?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, data.getLive());
            ps.setInt(2, data.getWork());
            ps.setInt(3,data.getTimespace());
            ps.setInt(4, data.getRelation());
            ps.setInt(5,data.getSocialing());
            ps.setInt(6, data.getTotal());
            ps.setInt(7,data.getLevel());
            ps.setString(8, number);
            ps.setString(9, data.getIdnumber());
            return ps.executeUpdate()>0;
        }
    }

    public boolean addsummary(summarydata data)throws SQLException,ClassNotFoundException{
        String sql1="select number from people where idnumber=?";
        String number = "";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql1)) {
            ps.setString(1, data.getIdnumber());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("number");
            }
        }
        String sql="insert into summary values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)) {
            ps.setInt(1,data.getLevel1());
            ps.setInt(2,data.getLevel2());
            ps.setInt(3,data.getLevel3());
            ps.setInt(4,data.getLevel4());
            ps.setInt(5,data.getLevel5());
            ps.setInt(6,data.getLevel6());
            ps.setInt(7,data.getLevel7());
                ps.setString(8,data.getName1());
            ps.setString(9,data.getName2());
            ps.setDate(10,data.getDate1());
            ps.setString(11,data.getName3());
            ps.setDate(12,data.getDate2());
            ps.setString(13, data.getIdnumber());
            ps.setString(14, number);
            return ps.executeUpdate()>0;
        }
    }

    public List<summarydata> checksummary(String type,String number)throws SQLException,ClassNotFoundException{
        String sql;
        if(type.equals("评估员")||type.equals("管理员")) {
            if (number.isEmpty()) sql = "select * from summary";
            else sql = "select * from summary where number=?";
        }else sql = "select * from summary where idnumber=?";
        try(Connection conn=getConnection(); PreparedStatement ps=conn.prepareStatement(sql)) {
            if(!number.isEmpty()) ps.setString(1, number);
            ResultSet rs = ps.executeQuery();
            List<summarydata> list=new ArrayList<>();
            if(rs.next()){
                summarydata data=new summarydata(
                        rs.getInt("leve1"),
                        rs.getInt("level2"),
                        rs.getInt("level3"),
                        rs.getInt("level4"),
                        rs.getInt("level5"),
                        rs.getInt("level6"),
                        rs.getInt("level7"),
                        rs.getString("name1"),
                        rs.getString("name2"),
                        rs.getDate("date1"),
                        rs.getString("name3"),
                        rs.getDate("date2"),
                        rs.getString("idnumber"),
                        rs.getString("number")
                        );
                list.add(data);
            }
            return list;
        }
    }

    public boolean adduser(indexdata data,String type) throws SQLException,ClassNotFoundException{
        String sql="insert into user values(?,?,?)";
        try(Connection conn=getConnection();PreparedStatement ps= conn.prepareStatement(sql)){
            ps.setString(1,data.getId());
            ps.setString(2,data.getPassword());
            ps.setString(3,type);
            return ps.executeUpdate()>0;
        }
    }

}
