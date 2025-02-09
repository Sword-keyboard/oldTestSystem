package data;
import java.sql.Date;

public class summarydata {
    private int level1;
    private int level2;
    private int level3;
    private int level4;
    private int level5;
    private int level6;
    private int level7;
    private String name1;
    private String name2;
    private Date date1;
    private String name3;
    private Date date2;
    private String idnumber;
    private String number;

    public summarydata(int level2, int level1, int level3, int level4, int level5, int level6, int level7, String name1, String name2, Date date1,
                       String name3, Date date2,String idnumber, String number) {
        this.level2 = level2;
        this.level1 = level1;
        this.level3 = level3;
        this.level4 = level4;
        this.level5 = level5;
        this.level6 = level6;
        this.level7 = level7;
        this.name1 = name1;
        this.name2 = name2;
        this.date1 = date1;
        this.name3 = name3;
        this.date2 = date2;
        this.idnumber = idnumber;
        this.number = number;
    }

    public int getLevel1() {
        return level1;
    }

    public int getLevel2() {
        return level2;
    }

    public int getLevel3() {
        return level3;
    }

    public int getLevel4() {
        return level4;
    }

    public int getLevel5() {
        return level5;
    }

    public int getLevel6() {
        return level6;
    }

    public int getLevel7() {
        return level7;
    }

    public String getName1() {
        return name1;
    }

    public String getName2() {
        return name2;
    }

    public Date getDate1() {
        return date1;
    }

    public String getName3() {
        return name3;
    }

    public Date getDate2() {
        return date2;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public String getNumber() {
        return number;
    }
}
